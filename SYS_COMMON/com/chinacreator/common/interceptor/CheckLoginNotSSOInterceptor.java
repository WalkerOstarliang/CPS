package com.chinacreator.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinacreator.common.business.Logininfobusiness;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 非单点登录拦截器
 * 
 * @filename CheckLoginNotSSOInterceptor.java
 * @author mingchun.xiong
 * @date May 20, 2014
 *
 */
public class CheckLoginNotSSOInterceptor implements Interceptor
{
	private String logicalName;
	private String mainUrl;
	/**
	 * 
	 */
	private static final long	serialVersionUID	= -7865774739125117964L;

	@Override
	public void destroy()
	{
		
	}
	
	@Override
	public void init()
	{
		
	}
	
	@SuppressWarnings("unused")
	@Override
	public String intercept(ActionInvocation invocation) throws Exception
	{
		System.out.println("...不使用SSO单点登录...");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession(true);
		Logininfobusiness business = new Logininfobusiness();
		Object userObject = session.getAttribute(logicalName);
		String username = ServletActionContext.getRequest().getParameter("username");
		
		if (!session.isNew() && userObject == null && ((username != null && !"".equals(username))))
		{
			if (userObject == null && username != null && !"".equals(username))
			{
				
				userObject = business.getLoginUserInfoByUserName(username);
				//存放到session缓存
				request.getSession().setAttribute(logicalName, userObject);
			}
		}
		else if (userObject != null && ((username != null && !"".equals(username))))
		{
			if (userObject == null && username != null && !"".equals(username))
			{
				userObject = business.getLoginUserInfoByUserName(username);
				//存放到session缓存
				request.getSession().setAttribute(logicalName, userObject);
			}
		}
		
		return invocation.invoke();
	}

	public String getLogicalName()
	{
		return logicalName;
	}

	public void setLogicalName(String logicalName)
	{
		this.logicalName = logicalName;
	}

	public String getMainUrl()
	{
		return mainUrl;
	}

	public void setMainUrl(String mainUrl)
	{
		this.mainUrl = mainUrl;
	}
	
}
