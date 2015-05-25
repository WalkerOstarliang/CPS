package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.ValidateHelper;

public class TdLabelTag extends BodyTagSupport
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2941745874279374876L;
	
	private String id;
	
	private String width;
	
	private String cssClass;
	
	private String cssStyle;

	private String colspan;
	
	private String rowspan;
	
	private String align;
	
	private String valign;
	
	private String title;
	
	@Override
	public int doEndTag() throws JspException {
		try
		{
			JspWriter out = pageContext.getOut();
			out.write("</th>\n");
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
			out.write("<th ");
			if (ValidateHelper.isNotEmptyString(id))
			{
				out.write(" id=\"" + id + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(width))
			{
				out.write(" width=\"" + width + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(cssClass))
			{
				out.write(" class=\"" + cssClass + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(cssStyle))
			{
				out.write(" style=\"" + cssStyle + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(colspan))
			{
				out.write(" colspan=\"" + colspan + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(rowspan))
			{
				out.write(" rowspan=\"" + rowspan + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(align))
			{
				out.write(" align=\"" + align + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(valign))
			{
				out.write(" valign=\"" + valign + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(title))
			{
				out.write(" title=\"" + title + "\" ");
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

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public String getCssStyle() {
		return cssStyle;
	}

	public void setCssStyle(String cssStyle) {
		this.cssStyle = cssStyle;
	}

	public String getColspan() {
		return colspan;
	}

	public void setColspan(String colspan) {
		this.colspan = colspan;
	}

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public String getRowspan() {
		return rowspan;
	}

	public void setRowspan(String rowspan) {
		this.rowspan = rowspan;
	}

	public String getValign()
	{
		return valign;
	}

	public void setValign(String valign)
	{
		this.valign = valign;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}
	
	
}
