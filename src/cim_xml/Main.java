package cim_xml;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dom4j.DocumentException;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.FileDialog;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
/**
 * @author suzhibo
 * the main class for cim_xml
 */
public class Main {
	private static Text cimPath;
	private static Text sqlPath;
	private static Text account;
	private static Text password;	
	private static Text connectString;
	
	public static final Logger log=LogManager.getLogger(Main.class);
	   //123为密码
	public static void main(String args[]){
		
		Date begin=new Date();
		try{
			begin();
		}catch(Exception e){
			Main.log.error(e.getMessage(), e);
		}
		
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

	/*	main.insertObject();*/
		Date end=new Date();
		Main.log.info("take "+(end.getTime()-begin.getTime())/1000+"s");
		
	}
	//make create sql
	/**
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * 
	 */
	private static void begin() throws ClassNotFoundException, IOException {
		// TODO Auto-generated method stub
		File f=new File("resource.dat");
		final Properties pro=new Properties();
		if(f.exists()){
			FileReader reader=new FileReader(f);
			pro.load(reader);
			reader.close();

		}
		
		final CimXml cimXml=new CimXml();
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Display display = Display.getDefault();
		final Shell shell = new Shell(display);
		shell.setLayout(new GridLayout(3, false));
		
		Label lblNewLabel = new Label(shell, SWT.NONE);
		lblNewLabel.setLayoutData(new GridData(SWT.CENTER, SWT.CENTER, false, false, 1, 1));
		lblNewLabel.setAlignment(SWT.CENTER);
		lblNewLabel.setText("cim\u8DEF\u5F84");
		
		cimPath = new Text(shell, SWT.BORDER);
		GridData gd_cimPath = new GridData(SWT.FILL, SWT.CENTER, true, false, 1, 1);
		gd_cimPath.widthHint = 272;
		cimPath.setLayoutData(gd_cimPath);
		
		Button btnNewButton = new Button(shell, SWT.NONE);
		btnNewButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseDown(MouseEvent e) {
				try{
					System.out.println("cimPath");
					FileDialog filedlg=new FileDialog(shell,SWT.OPEN);
					filedlg.setText("选择cim/xml文件");
					filedlg.setFilterPath(System.getProperty("user.home"));
					filedlg.setFilterExtensions(new String[]{"*.xml"});
					filedlg.setFilterNames(new String[]{"Xml,*.xml"});
					String filePath=filedlg.open();
					if(filePath!=null){
						cimPath.setText(filePath);
						File cimFile=new File(filePath);
					
						pro.setProperty("cimPath", filePath);
						System.out.println(filePath);
				}
				}catch(Exception e1){
					Main.log.error(e1.getMessage(), e1);
				}
				
			}
		});
		btnNewButton.setText("\u6D4F\u89C8");
		
		Label lblSql = new Label(shell, SWT.NONE);
		lblSql.setLayoutData(new GridData(SWT.CENTER, SWT.CENTER, false, false, 1, 1));
		lblSql.setText("sql\u8F93\u51FA\u8DEF\u5F84");
		
		sqlPath = new Text(shell, SWT.BORDER);
		sqlPath.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false, 1, 1));
		
		Button button = new Button(shell, SWT.NONE);
		button.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseDown(MouseEvent e) {
				try{
					System.out.println("sqlPath");
					FileDialog filedlg=new FileDialog(shell,SWT.OPEN);
					filedlg.setText("选择sql文件");
					filedlg.setFilterPath(System.getProperty("user.home"));
					filedlg.setFilterExtensions(new String[]{"*.sql"});
					filedlg.setFilterNames(new String[]{"Sql,*.sql"});
					String filePath=filedlg.open();
					sqlPath.setText(filePath);
					pro.setProperty("sqlPath", filePath);
					System.out.println(filePath);
				}catch(Exception e1){
					Main.log.error(e1.getMessage(), e1);
				}

			}
		});
		button.setText("\u6D4F\u89C8");
		
		Label label = new Label(shell, SWT.NONE);
		label.setLayoutData(new GridData(SWT.CENTER, SWT.CENTER, false, false, 1, 1));
		label.setText("\u6570\u636E\u5E93\u8FDE\u63A5\u53C2\u6570");
		
		connectString = new Text(shell, SWT.BORDER);
		connectString.setToolTipText("jdbc:oracle:thin:@ip:port:sid");
		connectString.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false, 1, 1));
		connectString.setText("jdbc:oracle:thin:@ip:port:sid");
		new Label(shell, SWT.NONE);;
		
		Label lblNewLabel_1 = new Label(shell, SWT.NONE);
		lblNewLabel_1.setLayoutData(new GridData(SWT.CENTER, SWT.CENTER, false, false, 1, 1));
		lblNewLabel_1.setText("\u6570\u636E\u5E93\u8D26\u53F7");
		
		account = new Text(shell, SWT.BORDER);
		account.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false, 1, 1));
		new Label(shell, SWT.NONE);
		
		Label lblNewLabel_2 = new Label(shell, SWT.NONE);
		lblNewLabel_2.setLayoutData(new GridData(SWT.CENTER, SWT.CENTER, false, false, 1, 1));
		lblNewLabel_2.setText("\u6570\u636E\u5E93\u5BC6\u7801");
		
		password = new Text(shell, SWT.BORDER | SWT.PASSWORD);
		password.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false, 1, 1));
		new Label(shell, SWT.NONE);
		new Label(shell, SWT.NONE);
		
		Button beginButton = new Button(shell, SWT.NONE);
		beginButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseDown(MouseEvent e) {
				try{
				
				FileWriter fWriter=null;
				MessageBox box=new MessageBox(shell,SWT.ICON_INFORMATION|SWT.YES);
				try{
					fWriter=new FileWriter(sqlPath.getText(),false);
					cimXml.setAnalyzeMode(AnalyzeMode.table);
					cimXml.setUrl(new File(cimPath.getText()));
					cimXml.buildTableSAX();
					cimXml.createTableSql(fWriter);
					fWriter.close();
					Iterator<Entry<String, Integer>> it=cimXml.recordCount.entrySet().iterator();
					while(it.hasNext()){
						Entry<String,Integer> entry=(Entry<String, Integer>) it.next();
						System.out.println(entry.getKey()+":"+entry.getValue());
					}
					cimXml.getDistinctTableMap().clear();
					cimXml.getRecordCount().clear();
					
					box.setMessage("提醒");
					box.setMessage("成功创建createSql文件，路径");
					box.open();
				}catch(Exception e1){
					box.setMessage("提醒");
					box.setMessage(e1.getClass().getName());
					box.open();
					throw e1;
				}
				}catch(Exception e2){
					Main.log.error(e2.getMessage(), e2);
				}
			}
		});
		beginButton.setLayoutData(new GridData(SWT.CENTER, SWT.CENTER, false, false, 1, 1));
		beginButton.setText("生成createsql");
		
		Button insert = new Button(shell, SWT.NONE);
		insert.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseDown(MouseEvent e) {
				Connection conn=null;
				MessageBox box=new MessageBox(shell,SWT.ICON_INFORMATION|SWT.YES);
				try{
				
				conn = DriverManager.getConnection(connectString.getText(), account.getText(),password.getText());
				cimXml.setAnalyzeMode(AnalyzeMode.insert);
				cimXml.setUrl(new File(cimPath.getText()));
				cimXml.setCon(conn);
				cimXml.buildTableSAX();
				Iterator<Entry<String, Integer>> it=cimXml.recordCount.entrySet().iterator();
				conn.close();
				StringBuffer mess=new StringBuffer();
				mess.append("成功插入以下数据:"+System.lineSeparator());
				while(it.hasNext()){
					Entry<String,Integer> entry=(Entry<String, Integer>) it.next();
					System.out.println(entry.getKey()+":"+entry.getValue());
					mess.append(entry.getKey()+":"+entry.getValue()+System.lineSeparator());
				}
				cimXml.getDistinctTableMap().clear();
				cimXml.getRecordCount().clear();
				pro.setProperty("connectString",connectString.getText());
				pro.setProperty("account", account.getText());
				box.setMessage("提醒");
				box.setMessage(mess.toString());
				box.open();
				}catch(Exception e1){
					box.setMessage("提醒");
					box.setMessage(e1.getClass().getName());
					box.open();
					Main.log.error(e1.getMessage(), e1);
				}
				}});
		insert.setText("\u5F00\u59CB\u63D2\u5165");
		new Label(shell, SWT.NONE);
		new Label(shell, SWT.NONE);
		new Label(shell, SWT.NONE);
		new Label(shell, SWT.NONE);
		
		Label lblCimcim = new Label(shell, SWT.NONE);
		lblCimcim.setLayoutData(new GridData(SWT.CENTER, SWT.CENTER, false, false, 1, 1));
		lblCimcim.setText("cim\u8DEF\u5F84\uFF1A\u7528\u4E8E\u8BBE\u5B9Acim\u6587\u4EF6\u6765\u6E90");
		new Label(shell, SWT.NONE);
		new Label(shell, SWT.NONE);
		
		Label lblSqlsql = new Label(shell, SWT.NONE);
		lblSqlsql.setLayoutData(new GridData(SWT.CENTER, SWT.CENTER, false, false, 1, 1));
		lblSqlsql.setText("sql\u8F93\u51FA\u8DEF\u5F84:\u7528\u4E8E\u8BBE\u5B9A\u8F93\u51FA\u7684SQL\u6587\u4EF6\u8DEF\u5F84");
		new Label(shell, SWT.NONE);
		if(pro.getProperty("cimPath")!=null){
			cimPath.setText(pro.getProperty("cimPath"));
		}
		if(pro.getProperty("sqlPath")!=null){
			sqlPath.setText(pro.getProperty("sqlPath"));
		}
		if(pro.getProperty("connectString")!=null){
			connectString.setText(pro.getProperty("connectString"));
		}
		if(pro.getProperty("account")!=null){
			account.setText(pro.getProperty("account"));
		}
		

		shell.pack();
		shell.open();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
		FileWriter writer;
		try {
			writer = new FileWriter(f,false);
			pro.store(writer,"");
			writer.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
}
class ConParam{
	public String jdbcUrl=null;    //test为数据库名称，1521为连接数据库的默认端口
	public String user=null;    //aa为用户名 
	public String password=null;  
}
