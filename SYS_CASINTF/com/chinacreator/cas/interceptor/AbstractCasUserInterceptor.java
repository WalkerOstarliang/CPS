package com.chinacreator.cas.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.jasig.cas.client.authentication.AttributePrincipal;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public abstract class AbstractCasUserInterceptor implements Interceptor,CasUserQueryIntf
{
	
	/**
	 * 
	 */
	private static final long	serialVersionUID	= -3736378651795937528L;

	private String logicalName;
	private String mainUrl;
	
	public void destroy()
	{
		
	}
	
	public void init()
	{
	}
	
	public String intercept(ActionInvocation invocation) throws Exception
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession(true);
		Object userObject = session.getAttribute(logicalName);
		AttributePrincipal principal = (AttributePrincipal)request.getUserPrincipal();
		String username = principal.getAttributes().get("username") != null ? String.valueOf(principal.getAttributes().get("username")) : "";
		String sfzh = principal.getAttributes().get("sfzh") != null ? String.valueOf(principal.getAttributes().get("sfzh")) : "";
		if (!session.isNew() && userObject == null && ((username != null && !"".equals(username)) || (sfzh != null && !"".equals(sfzh))))
		{
			if ((sfzh != null && !"".equals(sfzh)))
			{
				userObject = getUserObjectBySfzh(request, response, sfzh);
				request.getSession().setAttribute(logicalName, userObject);
			}
			if (userObject == null && username != null && !"".equals(username))
			{
				userObject = getUserObjectByUserName(request, response, username);
				//存放到session缓存
				request.getSession().setAttribute(logicalName, userObject);
			}
			afterInterceptor(userObject);
		}
		else if (userObject != null && ((username != null && !"".equals(username)) || (sfzh != null && !"".equals(sfzh))))
		{
			if (!equals(userObject, username, sfzh))
			{
				if ((sfzh != null && !"".equals(sfzh)))
				{
					userObject = getUserObjectBySfzh(request, response, sfzh);
					request.getSession().setAttribute(logicalName, userObject);
				}
				if (userObject == null && username != null && !"".equals(username))
				{
					userObject = getUserObjectByUserName(request, response, username);
					//存放到session缓存
					request.getSession().setAttribute(logicalName, userObject);
				}
				afterInterceptor(userObject);
			}
		}
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getRequestURI();
		if (session.isNew() || userObject == null)
		{
			response.sendRedirect(basePath);
		}
		else
		{
			return invocation.invoke();
		}
		return null;
	}
	
	
	/**
	 * 成功登录后执行操作一般用户记录用户登录日志
	 * 
	 * @date 2013-10-10 上午10:23:33
	 */
	public abstract void afterInterceptor(Object userObject);
	
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
