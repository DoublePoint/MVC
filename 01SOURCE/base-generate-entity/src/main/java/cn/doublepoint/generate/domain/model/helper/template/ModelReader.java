package cn.doublepoint.generate.domain.model.helper.template;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import cn.doublepoint.generate.domain.model.billing.CONSTANT;
import cn.doublepoint.generate.domain.model.helper.ModelField;
import cn.doublepoint.generate.domain.model.helper.ModelModel;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:servlet-front.xml"})
public class ModelReader {
	public  final String entity_p = "com.caland.core.bean";
	public  final String query_p = "com.caland.core.query";
	public  final String entity_xml_p = "ibatis";
	public  final String sqlmap_config_xml = "";

	public  final String action_p = "com.caland.core.action";
	public  final String dao_p = "com.caland.core.dao";
	public  final String dao_impl_p = "com.caland.core.dao.impl";
	public  final String service_p = "com.caland.core.service";
	public  final String service_impl_p = "com.caland.core.service.impl";

	public  final String template_dir = "com.caland.common.template";
	public  final String dao_tpl = "dao.txt";
	public  final String dao_impl_tpl = "dao_impl.txt";
	public  final String service_tpl = "service.txt";
	public  final String service_impl_tpl = "service_impl.txt";
	public  final String action_tpl = "action.txt";
	public  final String entity_tpl = "entity.txt";
	public  final String query_tpl = "query.txt";
	public  final String entity_xml_tpl = "entity-sqlmap.txt";
	public  final String sqlmap_config_tpl = "sqlmap-config.txt";
	// 分库
	public  final String sharding_rules_on_namespace_p = "dbRule";
	public  final String hash_function_p = "com.caland.core.dao.router";
	public  final String sharding_rules_on_namespace_tpl = "sharding-rules-on-namespace.txt";
	public  final String hash_function_tpl = "hash-function.txt";

	public  final boolean is_action = true;
	public  final boolean is_service = true;
	public  final boolean is_dao = true;
	public  final boolean is_page = false;

	public  final String SPT = File.separator;

	public  final String ENCODING = "UTF-8";

	String tpl = null;

	@Test
	public void test1() {

		List<ModelModel> entityModelList = new ArrayList<ModelModel>();
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document document = db.parse("file:/F://AllProject//00参考文件//BaseInfrastructure//系统支撑.oom");
			NodeList classesList = document.getElementsByTagName("c:Classes");
			Node classesElementNode = classesList.item(0);
			NodeList classElementNodeList = classesElementNode.getChildNodes();
			for (int i = 0; i < classElementNodeList.getLength(); i++) {
				List<ModelField> fieldList = new ArrayList<ModelField>();
				ModelModel entityModel = new ModelModel();
				Node classElementNode = classElementNodeList.item(i);
				NodeList classChildrenList = classElementNode.getChildNodes();
				for (int j = 0; j < classChildrenList.getLength(); j++) {
					Node item = classChildrenList.item(j);
					String nodeName = item.getNodeName();
					String nodeValue = item.getNodeValue();
					if (nodeValue == null || nodeValue == "")
						break;
					switch (nodeName) {
					case "a:Name":
						entityModel.setModelName(nodeValue);
						break;
					case "a:Code":
						entityModel.setModelCode(nodeValue);
						break;
					case "a:Comment":
						entityModel.setModelComment(nodeValue);
						break;
					case "a:Stereotype":
						entityModel.setModelType(nodeValue);
						break;
					case "c:Attributes": {
						NodeList attributeNodeList = item.getChildNodes();
						for (int k = 0; k < attributeNodeList.getLength(); k++) {
							ModelField field = new ModelField();
							boolean addFlag = false;
							Node attributeNode = attributeNodeList.item(k);
							for (int l = 0; l < attributeNode.getChildNodes().getLength(); l++) {
								Node attributeChildNode = attributeNode.getChildNodes().item(l);
								String attributeChildNodeNameString = attributeChildNode.getNodeName();
								String attributeChildNodeValueString = attributeChildNode.getNodeValue();
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
				entityModel.setFields(fieldList);
				entityModelList.add(entityModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		entityModelList.stream().forEach(entityModel -> {
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("entityModel", entityModel);
			File f = new File("F:/AllProject/01SOURCE/domain-model/test"+entityModel.getModelName() + ".java");
			tpl = converString("cn.doublepoint.generate.domain.model.helper.template" + SPT + entity_tpl);
			
//			tpl = entity_tpl;
			try {
				index(tpl, f,data);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});

	
	}

	/**
	 * 生成
	 * 
	 * @param tpl
	 * @param f
	 * @throws TemplateException
	 * @throws IOException
	 */
	public void index(String tpl, File f, Map<String, Object> data) throws TemplateException, IOException {
		File parent = f.getParentFile();
		if (!parent.exists()) {
			f.mkdirs();
		}
		Writer out = null;
		try {
			// FileWriter不能指定编码确实是个问题，只能用这个代替了。
			out = new OutputStreamWriter(new FileOutputStream(f), ENCODING);
			Template template = conf.getTemplate(tpl);
			template.process(data, out);
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}

	}

	private Configuration conf;

	@Before
	@Autowired
	public void setFreeMarkerConfigurer() {
		ApplicationContext ac = new FileSystemXmlApplicationContext("classpath:servlet-front.xml");
		FreeMarkerConfigurer freemarkerConfig=(FreeMarkerConfigurer)ac.getBean("freemarkerConfig");
		this.conf = freemarkerConfig.getConfiguration();
	}

	private void writeModel(List<ModelModel> entityModelList) {
		for (ModelModel modelModel : entityModelList) {
			if (modelModel.getModelType() != null) {
				File file;
				switch (modelModel.getModelType()) {
				case CONSTANT.CLASS_TYPE_ENTITY:
					file = new File(
							"F:/AllProject/01SOURCE/domain-model/entity/" + "T_" + modelModel.getModelCode() + ".java");
					break;
				case CONSTANT.CLASS_TYPE_ENUM:
					file = new File("F:/AllProject/01SOURCE/domain-model/enum/" + modelModel.getModelCode() + ".java");
					break;
				default:
					file = new File(
							"F:/AllProject/01SOURCE/domain-model/valueobject/" + modelModel.getModelCode() + ".java");
					break;
				}
				if (!file.exists()) {
					try {
						file.createNewFile();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				FileOutputStream outputStream;
				try {
					outputStream = new FileOutputStream(file);
					PrintWriter writer = new PrintWriter(outputStream);
					writer.write(new StringBuilder(modelModel.getCotent()).toString().toCharArray());
					writer.flush();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 项目classpath相对路径
	 * 
	 * @param packageName
	 * @param name
	 * @return
	 */
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
	private String converString(String s) {
		return s.replaceAll("\\.", "/").replace("\\", "/");
	}
}
