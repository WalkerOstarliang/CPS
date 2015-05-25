package com.chinacreator.common.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.googlecode.jsonplugin.JSONException;
import com.googlecode.jsonplugin.JSONUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 基本Action
 * @author mingchun.xiong
 *
 */
public class BaseAction extends ActionSupport implements ServletRequestAware, ServletResponseAware
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 3437750672575106983L;
	
	// 操作类型用户系统日志
	protected String operType;
	
	//模块名称，用于系统日志
	protected String modename;
	protected HttpSession session;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	private String jspPage;
	private String systemtitle;
	private String currentSystemDate;
	private String currentXzqh;
	
	public String execute()
	{
		return jspPage;
	}
	
	/**
	 * 输出文本
	 * @param object
	 * @return
	 */
	protected String responseWrite(Object object)
	{
		try 
		{
			String resStr = JSONUtil.serialize(object);
			this.returnValue(resStr);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	protected void returnValue(String resStr)
	{
		try
		{
			Object obj = getSession().getServletContext().getAttribute("encoding"); 
			String encoding = obj != null ? obj.toString() : "UTF-8";
			response.setCharacterEncoding(encoding);
			response.setContentType("text/plain;Charset=" + encoding);
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(resStr);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	protected void returnValue(String resStr,String encoding){
		try
		{
			response.setCharacterEncoding(encoding);
			response.setContentType("text/plain;Charset=" + encoding);
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(resStr);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	/**
	 * 获取HttpSession对象
	 * 
	 * @return HttpSession
	 */
	public HttpSession getSession() {
		
		return getRequest().getSession();
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}


	public String getIpAddress() 
	{
		String ip = request.getHeader("x-forwarded-for");
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) 
		{
			ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) 
		{
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) 
		{
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	public String getJspPage() {
		return jspPage;
	}

	public void setJspPage(String jspPage) {
		this.jspPage = jspPage;
	}


	public String getOperType() {
		return operType;
	}


	public void setOperType(String operType) {
		this.operType = operType;
	}


	public String getModename()
	{
		return modename;
	}


	public void setModename(String modename)
	{
		this.modename = modename;
	}

	public String getSystemtitle()
	{
		systemtitle = DictionaryCacheHellper.getSystemParamenterValueByKey("system.mc");
		return systemtitle;
	}

	public void setSystemtitle(String systemtitle)
	{
		this.systemtitle = systemtitle;
	}

	public String getCurrentSystemDate()
	{
		currentSystemDate = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
		return currentSystemDate;
	}

	public void setCurrentSystemDate(String currentSystemDate)
	{
		this.currentSystemDate = currentSystemDate;
	}

	public String getCurrentXzqh()
	{
		currentXzqh = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
		return currentXzqh;
	}

	public void setCurrentXzqh(String currentXzqh)
	{
		this.currentXzqh = currentXzqh;
	}
	
	
}
