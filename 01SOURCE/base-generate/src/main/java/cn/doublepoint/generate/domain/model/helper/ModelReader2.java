package cn.doublepoint.generate.domain.model.helper;

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
import javax.xml.parsers.ParserConfigurationException;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import cn.doublepoint.generate.domain.model.billing.CONSTANT;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class ModelReader2 {
	public static final String entity_p = "com.caland.core.bean";
	public static final String query_p = "com.caland.core.query";
	public static final String entity_xml_p = "ibatis";
	public static final String sqlmap_config_xml = "";
	
	public static final String action_p = "com.caland.core.action";
	public static final String dao_p = "com.caland.core.dao";
	public static final String dao_impl_p = "com.caland.core.dao.impl";
	public static final String service_p = "com.caland.core.service";
	public static final String service_impl_p = "com.caland.core.service.impl";
	
	public static final String template_dir = "com.caland.common.template";
	public static final String dao_tpl = "dao.txt";
	public static final String dao_impl_tpl = "dao_impl.txt";
	public static final String service_tpl = "service.txt";
	public static final String service_impl_tpl = "service_impl.txt";
	public static final String action_tpl = "action.txt";
	public static final String entity_tpl = "Entity.txt";
	public static final String query_tpl = "query.txt";
	public static final String entity_xml_tpl = "entity-sqlmap.txt";
	public static final String sqlmap_config_tpl = "sqlmap-config.txt";
	//分库
	public static final String sharding_rules_on_namespace_p = "dbRule";
	public static final String hash_function_p = "com.caland.core.dao.router";
	public static final String sharding_rules_on_namespace_tpl = "sharding-rules-on-namespace.txt";
	public static final String hash_function_tpl = "hash-function.txt";
	
	public static final boolean is_action = true;
	public static final boolean is_service = true;
	public static final boolean is_dao = true;
	public static final boolean is_page = false;
	
	public static final String SPT = File.separator;

	public static final String ENCODING = "UTF-8";
	
	Map<String, Object> data = new HashMap<String, Object>();

	public static List<JavaBeanModel> getEntityModelList() throws IOException {
		List<JavaBeanModel> entityModelList = new ArrayList<JavaBeanModel>();

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document document = db.parse("file:/F://AllProject//00参考文件//BaseInfrastructure//系统支撑.oom");
			NodeList classesList = document.getElementsByTagName("c:Classes");
			Node classesElementNode = classesList.item(0);
			NodeList classElementNodeList = classesElementNode.getChildNodes();
			for (int i = 0; i < classElementNodeList.getLength(); i++) {
				List<ModelField> fieldList = new ArrayList<ModelField>();
				JavaBeanModel entityModel = new JavaBeanModel();
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
						entityModel.setChName(nodeValue);
						break;
					case "a:Code":
						entityModel.setTableName(nodeValue);
						break;
					case "a:Comment":
						entityModel.setRemark(nodeValue);
						break;
					case "a:Stereotype":
						entityModel.setType(nodeValue);
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
							if (addFlag)
								fieldList.add(field);
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
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return entityModelList;
	}

	/**
	 * 生成
	 * @param tpl
	 * @param f
	 * @throws TemplateException
	 * @throws IOException
	 */
	public void index(String tpl,File f) throws TemplateException, IOException{
		File parent = f.getParentFile();
		if (!parent.exists()) {
			f.mkdirs();
		}
		if (!f.exists()) {
			try {
				f.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
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

	@Autowired
	public void setFreeMarkerConfigurer(
			FreeMarkerConfigurer freeMarkerConfigurer) {
		this.conf = freeMarkerConfigurer.getConfiguration();
	}
	private void writeModel(List<JavaBeanModel> entityModelList) {
		for (JavaBeanModel modelModel : entityModelList) {
			if (modelModel.getType() != null) {
				File file;
				switch (modelModel.getType()) {
				case CONSTANT.CLASS_TYPE_ENTITY:
					file = new File(
							"F:/AllProject/01SOURCE/domain-model/entity/" + "T_" + modelModel.getTableName() + ".java");
					break;
				case CONSTANT.CLASS_TYPE_ENUM:
					file = new File("F:/AllProject/01SOURCE/domain-model/enum/" + modelModel.getTableName() + ".java");
					break;
				default:
					file = new File(
							"F:/AllProject/01SOURCE/domain-model/valueobject/" + modelModel.getTableName() + ".java");
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
				// try {
				// outputStream.write(Byte.valueOf(modelModel.getCotent()));
				// } catch (NumberFormatException e) {
				// // TODO Auto-generated catch block
				// e.printStackTrace();
				// } catch (IOException e) {
				// // TODO Auto-generated catch block
				// e.printStackTrace();
				// }
				// System.out.println(modelModel.getCotent().toString());
			}
		}
	}
}
