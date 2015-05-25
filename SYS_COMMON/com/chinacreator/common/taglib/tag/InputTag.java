package com.chinacreator.common.taglib.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class InputTag extends BodyTagSupport
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 6537510786686793961L;
	
	private String id;
	
	private String type;
	
	private String name;
	
	private String label;
	
	private String value;
	
	private String width;
	
	private String height;
	
	private String cssStyle;
	
	private String cssClass;
	
	private String validate;
	
	private String onclick;
	
	private String ondblclick;
	
	private String onblur;
	
	private String onkeyup;
	
	private String onkeydown;

	
	protected String getString(String key)
	{
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		Object obj = pageContext.getAttribute(key);
		if (obj == null)
		{
			obj = request.getAttribute(key);
			if (obj == null)
			{
				obj = request.getSession().getAttribute(key);
				
				if (obj == null)
				{
					obj = request.getSession().getServletContext().getAttribute(key);
				}
			}
		}
		if (obj != null)
		{
			return obj.toString();
		}
		else
		{
			return "";
		}
	}
	 
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
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

	public String getOnblur() {
		return onblur;
	}

	public void setOnblur(String onblur) {
		this.onblur = onblur;
	}

	public String getOnkeyup() {
		return onkeyup;
	}

	public void setOnkeyup(String onkeyup) {
		this.onkeyup = onkeyup;
	}

	public String getOnkeydown() {
		return onkeydown;
	}

	public void setOnkeydown(String onkeydown) {
		this.onkeydown = onkeydown;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getValidate() {
		return validate;
	}

	public void setValidate(String validate) {
		this.validate = validate;
	}
	
}
