package cim_xml;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dom4j.DocumentException;
import org.dom4j.ElementPath;

/**
 * @author suzhibo
 * the main class for cim_xml
 */
public class Main {
	
	public URL url=null;
	private File sqlFile=new File("createTable.sql");
	public static final Logger log=LogManager.getLogger(Main.class);
	Connection conn=null;
	String jdbcUrl="jdbc:oracle:thin:@192.168.79.131:1521:orcl";    //test为数据库名称，1521为连接数据库的默认端口
    String user="scott";    //aa为用户名 
    String password="zxcvbnm123";    //123为密码
	public static void main(String args[]) throws DocumentException, IOException, SQLException, ClassNotFoundException{
		Date begin=new Date();
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Main main=new Main();
		main.url=new URL("file:///F:/workspace_j2ee_64/cim_xml/gz_psmodel_new.xml");//cim  gz_psmodel_new
		main.conn = DriverManager.getConnection(main.jdbcUrl, main.user, main.password);
		FileWriter fWriter=new FileWriter(main.sqlFile,false);
		CimXml cimXml=new CimXml(main.url);
		cimXml.setAnalyzeMode(AnalyzeMode.insert);
		cimXml.setCon(main.conn);
		cimXml.buildTableSAX();
		cimXml.createTableSql(fWriter);
		fWriter.close();
		/*String url1="file://F:/g各种PDF/java/dom4j-1.6.1dom4j-1.6.1/xml/web.xml";*/
	/*	for(int i=0;i<0;i++){
			System.out.println("1");
		}
		URL url=new URL("file:///F:/g各种PDF/java/dom4j-1.6.1/dom4j-1.6.1/xml/web.xml");
		System.out.println(url);
		CimXml cim=new CimXml(url);
		cim.bar();
		*/
	/*	String s="Naming.name";
		System.out.println(".");
		String[] sList=s.split("\\.");
		System.out.println(sList.length);
		System.out.println(sList[0]);*/
		/*main.createTableSql(cimXml);*/
		Iterator<Entry<String, Integer>> it=cimXml.recordCount.entrySet().iterator();
		while(it.hasNext()){
			Entry<String,Integer> entry=(Entry<String, Integer>) it.next();
			System.out.println(entry.getKey()+":"+entry.getValue());
		}
	/*	main.insertObject();*/
		Date end=new Date();
		main.conn.close();
		Main.log.info("take "+(end.getTime()-begin.getTime())/1000+"s");
		
	}
	//make create sql
	
}
