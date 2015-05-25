package com.chinacreator.common.taglib.tag;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;

public class DateTag extends BodyTagSupport
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -2654029885241857605L;
	
	private String id;
	
	private String name;
	
	private String onblur;
	
	private String value;
	
	private String startDate;
	
	private String minDate;
	
	private String maxDate;
	
	private String dateFmt = "yyyy-MM-dd HH:mm:ss";
	
	private String readOnly;
	
	private String disabled;
	
	private String cssClass;
	
	private String cssStyle;

	private String maxDateDepend;
	
	private String minDateDepend;
	
	private boolean defaultSystemDate = false;
	
	private boolean required = false;
	
	private boolean hideValue = false;
	
	@Override
	public int doEndTag() throws JspException {
		return super.doEndTag();
	}

	@Override
	public int doStartTag() throws JspException {
		StringBuffer validateStr = new StringBuffer();
		List<String> valiList = new ArrayList<String>();
		try
		{
			JspWriter out = pageContext.getOut();
			
			out.write("<input type=\"text\" ");
			
			if (ValidateHelper.isNotEmptyString(id))
			{
				out.write(" id=\"" + id + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(name))
			{
				out.write(" name=\"" + name + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(value))
			{
				out.write(" value=\"" + value + "\" ");
			}
			else
			{
				if (defaultSystemDate)
				{
					out.write(" value=\"" + DateTimeHelper.getNowDateStr(dateFmt) + "\" ");
				}
			}
			if (ValidateHelper.isNotEmptyString(onblur))
			{
				out.write(" onblur=\"" + onblur + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(startDate))
			{
				out.write(" startDate=\"" + startDate + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(minDate))
			{
				out.write(" minDate=\"" + minDate + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(maxDate))
			{
				if("sysdate".equals(maxDate)){
					out.write(" maxDate=\"" + DateTimeHelper.getNowDateStr(this.dateFmt) + "\" ");
				}else{
					out.write(" maxDate=\"" + maxDate + "\" ");
				}
			}
			if (ValidateHelper.isNotEmptyString(dateFmt))
			{
				out.write(" dateFmt=\"" + dateFmt + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(readOnly))
			{
				out.write(" readOnly=\"" + readOnly + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(disabled) && disabled.equalsIgnoreCase("true"))
			{
				out.write(" disabled=\"disabled\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(maxDateDepend))
			{
				out.write(" maxDateDepend=\"" + maxDateDepend + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(minDateDepend))
			{
				out.write(" minDateDepend=\"" + minDateDepend + "\" ");
			}
			
			if (required)
			{
				valiList.add("required");
			}
			if (ValidateHelper.isNotEmptyCollection(valiList))
			{
				validateStr.append("validate[" + valiList.toString() + "] ");
			}
			
			if (ValidateHelper.isNotEmptyString(cssClass))
			{
				String csc = validateStr + " Wdate cps-input " + cssClass;
				out.write(" class=\"" + csc + "\"");
			}
			else
			{
				String csc = validateStr + " Wdate cps-input ";
				out.write(" class=\"" + csc + "\"");
			}
			if (ValidateHelper.isNotEmptyString(cssStyle))
			{
				out.write(" style=\"" + cssStyle + "\" ");
			}
			
			out.write(" hideValue=\"" + hideValue + "\" ");
			
			out.write("/>");
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getMinDate() {
		return minDate;
	}

	public void setMinDate(String minDate) {
		this.minDate = minDate;
	}

	public String getMaxDate() {
		return maxDate;
	}

	public void setMaxDate(String maxDate) {
		this.maxDate = maxDate;
	}

	public String getDateFmt() {
		return dateFmt;
	}

	public void setDateFmt(String dateFmt) {
		this.dateFmt = dateFmt;
	}

	public String getReadOnly() {
		return readOnly;
	}

	public void setReadOnly(String readOnly) {
		this.readOnly = readOnly;
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

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	public String getOnblur() {
		return onblur;
	}

	public void setOnblur(String onblur) {
		this.onblur = onblur;
	}

	public String getMaxDateDepend() {
		return maxDateDepend;
	}

	public void setMaxDateDepend(String maxDateDepend) {
		this.maxDateDepend = maxDateDepend;
	}

	public String getMinDateDepend() {
		return minDateDepend;
	}

	public void setMinDateDepend(String minDateDepend) {
		this.minDateDepend = minDateDepend;
	}

	public boolean getDefaultSystemDate()
	{
		return defaultSystemDate;
	}

	public void setDefaultSystemDate(boolean defaultSystemDate)
	{
		this.defaultSystemDate = defaultSystemDate;
	}

	public boolean getRequired()
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
