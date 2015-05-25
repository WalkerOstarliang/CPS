package com.chinacreator.lsgl.bean;

import java.io.File;

import com.chinacreator.common.bean.BaseValue;

/**
 * 房屋照片信息对象
 * 
 * @filename FwzpxxBean.java
 * @author mingchun.xiong
 * @date 2013-8-14
 *
 */
public class FwzpxxBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= -7764590832495757746L;
	
	private String id;
	private String fwid;
	private File zp;
	private String ms;
	private String djsj;
	private String djrxm;
	private String djdwdm;
	private String djdwmc;
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getFwid()
	{
		return fwid;
	}
	public void setFwid(String fwid)
	{
		this.fwid = fwid;
	}
	public File getZp()
	{
		return zp;
	}
	public void setZp(File zp)
	{
		this.zp = zp;
	}
	public String getMs()
	{
		return ms;
	}
	public void setMs(String ms)
	{
		this.ms = ms;
	}
	public String getDjsj()
	{
		return djsj;
	}
	public void setDjsj(String djsj)
	{
		this.djsj = djsj;
	}
	public String getDjrxm()
	{
		return djrxm;
	}
	public void setDjrxm(String djrxm)
	{
		this.djrxm = djrxm;
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
	
	
}
