package com.chinacreator.common.taglib.tag;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.ValidateHelper;

/**
 * 级联下拉式菜单控件
 * @author mingchun.xiong
 *
 */
public class DoubleSelect extends BodyTagSupport
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 3726464971229752270L;
	
	private String id;
	
	private String name;
	
	private String value;
	
	private String zdlb;
	
	private String dependSelectId;
	
	private String doubleSelectId;
	
	private String parentdm;
	
	private String displayfield;
	
	private String headerKey;
	
	private String headerValue;
	
	private String disabled;
	
	private String cssClass = "cps-select";
	
	private String cssStyle;
	
	private String callback;
	
	private boolean required = false;
	
	private boolean hideValue = false;

	@Override
	public int doStartTag() throws JspException {
		StringBuffer validateStr = new StringBuffer();
		List<String> valiList = new ArrayList<String>();
		try
		{
			JspWriter out = pageContext.getOut();
			out.write("<select type=\"select\" id=\"" + id + "\" ");
			
			out.write(" zdlb=\"" + zdlb + "\" ");
			
			if (ValidateHelper.isNotEmptyString(name))
			{
				out.write(" name=\"" + name + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(parentdm))
			{
				out.write(" parentdm=\"" + parentdm + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(value))
			{
				out.write(" defaultValue=\"" + value + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(dependSelectId))
			{
				out.write(" depend=\"" + dependSelectId + "\" ");
			} 
			if (ValidateHelper.isNotEmptyString(doubleSelectId))
			{
				out.write(" doubleSelect=\"" + doubleSelectId + "\" ");
			} 
			if (headerKey != null)
			{
				out.write(" headKey=\"" + headerKey + "\" ");
			}
			if (headerValue != null)
			{
				out.write(" headValue=\"" + headerValue + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(displayfield))
			{
				out.write(" displayfield=\"" + displayfield + "\" ");
			}
			
			if (required)
			{
				valiList.add("required");
			}
			
			if (ValidateHelper.isNotEmptyCollection(valiList))
			{
				validateStr.append("validate[" + valiList.toString() + "] ");
			}
			out.write(" hideValue=\"" + hideValue + "\" ");
			if (ValidateHelper.isNotEmptyString(cssClass))
			{
				out.write(" class=\"" + cssClass + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(cssStyle))
			{
				out.write(" style=\"" + cssStyle + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(disabled) && "true".equals(disabled))
			{
				out.write(" disabled=\"disabled\" ");
			}
			
			out.write("></select>\n");
			out.write("<script type=\"text/javascript\">");
			if (ValidateHelper.isNotEmptyString(callback))
			{
				out.write("$(\"#" + id + "\").doubleDicSelect(" + callback + ");");
			}
			else
			{
				out.write("$(\"#" + id + "\").doubleDicSelect();");
			}
			
			out.write("</script>");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return super.doStartTag();
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

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getZdlb() {
		return zdlb;
	}

	public void setZdlb(String zdlb) {
		this.zdlb = zdlb;
	}

	public String getHeaderKey() {
		return headerKey;
	}

	public void setHeaderKey(String headerKey) {
		this.headerKey = headerKey;
	}

	public String getHeaderValue() {
		return headerValue;
	}

	public void setHeaderValue(String headerValue) {
		this.headerValue = headerValue;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
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
	
	public String getDependSelectId() {
		return dependSelectId;
	}

	public void setDependSelectId(String dependSelectId) {
		this.dependSelectId = dependSelectId;
	}

	public String getDoubleSelectId() {
		return doubleSelectId;
	}

	public void setDoubleSelectId(String doubleSelectId) {
		this.doubleSelectId = doubleSelectId;
	}

	public String getParentdm() {
		return parentdm;
	}

	public void setParentdm(String parentdm) {
		this.parentdm = parentdm;
	}

	public String getDisplayfield() {
		return displayfield;
	}

	public void setDisplayfield(String displayfield) {
		this.displayfield = displayfield;
	}

	public String getCallback()
	{
		return callback;
	}

	public void setCallback(String callback)
	{
		this.callback = callback;
	}

	public boolean isRequired()
	{
		return required;
	}

	public void setRequired(boolean required)
	{
		this.required = required;
	}

	public boolean isHideValue()
	{
		return hideValue;
	}

	public void setHideValue(boolean hideValue)
	{
		this.hideValue = hideValue;
	}
	
	
}
