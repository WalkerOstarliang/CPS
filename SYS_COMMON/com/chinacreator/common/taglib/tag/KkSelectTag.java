package com.chinacreator.common.taglib.tag;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.afgl.bean.KkxxBean;
import com.chinacreator.afgl.dao.KkxxDao;
import com.chinacreator.afgl.query.KkxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.helper.ValidateHelper;

public class KkSelectTag extends BodyTagSupport
{

	private static final long	serialVersionUID	= -9076238925702588265L;
	
	private String id;
	
	private String name;
	
	private String value;
	
	private String headerKey = "";
	
	private String headerValue = "";
	
	private String cssClass;
	
	private String cssStyle;
	
	private String onchange;
	
	@Override
	public int doStartTag() throws JspException {
		try
		{
			JspWriter out = pageContext.getOut();
			out.write("<select ");
			if (ValidateHelper.isNotEmptyString(id))
			{
				out.write(" id=\"" + id + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(name))
			{
				out.write(" name=\"" + name + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(cssClass))
			{
				out.write(" class=\"" + cssClass + "\" ");
			}
			if (ValidateHelper.isNotEmptyString(cssStyle))
			{
				out.write(" style=\"" + cssStyle + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(onchange))
			{
				out.write(" onchange=\"" + onchange + "\" ");
			}
			out.write(">\n");
			if (ValidateHelper.isNotEmptyString(headerValue))
			{
				out.write("<option value=\"" + headerKey + "\">" + headerValue + "</option>");
			}
			KkxxQuery kkxxQuery = new KkxxQuery();
			kkxxQuery.setZxbs("0");
			
			PageInfo pageInfo = new PageInfo();
			pageInfo.setCurrentPage(1);
			pageInfo.setPageSize(100000);
			List<KkxxBean> kkxxBeanList = KkxxDao.kkxxList(pageInfo, kkxxQuery).getDatas();
			if (ValidateHelper.isNotEmptyCollection(kkxxBeanList))
			{
				for (KkxxBean bean : kkxxBeanList)
				{
					if (bean.getKkbh().equals(value))
					{
						out.write("<option value=\"" + bean.getKkbh() + "\" selected=\"selected\">" + bean.getKkmc() + "</option>");
					}
					else
					{
						out.write("<option value=\"" + bean.getKkbh() + "\">" + bean.getKkmc() + "</option>");
					}
				}
			}
			out.write("</select>");
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
	
	
}
