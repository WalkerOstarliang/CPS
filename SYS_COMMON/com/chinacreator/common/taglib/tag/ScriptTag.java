package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class ScriptTag extends BodyTagSupport
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2914590724667173137L;

	@Override
	public int doEndTag() throws JspException {
		try
		{
			pageContext.getOut().write("</script>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return super.doEndTag();
	}

	@Override
	public int doStartTag() throws JspException {
		try
		{
			pageContext.getOut().write("<script type=\"text/javascript\">");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return EVAL_BODY_INCLUDE;
	}
	
	
}
