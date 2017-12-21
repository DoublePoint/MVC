/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2017-9-29 下午10:23:00
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.helper;

import java.util.Date;

public class ModelField {
	
	
	private String fieldType;
	private String fieldName;
	private String fieldComment;
	private boolean isId;

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFieldComment() {
		return fieldComment;
	}

	public void setFieldComment(String fieldComment) {
		this.fieldComment = fieldComment;
	}

	public boolean isId() {
		return isId;
	}

	public void setId(boolean isId) {
		this.isId = isId;
	}

	public StringBuffer getEntityFieldContent(){
		if(fieldName==null||"".equals(fieldName))
			return new StringBuffer();
		String firstCharUpperString=fieldName.substring(0, 1).toUpperCase()+fieldName.substring(1);
		
		StringBuffer sbBuffer=new StringBuffer();
		sbBuffer.append("	@Column (name = \""+ fieldName.replaceAll("[A-Z]", "_$0").toLowerCase()+"\")                                  \r\n");
		sbBuffer.append("	private "+switchFieldType(fieldType)+" "+fieldName+"; //"+fieldComment+"                                                \r\n");
		sbBuffer.append("	                                                                 \r\n");
		sbBuffer.append("	public "+switchFieldType(fieldType)+" get"+firstCharUpperString+"() {                                            \r\n");
		sbBuffer.append("		return "+fieldName+";                                                     \r\n");
		sbBuffer.append("	}                                                                \r\n");
		sbBuffer.append("                                                                  \r\n");
		sbBuffer.append("	public void set"+firstCharUpperString+"("+switchFieldType(fieldType)+" "+fieldName+") {                                     \r\n");
		sbBuffer.append("		this."+fieldName+" = "+fieldName+";                                                  \r\n");
		sbBuffer.append("	}                                                                \r\n");			
		return sbBuffer;
	}
	/**
	 * 获取私有属性
	 * @return
	 */
	public StringBuffer getFieldContent(){
		if(fieldName==null||"".equals(fieldName))
			return new StringBuffer();
		
		StringBuffer sbBuffer=new StringBuffer();
		sbBuffer.append("	@Column (name = \""+ fieldName.replaceAll("[A-Z]", "_$0").toLowerCase()+"\")                                  \r\n");
		sbBuffer.append("	private "+switchFieldType(fieldType)+" "+fieldName+"; //"+fieldComment+"       \r\n");
		return sbBuffer;
	}
	/**
	 * 获取set方法
	 */
	public StringBuffer getSetFunctionContent(){
		String firstCharUpperString=fieldName.substring(0, 1).toUpperCase()+fieldName.substring(1);
		StringBuffer sbBuffer=new StringBuffer();
		sbBuffer.append("                                                                  \r\n");
		sbBuffer.append("	public void set"+firstCharUpperString+"("+switchFieldType(fieldType)+" "+fieldName+") {                                     \r\n");
		sbBuffer.append("		this."+fieldName+" = "+fieldName+";                                                  \r\n");
		sbBuffer.append("	}                                                                \r\n");			
		return sbBuffer;
	}
	/**
	 * 获取get方法
	 * @return
	 */
	public StringBuffer getGetFunctionContent(){
		String firstCharUpperString=fieldName.substring(0, 1).toUpperCase()+fieldName.substring(1);
		StringBuffer sbBuffer=new StringBuffer();
		sbBuffer.append("	                                                                 \r\n");
		sbBuffer.append("	public "+switchFieldType(fieldType)+" get"+firstCharUpperString+"() {                                           \r\n");
		sbBuffer.append("		return "+fieldName+";                                                     \r\n");
		sbBuffer.append("	}                                                                \r\n");
		return sbBuffer;
	}
	public StringBuffer getEnumFieldContent(int index,boolean isLast){
		if(fieldName==null)
			return new StringBuffer();
		StringBuffer sbBuffer=new StringBuffer();
		String str=isLast?";":",";
		sbBuffer.append("	"+fieldName.toUpperCase()+"(\""+index+"\")"+str+""+"//"+fieldComment+"\r\n");
		return sbBuffer;
	}
	
	private String switchFieldType(String fieldType){
		switch (fieldType.toLowerCase()) {
		case "int":
			return "Integer";
		case "long":
			return "Long";
		case "string":
			return "String";
		case "date":
			return "Date";
		default:
			return fieldType;
		}
	}
}
