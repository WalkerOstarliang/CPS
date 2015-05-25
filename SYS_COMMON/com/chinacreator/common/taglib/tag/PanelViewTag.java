package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class PanelViewTag extends BodyTagSupport
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -24991609282471779L;
	
	private String tbarContextHtml = "";

	@Override
	public int doEndTag() throws JspException
	{
		return super.doEndTag();
	}

	@Override
	public int doStartTag() throws JspException
	{
		return EVAL_BODY_INCLUDE;
	}

	public String getTbarContextHtml()
	{
		return tbarContextHtml;
	}

	public void setTbarContextHtml(String tbarContextHtml)
	{
		this.tbarContextHtml = tbarContextHtml;
	}
	
}
