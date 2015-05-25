package com.chinacreator.tjbb.query;

import com.chinacreator.common.bean.QueryBean;

public class DataLrthQueryBean extends QueryBean
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 7704952488662210141L;
	
	private String orgcode;
	private String orgname;
	private String tjqsrq;
	private String tjjzrq;
	private String dwlx;
	private String sorttype;
	
	public String getOrgcode()
	{
		return orgcode;
	}
	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
	}
	
	public String getDwlx()
	{
		return dwlx;
	}
	public void setDwlx(String dwlx)
	{
		this.dwlx = dwlx;
	}
	public String getSorttype()
	{
		return sorttype;
	}
	public void setSorttype(String sorttype)
	{
		this.sorttype = sorttype;
	}
	
	public String getTjqsrq()
	{
		return tjqsrq;
	}
	public void setTjqsrq(String tjqsrq)
	{
		this.tjqsrq = tjqsrq;
	}
	public String getTjjzrq()
	{
		return tjjzrq;
	}
	public void setTjjzrq(String tjjzrq)
	{
		this.tjjzrq = tjjzrq;
	}
	public String getOrgname()
	{
		return orgname;
	}
	public void setOrgname(String orgname)
	{
		this.orgname = orgname;
	}
	 
}
