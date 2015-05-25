package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.ValidateHelper;

public class RowTag extends BodyTagSupport
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= -6746841903769428523L;
	
	private String id;
	
	private String height;
	
	private String cssClass;
	
	private String cssStyle;

	@Override
	public int doEndTag() throws JspException {
		try
		{
			JspWriter out = pageContext.getOut();
			out.write("</tr>\n");
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
			out.write("<tr ");
			if (ValidateHelper.isNotEmptyString(id))
			{
				out.write(" id=\"" + id + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(height))
			{
				out.write(" height=\"" + height + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(cssClass))
			{
				out.write(" class=\"" + cssClass + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(cssStyle))
			{
				out.write(" style=\"" + cssStyle + "\" ");
			}
			out.write(">\n");
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

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getCssClass()
	{
		return cssClass;
	}

	public void setCssClass(String cssClass)
	{
		this.cssClass = cssClass;
	}

	public String getCssStyle()
	{
		return cssStyle;
	}

	public void setCssStyle(String cssStyle)
	{
		this.cssStyle = cssStyle;
	}
	
	
	
}
