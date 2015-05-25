package com.chinacreator.afgl.zaxl.bean;

import com.chinacreator.zagl.bean.OperateBean;
/**
 * 社区干部
 * @author Administrator
 *
 */
public class ZaxlSqgbBean  extends OperateBean{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3261834267759768753L;
	private String  gbbh     ;   //  varchar2(27)  n      干部编号 15位社区编号 + 2位流水号
	private String  sssqbh   ;   //  varchar2(25)  y      所属社区编号
	private String  gbxm     ;   //  varchar2(30)  y      干部姓名
	private String  gbxb     ;   //  varchar2(2)  y      干部性别
	private String  gbsfzh   ;   //  varchar2(18)  y      干部身份证号
	private String  gbcsrq   ;   //  date  y      干部出生日期
	private String  gblxdh   ;   //  varchar2(20)  y      干部联系电话
	private String  gbzzmm   ;   //  varchar2(2)  y      干部政治面貌
	private String  gbzw     ;   //  varchar2(50)  y      干部职务 多个使用"," 分隔
	private String  gbhjdqh  ;   //  varchar2(12)  y      干部户籍地区划
	private String  gbxzdxz  ;   //  varchar2(120)  y      干部现住地详址
	private String  gbdrsj   ;   //  date  y      调入时间
	private String  gbdcsj   ;   //  date  y      调出时间
	private String  djrxm    ;   //  varchar2(30)  y      登记人姓名
	private String  djrjh    ;   //  varchar2(12)  y      登记人警号
	private String  djdwdm   ;   //  varchar2(12)  y      登记单位代码
	private String  djdwmc   ;   //  varchar2(120)  y      登记单位名称
	private String  djsj     ;   //  date  y      登记时间
	private String  sssqmc   ;   //  varchar2(250)  y      所属社区名称
	private String  zxbs     ;   //  varchar2(1)  y  1    注销标示 0 ：注销 1：正常
	private String  zxsj     ;   //  date  y      注销时间
	private String  zxyy     ;   //  varchar2(100)  y      注销原因
	private String  bz       ;   //  varchar2(500)  y      备注
	private String  sfdl     ;   //  varchar2(100)  y      是否调离 0 ：否 1：是
	private String  djrsfzh  ;   //  varchar2(18)  y      登记人身份证号码
	private String  whcd     ;   //  varchar2(3)  y      文化程度 字典：gb_whcd
	private String  lx       ;   //  varchar2(1)  y  1    1:社区干部 2：小区组干部
	public String getGbbh() {
		return gbbh;
	}
	public void setGbbh(String gbbh) {
		this.gbbh = gbbh;
	}
	public String getSssqbh() {
		return sssqbh;
	}
	public void setSssqbh(String sssqbh) {
		this.sssqbh = sssqbh;
	}
	public String getGbxm() {
		return gbxm;
	}
	public void setGbxm(String gbxm) {
		this.gbxm = gbxm;
	}
	public String getGbxb() {
		return gbxb;
	}
	public void setGbxb(String gbxb) {
		this.gbxb = gbxb;
	}
	public String getGbsfzh() {
		return gbsfzh;
	}
	public void setGbsfzh(String gbsfzh) {
		this.gbsfzh = gbsfzh;
	}
	public String getGbcsrq() {
		return gbcsrq;
	}
	public void setGbcsrq(String gbcsrq) {
		this.gbcsrq = gbcsrq;
	}
	public String getGblxdh() {
		return gblxdh;
	}
	public void setGblxdh(String gblxdh) {
		this.gblxdh = gblxdh;
	}
	public String getGbzzmm() {
		return gbzzmm;
	}
	public void setGbzzmm(String gbzzmm) {
		this.gbzzmm = gbzzmm;
	}
	public String getGbzw() {
		return gbzw;
	}
	public void setGbzw(String gbzw) {
		this.gbzw = gbzw;
	}
	public String getGbhjdqh() {
		return gbhjdqh;
	}
	public void setGbhjdqh(String gbhjdqh) {
		this.gbhjdqh = gbhjdqh;
	}
	public String getGbxzdxz() {
		return gbxzdxz;
	}
	public void setGbxzdxz(String gbxzdxz) {
		this.gbxzdxz = gbxzdxz;
	}
	public String getGbdrsj() {
		return gbdrsj;
	}
	public void setGbdrsj(String gbdrsj) {
		this.gbdrsj = gbdrsj;
	}
	public String getGbdcsj() {
		return gbdcsj;
	}
	public void setGbdcsj(String gbdcsj) {
		this.gbdcsj = gbdcsj;
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
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getSssqmc() {
		return sssqmc;
	}
	public void setSssqmc(String sssqmc) {
		this.sssqmc = sssqmc;
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
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getSfdl() {
		return sfdl;
	}
	public void setSfdl(String sfdl) {
		this.sfdl = sfdl;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getWhcd() {
		return whcd;
	}
	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}
	public String getLx() {
		return lx;
	}
	public void setLx(String lx) {
		this.lx = lx;
	}
	
	
	
}
