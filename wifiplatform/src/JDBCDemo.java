import java.sql.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.w3c.dom.*;
import org.xml.sax.SAXException;

import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.*;
import javax.xml.xpath.*;

public class JDBCDemo {
	public static void main(String[] args) throws Exception {

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		Element theBook = null, theElem = null, root = null;
		try {
			factory.setIgnoringElementContentWhitespace(true);

			DocumentBuilder db = factory.newDocumentBuilder();
			Document xmldoc = db.parse(new File(
					"C:/Users/chenfw/Downloads/maxnet_sig.xml"));
			root = xmldoc.getDocumentElement();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String user = "root";
		String password = "admin";
		String url = "jdbc:mysql://42.123.76.25:3306/config??useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&failOverReadOnly=false&maxReconnects=10 ";
		String driver = "com.mysql.jdbc.Driver";
		// String driver = "org.gjt.mm.mysql.Driver";
		String tableName = "studinfo";
		String sqlstr;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			stmt = con.createStatement();
			NodeList someBooks = selectNodes(
					"/MAXNET_SIG/GROUP_DESC_LIST/GROUP_DESC_BLOCK", root);
			
			for (int i = 0; i < someBooks.getLength(); i++) {
				Element el = (Element) someBooks.item(i);
				NodeList nl=el.getChildNodes();
				int group_id=0;
				String group_cn="";
		        for(int j=0;j<nl.getLength();j++)
		        {
		            Node nd=nl.item(j);
		            if(nd.getNodeName().equals("group_id"))
		            {
		            	String value =nd.getFirstChild().getNodeValue();
		            	
		            	group_id=Integer.parseInt(value);
		            }else if(nd.getNodeName().equals("group_cn")){
		            	String value =nd.getFirstChild().getNodeValue();
		            	//value = new String(value.getBytes(),"utf-8"); 
		            	group_cn= value;
		            }
		        }
				sqlstr = String
						.format("insert into groupconfig (group_id,group_cn) values( %d ,\'%s\')",
								group_id, group_cn);
				stmt.executeUpdate(sqlstr);
			}

			NodeList apps = selectNodes(
					"/MAXNET_SIG/APP_DESC_LIST/APP_DESC_BLOCK", root);
			for (int i = 0; i < apps.getLength(); i++) {
				Element el = (Element) apps.item(i);
				NodeList nl=el.getChildNodes();
				int group_id=0;
				int app_id=0;
				String name_cn="";
		        for(int j=0;j<nl.getLength();j++)
		        {
		            Node nd=nl.item(j);
		            if(nd.getNodeName().equals("group_id"))
		            {
		            	String value =nd.getFirstChild().getNodeValue();
		            	group_id=Integer.parseInt(value);
		            }else if(nd.getNodeName().equals("name_cn")){
		            	if(nd.getFirstChild()!=null)
		            	  name_cn= nd.getFirstChild().getNodeValue();
		            }else if(nd.getNodeName().equals("app_id")){
		            	app_id=Integer.parseInt(nd.getFirstChild().getNodeValue());
		            }
		        }
				sqlstr = String
						.format("insert into appconfig (app_id,group_id,name_cn) values(%d,%d,'%s')",
								app_id, group_id, name_cn);
				stmt.executeUpdate(sqlstr);
			}
			sqlstr = "insert into " + tableName
					+ " values ('20000908','honey',21)";

		} catch (ClassNotFoundException e1) {
			System.out.println("数据库驱动不存在！");
			System.out.println(e1.toString());
		} catch (SQLException e2) {
			System.out.println("数据库存在异常！");
			System.out.println(e2.toString());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
	}

	public static void output(Node node) {// 将node的XML字符串输出到控制台
		TransformerFactory transFactory = TransformerFactory.newInstance();
		try {
			Transformer transformer = transFactory.newTransformer();
			transformer.setOutputProperty("encoding", "gb2312");
			transformer.setOutputProperty("indent", "yes");

			DOMSource source = new DOMSource();
			source.setNode(node);
			StreamResult result = new StreamResult();
			result.setOutputStream(System.out);

			transformer.transform(source, result);
		} catch (TransformerConfigurationException e) {
			e.printStackTrace();
		} catch (TransformerException e) {
			e.printStackTrace();
		}
	}

	public static Node selectSingleNode(String express, Object source) {// 查找节点，并返回第一个符合条件节点
		Node result = null;
		XPathFactory xpathFactory = XPathFactory.newInstance();
		XPath xpath = xpathFactory.newXPath();
		try {
			result = (Node) xpath
					.evaluate(express, source, XPathConstants.NODE);
		} catch (XPathExpressionException e) {
			e.printStackTrace();
		}

		return result;
	}

	public static NodeList selectNodes(String express, Object source) {// 查找节点，返回符合条件的节点集。
		NodeList result = null;
		XPathFactory xpathFactory = XPathFactory.newInstance();
		XPath xpath = xpathFactory.newXPath();
		try {
			result = (NodeList) xpath.evaluate(express, source,
					XPathConstants.NODESET);
		} catch (XPathExpressionException e) {
			e.printStackTrace();
		}

		return result;
	}

	public static void saveXml(String fileName, Document doc) {// 将Document输出到文件
		TransformerFactory transFactory = TransformerFactory.newInstance();
		try {
			Transformer transformer = transFactory.newTransformer();
			transformer.setOutputProperty("indent", "yes");

			DOMSource source = new DOMSource();
			source.setNode(doc);
			StreamResult result = new StreamResult();
			result.setOutputStream(new FileOutputStream(fileName));

			transformer.transform(source, result);
		} catch (TransformerConfigurationException e) {
			e.printStackTrace();
		} catch (TransformerException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
