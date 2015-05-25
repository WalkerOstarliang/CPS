package com.chinacreator.lsgl.bean;

import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 同址人员
 * @company  chinacreator
 * @author zhun.liu
 * @date  Nov 27, 2013  2:32:24 PM
 */
public class TzryBean {
	private String xm;
	private String sfzh;
	private String xb;
	private String lxfs;
	private String rysx;
	private String dzid;
	private String dzmc;
	private String stmc;
	private String fwid;
	private String lxdh;
	private String fwcs;
	private String rysxms;
	
	private String xbms;
	
	private String rybh;
	
	private String rylb;
	private String rylbms;
	private String rkid;
	private String zxbs;
	private String zxbsms;
	
	
	public String getZxbsms() {
		zxbsms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZXBS", zxbs);
		return zxbsms;
	}
	public void setZxbsms(String zxbsms) {
		this.zxbsms = zxbsms;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getRkid() {
		return rkid;
	}
	public void setRkid(String rkid) {
		this.rkid = rkid;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getDzid() {
		return dzid;
	}
	public void setDzid(String dzid) {
		this.dzid = dzid;
	}
	public String getDzmc() {
		return dzmc;
	}
	public void setDzmc(String dzmc) {
		this.dzmc = dzmc;
	}
	public String getStmc() {
		return stmc;
	}
	public void setStmc(String stmc) {
		this.stmc = stmc;
	}
	public String getRybh() {
		return rybh;
	}
	public void setRybh(String rybh) {
		this.rybh = rybh;
	}
	public String getXbms() {
		xbms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		return xbms;
	}
	public void setXbms(String xbms) {
		this.xbms = xbms;
	}
	public String getRylb() {
		return rylb;
	}
	public void setRylb(String rylb) {
		this.rylb = rylb;
	}
	public String getFwid() {
		return fwid;
	}
	public void setFwid(String fwid) {
		this.fwid = fwid;
	}
	public String getLxfs() {
		return lxfs;
	}
	public void setLxfs(String lxfs) {
		this.lxfs = lxfs;
	}
	public String getRysx() {
		return rysx;
	}
	public void setRysx(String rysx) {
		this.rysx = rysx;
	}
	public String getRylbms() {
		rylbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_RYLB", rylb);
		return rylbms;
	}
	public void setRylbms(String rylbms) {
		this.rylbms = rylbms;
	}
	public String getLxdh()
	{
		return lxdh;
	}
	public void setLxdh(String lxdh)
	{
		this.lxdh = lxdh;
	}
	public String getFwcs()
	{
		return fwcs;
	}
	public void setFwcs(String fwcs)
	{
		this.fwcs = fwcs;
	}
	public String getRysxms()
	{
		rysxms = CommonSequenceHelper.getRysxms(rysx);
		return rysxms;
	}
	public void setRysxms(String rysxms)
	{
		this.rysxms = rysxms;
	}
	
}
