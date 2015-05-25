package com.chinacreator.common.taglib.tag;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.common.taglib.bean.TabItemBodyContentBean;

public class TabPanelTag extends BodyTagSupport
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 5272087962479217395L;
	
	private String id;
	
	private String width = "100%";
	
	private String height = "auto";
	
	
	private List<TabItemBodyContentBean> tabItems = new ArrayList<TabItemBodyContentBean>();


	@Override
	public int doStartTag() throws JspException {
		try
		{
			pageContext.getOut().write("<div id=\"" + id + "\" class=\"cps-tabpanel\" width=\"" + width + "\" height=\"" + height +"\"");
			pageContext.getOut().write(">\n");
			pageContext.getOut().write("<div class=\"cps-tab-head\">\n");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return EVAL_BODY_INCLUDE;
	}
	
	
	@Override
	public int doEndTag() throws JspException {
		try
		{
			//HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			pageContext.getOut().write("</div>\n");
			pageContext.getOut().write("<div class=\"cps-tab-content\" style=\"overflow: auto;width:" + width + ";\"");
			pageContext.getOut().write(">\n");
			if (ValidateHelper.isNotEmptyCollection(tabItems))
			{
				for (TabItemBodyContentBean bean : tabItems)
				{
					pageContext.getOut().write("<div class=\"tab-content\"");
					pageContext.getOut().write(">\n");
					if (ValidateHelper.isEmptyString(bean.getHref()) 
							&& ValidateHelper.isNotEmptyString(bean.getBodyContentHtml()))
					{
						pageContext.getOut().write(bean.getBodyContentHtml());
					}
					pageContext.getOut().write("</div>\n");
					
				}
			}
			pageContext.getOut().write("</div>");
			pageContext.getOut().write("</div>\n");
			tabItems.clear();
			pageContext.getOut().write("<script type=\"text/javascript\">");
			pageContext.getOut().write("$(function(){");
			pageContext.getOut().write("$(\"#" + id + "\").tabPanel();");
			pageContext.getOut().write("});");
			pageContext.getOut().write("</script>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return super.doEndTag();
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


	public String getHeight() {
		return height;
	}


	public void setHeight(String height) {
		this.height = height;
	}


	public List<TabItemBodyContentBean> getTabItems() {
		return tabItems;
	}


	public void setTabItems(List<TabItemBodyContentBean> tabItems) {
		this.tabItems = tabItems;
	}


	 
	
}
