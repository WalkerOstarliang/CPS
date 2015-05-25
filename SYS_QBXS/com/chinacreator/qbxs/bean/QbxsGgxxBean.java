package com.chinacreator.qbxs.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 
 * @company  chinacreator
 * @date  Mar 17, 2014  8:54:58 AM
 * 重要情报线索与事件涉事骨干信息
 */
public class QbxsGgxxBean {
	private String id;
	private String sjid;
	private String ldxxbh;	//联动信息编号
	private String yldxxbh;	//源联动信息编号
	private String ryxh;	//人员序号
	private String xm;	//姓名
	private String gmsfhm;	//公民身份号码
	private String hzhm;	//护照号码
	private String xb;	//性别
	private String xbms;
	private String csrq;	//出生日期
	private String wwxm;	//外文姓名
	private String bmhch;	//别名或绰号
	private String gj;	//国籍
	private String mz;	//民族
	private String hjd;	//户籍地
	private String hjdqhmc;
	private String hjdxz;
	private String xzd;	//现住地
	private String xzdmc;
	private String xzdxz;	//现住地详址
	private String zy;	//职业
	private String fwcs;	//服务处所
	private String gddhhm;	//固定电话号码
	private String sjhm;	//手机号码
	private String zzzhm;	//暂住证号码
	private String hlwtxgjhm;	//互联网通讯工具号码
	private String bz;	//备注
	
	private String cz;
	public String getLdxxbh() {
		return ldxxbh;
	}
	public void setLdxxbh(String ldxxbh) {
		this.ldxxbh = ldxxbh;
	}
	public String getYldxxbh() {
		return yldxxbh;
	}
	public void setYldxxbh(String yldxxbh) {
		this.yldxxbh = yldxxbh;
	}
	public String getRyxh() {
		return ryxh;
	}
	public void setRyxh(String ryxh) {
		this.ryxh = ryxh;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getGmsfhm() {
		return gmsfhm;
	}
	public void setGmsfhm(String gmsfhm) {
		this.gmsfhm = gmsfhm;
	}
	public String getHzhm() {
		return hzhm;
	}
	public void setHzhm(String hzhm) {
		this.hzhm = hzhm;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getWwxm() {
		return wwxm;
	}
	public void setWwxm(String wwxm) {
		this.wwxm = wwxm;
	}
	public String getBmhch() {
		return bmhch;
	}
	public void setBmhch(String bmhch) {
		this.bmhch = bmhch;
	}
	public String getGj() {
		return gj;
	}
	public void setGj(String gj) {
		this.gj = gj;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getHjd() {
		return hjd;
	}
	public void setHjd(String hjd) {
		this.hjd = hjd;
	}
	public String getXzd() {
		return xzd;
	}
	public void setXzd(String xzd) {
		this.xzd = xzd;
	}
	public String getXzdxz() {
		return xzdxz;
	}
	public void setXzdxz(String xzdxz) {
		this.xzdxz = xzdxz;
	}
	public String getZy() {
		return zy;
	}
	public void setZy(String zy) {
		this.zy = zy;
	}
	public String getFwcs() {
		return fwcs;
	}
	public void setFwcs(String fwcs) {
		this.fwcs = fwcs;
	}
	public String getGddhhm() {
		return gddhhm;
	}
	public void setGddhhm(String gddhhm) {
		this.gddhhm = gddhhm;
	}
	public String getSjhm() {
		return sjhm;
	}
	public void setSjhm(String sjhm) {
		this.sjhm = sjhm;
	}
	public String getZzzhm() {
		return zzzhm;
	}
	public void setZzzhm(String zzzhm) {
		this.zzzhm = zzzhm;
	}
	public String getHlwtxgjhm() {
		return hlwtxgjhm;
	}
	public void setHlwtxgjhm(String hlwtxgjhm) {
		this.hlwtxgjhm = hlwtxgjhm;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSjid() {
		return sjid;
	}
	public void setSjid(String sjid) {
		this.sjid = sjid;
	}
	public String getHjdqhmc() {
		hjdqhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", hjd);
		return hjdqhmc;
	}
	public void setHjdqhmc(String hjdqhmc) {
		this.hjdqhmc = hjdqhmc;
	}
	public String getXzdmc() {
		xzdmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", xzd);
		return xzdmc;
	}
	public void setXzdmc(String xzdmc) {
		this.xzdmc = xzdmc;
	}
	public String getXbms() {
		xbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		return xbms;
	}
	public void setXbms(String xbms) {
		this.xbms = xbms;
	}
	public String getHjdxz() {
		return hjdxz;
	}
	public void setHjdxz(String hjdxz) {
		this.hjdxz = hjdxz;
	}
	public String getCz() {
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"openQbxsGgxxWin('detail','" + id +"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		sb.append("<span onclick=\"openQbxsGgxxWin('update','" + id +"')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
		sb.append("<span onclick=\"deleteQbxsGgxxBean('" + id + "')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
		cz=sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
}
