package com.chinacreator.afgl.bean;

import com.chinacreator.common.bean.BaseValue;
/**
 * 业主委员会
 * @author Administrator
 *
 */
public class YwhxxBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private  String  id       ;   //  varchar2(22)  y      6位行政编码+6位日期+10位序列号
	private  String  wyxqmc   ;   //  varchar2(150)  y      业主委员会名称
	private  String  clrq     ;   //  date  y      成立日期
	private  String  djrxm    ;   //  varchar2(30)  y      登记人姓名
	private  String  djrjh    ;   //  varchar2(30)  y      登记人警号
	private  String  djrsfzh  ;   //  varchar2(18)  y      登记人身份证号
	private  String  djdwdm   ;   //  varchar2(12)  y      登记单位代码
	private  String  djdwmc   ;   //  varchar2(150)  y      登记单位名称
	private  String  ssjwqdm  ;   //  varchar2(12)  y      所属警务区代码
	private  String  ssjwqmc  ;   //  varchar2(150)  y      所属警务区名称
	private  String  zxbs     ;   //  varchar2(1)  y      注销标识  0：正常 ， 1：注销
	private  String  zxbsms   ; // 注销标识描述
	private  String  zxsj     ;   //  date  y      注销时间
	private  String  ip       ;   //  varchar2(150)  y      ip地址
	private  String  xgrxm    ;   //  varchar2(30)  y      修改人姓名
	private  String  xgrjh    ;   //  varchar2(30)  y      修改人警号
	private  String  xgsj     ;   //  date  y      修改时间
	private  String  djsj     ;   //  date  y      登记时间
	private  String  stid     ;   //  varchar2(50)  y      关联治安物业小区id
	private  String  stmc     ;   //  varchar2(200)  y     治安物业小区名称
	private  String  sqdm     ;   //  varchar2(12)  y      社区代码
	private  String  sqmc     ;   //  varchar2(120)  y      社区名称
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWyxqmc() {
		return wyxqmc;
	}
	public void setWyxqmc(String wyxqmc) {
		this.wyxqmc = wyxqmc;
	}
	public String getClrq() {
		return clrq;
	}
	public void setClrq(String clrq) {
		this.clrq = clrq;
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
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
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
	public String getSsjwqdm() {
		return ssjwqdm;
	}
	public void setSsjwqdm(String ssjwqdm) {
		this.ssjwqdm = ssjwqdm;
	}
	public String getSsjwqmc() {
		return ssjwqmc;
	}
	public void setSsjwqmc(String ssjwqmc) {
		this.ssjwqmc = ssjwqmc;
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
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getXgrxm() {
		return xgrxm;
	}
	public void setXgrxm(String xgrxm) {
		this.xgrxm = xgrxm;
	}
	public String getXgrjh() {
		return xgrjh;
	}
	public void setXgrjh(String xgrjh) {
		this.xgrjh = xgrjh;
	}
	public String getXgsj() {
		return xgsj;
	}
	public void setXgsj(String xgsj) {
		this.xgsj = xgsj;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getStid() {
		return stid;
	}
	public void setStid(String stid) {
		this.stid = stid;
	}
	public String getStmc() {
		return stmc;
	}
	public void setStmc(String stmc) {
		this.stmc = stmc;
	}
	public String getSqdm() {
		return sqdm;
	}
	public void setSqdm(String sqdm) {
		this.sqdm = sqdm;
	}
	public String getSqmc() {
		return sqmc;
	}
	public void setSqmc(String sqmc) {
		this.sqmc = sqmc;
	}
	public String getZxbsms() {
		String  strs = "";
		if("0".equals(zxbs)){
			strs ="正常";
		}else if("1".equals(zxbs)){
			strs ="注销";
		}
		zxbsms = strs; 
		return zxbsms;
	}
	public void setZxbsms(String zxbsms) {
		this.zxbsms = zxbsms;
	}
	
	
}
