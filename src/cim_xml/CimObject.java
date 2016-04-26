package cim_xml;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author suzhibo
 */
public class CimObject {
	private String tableName=null;
	private List<Column> column=null;
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public List<Column> getColumn() {
		return column;
	}
	public void setColumn(List<Column> column) {
		this.column = column;
	}
	/**
	 * @param objectName
	 */
	//exists return true,else return false
	public boolean columnExists(Column co){
		String coName=co.getColumnName();
		for(int i = 0,size=this.column.size();i<size;i++){
			if(this.column.get(i).getColumnName().equals(coName)){
				return true;
			}
		}
		return false;
	}
	public void addColumn(Column co,int index){
		this.column.add(index, co);
	}
	public String getCteateSql(){
		StringBuffer sql=new StringBuffer();
		StringBuffer comSql=new StringBuffer();
		sql.append("create table "+tableName+System.lineSeparator()
				+"("+System.lineSeparator());
		/*this.log.debug(sql);*/
		for(int i=0,size=this.getColumn().size();i<size;i++)
		{
			sql.append(this.getColumn().get(i).getColumnName()+
					" "+Column.columnString+","+System.lineSeparator());
			if(this.getColumn().get(i).getColumnComment()!=null){
			comSql.append("comment on column "+tableName+"."+this.getColumn().
					get(i).getColumnName()+" is '"+
					this.getColumn().get(i).
					getColumnComment()+"';"+
					System.lineSeparator());
			/*this.log.debug(sql);*/
			}
			
		}
		sql.deleteCharAt(sql.lastIndexOf(","));
		sql.append(");"+System.lineSeparator());
		sql.append(comSql+System.lineSeparator());
		return sql.toString();
	}
}


