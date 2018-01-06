/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.generate.domain.model.helper;

public class ModelConstantJS {
	private String fieldName;
	private String fieldType;
	public String getFieldType() {
		return fieldType;
	}
	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	private String fieldValue;
	private String fieldComment;
	
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getFieldValue() {
		return fieldValue;
	}
	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}
	public String getFieldComment() {
		return fieldComment;
	}
	public void setFieldComment(String fieldComment) {
		this.fieldComment = fieldComment;
	}
	
	public ModelConstantJS(String fieldName, String fieldType, String fieldValue, String fieldComment) {
		super();
		this.fieldName = fieldName;
		this.fieldType = fieldType;
		this.fieldValue = fieldValue;
		this.fieldComment = fieldComment;
	}
	
	
}
