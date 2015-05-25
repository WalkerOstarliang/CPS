package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.ValidateHelper;

public class ImageIconPanelTag extends BodyTagSupport
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -6262666267424681627L;
	
	private String id;
	
	private String width;
	
	private String height;
	
	/**
	 * auto ,visible, hidden,scroll
	 */
	private String scroll;
	
	private String cssClass;
	
	private String cssStyle;
	
	

	@Override
	public int doEndTag() throws JspException
	{
		JspWriter out = pageContext.getOut();
		try
		{
			out.write("</div>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return super.doEndTag();
	}

	@Override
	public int doStartTag() throws JspException
	{
		JspWriter out = pageContext.getOut();
		try
		{
			out.write("<div ");
			if (ValidateHelper.isNotEmptyString(id))
			{
				out.write(" id=\"" + id + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(width))
			{
				out.write(" width=\"" + width + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(height))
			{
				out.write(" height=\"" + height + "\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(cssClass))
			{
				out.write(" class=\"cps-icon-panel " + cssClass + "\" ");
			}
			else
			{
				out.write(" class=\"cps-icon-panel\" ");
			}
			
			if (ValidateHelper.isNotEmptyString(cssStyle))
			{
				if (ValidateHelper.isNotEmptyString(scroll))
				{
					out.write(" style=\"overflow:"+ scroll + ";" +cssStyle + "\"");
				}
				else
				{
					out.write(" style=\"" + cssStyle + "\" ");
				}
			}
			else
			{
				if (ValidateHelper.isNotEmptyString(scroll))
				{
					out.write(" style=\"overflow:"+ scroll + "\"");
				}
			}
			
			out.write(">");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return EVAL_BODY_INCLUDE;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getWidth()
	{
		return width;
	}

	public void setWidth(String width)
	{
		this.width = width;
	}

	public String getHeight()
	{
		return height;
	}

	public void setHeight(String height)
	{
		this.height = height;
	}

	public String getScroll()
	{
		return scroll;
	}

	public void setScroll(String scroll)
	{
		this.scroll = scroll;
	}

	public String getCssClass()
	{
		return cssClass;
	}

	public void setCssClass(String cssClass)
	{
		this.cssClass = cssClass;
	}

	public String getCssStyle()
	{
		return cssStyle;
	}

	public void setCssStyle(String cssStyle)
	{
		this.cssStyle = cssStyle;
	}

}
