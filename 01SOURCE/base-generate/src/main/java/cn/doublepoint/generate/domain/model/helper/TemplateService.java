/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月15日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.generate.domain.model.helper;

import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.generate.EGenerateType;
import cn.doublepoint.generate.GenerateTemplateUtil;

public class TemplateService {
	
	private String annotationServiceName;//Application的bean名称
	private String serviceClassName;//Application的Class名称
	private String paramName;//参数名称
	private String paramListName;//列表参数名称
	private String packageName;

	public TemplateService(TemplateEntityModel entityModel) {
		String tableName = entityModel.getTableName();
		String entityClassName = GenerateTemplateUtil.getClassName(tableName, EGenerateType.Entity);
		annotationServiceName = StringUtil.lowercaseTheFirstChar(entityClassName) + "Service";
		serviceClassName = entityClassName + "Service";
		paramName=StringUtil.lowercaseTheFirstChar(entityClassName);
		paramListName=paramName+"List";
		packageName=StringUtil.lowerCase(entityClassName);
	}

	public String getAnnotationServiceName() {
		return annotationServiceName;
	}

	public void setAnnotationServiceName(String annotationServiceName) {
		this.annotationServiceName = annotationServiceName;
	}


	public String getServiceClassName() {
		return serviceClassName;
	}


	public void setServiceClassName(String serviceClassName) {
		this.serviceClassName = serviceClassName;
	}


	public String getParamName() {
		return paramName;
	}


	public void setParamName(String paramName) {
		this.paramName = paramName;
	}


	public String getParamListName() {
		return paramListName;
	}


	public void setParamListName(String paramListName) {
		this.paramListName = paramListName;
	}


	public String getserviceClassName() {
		return serviceClassName;
	}

	public void setserviceClassName(String serviceClassName) {
		this.serviceClassName = serviceClassName;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

}
