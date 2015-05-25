package com.chinacreator.remote.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.remote.bean.QueryResultSet;
import com.chinacreator.remote.bean.RequestErrorInfoBean;
import com.dragonsoft.commons.util.StringUtils;

/**
 * 请求服务Xml解析返回信息
 * @author mingchun.xiong
 *
 */
public class ResultSetXmlUtil 
{
	private final static String MSG_CHARSET = "UTF-8";//消息编号
	private static String RBSP_ERR = "RBSP_ERR";
	private static String ITEMS = "Items";
	private static String ITEM = "Item";
	
	/**
	 * 解析错误返回Xml
	 * @param xmlStr
	 * @return
	 * @throws DocumentException
	 */
	@SuppressWarnings("unchecked")
	public static RequestErrorInfoBean parseErrorResultXml(String xmlStr) throws DocumentException
	{
		if (xmlStr == null || "".equals(xmlStr))
		{
			return null;
		}
		Document document = DocumentHelper.parseText(xmlStr);
		Element root = document.getRootElement();
		Element itemsEle = (Element) root.selectNodes(ITEMS).get(0);
		List<Element> itemEles = itemsEle.selectNodes(ITEM);
		RequestErrorInfoBean bean = null;
		if (itemEles != null && itemEles.size() > 0)
		{
			bean = new RequestErrorInfoBean();
			Element errorCodeEle = (Element) itemEles.get(0).selectNodes("Value").get(0);
			bean.setErrorCode(errorCodeEle.getTextTrim());
			
			Element errorMsgEle = (Element) itemEles.get(1).selectNodes("Value").get(0);
			bean.setErrorMessage(errorMsgEle.getTextTrim());
			
			Element errorTaskIdEle = (Element) itemEles.get(2).selectNodes("Value").get(0);
			bean.setErrorMessage(errorTaskIdEle.getTextTrim());
			return bean;
		}
		return bean;
	}
	
	@SuppressWarnings("unchecked")
	public static <T> QueryResultSet<T> parseQueryResultSetXml(String xmlStr,String fieldsStr, Class<T> clazz) throws Exception
	{
		if (xmlStr == null || "".equals(xmlStr))
		{
			return null;
		}
		Document document = DocumentHelper.parseText(xmlStr);
		Element root = document.getRootElement();
		List<String> fieldList = new ArrayList<String>();
		if (root.getName().equals(RBSP_ERR))
		{
			QueryResultSet<T> queryResultSet = new QueryResultSet<T>();
			RequestErrorInfoBean bean = parseErrorResultXml(xmlStr);
			queryResultSet.setTaskId(bean.getTaskId());
			queryResultSet.setErrorCode(bean.getErrorCode());
			queryResultSet.setErrorMessage(bean.getErrorMessage());
			throw new Exception("调用远程数据失败:\n" + xmlStr);
		}
		else
		{
			QueryResultSet<T> queryResultSet = new QueryResultSet<T>();
			//成功代码000获取
			List<Element> datalist = root.selectNodes("/RBSPMessage/Method[1]/Items[1]/Item[1]/Value[1]/Row[1]/Data[1]");
			queryResultSet.setServiceResultCode(datalist.get(0).getTextTrim());
			
			//数据字段
			datalist = root.selectNodes("/RBSPMessage/Method[1]/Items[1]/Item[1]/Value[1]/Row[2]/Data");
			if (ValidateHelper.isNotEmptyCollection(datalist))
			{
				for (Element ele : datalist)
				{
					fieldList.add(ele.getTextTrim());
				}
			}
			//数据获取
			datalist = root.selectNodes("/RBSPMessage/Method[1]/Items[1]/Item[1]/Value[1]/Row[3]/Data");
			if (ValidateHelper.isNotEmptyCollection(datalist))
			{
				T t = clazz.newInstance();
				for (int i=0;i<datalist.size();i++)
				{
					BeanUtils.setProperty(t, fieldList.get(i).toLowerCase(), datalist.get(i).getTextTrim());
				}
				queryResultSet.getDatas().add(t);
			}
			return queryResultSet;
		}
	}
	
	/**
	 * 创建xml
	 * @param strSenderId 请求方编号
	 * @param strReceiveId 服务方编号
	 * @param strCode 共享数据项集
	 * @param strCondition 条件
	 * @param strFields
	 * @param version
	 * @param userCardId
	 * @param userName
	 * @param userDept
	 * @param pkiId
	 * @return
	 */
	public static byte[] createXml(String strSenderId, String strReceiveId, String strCode, String strCondition,
			String strFields, String infoCodeMode, String version, String userCardId, String userName, 
			String userDept, String pkiId) 
	{

		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("RBSPMessage");
		root.addElement("Version").addText(version);
		root.addElement("SenderID").addText(strSenderId);
		root.addElement("TimeStamp").addText("");
		root.addElement("Validity").addText("");
		// 加入安全信息
		Element security = root.addElement("Security");
		security.addElement("Signature").addAttribute("Algorithm", "");
		security.addElement("CheckCode").addAttribute("Algorithm", "");
		security.addElement("Encrypt").addText("");

		Element method = root.addElement("Method");
		// 加入前端用户信息
		Element endUser = method.addElement("EndUser");
		endUser.addElement("UserName").addText(userName);
		endUser.addElement("UserIDCard").addText(userCardId);
		endUser.addElement("UserDept").addText(userDept);
		endUser.addElement("UserCertID").addText(pkiId);

		method.addElement("Name").addText("Query");

		Element node23 = method.addElement("Items");

		// 加入共享数据项集
		Element node23x = node23.addElement("Item");
		node23x.addElement("Name").addText("DataObjectCode");
		Element node23xx = node23x.addElement("Value").addAttribute("Type", "string");
		node23xx.addElement("Data").addText(strCode);

		// 加入条件
		Element node23xb = node23.addElement("Item");
		node23xb.addElement("Name").addText("Condition");
		Element node23xxb = node23xb.addElement("Value").addAttribute("Type", "string");
		node23xxb.addElement("Data").addText(strCondition);

		// 加入返回值
		Element node23xc = node23.addElement("Item");
		node23xc.addElement("Name").addText("RequiredItems");
		Element node23xxc = node23xc.addElement("Value").addAttribute("Type", "arrayOf_string");
		Element node23xxx = node23xxc.addElement("Row");
		String strField[] = StringUtils.splitString(strFields, ",");
		for (int j = 0; j < strField.length; j++) {
			node23xxx.addElement("Data").addText(strField[j]);
		}
		
		Element node23xd = node23.addElement("Item");
		node23xd.addElement("Name").addText("InfoCodeMode");
		Element node23xxd = node23xd.addElement("Value").addAttribute("Type", "string");
		node23xxd.addElement("Data").addText(infoCodeMode);				
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			OutputFormat outformat = OutputFormat.createPrettyPrint();
			outformat.setEncoding(MSG_CHARSET);
			XMLWriter writer = new XMLWriter(baos, outformat);
			writer.write(document);
			writer.close();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		byte bt[] = baos.toByteArray();
		return bt;
	}
}
