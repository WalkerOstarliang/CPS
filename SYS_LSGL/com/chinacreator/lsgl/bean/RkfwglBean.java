package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 房屋人口管理对象
 * 
 * @filename RkfwglBean.java
 * @author mingchun.xiong
 * @date 2013-8-23
 *
 */
public class RkfwglBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 4553305850117724828L;

	private String rkfwglid;
	
	private String rybh;
	
	private String fwid;
	
	private String oldfwid;
	
	private String fwmc;
	
	private String dzid;
	
	private String dzmc;
	
	private String rzsj;
	
	private String blsj;
	
	private String zxbs;
	private String zxbsms;
	
	private String zxmjxm;
	
	private String zxsj;
	
	private String zxdwdm;
	
	private String zxdwmc;
	
	private String sfzh;
	
	private String zxyy;
	private String djsj;
	
	
	private String rylb;
	private String rylbms;
	private String xm;
	private String xb;
	private String xbms;
	private String lxdh;
	private String rkid;  //如 常口的czrkbh 流口表中的 zzbh  。。。。。
	
	private String djdwdm;
	private String djdwmc;
	private String cz;
	private String fwcs;
	
	private String zjzl;
	private String zjzlms;
	
	private String fzsfzh;
	private String fzxm;
	
	public String getFwcs() {
		return fwcs;
	}

	public void setFwcs(String fwcs) {
		this.fwcs = fwcs;
	}

	public String getRkfwglid()
	{
		return rkfwglid;
	}

	public void setRkfwglid(String rkfwglid)
	{
		this.rkfwglid = rkfwglid;
	}

	public String getRybh()
	{
		return rybh;
	}

	public void setRybh(String rybh)
	{
		this.rybh = rybh;
	}

	public String getFwid()
	{
		return fwid;
	}

	public void setFwid(String fwid)
	{
		this.fwid = fwid;
	}

	public String getDzid()
	{
		return dzid;
	}

	public void setDzid(String dzid)
	{
		this.dzid = dzid;
	}

	public String getFwmc()
	{
		return fwmc;
	}

	public void setFwmc(String fwmc)
	{
		this.fwmc = fwmc;
	}

	public String getZxmjxm()
	{
		return zxmjxm;
	}

	public void setZxmjxm(String zxmjxm)
	{
		this.zxmjxm = zxmjxm;
	}

	public String getZxsj()
	{
		return zxsj;
	}

	public void setZxsj(String zxsj)
	{
		this.zxsj = zxsj;
	}

	public String getZxdwdm()
	{
		return zxdwdm;
	}

	public void setZxdwdm(String zxdwdm)
	{
		this.zxdwdm = zxdwdm;
	}

	public String getZxdwmc()
	{
		return zxdwmc;
	}

	public void setZxdwmc(String zxdwmc)
	{
		this.zxdwmc = zxdwmc;
	}

	public String getZxbs()
	{
		return zxbs;
	}

	public void setZxbs(String zxbs)
	{
		this.zxbs = zxbs;
	}

	public String getRzsj()
	{
		return rzsj;
	}

	public void setRzsj(String rzsj)
	{
		this.rzsj = rzsj;
	}

	public String getBlsj()
	{
		return blsj;
	}

	public void setBlsj(String blsj)
	{
		this.blsj = blsj;
	}

	public String getDzmc()
	{
		return dzmc;
	}

	public void setDzmc(String dzmc)
	{
		this.dzmc = dzmc;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getZxyy() {
		return zxyy;
	}

	public void setZxyy(String zxyy) {
		this.zxyy = zxyy;
	}

	public String getRylb() {
		return rylb;
	}

	public void setRylb(String rylb) {
		this.rylb = rylb;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getXb() {
		return xb;
	}

	public void setXb(String xb) {
		this.xb = xb;
	}

	public String getLxdh() {
		return lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getRkid() {
		return rkid;
	}

	public void setRkid(String rkid) {
		this.rkid = rkid;
	}

	public String getXbms() {
		xbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		return xbms;
	}

	public void setXbms(String xbms) {
		this.xbms = xbms;
	}

	public String getRylbms() {
		rylbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_RYLB", rylb);
		return "<font color='red'>"+rylbms+"</font>";
	}

	public void setRylbms(String rylbms) {
		this.rylbms = rylbms;
	}

	public String getCz() {
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"openJzxxInfo('detail','"+rkid+"','"+rylb+"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		cz = sb.toString();
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getZxbsms() {
		zxbsms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZXBS", zxbs);
		return zxbsms;
	}

	public void setZxbsms(String zxbsms) {
		this.zxbsms = zxbsms;
	}

	public String getDjsj() {
		return djsj;
	}

	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}

	public String getDjdwdm() {
		return djdwdm;
	}

	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}

	public String getDjdwmc() {
		return djdwmc;
	}

	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}

	public String getOldfwid()
	{
		return oldfwid;
	}

	public void setOldfwid(String oldfwid)
	{
		this.oldfwid = oldfwid;
	}

	public String getZjzl()
	{
		
		return zjzl;
	}

	public void setZjzl(String zjzl)
	{
		this.zjzl = zjzl;
	}

	public String getZjzlms()
	{
		zjzlms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", zjzl);
		return zjzlms;
	}

	public void setZjzlms(String zjzlms)
	{
		this.zjzlms = zjzlms;
	}

	public String getFzsfzh()
	{
		return fzsfzh;
	}

	public void setFzsfzh(String fzsfzh)
	{
		this.fzsfzh = fzsfzh;
	}

	public String getFzxm()
	{
		return fzxm;
	}

	public void setFzxm(String fzxm)
	{
		this.fzxm = fzxm;
	}
	
}
