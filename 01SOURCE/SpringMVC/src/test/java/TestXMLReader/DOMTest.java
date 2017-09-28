package TestXMLReader;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		Date date=new Date();
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		
		String entityNameString=""
				,entityCodeString="";
		StringBuffer sbBuffer = new StringBuffer();
		sbBuffer.append("/**                                                               \r\n");
		sbBuffer.append("* 创   建   人： 刘磊                                             \r\n");
		
		sbBuffer.append("*                                                                 \r\n");
		sbBuffer.append("* 创   建   时   间 ："+formatter.format(date)+"                      \r\n");
		
		sbBuffer.append("*                                                                 \r\n");
		sbBuffer.append("* 类   说   明 ：                                                 \r\n");
		sbBuffer.append("*                                                                 \r\n");
		sbBuffer.append("* 修   改   人：          修   改   日   期：                     \r\n");
		sbBuffer.append("*/                                                                \r\n");
		sbBuffer.append("package cn.doublepoint.domain.model.entity.xt;                    \r\n");
		sbBuffer.append("                                                                  \r\n");
		sbBuffer.append("import javax.persistence.Column;                                  \r\n");
		sbBuffer.append("import javax.persistence.Entity;                                  \r\n");
		sbBuffer.append("import javax.persistence.Id;                                      \r\n");
		sbBuffer.append("                                                                  \r\n");
		sbBuffer.append("@Entity                                                           \r\n");
		sbBuffer.append("public class %EntityName% {                                              \r\n");
		sbBuffer.append("                                                                  \r\n");
		sbBuffer.append("	@Id                                                              \r\n");
		sbBuffer.append("	@Column                                                          \r\n");
		sbBuffer.append("	private long bs;                                                 \r\n");
		sbBuffer.append("	                                                                 \r\n");
		sbBuffer.append("	@Column                                                          \r\n");
		sbBuffer.append("	private String yhbh;                                             \r\n");
		sbBuffer.append("                                                                  \r\n");
		sbBuffer.append("	public long getBs() {                                            \r\n");
		sbBuffer.append("		return bs;                                                     \r\n");
		sbBuffer.append("	}                                                                \r\n");
		sbBuffer.append("                                                                  \r\n");
		sbBuffer.append("	public void setBs(long bs) {                                     \r\n");
		sbBuffer.append("		this.bs = bs;                                                  \r\n");
		sbBuffer.append("	}                                                                \r\n");
		sbBuffer.append("}\r\n");

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document document = db.parse("file:/d://ProgramFiles//springmvc//00参考文件/BaseInfrastructure//后台.oob");// 传入文件名可以是相对路径也可以是绝对路径
			NodeList classesList = document.getElementsByTagName("c:Classes");
			Node classesElementNode = classesList.item(0);
			NodeList classElementNodeList = classesElementNode.getChildNodes();
			for (int i = 0; i < classElementNodeList.getLength(); i++) {
				Node classElementNode = classElementNodeList.item(i);
				NodeList classChildrenList = classElementNode.getChildNodes();
				for (int j = 0; j < classChildrenList.getLength(); j++) {
					Node item=classChildrenList.item(j);
					String nodeName=item.getNodeName();
					String nodeValue=item.getNodeValue();
					if(nodeName.equals("a:Name")){
						entityNameString=nodeValue;
					}
					else if(nodeName.equals("a:Code")){
						entityCodeString=nodeValue;
					}
					if (item.getNodeType() == Node.ELEMENT_NODE) {
						// 获取了element类型节点的节点名
						System.out.print("第" + (i + 1) + "个节点的节点名："+ classChildrenList.item(j).getNodeName());
						// 获取了element类型节点的节点值
						System.out.println("--节点值是："
								+ classChildrenList.item(j).getFirstChild()
										.getNodeValue());
						// System.out.println("--节点值是：" +
						// childNodes.item(k).getTextContent());
					}
				}

			}
			System.out.println(sbBuffer.toString());

		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
