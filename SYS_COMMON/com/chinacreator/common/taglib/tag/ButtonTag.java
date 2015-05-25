package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.ValidateHelper;

public class ButtonTag extends BodyTagSupport
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= -2406906500810304975L;
	
	private String id;
	
	private String name;
	
	private String type = "button";
	
	private String cssStyle;
	
	private String cssClass = "cps-btn";
	
	private String value;
	
	private String onclick;
	
	private String ondblclick;

	private boolean display = true;
	
	@Override
	public int doEndTag() throws JspException {
		return super.doEndTag();
	}

	@Override
	public int doStartTag() throws JspException {
		try
		{
			pageContext.getOut().write("<button ");
			pageContext.getOut().write(" type=\"" + type + "\"");
			pageContext.getOut().write(" title=\"" + value + "\"");
			
			if (ValidateHelper.isNotEmptyString(id))
			{
				pageContext.getOut().write(" id=\"" + id + "\"");
			}
			if (ValidateHelper.isNotEmptyString(name))
			{
				pageContext.getOut().write(" name=\"" + name + "\"");
			}
			
			if (ValidateHelper.isNotEmptyString(cssClass))
			{
				pageContext.getOut().write(" class=\"" + cssClass + "\"");
			}
			if (!display)
			{
				pageContext.getOut().write(" style=\"display:none;\" ");
			}
			else if (ValidateHelper.isNotEmptyString(cssStyle))
			{
				pageContext.getOut().write(" style=\"" + cssStyle + "\"");
			}
			if (ValidateHelper.isNotEmptyString(onclick))
			{
				pageContext.getOut().write(" onclick=\"" + onclick + "\"");
			}
			if (ValidateHelper.isNotEmptyString(ondblclick))
			{
				pageContext.getOut().write(" ondblclick=\"" + ondblclick +"\"");
			}
			
			pageContext.getOut().write("><span><em>");
			pageContext.getOut().write(value);
			pageContext.getOut().write("</em> </span></button>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getOnclick() {
		return onclick;
	}

	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

	public String getOndblclick() {
		return ondblclick;
	}

	public void setOndblclick(String ondblclick) {
		this.ondblclick = ondblclick;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean getDisplay()
	{
		return display;
	}

	public void setDisplay(boolean display)
	{
		this.display = display;
	}
	
	
	
}
