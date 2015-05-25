package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 小区信息
 *
 */
public class XqxxQuery extends QueryBean {

	private static final long serialVersionUID = 6154728363051531444L;
	 
	private String sqbh;
	
	private String xqbh;
	
	private String xqmc;

	public String getSqbh()
	{
		return sqbh;
	}

	public void setSqbh(String sqbh)
	{
		this.sqbh = sqbh;
	}

	public String getXqmc()
	{
		return xqmc;
	}

	public void setXqmc(String xqmc)
	{
		this.xqmc = xqmc;
	}

	public String getXqbh()
	{
		return xqbh;
	}

	public void setXqbh(String xqbh)
	{
		this.xqbh = xqbh;
	}
	
	
	
}
