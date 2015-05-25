package com.chinacreator.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 编码过滤器
 * @author mingchun.xiong
 *
 */
public class EncodingFilter implements Filter
{
	protected String encoding = "UTF-8";
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		response.setContentType("text/html;charset=" + encoding);
		chain.doFilter(request, response);
	}
	
	public void init(FilterConfig filterConfig) throws ServletException 
	{
		this.encoding = filterConfig.getInitParameter("encoding");
		filterConfig.getServletContext().setAttribute("encoding", encoding);
	}
	
	public void destroy() 
	{
	}
 
}