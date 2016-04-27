package cim_xml;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.Map.Entry;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.ElementHandler;
import org.dom4j.ElementPath;
import org.dom4j.io.SAXReader;

/**
 * @author suzhibo
 */
public class CimXml implements ElementHandler{
	//parse the cim/xml file
	private Map<String,CimObject> distinctTableMap=new HashMap<String,CimObject>();
	public  Map<String,Integer> recordCount=new HashMap<String,Integer>();
	private int num=1;
	private AnalyzeMode analyzeMode=null;
	private Connection con=null;
	private File url=null;
	private static CimObject cimObj=null;
	CimXml(){
	}
	public void buildTableSAX() throws DocumentException{
		SAXReader reader=new SAXReader();
		reader.setDefaultHandler(this);
		reader.read(url);
	}
	@Override
	public void onStart(ElementPath elementPath) {
		// TODO Auto-generated method stub
		//the begin of the element,we only deal the begin of the 2lv elements;
		int level=getLevel(elementPath);
		if(level==1){
			return;
		}
		if(level==3){
			return;
		}
		if(level==2){
			CimXml.cimObj=new CimObject();
			CimXml.cimObj.setColumn(new ArrayList<Column>());
			CimXml.cimObj.setTableName(getObjectName(elementPath.getCurrent()));
			CimXml.cimObj.getColumn().add(getPk(elementPath.getCurrent()));
		}
		
	}
	/* (non-Javadoc)
	 * @see org.dom4j.ElementHandler#onEnd(org.dom4j.ElementPath)
	 */
	@Override
	public void onEnd(ElementPath elementPath) {
		// TODO Auto-generated method stub
		int level=getLevel(elementPath);
		if(level==1){
			return;
		}
		if(level==2){
			checkAndManage(CimXml.cimObj);
			if(this.analyzeMode==AnalyzeMode.insert){
				insert(CimXml.cimObj);
			}
		}
		if(level==3){
			Column column=getColumn(elementPath.getCurrent());
			checkRepeat(CimXml.cimObj.getColumn(),column);
			CimXml.cimObj.getColumn().add(column);
		}
		
		elementPath.getCurrent().detach();
	}
	public int getLevel(ElementPath elePath){
		String path=elePath.getPath();
		return path.split("/").length-1; 
	}
	public void buildTable() throws DocumentException{
		SAXReader reader=new SAXReader();
		Document document=reader.read(url);
		Element root=document.getRootElement();
		CimObject cimObject=null;
		Element current=null;
		for(int i=0,size=root.nodeCount();i<size;i++){
			//only analyze element
			Main.log.debug(i+" "+root.node(i).getNodeTypeName()
					+" "+root.node(i).getPath());
			if(root.node(i) instanceof Element){
				current=(Element) root.node(i);
				Main.log.debug(i+" "+current.getName());
				cimObject=new CimObject();
				cimObject.setTableName(getObjectName(current));
				cimObject.setColumn(getObjectColumn(current));
				checkAndManage(cimObject);
				insert(cimObject);
			}
		}
	}
	private void insert(CimObject cimObject){
		if(this.analyzeMode==AnalyzeMode.table){
			return;
		}
		PreparedStatement pStat=null;
		try {
			StringBuffer sql=new StringBuffer();
			StringBuffer sqlQuestion=new StringBuffer();
			
			sql.append("insert into "+cimObject.getTableName()
						+"(");
			for(int i=0,size=cimObject.getColumn().size();i<size;i++){
				if(i!=0){
						sql.append(",");
						sqlQuestion.append(",");
					}
				sql.append(cimObject.getColumn().get(i).getColumnName());
				sqlQuestion.append("?");
						
				}
			sql.append(") values(");
			sql.append(sqlQuestion+")");
			Main.log.debug("sql: "+sql+System.lineSeparator());
			pStat=this.con.prepareStatement(sql.toString());
		//在PreparedStatement对象中设置变量，并且执行；
		for(int i=0,size=cimObject.getColumn().size();i<size;i++){
				pStat.setString(i+1,
				cimObject.getColumn().get(i).getColumnValue());
					
			}
				pStat.addBatch();
				pStat.executeBatch();
				pStat.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void checkAndManage(CimObject obj){
		//check the same name table is exists or not
		//if the table is new ,add it and return
		Main.log.info("objectNum: "+this.num++);
		if(this.distinctTableMap.get(obj.getTableName())==null){
			this.distinctTableMap.put(obj.getTableName(), obj);
			this.recordCount.put(obj.getTableName(), 1);
			return;
		}
		//table is exists check the column difference
		else{
			CimObject tableObj=this.distinctTableMap.get(obj.getTableName());
			this.recordCount.put(obj.getTableName(), this.recordCount.get(obj.getTableName())+1);
			for(int i=0,size=obj.getColumn().size();i<size;i++){
				if(!tableObj.columnExists(obj.getColumn().get(i))){
					tableObj.addColumn(obj.getColumn().get(i), i);
				}
			}
		}
	}
	//处理表内的内容，包括第一个元素的ID
	public List<Column> getObjectColumn(Element element){
		
		List<Column> list=new ArrayList<Column>();
		//获取主键 属性名为ref:ID的值
		list.add(getPk(element));
		//获取除主键外的其他字段值
		for(int n=0,size=element.nodeCount();n<size;n++){
			if(element.node(n) instanceof Element){
				Element el=(Element) element.node(n);
				Column column=getColumn(el);
				checkRepeat(list,column);
				list.add(column);
				
			}  
		}
		return list;
	}
	//如果没有重复了,返回true，如果重复了，尝试在字段名后面+1，再返回false
	public boolean checkRepeat(List<Column> list,Column column){
		
		for(int i=0,size=list.size();i<=size-1;i++)
		{
			if(list.get(i).getColumnName().equals(column.getColumnName()))
			{
				list.get(i).setRepeatCount(list.get(i).getRepeatCount()+1);
				column.setColumnName(column.getColumnName()+list.get(i).getRepeatCount());
				return false;
			}
		}
		return true;
	}
	public Column getPk(Element ele){
		Column pk=new Column();
		/*for(int i=0,size=ele.attributes().size();i<size;i++){
			Attribute att=(Attribute)ele.attributes().get(i);
			System.out.println(att.getName()+" "+att.getValue());
		}*/
		String ID=ele.attribute("ID").getValue();
		pk.setColumnName("ID");
		pk.setColumnValue(ID);
		return pk;
	}
	public Column getColumn(Element el){
		Column column=new Column();
		//获得cim:xxx的xxx
		String cName=el.getName();
		//设置注释
		column.setColumnComment(cName);
		//设置字段名
		if(cName.contains(".")){
			String[] cNameList=cName.split("\\.");
			cName=cNameList[cNameList.length-1];//如果有.分割，选取最后一个
		}
		column.setColumnName(cName);
		//设置字段值
		String value=null;
		if(el.attribute("resource")!=null){
			value=el.attribute("resource").getValue();
		}
		else
		{
			value=el.getText();
		}
		column.setColumnValue(value);
		return column;
	}
	
	public String getObjectName(Element element){
		String name=element.getName();//name 
		return name;//name;
	}
	public Map<String, CimObject> getDistinctTableMap() {
		return distinctTableMap;
	}
	public void setAnalyzeMode(AnalyzeMode analyzeMode) {
		this.analyzeMode = analyzeMode;
	}
	public void setCon(Connection con) {
		this.con = con;
	}
	/* (non-Javadoc)
	 * @see org.dom4j.ElementHandler#onStart(org.dom4j.ElementPath)
	 */
	public void createTableSql(FileWriter fWriter) throws IOException{
		try {
			Set<Entry<String,CimObject>> tableSet=getDistinctTableMap().entrySet();
			Iterator it=tableSet.iterator();
			Entry<String,CimObject> obj;
			while(it.hasNext()){
				obj=(Entry<String, CimObject>) it.next();
				fWriter.write(obj.getValue().getCteateSql());
			}
			
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void setUrl(File url) {
		this.url = url;
	}
	public Map<String, Integer> getRecordCount() {
		return recordCount;
	}
	public void setDistinctTableMap(Map<String, CimObject> distinctTableMap) {
		this.distinctTableMap = distinctTableMap;
	}
}
