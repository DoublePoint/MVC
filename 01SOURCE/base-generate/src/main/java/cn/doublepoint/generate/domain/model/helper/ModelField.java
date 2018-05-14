/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2017-9-29 下午10:23:00
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.generate.domain.model.helper;

import java.util.Date;

import cn.doublepoint.commonutil.domain.model.StringUtil;

public class ModelField {
	
	
	private String fieldType;//属性类型
	private String fieldName;//数据库字段名称 暂时的类型为带有下划线的例如create_time 后期还需要进行转换
	private String annotationColumnName;
	private String fieldComment;//字段备注
	private String propertyName;//属性名称
	private String getFunctionName;//get方法名称
	private String setFunctionName;//set方法名称
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
		this.setAnnotationColumnName(StringUtil.upcase(fieldName));
		this.setPropertyName(StringUtil.underlineToCamel(fieldName));
		this.setGetFunctionName("get"+StringUtil.underlineToCamelOfFirstUpper(fieldName));
		this.setSetFunctionName("set"+StringUtil.underlineToCamelOfFirstUpper(fieldName));
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

	public String getAnnotationColumnName() {
		return annotationColumnName;
	}

	public void setAnnotationColumnName(String annotationColumnName) {
		this.annotationColumnName = annotationColumnName;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public String getGetFunctionName() {
		return getFunctionName;
	}

	public void setGetFunctionName(String getFunctionName) {
		this.getFunctionName = getFunctionName;
	}

	public String getSetFunctionName() {
		return setFunctionName;
	}

	public void setSetFunctionName(String setFunctionName) {
		this.setFunctionName = setFunctionName;
	}
	
}
