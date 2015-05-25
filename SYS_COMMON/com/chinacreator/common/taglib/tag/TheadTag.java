package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.ValidateHelper;

public class TheadTag extends BodyTagSupport {

	private static final long serialVersionUID = 1L;
	
	private String cssClass;
	
	private String cssStyle="text-align:left;font-size:12px;font-weight:bolder;"; 
	
	private String colspan;

	@Override
	public int doEndTag() throws JspException{
		try {
			JspWriter out = pageContext.getOut();
			out.write("</th>\n</tr>\n</thead>\n");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return super.doEndTag();
		
	}
	
	@Override
	public int doStartTag() throws JspException{
		try
		{
			JspWriter out = pageContext.getOut();
			out.write("<thead>\n<tr>\n<th");
			if(ValidateHelper.isNotEmptyString(colspan)){
				out.write(" colspan=\"" + colspan + "\" ");
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
}
