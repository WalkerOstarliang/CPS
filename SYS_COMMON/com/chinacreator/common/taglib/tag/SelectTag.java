package com.chinacreator.common.taglib.tag;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.sun.org.apache.commons.beanutils.BeanUtils;

public class SelectTag extends BodyTagSupport
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= -9076238925702588265L;
	
	private String id;
	
	private List<?> list;
	
	private String listKey;
	
	private String listValue;
	
	private String name;
	
	private String value;
	
	private String zdlb;
	
	private String headerKey = "";
	
	private String headerValue = "";
	
	private String disabled;
	
	private String cssClass;
	
	private String cssStyle;
	
	private String onchange;
	
	private boolean optgroup = false;
	
	private boolean required = false;
	
	private boolean hideValue = false;
	
	private String parentDm;
	
	private boolean enableEdit = false;
	
	private boolean valuetextmode = false;
	
	@Override
	public int doStartTag() throws JspException {
		StringBuffer validateStr = new StringBuffer();
		List<String> valiList = new ArrayList<String>();
		try
		{
			JspWriter out = pageContext.getOut();
			if ("true".equals(disabled) && hideValue == true)
			{
				out.write("<input type=\"hidden\" name=\"" + name +"\" value=\"" + value +"\"> ");
			}
			out.write("<select type=\"select\"");
			if (ValidateHelper.isNotEmptyString(id))
			{
				out.write(" id=\"" + id + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(name))
			{
				out.write(" name=\"" + name + "\" ");
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
				if (enableEdit)
				{
					out.write(" class=\"" + validateStr +  cssClass + " cps-select chosen-select\" ");
				}
				else
				{
					out.write(" class=\"" + validateStr +  cssClass + " cps-select\" ");
				}
				
			}
			else
			{
				if (enableEdit)
				{
					out.write(" class=\"" + validateStr + " cps-select chosen-select\" ");
				}
				else
				{
					out.write(" class=\"" + validateStr + " cps-select\" ");
				}
				
			}
			if (ValidateHelper.isNotEmptyString(cssStyle))
			{
				out.write(" style=\"" + cssStyle + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(disabled) && "true".equalsIgnoreCase(disabled))
			{
				out.write(" disabled=\"disabled\" ");
			}
			if (ValidateHelper.isNotEmptyString(onchange))
			{
				out.write(" onchange=\"" + onchange + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(value))
			{
				out.write(" initValue=\"" + value + "\" ");
			}
			
			out.write(" hideValue=\"" + hideValue + "\" ");
			
			out.write(">\n");
			if (ValidateHelper.isNotEmptyString(headerValue))
			{
				out.write("<option value=\"" + headerKey + "\">" + headerValue + "</option>");
			}
			if (ValidateHelper.isNotEmptyCollection(list))
			{
				if (ValidateHelper.isNotEmptyString(listKey) && ValidateHelper.isNotEmptyString(listValue))
				{
					for (Object obj : list)
					{
						String key = BeanUtils.getProperty(obj, listKey);
						String text = BeanUtils.getProperty(obj, listValue);
						if (key.equals(value))
						{
							out.write("<option value=\"" + key + "\" selected=\"selected\" title=\"" + text  + "\">" + text + "</option>");
						}
						else
						{
							out.write("<option value=\"" + key + "\" title=\"" + text + "\">" +text + "</option>");
						}
					}
				}
				else
				{
					throw new Exception("the list is not null, then listKey and listValue must be not null.");
				}
			}
			else if (ValidateHelper.isNotEmptyString(zdlb))
			{
				List<SystemDictionaryBean> dicBeanList = null;
				if (optgroup)
				{
					dicBeanList = DictionaryCacheHellper.getSystemDictionaryListByZdlbAndOnLevel(zdlb);
				}
				else
				{
					if (ValidateHelper.isNotEmptyString(parentDm))
					{
						dicBeanList = DictionaryCacheHellper.getSystemDictionaryBeanListByParentDm(zdlb, parentDm);
					}
					else
					{
						dicBeanList = DictionaryCacheHellper.getSystemDictionaryListByZdlb(zdlb);
					}
					
				}
				if (ValidateHelper.isNotEmptyCollection(dicBeanList))
				{
					for (SystemDictionaryBean bean : dicBeanList)
					{
						if (optgroup)
						{
							String dm = bean.getDm();
							List<SystemDictionaryBean> childBeans = DictionaryCacheHellper.getSystemDictionaryBeanListByParentDm(zdlb, dm);
							if (ValidateHelper.isNotEmptyCollection(childBeans))
							{
								out.write("<optgroup label=\"" +bean.getMc() + "\">");
								for (SystemDictionaryBean childBean : childBeans)
								{
									if (childBean.getDm().equals(value))
									{
										out.write("<option value=\"" + childBean.getDm() + "\" selected=\"selected\" title=\"" + childBean.getMc()  + "\">" + childBean.getMc() + "</option>");
									}
									else
									{
										out.write("<option value=\"" + childBean.getDm() + "\" title=\"" + childBean.getMc()  + "\">" + childBean.getMc() + "</option>");
									}
								}
								out.write("</optgroup>");
							}
							else
							{
								if (bean.getDm().equals(value))
								{
									if(enableEdit)
									{
										out.write("<option value=\"" + bean.getDm() + "\" selected=\"selected\" title=\"" + bean.getMc()  + "\">[" + bean.getDm() + "]"+bean.getMc() + "</option>");
									}
									else
									{
										out.write("<option value=\"" + bean.getDm() + "\" selected=\"selected\" title=\"" + bean.getMc()  + "\">" + bean.getMc() + "</option>");
									}
								}
								else
								{
									if(enableEdit)
									{
										out.write("<option value=\"" + bean.getDm() + "\" title=\"" + bean.getMc()  + "\">[" + bean.getDm() + "]"+bean.getMc() + "</option>");
									}
									else
									{
										out.write("<option value=\"" + bean.getDm() + "\" title=\"" + bean.getMc()  + "\">" +bean.getMc() + "</option>");
									}
								}
							}
						}
						else
						{
							if (valuetextmode)
							{
								String valuetext = bean.getDm() + "-" + bean.getMc();
								if (valuetext.equals(value))
								{
									out.write("<option value=\"" + valuetext + "\" selected=\"selected\" title=\"" + valuetext + "\">" +valuetext+ "</option>");
								}
								else
								{
									out.write("<option value=\"" + valuetext + "\" title=\"" + valuetext + "\">" +valuetext + "</option>");
								}
							}
							else
							{
								if (bean.getDm().equals(value))
								{
									if(enableEdit)
									{
										out.write("<option value=\"" + bean.getDm() + "\" selected=\"selected\" title=\"" + bean.getMc()  + "\">[" + bean.getDm()+"]" +bean.getMc() + "</option>");
									}
									else
									{
										out.write("<option value=\"" + bean.getDm() + "\" selected=\"selected\" title=\"" + bean.getMc()  + "\">" +bean.getMc() + "</option>");
									}
								}
								else
								{
									if (enableEdit)
									{
										out.write("<option value=\"" + bean.getDm() + "\" title=\"" + bean.getMc()  + "\">[" + bean.getDm()+"]" +bean.getMc() + "</option>");
									}
									else
									{
										out.write("<option value=\"" + bean.getDm() + "\" title=\"" + bean.getMc()  + "\">" +bean.getMc() + "</option>");
									}
									 
								}
							}
						}
					}
				}
			}
			out.write("</select>");
			/*if (enableEdit)
			{
				if (ValidateHelper.isEmptyString(id))
				{
					throw new Exception("when property disablededit is false ,then id must be not empty.");
				}
				out.write("<script type=\"text/javascript\">");
				out.write("$(function(){");
				out.write("$(\"#"+ id + "\").chosen({});");
				out.write("})");
				out.write("</script>");
			}*/
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

	public String getOnchange() {
		return onchange;
	}

	public void setOnchange(String onchange) {
		this.onchange = onchange;
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

	public boolean getOptgroup()
	{
		return optgroup;
	}

	public void setOptgroup(boolean optgroup)
	{
		this.optgroup = optgroup;
	}

	public List<?> getList()
	{
		return list;
	}

	public void setList(List<?> list)
	{
		this.list = list;
	}

	public String getListKey()
	{
		return listKey;
	}

	public void setListKey(String listKey)
	{
		this.listKey = listKey;
	}

	public String getListValue()
	{
		return listValue;
	}

	public void setListValue(String listValue)
	{
		this.listValue = listValue;
	}

	public String getParentDm()
	{
		return parentDm;
	}

	public void setParentDm(String parentDm)
	{
		this.parentDm = parentDm;
	}

	public boolean isEnableEdit()
	{
		return enableEdit;
	}

	public void setEnableEdit(boolean enableEdit)
	{
		this.enableEdit = enableEdit;
	}

	public boolean isValuetextmode()
	{
		return valuetextmode;
	}

	public void setValuetextmode(boolean valuetextmode)
	{
		this.valuetextmode = valuetextmode;
	}

	
	
}
