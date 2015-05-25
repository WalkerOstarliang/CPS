package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 人员关系人表
 * 
 * @filename RkgxrxxBean.java
 * @author mingchun.xiong
 * @date 2013-8-20
 *
 */
public class RkgxrxxBean extends BaseValue
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 7387719830982121353L;
	
	private String id;
	private String rybh;
	private String sfzh;
	private String gxrxm;
	private String gxrsfzh;
	private String gxrxb;
	private String gxrxbms;
	private String gxrcsrq;
	private String gxrlxdh;
	private String gxrxzdxz;
	private String ydsrgx;
	private String ydsrgxms;
	private String isgdzy;
	private String isgdzyms;
	private String djrxm;
	private String djsj;
	private String djdwdm;
	private String djdwmc;
	private String czrxm;
	private String czdwdm;
	private String czdwmc;
	private String czsj;
	private String czbs;
	
	private String cz;
	private String czrsfzh;
	private String djrsfzh;
	/**
	 * 证件类型
	 */
	private String zjlx;
	private String zjlxmc;
	
	/**
	 * 外文姓
	 */
	private String wwx;
	
	/**
	 * 外文名
	 */
	private String wwm;
	
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
	public String getGxrxm()
	{
		return gxrxm;
	}
	public void setGxrxm(String gxrxm)
	{
		this.gxrxm = gxrxm;
	}
	public String getGxrsfzh()
	{
		return gxrsfzh;
	}
	public void setGxrsfzh(String gxrsfzh)
	{
		this.gxrsfzh = gxrsfzh;
	}
	public String getGxrlxdh()
	{
		return gxrlxdh;
	}
	public void setGxrlxdh(String gxrlxdh)
	{
		this.gxrlxdh = gxrlxdh;
	}
	public String getGxrxzdxz()
	{
		return gxrxzdxz;
	}
	public void setGxrxzdxz(String gxrxzdxz)
	{
		this.gxrxzdxz = gxrxzdxz;
	}
	public String getYdsrgx()
	{
		return ydsrgx;
	}
	public void setYdsrgx(String ydsrgx)
	{
		this.ydsrgx = ydsrgx;
	}
	public String getIsgdzy()
	{
		return isgdzy;
	}
	public void setIsgdzy(String isgdzy)
	{
		this.isgdzy = isgdzy;
	}
	public String getDjrxm()
	{
		return djrxm;
	}
	public void setDjrxm(String djrxm)
	{
		this.djrxm = djrxm;
	}
	public String getDjsj()
	{
		return djsj;
	}
	public void setDjsj(String djsj)
	{
		this.djsj = djsj;
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
	public String getCzrxm()
	{
		return czrxm;
	}
	public void setCzrxm(String czrxm)
	{
		this.czrxm = czrxm;
	}
	public String getCzdwdm()
	{
		return czdwdm;
	}
	public void setCzdwdm(String czdwdm)
	{
		this.czdwdm = czdwdm;
	}
	public String getCzdwmc()
	{
		return czdwmc;
	}
	public void setCzdwmc(String czdwmc)
	{
		this.czdwmc = czdwmc;
	}
	public String getCzsj()
	{
		return czsj;
	}
	public void setCzsj(String czsj)
	{
		this.czsj = czsj;
	}
	public String getCzbs()
	{
		return czbs;
	}
	public void setCzbs(String czbs)
	{
		this.czbs = czbs;
	}
	public String getYdsrgxms()
	{
		ydsrgxms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("SHGX", ydsrgx);
		return ydsrgxms;
	}
	public void setYdsrgxms(String ydsrgxms)
	{
		this.ydsrgxms = ydsrgxms;
	}
	public String getGxrxb()
	{
		return gxrxb;
	}
	public void setGxrxb(String gxrxb)
	{
		this.gxrxb = gxrxb;
	}
	public String getGxrxbms()
	{
		gxrxbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", gxrxb);
		return gxrxbms;
	}
	public void setGxrxbms(String gxrxbms)
	{
		this.gxrxbms = gxrxbms;
	}
	public String getGxrcsrq()
	{
		return gxrcsrq;
	}
	public void setGxrcsrq(String gxrcsrq)
	{
		this.gxrcsrq = gxrcsrq;
	}
	public String getIsgdzyms()
	{
		if ("0".equals(isgdzy))
		{
			isgdzyms = "否";
		}
		else if ("1".equals(isgdzy))
		{
			isgdzyms = "是";
		}
		return isgdzyms;
	}
	public void setIsgdzyms(String isgdzyms)
	{
		this.isgdzyms = isgdzyms;
	}
	public String getZjlx() {
		return zjlx;
	}
	public void setZjlx(String zjlx) {
		this.zjlx = zjlx;
	}
	public String getZjlxmc() {
		
		if(ValidateHelper.isNotEmptyString(this.zjlx)){
			zjlxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", this.zjlx);
		}
		
		return zjlxmc;
	}
	public void setZjlxmc(String zjlxmc) {
		this.zjlxmc = zjlxmc;
	}
	public String getWwx() {
		return wwx;
	}
	public void setWwx(String wwx) {
		this.wwx = wwx;
	}
	public String getWwm() {
		return wwm;
	}
	public void setWwm(String wwm) {
		this.wwm = wwm;
	}
	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"delGxr('" + this.id + "',saveAfterCallback)\" style=\"color:green\">删除</span>&nbsp;";
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getCzrsfzh() {
		return czrsfzh;
	}
	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	
}
