package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.ValidateHelper;

public class TableTag extends BodyTagSupport
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 579932169928258723L;
	
	private String id;
	
	private String width = "100%";
	
	private String height;
	
	private String cssStyle;
	
	private String cssClass = "cps-table-list";

	
	@Override
	public int doEndTag() throws JspException {
		try
		{
			JspWriter out = pageContext.getOut();
			out.write("</table>");
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
			JspWriter out = pageContext.getOut();
			out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" ");
			if (ValidateHelper.isNotEmptyString(id))
			{
				out.write(" id=\"" + id + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(width))
			{
				out.write(" width=\"" + width + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(height))
			{
				out.write(" height=\"" + height + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(cssStyle))
			{
				out.write(" style=\"" + cssStyle + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(cssClass))
			{
				out.write(" class=\"" + cssClass + "\" ");
			}
			out.write(">");
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

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
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

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}
	
	
	
}
