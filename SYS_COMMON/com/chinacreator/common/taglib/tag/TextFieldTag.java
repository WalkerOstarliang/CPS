package com.chinacreator.common.taglib.tag;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.ValidateHelper;

/**
 * 文本框标签
 * @author mingchun.xiong
 *
 */
public class TextFieldTag extends BodyTagSupport
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= -4470183685923942335L;
	
	private String id;
	
	private String inputType;
	
	/**
	 * textarea,text
	 */
	private String type = "text";
	
	private String name;
	
	private String value;
	
	private String cssClass="cps-input";
	
	private String cssStyle;
	
	private String maxlength;
	
	private String minlength;
	
	private String readonly;
	
	private String disabled;
	
	private String onclick;

	private String ondblclick;
	
	private String onblur;
	
	private String onfocus;

	private String onkeyup;
	
	private String onkeydown;
	
	private boolean required = false;
	
	private boolean isSfzh = false;
	
	private boolean isPhone = false;
	
	private boolean isMobile = false;
	
	private boolean isEmail = false;
	
	private boolean hideValue =  false;
	
	private boolean appendPopuBtn = false;
	
	private boolean autoInitValue = true;
	
	@Override
	public int doStartTag() throws JspException {
		try
		{
			writeInput();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return super.doStartTag();
	}

	private void writeInput()
	{
		
		try
		{
			JspWriter out = pageContext.getOut();
			if (type.equals("text"))
			{
				out.write("<input type=\"text\" " );
			}
			else if (type.equals("textarea"))
			{
				out.write("<textarea wrap=\"physical\"  type=\"textarea\" rows=\"20\"" );
			}
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
				out.write(" value=\"" + value + "\" title=\"" +value + "\"");
			}
			else
			{
				String value = "";
				if (autoInitValue)
				{
					value = getScopeString(name);
				}
				out.write(" value=\"" + value + "\" title=\"" + value +"\"");
			}
			
			if (ValidateHelper.isNotEmptyString(cssClass))
			{
				String cssClassStr = "";
				String validateStr = getValidateStr();
				
				if (ValidateHelper.isNotEmptyString(validateStr.toString()))
				{
					cssClassStr += validateStr;
				}
				
				if (appendPopuBtn)
				{
					cssClassStr += " cps-popu-btn ";
					readonly = "true";
				}
				
				if ("cps-input".equals(cssClass))
				{
					cssClassStr += " cps-input";
				}
				else
				{
					cssClassStr += " " + cssClass + " cps-input";
				}
				
				out.write(" class=\"" + cssClassStr + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(cssStyle))
			{
				if("textarea".equals(this.type)){
					String textarea_style="word-wrap:break-word;break-word:break-all;overflow:hidden;";
					this.cssStyle = textarea_style + this.cssStyle;
				}
				out.write(" style=\"" + cssStyle + "\" ");
			}
			
			out.write(" hideValue=\"" + hideValue + "\" ");
			
			if (ValidateHelper.isNotEmptyString(maxlength))
			{
				out.write(" maxlength=\"" + maxlength + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(readonly) && "true".equals(readonly))
			{
				out.write(" readonly=\"readonly\" ");
			}
			if (ValidateHelper.isNotEmptyString(disabled) && "true".equals(disabled))
			{
				out.write(" disabled=\"disabled\" ");
			}
			if (ValidateHelper.isNotEmptyString(onclick))
			{
				out.write(" onclick=\"" + onclick + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(ondblclick))
			{
				out.write(" ondblclick=\"" + ondblclick + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(onblur))
			{
				out.write(" onblur=\"" + onblur + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(onfocus))
			{
				out.write(" onfocus=\"" + onfocus + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(onkeyup))
			{
				out.write(" onkeyup=\"" + onkeyup + "\" ");
			}
			else
			{
				if (ValidateHelper.isNotEmptyString(inputType))
				{
					// 整数
					if (inputType.equalsIgnoreCase("integer"))
					{
						out.write(" onkeyup=\"this.value=this.value.replace(/[^0-9]+/,'');\" ");
					}
					// 只能输入数字
					else if (inputType.equalsIgnoreCase("number"))
					{
						out.write(" onkeyup=\"this.value=this.value.replace(/[^\\.\\d]/g,'');\" ");
					}
					// 不能输入中文和特殊字符
					else if ("onlychar".equalsIgnoreCase(inputType))
					{
						out.write(" onkeyup=\"this.value=this.value.replace(/[^\\w\\.\\/]/ig,'');\" ");
					}
					// 只能输入中文
					else if ("onlychinese".equals(inputType))
					{
						out.write(" onkeyup=\"this.value=this.value.replace(/[^\u4E00-\u9FA5]/g,'');\" ");
					}
				}
			}
			if (ValidateHelper.isNotEmptyString(onkeydown))
			{
				out.write(" onkeydown=\"" + onkeydown + "\" ");
			}
			if (type.equals("text"))
			{
				out.write("/>");
			}
			else if (type.equals("textarea"))
			{
				out.write(" >");
				if (ValidateHelper.isNotEmptyString(value))
				{
					out.write(value);
				}
				else
				{
					String value = getScopeString(name);
					out.write(value);
				}
				out.write("</textarea>" );
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	private String getScopeString(String key)
	{
		try
		{
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			if (ValidateHelper.isNotEmptyString(key))
			{
				if (pageContext.getAttribute(key) == null)
				{
					if (request.getAttribute(key) == null)
					{
						if (request.getSession().getAttribute(key) == null)
						{
							if (request.getSession().getServletContext().getAttribute(key) == null)
							{
								return "";
							}
							else
							{
								return request.getSession().getServletContext().getAttribute(key).toString();
							}
						}
						else
						{
							return request.getSession().getAttribute(key).toString();
						}
					}
					else
					{
						return pageContext.getRequest().getAttribute(key).toString();
					}
				}
				else
				{
					return pageContext.getAttribute(key).toString();
				}
			}
		}
		catch(Exception e)
		{
		}
		return "";
	}
	
	private String getValidateStr()
	{
		StringBuffer validateStr = new StringBuffer();
		List<String> valStrList = new ArrayList<String>();
		if (required)
		{
			valStrList.add("required");
		}
		if (isPhone)
		{
			valStrList.add("custom[phone]");
		}
		if (isMobile)
		{
			valStrList.add("custom[mobile]");
		}
		
		if (ValidateHelper.isNotEmptyString(maxlength))
		{
			valStrList.add("maxSize[" + maxlength + "]");
		}
		
		if (ValidateHelper.isNotEmptyString(minlength))
		{
			valStrList.add("minSize[" + minlength + "]");
		}
		if (isEmail)
		{
			valStrList.add("custom[email]");
		}
		
		if (isSfzh)
		{ 
			valStrList.add("maxSize[18]");
			valStrList.add("funcCall[checkIDC]");
			maxlength = "18";
		}
		if (ValidateHelper.isNotEmptyCollection(valStrList))
		{
			validateStr.append(" validate" + valStrList.toString());
		}
		return validateStr.toString();
	}
	
	public String getReadonly() {
		return readonly;
	}


	public void setReadonly(String readonly) {
		this.readonly = readonly;
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

	public String getOnfocus() {
		return onfocus;
	}

	public void setOnfocus(String onfocus) {
		this.onfocus = onfocus;
	}

	public String getMaxlength() {
		return maxlength;
	}

	public void setMaxlength(String maxlength) {
		this.maxlength = maxlength;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	public String getOnkeyup()
	{
		return onkeyup;
	}

	public void setOnkeyup(String onkeyup)
	{
		this.onkeyup = onkeyup;
	}

	public String getOnkeydown()
	{
		return onkeydown;
	}

	public void setOnkeydown(String onkeydown)
	{
		this.onkeydown = onkeydown;
	}

	public String getInputType()
	{
		return inputType;
	}

	public void setInputType(String inputType)
	{
		this.inputType = inputType;
	}

	public boolean getIsSfzh()
	{
		return isSfzh;
	}

	public void setIsSfzh(boolean isSfzh)
	{
		this.isSfzh = isSfzh;
	}

	public boolean getRequired()
	{
		return required;
	}

	public void setRequired(boolean required)
	{
		this.required = required;
	}

	public boolean getIsPhone()
	{
		return isPhone;
	}

	public void setIsPhone(boolean isPhone)
	{
		this.isPhone = isPhone;
	}

	public boolean getIsEmail()
	{
		return isEmail;
	}

	public void setIsEmail(boolean isEmail)
	{
		this.isEmail = isEmail;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public boolean isAppendPopuBtn()
	{
		return appendPopuBtn;
	}

	public void setAppendPopuBtn(boolean appendPopuBtn)
	{
		this.appendPopuBtn = appendPopuBtn;
	}

	public String getMinlength()
	{
		return minlength;
	}

	public void setMinlength(String minlength)
	{
		this.minlength = minlength;
	}

	public boolean getAutoInitValue()
	{
		return autoInitValue;
	}

	public void setAutoInitValue(boolean autoInitValue)
	{
		this.autoInitValue = autoInitValue;
	}
	
	
}
