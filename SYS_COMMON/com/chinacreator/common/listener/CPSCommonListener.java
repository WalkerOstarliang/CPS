package com.chinacreator.common.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.quartz.Scheduler;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.chinacreator.common.business.SystemInitService;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.PropertiesUtil;

/**
 * 系统初始化监听
 * @author 熊明春
 *
 */
public class CPSCommonListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent arg0) 
	{
		
	}

	public void contextInitialized(ServletContextEvent context) 
	{
		DictionaryCacheHellper.initCache();
		String themePath = context.getServletContext().getInitParameter("themePath");
		context.getServletContext().setAttribute("contextPath", context.getServletContext().getContextPath());
		context.getServletContext().setAttribute("themePath", themePath);
		
		String value = PropertiesUtil.getValue("get.system.source.for.database");
		//是否从数据库中加载
		if ("true".equals(value))
		{
			SystemInitService.initSetMhSystemConfig(context.getServletContext());
		}
		else
		{
			SystemInitService.initSetMhSystemConfigFormConfigFile(context.getServletContext());
		}
		try
		{
			String start = DictionaryCacheHellper.getSystemParamenterValueByKey("import.scheduler.start");
			if ("true".equalsIgnoreCase(start))
			{
				WebApplicationContext webcontext = WebApplicationContextUtils.getWebApplicationContext(context.getServletContext());
				Scheduler scheduler = (Scheduler)webcontext.getBean("doscheduler");
				scheduler.start();
				System.out.println(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss") + "-系统定时任务启动.");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		 
	}
	
}