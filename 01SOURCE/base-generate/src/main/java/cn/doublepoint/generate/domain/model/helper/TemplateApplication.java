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

import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.generate.EGenerateType;
import cn.doublepoint.generate.GenerateTemplateUtil;

public class TemplateApplication {
	
	private String annotationApplicationName;//Application的bean名称
	private String applicationClassName;//Application的Class名称
	private String paramName;//参数名称
	private String paramListName;//列表参数名称

	public TemplateApplication(TemplateEntityModel entityModel) {
		String tableName = entityModel.getTableName();
		String entityClassName = GenerateTemplateUtil.getClassName(tableName, EGenerateType.Entity);
		annotationApplicationName = StringUtil.lowercaseTheFirstChar(entityClassName) + "Application";
		applicationClassName = entityClassName + "Application";
		paramName=StringUtil.camelToUnderlineOfAllLowcase(entityClassName);
		paramListName=paramName+"List";
	}

	public String getAnnotationApplicationName() {
		return annotationApplicationName;
	}

	public void setAnnotationApplicationName(String annotationApplicationName) {
		this.annotationApplicationName = annotationApplicationName;
	}

	public String getApplicationClassName() {
		return applicationClassName;
	}

	public void setApplicationClassName(String applicationClassName) {
		this.applicationClassName = applicationClassName;
	}

}
