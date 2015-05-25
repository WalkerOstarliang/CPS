package com.chinacreator.menu.bean;

import com.chinacreator.common.bean.BaseValue;

public class OutSiteMenuBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -9215396886057127555L;
	
	private String id;
	
	private String menuname;
	
	private String menuhref;
	
	private String createusersfzh;
	
	private String createdate;
	
	private String orderflag;
	

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getMenuname()
	{
		return menuname;
	}

	public void setMenuname(String menuname)
	{
		this.menuname = menuname;
	}

	public String getMenuhref()
	{
		return menuhref;
	}

	public void setMenuhref(String menuhref)
	{
		this.menuhref = menuhref;
	}

	public String getCreateusersfzh()
	{
		return createusersfzh;
	}

	public void setCreateusersfzh(String createusersfzh)
	{
		this.createusersfzh = createusersfzh;
	}

	public String getCreatedate()
	{
		return createdate;
	}

	public void setCreatedate(String createdate)
	{
		this.createdate = createdate;
	}

	public String getOrderflag()
	{
		return orderflag;
	}

	public void setOrderflag(String orderflag)
	{
		this.orderflag = orderflag;
	}

	
}
