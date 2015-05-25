package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

public class TbarTag extends BodyTagSupport
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 1074005111607112988L;
	
	private String id;
	
	private String bodyContentHtml = "";

	@Override
	public int doEndTag() throws JspException
	{
		try
		{
			PanelViewTag parentTag =  (PanelViewTag)TagSupport.findAncestorWithClass(this, PanelViewTag.class);
			BodyContent bc = getBodyContent();
			if (parentTag != null && bc != null)
			{
				bodyContentHtml = bc.getString();
				parentTag.setTbarContextHtml(bodyContentHtml);
			}
			else
			{
				pageContext.getOut().write("<div id=\"" + id + "\">");
				pageContext.getOut().write(bodyContentHtml);
				pageContext.getOut().write("</div>");
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException
	{
		return EVAL_BODY_BUFFERED;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}
	
	
	
}
