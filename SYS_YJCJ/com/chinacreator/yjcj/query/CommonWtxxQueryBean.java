package com.chinacreator.yjcj.query;

import com.chinacreator.common.bean.QueryBean;

public class CommonWtxxQueryBean extends QueryBean
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -5414990219597401042L;

	private String wtid;
	
	private String fjid;
	
	private String title;
	
	private String djsjstart;
	
	private String djsjend;
	
	private String sffk;

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getDjsjstart()
	{
		return djsjstart;
	}

	public void setDjsjstart(String djsjstart)
	{
		this.djsjstart = djsjstart;
	}

	public String getDjsjend()
	{
		return djsjend;
	}

	public void setDjsjend(String djsjend)
	{
		this.djsjend = djsjend;
	}

	public String getWtid()
	{
		return wtid;
	}

	public void setWtid(String wtid)
	{
		this.wtid = wtid;
	}

	public String getFjid()
	{
		return fjid;
	}

	public void setFjid(String fjid)
	{
		this.fjid = fjid;
	}

	public String getSffk()
	{
		return sffk;
	}

	public void setSffk(String sffk)
	{
		this.sffk = sffk;
	}
	
}
