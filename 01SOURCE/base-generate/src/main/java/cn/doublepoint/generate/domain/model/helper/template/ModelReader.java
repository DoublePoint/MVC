//package cn.doublepoint.generate.domain.model.helper.template;
//
//import java.io.File;
//import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.OutputStreamWriter;
//import java.io.PrintWriter;
//import java.io.Writer;
//import java.lang.reflect.Field;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.stream.Collectors;
//
//import javax.xml.parsers.DocumentBuilder;
//import javax.xml.parsers.DocumentBuilderFactory;
//
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.FileSystemXmlApplicationContext;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
//import org.w3c.dom.Element;
//import org.w3c.dom.Node;
//import org.w3c.dom.NodeList;
//
//import cn.doublepoint.common.constant.XTConstant;
//import cn.doublepoint.commonutil.domain.model.StringUtil;
//import cn.doublepoint.generate.domain.model.billing.CONSTANT;
//import cn.doublepoint.generate.domain.model.helper.BeanModel;
//import cn.doublepoint.generate.domain.model.helper.ModelConstantJS;
//import cn.doublepoint.generate.domain.model.helper.ModelField;
//import freemarker.template.Configuration;
//import freemarker.template.Template;
//import freemarker.template.TemplateException;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:servlet-front.xml" })
//public class ModelReader {
//	public final String ENTITY_P = "com.caland.core.bean";
//	public final String QUERY_P = "com.caland.core.query";
//	public final String ENTITY_XML_P = "ibatis";
//	public final String SQLMAP_CONFIG_XML = "";
//
//	public final String ACTION_P = "com.caland.core.action";
//	public final String DAO_P = "com.caland.core.dao";
//	public final String DAO_IMPL_P = "com.caland.core.dao.impl";
//	public final String SERVICE_P = "com.caland.core.service";
//	public final String SERVICE_IMPL_P = "com.caland.core.service.impl";
//
//	public final String DAO_TPL = "dao.txt";
//	public final String DAO_IMPL_TPL = "dao_impl.txt";
//	public final String SERVICE_TPL = "service.txt";
//	public final String SERVICE_IMPL_TPL = "service_impl.txt";
//	public final String ACTION_TPL = "action.txt";
//
//	public final String QUERY_TPL = "query.txt";
//	public final String ENTITY_XML_TPL = "entity-sqlmap.txt";
//	public final String SQLMAP_CONFIG_TPL = "sqlmap-config.txt";
//	// 分库
//	public final String SHARDING_RULES_ON_NAMESPACE_P = "dbRule";
//	public final String HASH_FUNCTION_P = "com.caland.core.dao.router";
//	public final String SHARDING_RULES_ON_NAMESPACE_TPL = "sharding-rules-on-namespace.txt";
//	public final String HASH_FUNCTION_TPL = "hash-function.txt";
//
//	public final boolean IS_ACTION = true;
//	public final boolean IS_SERVICE = true;
//	public final boolean IS_DAO = true;
//	public final boolean IS_PAGE = false;
//
//	public final String SPT = File.separator;
//
//	public final String ENCODING = "UTF-8";
//
//	String templateFileName = null;
//
//	private final String EXT_TYPE_JAVA = ".java";
//	private final String EXT_TYPE_JS = ".js";
//
//	private final String GENERATE_FILE_ENTITY_DIR = "F:/AllProject/01SOURCE/domain-model/test/";
//	private final String GENERATE_FILE_ENTITY_TPL_NAME = "Entity.java.ftl";
//	private final String GENERATE_FILE_ENTITY_EXT_TYPE_ = EXT_TYPE_JAVA;
//
//	private final String GENERATE_FILE_CONSTANT_JS_DIR = "F:/AllProject/01SOURCE/domain-model/test/js/";
//	private final String GENERATE_FILE_CONSTANT_JS_EXT_TYPE_ = EXT_TYPE_JS;
//	private final String GENERATE_FILE_CONSTANT_JS_TPL_NAME = "Constant.js.ftl";
//	private final String GENERATE_FILE_CONSTANT_JS_FILE_NAME_ = GENERATE_FILE_CONSTANT_JS_DIR + "framework-xt-constant"
//			+ GENERATE_FILE_CONSTANT_JS_EXT_TYPE_;
//	
//	private final String GENERATE_FILE_REPOSITORY_DIR = "F:/AllProject/01SOURCE/domain-model/test/repository/";
//	private final String GENERATE_FILE_REPOSITORY_EXT_TYPE_ = EXT_TYPE_JAVA;
//	private final String GENERATE_FILE_REPOSITORY_TPL_NAME = "Repository.java.ftl";
//	
//	private final String GENERATE_FILE_REPOSITORY_EXTEND_DIR = "F:/AllProject/01SOURCE/domain-model/test/repository/";
//	private final String GENERATE_FILE_REPOSITORY_EXTEND_EXT_TYPE_ = EXT_TYPE_JAVA;
//	private final String GENERATE_FILE_REPOSITORY_EXTEND_TPL_NAME = "RepositoryExtend.java.ftl";
//	
//	private final String GENERATE_FILE_REPOSITORY_EXTEND_IMPL_DIR = "F:/AllProject/01SOURCE/domain-model/test/repository/";
//	private final String GENERATE_FILE_REPOSITORY_EXTEND_IMPL_EXT_TYPE_ = EXT_TYPE_JAVA;
//	private final String GENERATE_FILE_REPOSITORY_EXTEND_IMPL_TPL_NAME = "RepositoryExtendImpl.java.ftl";
//
//	private final String TEMPLATE_DIR = "cn.doublepoint.generate.domain.model.helper.template/";
//
//	List<BeanModel> entityModelList = new ArrayList<BeanModel>();
//	Map<String, Object> data = new HashMap<String, Object>();
//	private final String TEMPLATE_ENTITY_KEY_NAME = "entityModel";
//
//	@Test
//	public void buildEntity() {
//		buildEntityModelList();
//		entityModelList.stream().forEach(entityModel -> {
//			String fileEntityFir=GENERATE_FILE_ENTITY_DIR;//将要生成的实体文件所在文件夹
//			String className=entityModel.getClassName();
//			
//			data.put(TEMPLATE_ENTITY_KEY_NAME, entityModel);
//			File f = new File(
//					fileEntityFir + className + GENERATE_FILE_ENTITY_EXT_TYPE_);
//			templateFileName = converString(TEMPLATE_DIR) + "" + GENERATE_FILE_ENTITY_TPL_NAME;
//
//			try {
//				createFileByTemplate(templateFileName, f, data);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		});
//	}
//	@Test
//	public void buildEntityRepository() {
//		buildEntityModelList();
//		entityModelList.stream().forEach(entityModel -> {
//			data.put(TEMPLATE_ENTITY_KEY_NAME, entityModel);
//			File f = new File(GENERATE_FILE_REPOSITORY_DIR + StringUtil.join(entityModel.getTableName().split("_")).toUpperCase()+"Repository" + GENERATE_FILE_REPOSITORY_EXT_TYPE_);
//			templateFileName = converString(TEMPLATE_DIR) + "" + GENERATE_FILE_REPOSITORY_TPL_NAME;
//
//			try {
//				createFileByTemplate(templateFileName, f, data);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		});
//	}
//	@Test
//	public void buildEntityRepositoryExtend() {
//		buildEntityModelList();
//		entityModelList.stream().forEach(entityModel -> {
//			data.put(TEMPLATE_ENTITY_KEY_NAME, entityModel);
//			File f = new File(GENERATE_FILE_REPOSITORY_EXTEND_DIR + StringUtil.join(entityModel.getTableName().split("_")).toUpperCase()+"RepositoryExtend" + GENERATE_FILE_REPOSITORY_EXTEND_EXT_TYPE_);
//			templateFileName = converString(TEMPLATE_DIR) + "" + GENERATE_FILE_REPOSITORY_EXTEND_TPL_NAME;
//
//			try {
//				createFileByTemplate(templateFileName, f, data);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		});
//	}
//	@Test
//	public void buildEntityRepositoryExtendImpl() {
//		buildEntityModelList();
//		entityModelList.stream().forEach(entityModel -> {
//			data.put(TEMPLATE_ENTITY_KEY_NAME, entityModel);
//			File f = new File(GENERATE_FILE_REPOSITORY_EXTEND_IMPL_DIR + StringUtil.join(entityModel.getTableName().split("_")).toUpperCase()+"RepositoryExtendImpl" + GENERATE_FILE_REPOSITORY_EXTEND_IMPL_EXT_TYPE_);
//			templateFileName = converString(TEMPLATE_DIR) + "" + GENERATE_FILE_REPOSITORY_EXTEND_IMPL_TPL_NAME;
//
//			try {
//				createFileByTemplate(templateFileName, f, data);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		});
//	}
//	@Test
//	public void buildEntityQuery() {
//
//	}
//
//	@Test
//	public void buildConstantJs() throws Exception {
//		Class<XTConstant> clazz = XTConstant.class;
//		Field[] fields = clazz.getDeclaredFields();
//
//		List<ModelConstantJS> fieldList = Arrays.stream(fields).map(field -> {
//			try {
//				return new ModelConstantJS(field.getName(), field.getType().toString().toLowerCase(),
//						field.get(clazz).toString(), "");
//			} catch (Exception e) {
//				return null;
//			}
//		}).collect(Collectors.toList());
//
//		File newFile = new File(GENERATE_FILE_CONSTANT_JS_DIR + "Constant" + GENERATE_FILE_CONSTANT_JS_EXT_TYPE_);
//		templateFileName = converString(TEMPLATE_DIR) + "" + GENERATE_FILE_CONSTANT_JS_TPL_NAME;
//		data.put("fieldList", fieldList);
//		try {
//			createFileByTemplate(templateFileName, newFile, data);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}
//
//	/**
//	 * 根据模板创建文件
//	 * 
//	 * @param sourceTemplate
//	 * @param newFile
//	 * @param templateData
//	 * @throws TemplateException
//	 * @throws IOException
//	 */
//	public void createFileByTemplate(String sourceTemplate, File newFile, Map<String, Object> templateData)
//			throws TemplateException, IOException {
//		File parent = newFile.getParentFile();
//		if (!parent.exists()) {
//			parent.mkdirs();
//		}
//		Writer out = null;
//		try {
//			// FileWriter不能指定编码确实是个问题，只能用这个代替了。
//			out = new OutputStreamWriter(new FileOutputStream(newFile), ENCODING);
//			sourceTemplate = "/target/classes/" + sourceTemplate;
//			Template template = conf.getTemplate(sourceTemplate);
//			template.process(templateData, out);
//		} finally {
//			if (out != null) {
//				out.flush();
//				out.close();
//			}
//		}
//
//	}
//
//	@SuppressWarnings("resource")
//	@Before
//	@Autowired
//	public void setFreeMarkerConfigurer() {
//		ApplicationContext ac = new FileSystemXmlApplicationContext("classpath:servlet-front.xml");
//		FreeMarkerConfigurer freemarkerConfig = (FreeMarkerConfigurer) ac.getBean("freemarkerConfig");
//		this.conf = freemarkerConfig.getConfiguration();
//		Date date = new Date();
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
//		data.put("datetime", formatter.format(date));
//	}
//
//	private void buildEntityModelList() {
//		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
//		try {
//			DocumentBuilder db = dbf.newDocumentBuilder();
//			NodeList classElementNodeList = db.parse("file:/F://AllProject//00参考文件//BaseInfrastructure//系统支撑.oom")
//					.getElementsByTagName("c:Classes").item(0).getChildNodes();
//			for (int i = 0; i < classElementNodeList.getLength(); i++) {
//				List<ModelField> fieldList = new ArrayList<ModelField>();
//				BeanModel entityModel = new BeanModel();
//				NodeList classChildrenList = classElementNodeList.item(i).getChildNodes();
//				boolean isadd = false;
//				for (int j = 0; j < classChildrenList.getLength(); j++) {
//					if (!(classChildrenList.item(j) instanceof Element))
//						continue;
//					Element item = (Element) classChildrenList.item(j);
//					String nodeName = item.getNodeName();
//					String nodeValue = item.getTextContent();
//					if (nodeValue == null || nodeValue == "")
//						break;
//					isadd = true;
//					switch (nodeName) {
//					case "a:Name"://中文说明
//						entityModel.setChName(nodeValue);
//						break;
//					case "a:Code"://英文编码
//						entityModel.setTableName(nodeValue);
//						break;
//					case "a:Comment"://中文备注
//						entityModel.setRemark(nodeValue);
//						break;
//					case "a:Stereotype"://实体 枚举 值对象类型
//						entityModel.setType(nodeValue);
//						break;
//						//属性名称
//					case "c:Attributes": {
//						NodeList attributeNodeList = item.getChildNodes();
//						for (int k = 0; k < attributeNodeList.getLength(); k++) {
//							ModelField field = new ModelField();
//							boolean addFlag = false;
//							Node attributeNode = attributeNodeList.item(k);
//							for (int l = 0; l < attributeNode.getChildNodes().getLength(); l++) {
//								Node attributeChildNode = attributeNode.getChildNodes().item(l);
//								String attributeChildNodeNameString = attributeChildNode.getNodeName();
//								String attributeChildNodeValueString = attributeChildNode.getTextContent();
//								if (attributeChildNodeValueString == null || attributeChildNodeValueString == "")
//									break;
//								switch (attributeChildNodeNameString) {
//								case "a:Name":
//									addFlag = true;
//									field.setFieldComment(attributeChildNodeValueString);
//									break;
//								case "a:Code":
//									addFlag = true;
//									field.setFieldName(attributeChildNodeValueString);
//									break;
//								case "a:DataType":
//									addFlag = true;
//									field.setFieldType(attributeChildNodeValueString);
//									break;
//								default:
//									break;
//								}
//
//							}
//							if (addFlag) {
//								fieldList.add(field);
//							}
//						}
//					}
//						break;
//					default:
//						break;
//					}
//				}
//				if (isadd) {
//					entityModel.setFields(fieldList);
//					entityModelList.add(entityModel);
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	private Configuration conf;
//
//	@SuppressWarnings({ "unused", "resource" })
//	private void writeModel(List<BeanModel> entityModelList) {
//		for (BeanModel modelModel : entityModelList) {
//			if (modelModel.getType() != null) {
//				File file;
//				switch (modelModel.getType()) {
//				case CONSTANT.CLASS_TYPE_ENTITY:
//					file = new File("F:/AllProject/01SOURCE/domain-model/entity/" + "T_"
//							+ modelModel.getTableName() + ".java");
//					break;
//				case CONSTANT.CLASS_TYPE_ENUM:
//					file = new File(
//							"F:/AllProject/01SOURCE/domain-model/enum/" + modelModel.getTableName() + ".java");
//					break;
//				default:
//					file = new File("F:/AllProject/01SOURCE/domain-model/valueobject/" + modelModel.getTableName()
//							+ ".java");
//					break;
//				}
//				if (!file.exists()) {
//					try {
//						file.createNewFile();
//					} catch (IOException e) {
//						e.printStackTrace();
//					}
//				}
//				FileOutputStream outputStream;
//				try {
//					outputStream = new FileOutputStream(file);
//					PrintWriter writer = new PrintWriter(outputStream);
//					writer.write(new StringBuilder(modelModel.getCotent()).toString().toCharArray());
//					writer.flush();
//				} catch (FileNotFoundException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
//
//	/**
//	 * 项目classpath相对路径
//	 * 
//	 * @param packageName
//	 * @param name
//	 * @return
//	 */
//	@SuppressWarnings("unused")
//	private String getFilePath(String packageName, String name) {
//		String path = converString(packageName);
//		return "src/" + path + "/" + name;
//	}
//
//	/**
//	 * \\. 换 /
//	 * 
//	 * @param s
//	 * @return
//	 */
//	private String converString(String s) {
//		return s.replaceAll("\\.", "/").replace("\\", "/");
//	}
//
//}
