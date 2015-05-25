package com.chinacreator.dwdj.bean;

import java.io.Serializable;
/**
 * 危爆单位数据同步--新增
 * @author Administrator
 *
 */
public class DwtbBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5302122244258868405L;
	private String  ywzjid  ;  //  (50)  n      原业务系统主键id  新增
	private String  dwmc  ;  //  (400)  n      单位名称（必填）
	private String  frdbsfzh  ;  //  (18)  y      法人代表身份证
	private String  frdbxm  ;  //  (30)  y      法人代表姓名
	private String  frdblxdh  ;  //  (30)  y      法人联系电话
	private String  dwdh  ;  //  (30)  y      单位电话
	private String  dwdz  ;  //  (500)  n      单位地址
	private String  hylb  ;  //  (3)  n      行业类别（02：    娱乐场所        05：网吧         07：旅馆业  04：危险物品单位）
	private String  hylbms ; // 行业类别描述
	private String  dwlb  ;  //  (6)  n      单位类别（1799：娱乐场所   1750：网吧    2605：旅馆   2800：生化及危险物品单位）
	private String  dwlbms ; // 单位类别描述
	private String  zzjgdm  ;  //  (40)  y      组织机构代码
	private String  yyzzhm  ;  //  (60)  y      营业执照
	private String  kyrq  ;  //    y      开业日期
	private String  sszrdwdm  ;  //  (12)  y      责任单位代码
	private String  sssqdm  ;  //  (12)  y      社区代码
	private String  zxbs  ;  //  (1)  y      注销标示
	private String  zxbsms ; // 注销标识描述
	private String  zxsj  ;  //    y      注销时间
	private String  djsj  ;  //    y      登记时间
	private String  xgsj  ;  //    y      修改时间
	private String  jlrksj  ;  //    y  sys;  //      入库时间
	private String  jlbgsj  ;  //    y  sys;  //      变更信息
	private String  qsbs  ;  //  (2)  y  0    签收状态（0：未派发 1：已派发 2：已签收 3：已退回） 
	private String  glbm  ;  //  (2)  y      管理部门（1:治安 2:内保 3:外管 4:网监 5:消防 9:其他）
	private String  glzt  ;  //  (1)  y      管理状态
	private String  ywxtdwlx  ;  //  (2)  y      业务系统单位类型（hylb为07时，01 旅馆， 02家庭旅馆）hylb为05时，03网吧，hylb为02时，04娱乐场所，05危险物品单位
	private String  djrxm  ;  //  (30)  y      登记人姓名
	private String  djrjh  ;  //  (20)  y      登记人警号
	private String  djdwdm  ;  //  (12)  y      登记单位代码
	private String  djdwmc  ;  //  (100)  y      登记单位名称
	
	/*
	 * dwdm 单位代码 -- 用于查询所属社区
	 */
	private String dwdm; 
	
	/***
	 * 危爆单位表
	 */
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
	
	public String getJlbh() {
		return jlbh;
	}
	public void setJlbh(String jlbh) {
		this.jlbh = jlbh;
	}
	public String getJgbh() {
		return jgbh;
	}
	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}
	public String getHwlb() {
		return hwlb;
	}
	public void setHwlb(String hwlb) {
		this.hwlb = hwlb;
	}
	public String getHwlbmc() {
		return hwlbmc;
	}
	public void setHwlbmc(String hwlbmc) {
		this.hwlbmc = hwlbmc;
	}
	public String getDwfl() {
		return dwfl;
	}
	public void setDwfl(String dwfl) {
		this.dwfl = dwfl;
	}
	public String[] getDwfls() {
		return dwfls;
	}
	public void setDwfls(String[] dwfls) {
		this.dwfls = dwfls;
	}
	public String getFbxkfw() {
		return fbxkfw;
	}
	public void setFbxkfw(String fbxkfw) {
		this.fbxkfw = fbxkfw;
	}
	public String getScdz() {
		return scdz;
	}
	public void setScdz(String scdz) {
		this.scdz = scdz;
	}
	public String getCssb() {
		return cssb;
	}
	public void setCssb(String cssb) {
		this.cssb = cssb;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getDwdm() {
		return dwdm;
	}
	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}
	public String getYwzjid() {
		return ywzjid;
	}
	public void setYwzjid(String ywzjid) {
		this.ywzjid = ywzjid;
	}
	public String getDwmc() {
		return dwmc;
	}
	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}
	public String getFrdbsfzh() {
		return frdbsfzh;
	}
	public void setFrdbsfzh(String frdbsfzh) {
		this.frdbsfzh = frdbsfzh;
	}
	public String getFrdbxm() {
		return frdbxm;
	}
	public void setFrdbxm(String frdbxm) {
		this.frdbxm = frdbxm;
	}
	public String getFrdblxdh() {
		return frdblxdh;
	}
	public void setFrdblxdh(String frdblxdh) {
		this.frdblxdh = frdblxdh;
	}
	public String getDwdh() {
		return dwdh;
	}
	public void setDwdh(String dwdh) {
		this.dwdh = dwdh;
	}
	public String getDwdz() {
		return dwdz;
	}
	public void setDwdz(String dwdz) {
		this.dwdz = dwdz;
	}
	public String getHylb() {
		return hylb;
	}
	public void setHylb(String hylb) {
		this.hylb = hylb;
	}
	public String getDwlb() {
		return dwlb;
	}
	public void setDwlb(String dwlb) {
		this.dwlb = dwlb;
	}
	public String getZzjgdm() {
		return zzjgdm;
	}
	public void setZzjgdm(String zzjgdm) {
		this.zzjgdm = zzjgdm;
	}
	public String getYyzzhm() {
		return yyzzhm;
	}
	public void setYyzzhm(String yyzzhm) {
		this.yyzzhm = yyzzhm;
	}
	public String getKyrq() {
		return kyrq;
	}
	public void setKyrq(String kyrq) {
		this.kyrq = kyrq;
	}
	public String getSszrdwdm() {
		return sszrdwdm;
	}
	public void setSszrdwdm(String sszrdwdm) {
		this.sszrdwdm = sszrdwdm;
	}
	public String getSssqdm() {
		return sssqdm;
	}
	public void setSssqdm(String sssqdm) {
		this.sssqdm = sssqdm;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getZxsj() {
		return zxsj;
	}
	public void setZxsj(String zxsj) {
		this.zxsj = zxsj;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getXgsj() {
		return xgsj;
	}
	public void setXgsj(String xgsj) {
		this.xgsj = xgsj;
	}
	public String getJlrksj() {
		return jlrksj;
	}
	public void setJlrksj(String jlrksj) {
		this.jlrksj = jlrksj;
	}
	public String getJlbgsj() {
		return jlbgsj;
	}
	public void setJlbgsj(String jlbgsj) {
		this.jlbgsj = jlbgsj;
	}
	public String getQsbs() {
		return qsbs;
	}
	public void setQsbs(String qsbs) {
		this.qsbs = qsbs;
	}
	public String getGlbm() {
		return glbm;
	}
	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}
	public String getGlzt() {
		return glzt;
	}
	public void setGlzt(String glzt) {
		this.glzt = glzt;
	}
	public String getYwxtdwlx() {
		return ywxtdwlx;
	}
	public void setYwxtdwlx(String ywxtdwlx) {
		this.ywxtdwlx = ywxtdwlx;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
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
	public String getHylbms() {
		if("04".equals(hylb)){
			hylbms = "危险物品单位";
		}
		return hylbms;
	}
	public void setHylbms(String hylbms) {
		this.hylbms = hylbms;
	}
	public String getZxbsms() {
		if("0".equals(zxbs)){
			zxbsms = "正常";
		}else if("1".equals(zxbs)){
			zxbsms = "注销";
		}else{
			zxbsms = "正常";
		}
		return zxbsms;
	}
	public void setZxbsms(String zxbsms) {
		this.zxbsms = zxbsms;
	}
	public String getDwlbms() {
		
		//DictionaryCacheHellper. ;
		return dwlbms;
	}
	public void setDwlbms(String dwlbms) {
		this.dwlbms = dwlbms;
	}
	
}
