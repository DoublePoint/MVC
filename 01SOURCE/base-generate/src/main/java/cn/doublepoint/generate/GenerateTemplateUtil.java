/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月19日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.generate;

import static java.util.stream.Collectors.toList;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.fasterxml.jackson.databind.deser.Deserializers.Base;

import cn.doublepoint.commonutil.domain.model.BaseModel;
import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.generate.domain.model.helper.TemplateEntityModel;
import cn.doublepoint.generate.domain.model.helper.BaseTemplate;
import cn.doublepoint.generate.domain.model.helper.TemplateEntityField;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class GenerateTemplateUtil {
	public final String ENTITY_P = "com.caland.core.bean";
	public final String QUERY_P = "com.caland.core.query";
	public final String ENTITY_XML_P = "ibatis";
	public final String SQLMAP_CONFIG_XML = "";

	public final String ACTION_P = "com.caland.core.action";
	public final String DAO_P = "com.caland.core.dao";
	public final String DAO_IMPL_P = "com.caland.core.dao.impl";
	public final String SERVICE_P = "com.caland.core.service";
	public final String SERVICE_IMPL_P = "com.caland.core.service.impl";

	public final String DAO_TPL = "dao.txt";
	public final String DAO_IMPL_TPL = "dao_impl.txt";
	public final String SERVICE_TPL = "service.txt";
	public final String SERVICE_IMPL_TPL = "service_impl.txt";
	public final String ACTION_TPL = "action.txt";

	public final String QUERY_TPL = "query.txt";
	public final String ENTITY_XML_TPL = "entity-sqlmap.txt";
	public final String SQLMAP_CONFIG_TPL = "sqlmap-config.txt";
	// 分库
	public final String SHARDING_RULES_ON_NAMESPACE_P = "dbRule";
	public final String HASH_FUNCTION_P = "com.caland.core.dao.router";
	public final String SHARDING_RULES_ON_NAMESPACE_TPL = "sharding-rules-on-namespace.txt";
	public final String HASH_FUNCTION_TPL = "hash-function.txt";

	public final boolean IS_ACTION = true;
	public final boolean IS_SERVICE = true;
	public final boolean IS_DAO = true;
	public final boolean IS_PAGE = false;

	public final String SPT = File.separator;

	public final String ENCODING = "UTF-8";

	static String templateFileName = null;

	private final static String GENERATE_FILE_ENTITY_TPL_NAME = "Entity.java.ftl";
	private final static String GENERATE_FILE_REPOSITORY_TPL_NAME = "Repository.java.ftl";
	private final static String GENERATE_FILE_REPOSITORY_EXTEND_TPL_NAME = "RepositoryExtend.java.ftl";
	private final static String GENERATE_FILE_REPOSITORY_EXTEND_IMPL_TPL_NAME = "RepositoryExtendImpl.java.ftl";

	private final static String TEMPLATE_DIR = "/cn.doublepoint.generate.domain.model.helper.template/";

	private final static String TEMPLATE_ENTITY_KEY_NAME = "baseModel";

	/**
	 * 分别获取 某个表对应的某个文件内容
	 * 
	 * @param file
	 * @param tableNameLlist
	 * @return
	 * @throws TemplateException
	 * @throws IOException
	 */
	public static Map<String, String> buildEntityByTableNameList(List<BaseTemplate> baseModelList)
			throws TemplateException, IOException {
		if (baseModelList == null || baseModelList.size() == 0)
			return null;
		Map<String, String> tableContentMap = new HashMap<String, String>();
		baseModelList.forEach(baseModel -> {
			Map<String, Object> data = new HashMap<String, Object>();
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
			data.put("datetime", formatter.format(date));
			data.put(TEMPLATE_ENTITY_KEY_NAME, baseModel);
			try {
				String template = createFileByTemplate(GENERATE_FILE_ENTITY_TPL_NAME, data);
				tableContentMap.put(baseModel.getEntityModel().getTableName(), template);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});

		return tableContentMap;
	}

	/**
	 * 分别获取 某个表对应的某个文件内容
	 * 
	 * @param file
	 * @param tableNameLlist
	 * @return
	 * @throws TemplateException
	 * @throws IOException
	 */
	public static Map<String, String> buildRepositoryByTableNameList(List<BaseTemplate> baseModelList)
			throws TemplateException, IOException {
		Map<String, String> tableContentMap = new HashMap<String, String>();
		baseModelList.stream().forEach(baseModel -> {
			Map<String, Object> data = new HashMap<String, Object>();
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
			data.put("datetime", formatter.format(date));
			data.put(TEMPLATE_ENTITY_KEY_NAME, baseModel);
			try {
				String template = createFileByTemplate(GENERATE_FILE_REPOSITORY_TPL_NAME, data);
				tableContentMap.put(baseModel.getEntityModel().getTableName(), template);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
		return tableContentMap;
	}

	public static String buildEntityByTableName(File file, String tableName) throws TemplateException, IOException {
		List<BaseTemplate> entityModelList = buildEntityModelList(file, tableName);

		Map<String, Object> data = new HashMap<String, Object>();
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		data.put("datetime", formatter.format(date));
		data.put(TEMPLATE_ENTITY_KEY_NAME, entityModelList.get(0));
		String template = createFileByTemplate(GENERATE_FILE_ENTITY_TPL_NAME, data);
		return template;
	}

	/**
	 * 根据模板创建文件
	 * 
	 * @param sourceTemplate
	 * @param newFile
	 * @param templateData
	 * @throws TemplateException
	 * @throws IOException
	 */
	public static String createFileByTemplate(String templateFile, Map<String, Object> templateData)
			throws TemplateException, IOException {
		ApplicationContext ac = new FileSystemXmlApplicationContext("classpath:servlet-front.xml");
		FreeMarkerConfigurer freemarkerConfig = (FreeMarkerConfigurer) ac.getBean("freemarkerConfig");
		Configuration conf = freemarkerConfig.getConfiguration();
		// FileWriter不能指定编码确实是个问题，只能用这个代替了。
		// Template template = conf.getTemplate("classpath:"+sourceTemplate);
		conf.setClassForTemplateLoading(GenerateTemplateUtil.class, "/template");
		Template template = conf.getTemplate(templateFile); // framemaker.ftl为要装载的模板
		String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, templateData);
		return text;
	}

	/**
	 * 获取所有的实体信息 包括字段信息
	 * 
	 * @param file
	 * @param tableName
	 * @return
	 */
	public static List<BaseTemplate> buildEntityModelList(File file, List<String> tableNameList) {
		List<BaseTemplate> baseModelList = new ArrayList<BaseTemplate>();
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			NodeList classElementNodeList = db.parse(file).getElementsByTagName("c:Classes").item(0).getChildNodes();
			for (int i = 0; i < classElementNodeList.getLength(); i++) {
				List<TemplateEntityField> fieldList = new ArrayList<TemplateEntityField>();
				TemplateEntityModel entityModel = new TemplateEntityModel();
				NodeList classChildrenList = classElementNodeList.item(i).getChildNodes();
				boolean isadd = false;
				for (int j = 0; j < classChildrenList.getLength(); j++) {
					if (!(classChildrenList.item(j) instanceof Element))
						continue;
					Element item = (Element) classChildrenList.item(j);
					String nodeName = item.getNodeName();
					String nodeValue = item.getTextContent();
					if (nodeValue == null || nodeValue == "")
						break;
					isadd = true;
					switch (nodeName) {
					case "a:Name":// 中文说明
						entityModel.setChName(nodeValue);
						break;
					case "a:Code":// 英文编码
						entityModel.setTableName(nodeValue);
						break;
					case "a:Comment":// 中文备注
						entityModel.setRemark(nodeValue);
						break;
					case "a:Stereotype":// 实体 枚举 值对象类型
						entityModel.setType(nodeValue);
						break;
					// 属性名称
					case "c:Attributes": {
						NodeList attributeNodeList = item.getChildNodes();
						for (int k = 0; k < attributeNodeList.getLength(); k++) {
							TemplateEntityField field = new TemplateEntityField();
							boolean addFlag = false;
							Node attributeNode = attributeNodeList.item(k);
							for (int l = 0; l < attributeNode.getChildNodes().getLength(); l++) {
								Node attributeChildNode = attributeNode.getChildNodes().item(l);
								String attributeChildNodeNameString = attributeChildNode.getNodeName();
								String attributeChildNodeValueString = attributeChildNode.getTextContent();
								if (attributeChildNodeValueString == null || attributeChildNodeValueString == "")
									break;
								switch (attributeChildNodeNameString) {
								case "a:Name":
									addFlag = true;
									field.setFieldComment(attributeChildNodeValueString);
									break;
								case "a:Code":
									addFlag = true;
									field.setFieldName(attributeChildNodeValueString);
									break;
								case "a:DataType":
									addFlag = true;
									field.setFieldType(attributeChildNodeValueString);
									break;
								default:
									break;
								}

							}
							if (addFlag) {
								fieldList.add(field);
							}
						}
					}
						break;
					default:
						break;
					}
				}
				if (isadd) {
					entityModel.setFields(fieldList);
					if(tableNameList==null||tableNameList.size()==0){
						BaseTemplate baseTemplate=new BaseTemplate(entityModel);
						baseModelList.add(baseTemplate);
					}
					else if(tableNameList.stream().filter(entityModel.getTableName()::equalsIgnoreCase).count()>0){
						BaseTemplate baseTemplate=new BaseTemplate(entityModel);
						baseModelList.add(baseTemplate);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return baseModelList;
	}

	/**
	 * 获取所有的实体信息 包括字段信息
	 * 
	 * @param file
	 * @param tableName
	 * @return
	 */
	public static List<BaseTemplate> buildEntityModelList(File file, String tableName) {
		if(StringUtil.isNullOrEmpty(tableName)){
			List<String> list=new ArrayList<String>();
			return buildEntityModelList(file,list);
		}
		else {
			List<String> list=new ArrayList<String>();
			list.add(tableName);
			return buildEntityModelList(file,list);
		}
 	}

	/**
	 * 获取所有的实体信息 包括字段信息
	 * 
	 * @param file
	 * @param tableName
	 * @return
	 */
	public static List<BaseTemplate> buildEntityModelList(File file) {
		return buildEntityModelList(file,"");
	}

	/**
	 * 获取文件中所有表信息 不包括字段信息
	 * 
	 * @param file
	 * @return
	 */
	public static List<TemplateEntityModel> buildTableNameList(File file) {
		List<TemplateEntityModel> entityModelList = new ArrayList<TemplateEntityModel>();
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			NodeList classElementNodeList = db.parse(file).getElementsByTagName("c:Classes").item(0).getChildNodes();
			for (int i = 0; i < classElementNodeList.getLength(); i++) {
				TemplateEntityModel entityModel = new TemplateEntityModel();
				NodeList classChildrenList = classElementNodeList.item(i).getChildNodes();
				boolean isadd = false;
				for (int j = 0; j < classChildrenList.getLength(); j++) {
					if (!(classChildrenList.item(j) instanceof Element))
						continue;
					Element item = (Element) classChildrenList.item(j);
					String nodeName = item.getNodeName();
					String nodeValue = item.getTextContent();
					if (nodeValue == null || nodeValue == "")
						break;
					isadd = true;
					switch (nodeName) {
					case "a:Name":// 中文说明
						entityModel.setChName(nodeValue);
						break;
					case "a:Code":// 英文编码
						entityModel.setTableName(nodeValue);
						break;
					case "a:Comment":// 中文备注
						entityModel.setRemark(nodeValue);
						break;
					case "a:Stereotype":// 实体 枚举 值对象类型
						entityModel.setType(nodeValue);
						break;
					default:
						break;
					}
				}
				if (isadd) {
					entityModelList.add(entityModel);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entityModelList;

	}

	/**
	 * 获取生成的模板的文件名称，包括扩展名
	 * 
	 * @param tableName
	 * @param type
	 * @return
	 */
	public static String getFileNameContainExt(String tableName, EGenerateType type) {
		return getName(tableName, type, true);
	}

	/**
	 * 获取生成的模板的文件名称，不包括扩展名
	 * 
	 * @param tableName
	 * @param type
	 * @return
	 */
	public static String getFileNameNotContainExt(String tableName, EGenerateType type) {
		return getName(tableName, type, false);
	}

	/**
	 * 获取生成的模板的文件名称，不包括扩展名
	 * 
	 * @param tableName
	 * @param type
	 * @return
	 */
	public static String getClassName(String tableName, EGenerateType type) {
		return getName(tableName, type, false);
	}

	/**
	 * 根据Table名称获取对应的名称
	 * 
	 * @param tableName
	 * @param type
	 * @param isContainExt
	 *            是否包含扩展名
	 * @return
	 */
	public static String getName(String tableName, EGenerateType type, boolean isContainExt) {
		if (type == EGenerateType.Entity)
			return StringUtil.filter(GenerateEntityFilterUtil.getFilters(),
					StringUtil.underlineToCamelOfFirstUpper(tableName)) + (isContainExt ? ".java" : "");
		if (type == EGenerateType.Repository)
			return StringUtil.filter(GenerateEntityFilterUtil.getFilters(),
					StringUtil.underlineToCamelOfFirstUpper(tableName)) + "Repository" + (isContainExt ? ".java" : "");
		if (type == EGenerateType.Application)
			return StringUtil.filter(GenerateEntityFilterUtil.getFilters(),
					StringUtil.underlineToCamelOfFirstUpper(tableName)) + "Application" + (isContainExt ? ".java" : "");
		if (type == EGenerateType.Jsp)
			return StringUtil.filter(GenerateEntityFilterUtil.getFilters(),
					StringUtil.underlineToCamelOfFirstUpper(tableName)) + "" + (isContainExt ? ".jsp" : "");
		if (type == EGenerateType.Sctipt)
			return StringUtil.filter(GenerateEntityFilterUtil.getFilters(),
					StringUtil.underlineToCamelOfFirstUpper(tableName)) + "Sctipt" + (isContainExt ? ".js" : "");
		if (type == EGenerateType.DialogJsp)
			return StringUtil.filter(GenerateEntityFilterUtil.getFilters(),
					StringUtil.underlineToCamelOfFirstUpper(tableName)) + "Dialog" + (isContainExt ? ".jsp" : "");
		if (type == EGenerateType.DialogScript)
			return StringUtil.filter(GenerateEntityFilterUtil.getFilters(),
					StringUtil.underlineToCamelOfFirstUpper(tableName)) + "DialogScript" + (isContainExt ? ".js" : "");
		if (type == EGenerateType.Controller)
			return StringUtil.filter(GenerateEntityFilterUtil.getFilters(),
					StringUtil.underlineToCamelOfFirstUpper(tableName)) + "Controller" + (isContainExt ? ".java" : "");
		return tableName;
	}

	/**
	 * 项目classpath相对路径
	 * 
	 * @param packageName
	 * @param name
	 * @return
	 */
	@SuppressWarnings("unused")
	private String getFilePath(String packageName, String name) {
		String path = converString(packageName);
		return "src/" + path + "/" + name;
	}

	/**
	 * \\. 换 /
	 * 
	 * @param s
	 * @return
	 */
	private static String converString(String s) {
		return s.replaceAll("\\.", "/").replace("\\", "/");
	}
}
