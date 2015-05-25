package com.chinacreator.lsgl.bean;

import java.io.File;

import com.chinacreator.common.bean.BaseValue;

/**
 * 人口照片信息
 * 
 * @filename RkzpxxBean.java
 * @author mingchun.xiong
 * @date 2013-8-19
 *
 */
public class RkzpxxBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 9079817971736300310L;

	private String id;
	private String rybh;
	private String sfzh;
	private File zp;
	private byte[] zpbytes;
	private String ms;
	private String djsj;
	private String djrxm;
	private String djdwdm;
	private String djdwmc;
	private String ycfwzp;
	private String rxfw;
	private String djrsfzh;
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getRybh()
	{
		return rybh;
	}
	public void setRybh(String rybh)
	{
		this.rybh = rybh;
	}
	public String getSfzh()
	{
		return sfzh;
	}
	public void setSfzh(String sfzh)
	{
		this.sfzh = sfzh;
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
	public String getYcfwzp()
	{
		return ycfwzp;
	}
	public void setYcfwzp(String ycfwzp)
	{
		this.ycfwzp = ycfwzp;
	}
	public String getRxfw()
	{
		return rxfw;
	}
	public void setRxfw(String rxfw)
	{
		this.rxfw = rxfw;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public byte[] getZpbytes()
	{
		return zpbytes;
	}
	public void setZpbytes(byte[] zpbytes)
	{
		this.zpbytes = zpbytes;
	}
	
}

