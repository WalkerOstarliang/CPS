package com.chinacreator.common.taglib.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

import com.chinacreator.common.helper.ValidateHelper;

public class ImageIconTag extends BodyTagSupport
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 7652516104893341044L;
	
	private String id;
	
	private String imageSrc = "/systemico/default.png";
	
	private String title;

	private String href;
	
	private String target;
	
	private String onclick;
	
	private String ondblclick;
	
	private String rel;
	
	@Override
	public int doStartTag() throws JspException
	{
		String contentPath = ((HttpServletRequest)pageContext.getRequest()).getContextPath();
		try
		{
			Tag tag = TagSupport.findAncestorWithClass(this, ImageIconPanelTag.class);
			if (tag != null && tag instanceof ImageIconPanelTag)
			{
				JspWriter out = pageContext.getOut();
				out.write("<ul ");
				if (ValidateHelper.isNotEmptyString(id))
				{
					out.write(" id=\"" + id + "\" ");
				}
				if (ValidateHelper.isNotEmptyString(onclick))
				{
					out.write(" onclick=\"" + onclick + "\" ");
				}
				if (ValidateHelper.isNotEmptyString(ondblclick))
				{
					out.write(" ondblclick=\"" + ondblclick + "\" ");
				}
				if (ValidateHelper.isNotEmptyString(target))
				{
					out.write(" target=\"" + target + "\" ");
				}
				if (ValidateHelper.isNotEmptyString(href))
				{
					if (href.startsWith(contentPath))
					{
						out.write(" href=\"" + href + "\" ");
					}
					else
					{
						out.write(" href=\"" + contentPath + href + "\" ");
					}
					
				}
				if (ValidateHelper.isNotEmptyString(rel))
				{
					out.write(" rel=\"" + rel + "\" ");
				}
				out.write(">\n");
				
				out.write("<li>");
				out.write("<img src=\"" + contentPath + imageSrc + "\" width=\"45\" height=\"45\"/>");
				out.write("</li>");
				out.write("<li><span>" + title + "</span></li>");
				out.write("</ul>");
			}
			else
			{
				throw new Exception("the parent of ImageIcon tag must be ImageIconPanel tag.");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getImageSrc()
	{
		return imageSrc;
	}

	public void setImageSrc(String imageSrc)
	{
		this.imageSrc = imageSrc;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getOnclick()
	{
		return onclick;
	}

	public void setOnclick(String onclick)
	{
		this.onclick = onclick;
	}

	public String getHref()
	{
		return href;
	}

	public void setHref(String href)
	{
		this.href = href;
	}

	public String getTarget()
	{
		return target;
	}

	public void setTarget(String target)
	{
		this.target = target;
	}

	public String getRel()
	{
		return rel;
	}

	public void setRel(String rel)
	{
		this.rel = rel;
	}

	public String getOndblclick()
	{
		return ondblclick;
	}

	public void setOndblclick(String ondblclick)
	{
		this.ondblclick = ondblclick;
	}
	
	
}
