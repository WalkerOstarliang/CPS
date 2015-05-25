package com.chinacreator.common.interceptor;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 异常拦截器
 * @author mingchun.xiong
 *
 */
public class ExceptionInterceptor implements Interceptor
{
	
	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 8630253117363512607L;

	private static final Logger LOG = Logger.getLogger(ExceptionInterceptor.class);
	
	
	public void destroy() {
		
	}
	
	public void init() {
		
	}
	
	public String intercept(ActionInvocation invocation)
	{
		String actionName = invocation.getProxy().getActionName();
		String method = invocation.getProxy().getMethod();
		String namespace = invocation.getProxy().getNamespace();
		String resultcode = "";
		try
		{
			resultcode = invocation.invoke();
		}
		catch(Exception e)
		{
			LOG.error("执行Action=[" + actionName+"],method=[" + method + "],namespace=[" + namespace + "]发生异常问题,", e);
			e.printStackTrace();
			resultcode = "exception";
		}
		return resultcode;
	}
	
}
