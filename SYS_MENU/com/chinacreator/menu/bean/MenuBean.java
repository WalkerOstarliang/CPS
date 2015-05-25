package com.chinacreator.menu.bean;

import java.io.File;

import com.chinacreator.common.bean.BaseValue;

public class MenuBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 6952675026273066586L;
	
	private String menuid;
	
	private String title;
	
	private String href;
	
	private String parentid;
	
	private String menulevel;
	
	private String sn;
	
	private String createdate;
	
	private String isvalid;

	private File imageicon;
	
	private String imageiconFileName;
	
	private String imageiconContentType;
	
	private boolean isShortCut;
	
	public String getMenuid()
	{
		return menuid;
	}

	public void setMenuid(String menuid)
	{
		this.menuid = menuid;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getHref()
	{
		return href;
	}

	public void setHref(String href)
	{
		this.href = href;
	}

	public String getParentid()
	{
		return parentid;
	}

	public void setParentid(String parentid)
	{
		this.parentid = parentid;
	}

	public String getMenulevel()
	{
		return menulevel;
	}

	public void setMenulevel(String menulevel)
	{
		this.menulevel = menulevel;
	}

	public String getSn()
	{
		return sn;
	}

	public void setSn(String sn)
	{
		this.sn = sn;
	}

	public String getCreatedate()
	{
		return createdate;
	}

	public void setCreatedate(String createdate)
	{
		this.createdate = createdate;
	}

	public File getImageicon()
	{
		return imageicon;
	}

	public void setImageicon(File imageicon)
	{
		this.imageicon = imageicon;
	}

	public String getImageiconFileName()
	{
		return imageiconFileName;
	}

	public void setImageiconFileName(String imageiconFileName)
	{
		this.imageiconFileName = imageiconFileName;
	}

	public String getImageiconContentType()
	{
		return imageiconContentType;
	}

	public void setImageiconContentType(String imageiconContentType)
	{
		this.imageiconContentType = imageiconContentType;
	}

	public String getIsvalid()
	{
		return isvalid;
	}

	public void setIsvalid(String isvalid)
	{
		this.isvalid = isvalid;
	}

	public boolean getIsShortCut()
	{
		return isShortCut;
	}

	public void setIsShortCut(boolean isShortCut)
	{
		this.isShortCut = isShortCut;
	}
	
}
