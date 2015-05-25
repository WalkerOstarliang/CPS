package com.chinacreator.yjcj.bean;

import java.util.List;

import com.chinacreator.common.bean.BaseValue;

public class CommonWtxxBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 863562730547066226L;
	
	private String wtid;
	private String title;
	private String content;
	private String djrxm;
	private String djrjh;
	private String djrsfzh;
	private String djdwdm;
	private String djdwmc;
	private String djrlxfs;
	private String sffk;
	private String djsj;
	
	private List<CommonWtfjBean> wtfjBeans;
	
	public String getWtid()
	{
		return wtid;
	}
	public void setWtid(String wtid)
	{
		this.wtid = wtid;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
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
	public String getSffk()
	{
		return sffk;
	}
	public void setSffk(String sffk)
	{
		this.sffk = sffk;
	}
	public String getDjsj()
	{
		return djsj;
	}
	public void setDjsj(String djsj)
	{
		this.djsj = djsj;
	}
	public List<CommonWtfjBean> getWtfjBeans()
	{
		return wtfjBeans;
	}
	public void setWtfjBeans(List<CommonWtfjBean> wtfjBeans)
	{
		this.wtfjBeans = wtfjBeans;
	}
	public String getDjrjh()
	{
		return djrjh;
	}
	public void setDjrjh(String djrjh)
	{
		this.djrjh = djrjh;
	}
	
	
}
