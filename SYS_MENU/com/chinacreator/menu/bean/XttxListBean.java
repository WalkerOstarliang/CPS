package com.chinacreator.menu.bean;

import com.chinacreator.common.bean.BaseValue;

public class XttxListBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -1277488658125358236L;
	
	private String type;
	
	private String title;
	
	private String blsj;
	
	private String blhref;
	
	private String cz;

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getBlsj()
	{
		return blsj;
	}

	public void setBlsj(String blsj)
	{
		this.blsj = blsj;
	}

	public String getBlhref()
	{
		return blhref;
	}

	public void setBlhref(String blhref)
	{
		this.blhref = blhref;
	}

	public String getCz()
	{
		cz = "<span onclick=\"openXxBlPageWin('"+blhref + "')\" class=\"cps_span_href\">办理</span>";
		return cz;
	}

	public void setCz(String cz)
	{
		this.cz = cz;
	}

	public String getType()
	{
		type = "<span style='color:green'>" + type + "</span>";
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}
	
}
