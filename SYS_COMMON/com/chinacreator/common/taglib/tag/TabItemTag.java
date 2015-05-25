package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.common.taglib.bean.TabItemBodyContentBean;

/**
 * TabItem
 * @author mingchun.xiong
 *
 */
public class TabItemTag extends BodyTagSupport
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= -3642030204163687765L;
	
	private String id;
	
	private String title;
	
	private String display;
	
	private String href;

	private String beforeClick;
	
	private String bodyContentHtml;
	
	private String disabled;
	
	@Override
	public int doEndTag() throws JspException {
		try
		{
			BodyContent bc = getBodyContent();
			if (bc != null)
			{
				bodyContentHtml = bc.getString();
			}
			TabPanelTag parentTag =  (TabPanelTag)TagSupport.findAncestorWithClass(this, TabPanelTag.class);
			TabItemBodyContentBean bean = new TabItemBodyContentBean();
			org.springframework.beans.BeanUtils.copyProperties(this, bean);
			parentTag.getTabItems().add(bean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		
		try
		{
			pageContext.getOut().write("<button ");
			if (ValidateHelper.isNotEmptyString(id))
			{
				pageContext.getOut().write(" id=\"" + id + "\" type=\"button\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(disabled) && "true".equals(disabled))
			{
				pageContext.getOut().write(" disabled=\"disabled\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(beforeClick))
			{
				pageContext.getOut().write(" beforeClick=\"" + beforeClick + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(href))
			{
				pageContext.getOut().write(" href=\"" + href + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(display))
			{
				pageContext.getOut().write(" display=\"" + display + "\" ");
				if (display == "true")
				{
					pageContext.getOut().write(" class=\"cps-tab-head-inline\" ");
				}
				else
				{
					pageContext.getOut().write(" class=\"cps-tab-head-none\" ");
				}
			}
			else
			{
				pageContext.getOut().write(" class=\"cps-tab-head-none\" ");
			}
			pageContext.getOut().write(">");
			if (ValidateHelper.isNotEmptyString(title))
			{
				pageContext.getOut().write(title);
			}
			else
			{
				pageContext.getOut().write("");
			}
			pageContext.getOut().write("</button>");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return EVAL_BODY_BUFFERED;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getBodyContentHtml() {
		return bodyContentHtml;
	}

	public void setBodyContentHtml(String bodyContentHtml) {
		this.bodyContentHtml = bodyContentHtml;
	}

	public String getBeforeClick() {
		return beforeClick;
	}

	public void setBeforeClick(String beforeClick) {
		this.beforeClick = beforeClick;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}
	
	
	
	
}
