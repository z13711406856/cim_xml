package cim_xml;

/**
 * @author suzhibo
 */
public class Column{
	private String columnName=null;
	private String columnType=null;
	private int repeatCount=0;//the column repeat count in the table
	private String columnValue=null;
	private String columnComment=null;
	public static String columnString="varchar2(500)";
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getColumnType() {
		return columnType;
	}
	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}
	public String getColumnValue() {
		return columnValue;
	}
	public void setColumnValue(String columnValue) {
		this.columnValue = columnValue;
	}
	public String getColumnComment() {
		return columnComment;
	}
	public void setColumnComment(String columnComment) {
		this.columnComment = columnComment;
	}
	public String getColumnName() {
		return columnName;
	}
	public int getRepeatCount() {
		return repeatCount;
	}
	public void setRepeatCount(int repeatCount) {
		this.repeatCount = repeatCount;
	}
}