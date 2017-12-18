package cn.doublepoint.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.junit.Test;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import cn.doublepoint.billing.CONSTANT;

/**
 * DOM方式解析xml
 */
public class DOMTest {

	@Test
	public void test() throws IOException {
		List<ModelModel> entityModelList = new ArrayList<ModelModel>();

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document document = db.parse(
					"file:/F://AllProject//00参考文件//BaseInfrastructure//系统支撑.oom");// 传入文件名可以是相对路径也可以是绝对路径
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
					String nodeValue = item.getTextContent();
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
							boolean addFlag=false;
							Node attributeNode = attributeNodeList.item(k);
							for (int l = 0; l < attributeNode.getChildNodes().getLength(); l++) {
								Node attributeChildNode = attributeNode.getChildNodes().item(l);
								String attributeChildNodeNameString = attributeChildNode.getNodeName();
								String attributeChildNodeValueString = attributeChildNode.getTextContent();
								if (attributeChildNodeValueString == null || attributeChildNodeValueString == "")
									break;
								switch (attributeChildNodeNameString) {
								case "a:Name":
									addFlag=true;
									field.setFieldComment(attributeChildNodeValueString);
									break;
								case "a:Code":
									addFlag=true;
									field.setFieldName(attributeChildNodeValueString);
									break;
								case "a:DataType":
									addFlag=true;
									field.setFieldType(attributeChildNodeValueString);
									break;
								default:
									
									break;
								}

							}
							if(addFlag)
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
		for (ModelModel modelModel : entityModelList) {
			if (modelModel.getModelType() != null) {
				File file;
				switch (modelModel.getModelType()) {
				case CONSTANT.CLASS_TYPE_ENTITY:
					file = new File("F:/AllProject/01SOURCE/domain-model/entity/"
							+ "T_"+modelModel.getModelCode() + ".java");
					break;
				case CONSTANT.CLASS_TYPE_ENUM:
					file = new File("F:/AllProject/01SOURCE/domain-model/enum/"
							+ modelModel.getModelCode() + ".java");
					break;
				default:
					file = new File("F:/AllProject/01SOURCE/domain-model/valueobject/"
							+ modelModel.getModelCode() + ".java");
					break;
				}
				if (!file.exists()) {
					file.createNewFile();
				}
				FileOutputStream outputStream = new FileOutputStream(file);
				PrintWriter writer = new PrintWriter(outputStream);
				writer.write(new StringBuffer(modelModel.getCotent()).toString().toCharArray());
				writer.flush();
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
