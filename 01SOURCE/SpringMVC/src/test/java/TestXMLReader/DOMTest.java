package TestXMLReader;

import java.io.IOException;
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

/**
 * DOM方式解析xml
 */
public class DOMTest {

	@Test
	public void test() {
		List<ModelModel> entityModelList=new ArrayList<ModelModel>();
		

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document document = db.parse("file:/d://ProgramFiles//springmvc//00参考文件/BaseInfrastructure//后台.oob");// 传入文件名可以是相对路径也可以是绝对路径
			NodeList classesList = document.getElementsByTagName("c:Classes");
			Node classesElementNode = classesList.item(0);
			NodeList classElementNodeList = classesElementNode.getChildNodes();
			for (int i = 0; i < classElementNodeList.getLength(); i++) {
				List<ModelField> fieldList=new ArrayList<ModelField>();
				ModelModel entityModel=new ModelModel();
				Node classElementNode = classElementNodeList.item(i);
				NodeList classChildrenList = classElementNode.getChildNodes();
				for (int j = 0; j < classChildrenList.getLength(); j++) {
					
					Node item=classChildrenList.item(j);
					String nodeName=item.getNodeName();
					String nodeValue=item.getTextContent();
					if(nodeValue==null||nodeValue=="")
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
					case "c:Attributes":
						{
							NodeList attributeNodeList=item.getChildNodes();
							
							for(int k=0;k<attributeNodeList.getLength();k++){
								
								ModelField field=new ModelField();
								Node attributeNode=attributeNodeList.item(k);
								for (int l = 0; l < attributeNode.getChildNodes().getLength(); l++) {
									Node attributeChildNode=attributeNode.getChildNodes().item(l);
									String attributeChildNodeNameString=attributeChildNode.getNodeName();
									String attributeChildNodeValueString=attributeChildNode.getTextContent();
									if(attributeChildNodeValueString==null||attributeChildNodeValueString=="")
										break;
									switch (attributeChildNodeNameString) {
									case "a:Name":
										field.setFieldComment(attributeChildNodeValueString);
										break;
									case "a:Code":
										field.setFieldName(attributeChildNodeValueString);
										break;
									case "a:DataType":
										field.setFieldType(attributeChildNodeValueString);
										break;
									default:
										break;
								}
								
								}
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
			System.out.println(modelModel.getCotent());
		}
		
	}
}
