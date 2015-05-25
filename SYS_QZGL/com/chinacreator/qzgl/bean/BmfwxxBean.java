package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;

public class BmfwxxBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7522021653628410133L;
	private String bh;
	private String fwxmlb;  //服务项目类别
	private String fwdxxm; //服务民警姓名
	private String fwdxsfzh; //服务民警身份证号
	private String fwdxlxfs;  //服务民警联系方式
	private String fwsj;
	private String bfwqtmc;   //被服务群体名称
	private String bfwdxxm;   //被服务对象姓名
	private String bfwdxsfzh; //被服务对象身份证号
	private String bfwdxlxfs; //被服务对象联系方式
	private String bfwdxjtzz; //被服务对象家庭住址
	private String fwnrms;    //服务内容描述
	private String bz;        //备注
	private String djrxm;     //登记人姓名
	private String djsj;      
	private String djdwdm;
	private String djdwmc;
	private String djrjh;
	private String zxbs;
	private String zxmc;
	private String zxsj;
	private String zxyy;
	private String djrsfzh;
	
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getFwxmlb() {
		return fwxmlb;
	}
	public void setFwxmlb(String fwxmlb) {
		this.fwxmlb = fwxmlb;
	}
	public String getFwdxxm() {
		return fwdxxm;
	}
	public void setFwdxxm(String fwdxxm) {
		this.fwdxxm = fwdxxm;
	}
	public String getFwdxsfzh() {
		return fwdxsfzh;
	}
	public void setFwdxsfzh(String fwdxsfzh) {
		this.fwdxsfzh = fwdxsfzh;
	}
	public String getFwdxlxfs() {
		return fwdxlxfs;
	}
	public void setFwdxlxfs(String fwdxlxfs) {
		this.fwdxlxfs = fwdxlxfs;
	}
	public String getFwsj() {
		return fwsj;
	}
	public void setFwsj(String fwsj) {
		this.fwsj = fwsj;
	}
	public String getBfwqtmc() {
		return bfwqtmc;
	}
	public void setBfwqtmc(String bfwqtmc) {
		this.bfwqtmc = bfwqtmc;
	}
	public String getBfwdxxm() {
		return bfwdxxm;
	}
	public void setBfwdxxm(String bfwdxxm) {
		this.bfwdxxm = bfwdxxm;
	}
	public String getBfwdxsfzh() {
		return bfwdxsfzh;
	}
	public void setBfwdxsfzh(String bfwdxsfzh) {
		this.bfwdxsfzh = bfwdxsfzh;
	}
	public String getBfwdxlxfs() {
		return bfwdxlxfs;
	}
	public void setBfwdxlxfs(String bfwdxlxfs) {
		this.bfwdxlxfs = bfwdxlxfs;
	}
	public String getBfwdxjtzz() {
		return bfwdxjtzz;
	}
	public void setBfwdxjtzz(String bfwdxjtzz) {
		this.bfwdxjtzz = bfwdxjtzz;
	}
	public String getFwnrms() {
		return fwnrms;
	}
	public void setFwnrms(String fwnrms) {
		this.fwnrms = fwnrms;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
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
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
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
	public String getZxyy() {
		return zxyy;
	}
	public void setZxyy(String zxyy) {
		this.zxyy = zxyy;
	}
	public String getZxmc() {
		if("1".equals(zxbs)){
			zxmc = "已注销";
		}else{
			zxmc = "使用中";
		}
		return zxmc;
	}
	public void setZxmc(String zxmc) {
		this.zxmc = zxmc;
	}
	
	

}
