package com.chinacreator.common.business;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.chinacreator.common.bean.MhSystemBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.common.poolman.SQLExecutor;

public class SystemInitService
{
	
	public static void initSetMhSystemConfig(ServletContext context)
	{
		String sql = "select * from v_mh_system ";
		try
		{
			List<MhSystemBean> list = SQLExecutor.queryListWithDBName(MhSystemBean.class, CommonConstant.DBNAME_SQJW, sql);
			if (ValidateHelper.isNotEmptyCollection(list))
			{
				for (MhSystemBean mhBean : list)
				{
					context.setAttribute(mhBean.getSystemdm(), mhBean);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public static void initSetMhSystemConfigFormConfigFile(ServletContext context)
	{
		List<MhSystemBean> list = new ArrayList<MhSystemBean>();
		try
		{
			SAXReader reader = new SAXReader();
			Document document = reader.read(SystemInitService.class.getResourceAsStream("/system-mapping.xml"));
			Element root = document.getRootElement();
			Iterator<Element> iterator = root.elementIterator("system");
			while(iterator.hasNext())
			{
				Element systemEle = iterator.next();
				String systemdm = systemEle.selectSingleNode("systemdm").getText();
				String systemname = systemEle.selectSingleNode("systemname").getText();
				String projectname = systemEle.selectSingleNode("projectname").getText();
				String ip = systemEle.selectSingleNode("ip").getText();
				String port = systemEle.selectSingleNode("port").getText();
				
				MhSystemBean bean = new MhSystemBean();
				bean.setSystemdm(systemdm);
				bean.setSystemname(systemname);
				bean.setProjectname(projectname);
				bean.setIp(ip);
				bean.setPort(port);
				list.add(bean);
			}
			if (ValidateHelper.isNotEmptyCollection(list))
			{
				for (MhSystemBean mhBean : list)
				{
					context.setAttribute(mhBean.getSystemdm(), mhBean);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
