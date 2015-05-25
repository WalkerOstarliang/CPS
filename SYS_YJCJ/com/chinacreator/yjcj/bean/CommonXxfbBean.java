package com.chinacreator.yjcj.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;

/**
 * 信息发布对象
 * 
 * @filename CommonXxfbBean.java
 * @author mingchun.xiong
 * @date Mar 2, 2015
 *
 */
public class CommonXxfbBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= -26267238729770833L;
	private String xxid;
	private String title;
	private String content;
	private String djrxm;
	private String djrsfzh;
	private String djdwdm;
	private String djdwmc;
	private String djsj;
	
	private List<CommonXxfbfjBean> fjBeans = new ArrayList<CommonXxfbfjBean>();
	
	public String getXxid()
	{
		return xxid;
	}
	public void setXxid(String xxid)
	{
		this.xxid = xxid;
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
	public String getDjsj()
	{
		return djsj;
	}
	public void setDjsj(String djsj)
	{
		this.djsj = djsj;
	}
	public List<CommonXxfbfjBean> getFjBeans()
	{
		return fjBeans;
	}
	public void setFjBeans(List<CommonXxfbfjBean> fjBeans)
	{
		this.fjBeans = fjBeans;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	
}
