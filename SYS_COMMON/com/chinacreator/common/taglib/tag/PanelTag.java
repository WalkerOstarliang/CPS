package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

import com.chinacreator.common.helper.ValidateHelper;

public class PanelTag extends BodyTagSupport
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -7297149563683533872L;
	
	private static final String MODE_VIEW = "view";
	
	private String id;
	
	private String title;
	
	private String width;
	
	private String height;
	
	private String cssStyle;
	
	private String cssClass;
	
	private boolean scroll;
	
	private String tbarBodyContextHtml = "";
	
	/**
	 * view
	 */
	private String mode;
	
	@Override
	public int doEndTag() throws JspException {
		try
		{
			pageContext.getOut().write("</div>");
			pageContext.getOut().write("</div>");
			if (MODE_VIEW.equalsIgnoreCase(mode) && ValidateHelper.isNotEmptyString(id))
			{
				pageContext.getOut().write("<script type=\"text/javascript\">");
				pageContext.getOut().write("$(\"#" +getId() + "\").find(\":input\").attr(\"disabled\",\"disabled\")");
				pageContext.getOut().write("</script>");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return super.doEndTag();
	}

	@Override
	public int doStartTag() throws JspException 
	{
		try
		{
			PanelViewTag parentTag =  (PanelViewTag)TagSupport.findAncestorWithClass(this, PanelViewTag.class);
			if (parentTag != null)
			{
				tbarBodyContextHtml = parentTag.getTbarContextHtml();
			}
			else
			{
				tbarBodyContextHtml = "";
			}
			pageContext.getOut().write("<div class=\"cps-panel\" ");
			if (ValidateHelper.isNotEmptyString(cssStyle))
			{
				pageContext.getOut().write(" style=\"");
				if (ValidateHelper.isNotEmptyString(width))
				{
					pageContext.getOut().write("width:" + width + ";");
				}
				pageContext.getOut().write(cssStyle);
				pageContext.getOut().write("\"");
			}
			if (ValidateHelper.isNotEmptyString(width))
			{
				pageContext.getOut().write(" style=\"");
				pageContext.getOut().write(" width:" + width + ";");
				pageContext.getOut().write("\"");
			}
			
			if (ValidateHelper.isNotEmptyString(cssClass))
			{
				pageContext.getOut().write(" class=\"" + cssClass + "\"");
			}
			pageContext.getOut().write(">\n");
			pageContext.getOut().write("<div class=\"cps-panel-title\">");
			
			//标题
			pageContext.getOut().write("<div style=\"float:left\">");
			pageContext.getOut().write("&nbsp;"+title);
			pageContext.getOut().write("</div>");
			
			//工具栏
			pageContext.getOut().write("<div id=\"tbar_" + id +"\" style=\"float:right;padding-right: 5px;\">");
			pageContext.getOut().write(tbarBodyContextHtml);
			pageContext.getOut().write("</div>");
			
			pageContext.getOut().write("</div>\n");
			pageContext.getOut().write("<div class=\"cps-panel-content\"");
			if (ValidateHelper.isNotEmptyString(id))
			{
				pageContext.getOut().write(" id=\"" + id + "\"");
			}
			
			if (ValidateHelper.isNotEmptyString(width) || ValidateHelper.isNotEmptyString(height))
			{
				if (scroll)
				{
					pageContext.getOut().write(" style=\"overflow: auto;");
				}
				else
				{
					pageContext.getOut().write(" style=\"overflow: hidden;");
				}
				if (ValidateHelper.isNotEmptyString(width))
				{
					pageContext.getOut().write("width:" + width + ";");
				}
				if (ValidateHelper.isNotEmptyString(height))
				{
					pageContext.getOut().write("height:" + height + ";");
				}
				pageContext.getOut().write("\"");
			}
			else
			{
				pageContext.getOut().write(" style=\"overflow: hidden;\"");
			}
			pageContext.getOut().write(">");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return EVAL_BODY_INCLUDE;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCssStyle() {
		return cssStyle;
	}

	public void setCssStyle(String cssStyle) {
		this.cssStyle = cssStyle;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getTbarBodyContextHtml()
	{
		return tbarBodyContextHtml;
	}

	public void setTbarBodyContextHtml(String tbarBodyContextHtml)
	{
		this.tbarBodyContextHtml = tbarBodyContextHtml;
	}

	public boolean getScroll()
	{
		return scroll;
	}

	public void setScroll(boolean scroll)
	{
		this.scroll = scroll;
	}

	public String getMode()
	{
		return mode;
	}

	public void setMode(String mode)
	{
		this.mode = mode;
	}
	
}
