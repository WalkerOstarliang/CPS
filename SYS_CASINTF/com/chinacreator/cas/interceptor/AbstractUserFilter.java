package com.chinacreator.cas.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jasig.cas.client.authentication.AttributePrincipal;

public abstract class AbstractUserFilter implements Filter, CasUserQueryIntf
{
	
	private String logicalName;
	private String mainUrl;
	
	public void destroy()
	{
		
	}
	
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException
	{
		HttpServletRequest request = (HttpServletRequest)servletRequest;
		HttpServletResponse response = (HttpServletResponse)servletResponse;
		HttpSession session = request.getSession(true);
		
		Object userObject = session.getAttribute(logicalName);
		
		AttributePrincipal principal = (AttributePrincipal)request.getUserPrincipal();
		String username = principal.getAttributes().get("username") != null ? String.valueOf(principal.getAttributes().get("username")) : "";
		String sfzh = principal.getAttributes().get("sfzh") != null ? String.valueOf(principal.getAttributes().get("sfzh")) : "";
		if (!session.isNew() && userObject == null && ((username != null && !"".equals(username)) || (sfzh != null && !"".equals(sfzh)) ))
		{
			if ((sfzh != null && !"".equals(sfzh)))
			{
				userObject = getUserObjectBySfzh(request, response,sfzh);
				request.getSession().setAttribute(logicalName, userObject);
			}
			if (userObject == null && username != null && !"".equals(username))
			{
				userObject = getUserObjectByUserName(request,response,username);
				//存放到session缓存
				request.getSession().setAttribute(logicalName, userObject);
			}
			
			afterInterceptor(userObject);
		}
		
		if (session.isNew() || userObject == null)
		{
			String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
			if (mainUrl != null && !mainUrl.equals(""))
			{
				url = url + mainUrl;
			}
			System.out.println(url);
			response.sendRedirect(url);
		}
		else
		{
			chain.doFilter(servletRequest, servletResponse);
		}
		
	}
	
	public void init(FilterConfig config) throws ServletException
	{
		logicalName = config.getInitParameter("logicalName");
		mainUrl = config.getInitParameter("mainUrl");
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
