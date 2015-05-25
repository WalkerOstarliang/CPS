package com.chinacreator.tjbb.query;

import com.chinacreator.common.bean.QueryBean;

public class PcsTjqkQueryBean extends QueryBean
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -2202162403367621388L;
	
	private String orgcode;

	private String suborgcode;
	
	private int orgLeve;
	
	private String sfwsxx;
	
	private String tjyf;
	
	public String getOrgcode()
	{
		return orgcode;
	}

	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
	}

	public String getSuborgcode()
	{
		return suborgcode;
	}

	public void setSuborgcode(String suborgcode)
	{
		this.suborgcode = suborgcode;
	}

	public int getOrgLeve() {
		return orgLeve;
	}

	public void setOrgLeve(int orgLeve) {
		this.orgLeve = orgLeve;
	}

	public String getSfwsxx()
	{
		return sfwsxx;
	}

	public void setSfwsxx(String sfwsxx)
	{
		this.sfwsxx = sfwsxx;
	}

	public String getTjyf()
	{
		return tjyf;
	}

	public void setTjyf(String tjyf)
	{
		this.tjyf = tjyf;
	}
	
	
}
