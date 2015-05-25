package com.chinacreator.sydw.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 单位管理查询对象
 * 
 * @filename DwglQueryBean.java
 * @author mingchun.xiong
 * @date Jun 27, 2014
 *
 */
public class DwglQueryBean extends QueryBean
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -8982419342653752474L;
	
	private String jgbh;
	
	private String dwmc;
	
	private String fwid;

	public String getDwmc()
	{
		return dwmc;
	}

	public void setDwmc(String dwmc)
	{
		this.dwmc = dwmc;
	}

	public String getFwid()
	{
		return fwid;
	}

	public void setFwid(String fwid)
	{
		this.fwid = fwid;
	}

	public String getJgbh()
	{
		return jgbh;
	}

	public void setJgbh(String jgbh)
	{
		this.jgbh = jgbh;
	}
	
}
