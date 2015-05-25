package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class WxwpdwBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 7613256433468022444L;
	
	private String jlbh;
	private String jgbh;
	private String hwlb;
	private String hwlbmc;
	private String dwfl;
	private String[] dwfls;
	private String fbxkfw;
	private String scdz;
	private String cssb;
	private String bz;
	
	public String getJlbh()
	{
		return jlbh;
	}
	public void setJlbh(String jlbh)
	{
		this.jlbh = jlbh;
	}
	public String getJgbh()
	{
		return jgbh;
	}
	public void setJgbh(String jgbh)
	{
		this.jgbh = jgbh;
	}
	public String getHwlb()
	{
		return hwlb;
	}
	public void setHwlb(String hwlb)
	{
		this.hwlb = hwlb;
	}
	public String getDwfl()
	{
		return dwfl;
	}
	public void setDwfl(String dwfl)
	{
		this.dwfl = dwfl;
	}
	public String getFbxkfw()
	{
		return fbxkfw;
	}
	public void setFbxkfw(String fbxkfw)
	{
		this.fbxkfw = fbxkfw;
	}
	public String getScdz()
	{
		return scdz;
	}
	public void setScdz(String scdz)
	{
		this.scdz = scdz;
	}
	public String getCssb()
	{
		return cssb;
	}
	public void setCssb(String cssb)
	{
		this.cssb = cssb;
	}
	public String getBz()
	{
		return bz;
	}
	public void setBz(String bz)
	{
		this.bz = bz;
	}
	public String getHwlbmc() {
		hwlbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_HWLB", this.hwlb);
		return hwlbmc;
	}
	public void setHwlbmc(String hwlbmc) {
		this.hwlbmc = hwlbmc;
	}
	public String[] getDwfls()
	{
		return dwfls;
	}
	public void setDwfls(String[] dwfls)
	{
		this.dwfls = dwfls;
	}
	
}
