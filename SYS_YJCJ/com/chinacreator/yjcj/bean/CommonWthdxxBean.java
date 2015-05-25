package com.chinacreator.yjcj.bean;

import java.util.List;

import com.chinacreator.common.bean.BaseValue;

public class CommonWthdxxBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 1042646363365516451L;
	
	private String wthdid;
	private String wtid;
	private String hdcontent;
	private String djrxm;
	private String djrsfzh;
	private String djdwdm;
	private String djdwmc;
	private String djrlxfs;
	private String djdj;
	
	private List<CommonWtfjBean> wtfjBeans;
	
	public String getWthdid()
	{
		return wthdid;
	}
	public void setWthdid(String wthdid)
	{
		this.wthdid = wthdid;
	}
	public String getWtid()
	{
		return wtid;
	}
	public void setWtid(String wtid)
	{
		this.wtid = wtid;
	}
	public String getHdcontent()
	{
		return hdcontent;
	}
	public void setHdcontent(String hdcontent)
	{
		this.hdcontent = hdcontent;
	}
	public String getDjrxm()
	{
		return djrxm;
	}
	public void setDjrxm(String djrxm)
	{
		this.djrxm = djrxm;
	}
	public String getDjrsfzh()
	{
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh)
	{
		this.djrsfzh = djrsfzh;
	}
	public String getDjdwdm()
	{
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm)
	{
		this.djdwdm = djdwdm;
	}
	public String getDjdwmc()
	{
		return djdwmc;
	}
	public void setDjdwmc(String djdwmc)
	{
		this.djdwmc = djdwmc;
	}
	public String getDjrlxfs()
	{
		return djrlxfs;
	}
	public void setDjrlxfs(String djrlxfs)
	{
		this.djrlxfs = djrlxfs;
	}
	public String getDjdj()
	{
		return djdj;
	}
	public void setDjdj(String djdj)
	{
		this.djdj = djdj;
	}
	public List<CommonWtfjBean> getWtfjBeans()
	{
		return wtfjBeans;
	}
	public void setWtfjBeans(List<CommonWtfjBean> wtfjBeans)
	{
		this.wtfjBeans = wtfjBeans;
	}
	
	
}
