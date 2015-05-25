package com.chinacreator.afgl.zaxl.bean;

import com.chinacreator.zagl.bean.OperateBean;
/**
 * 巡逻队员信息
 * @author Administrator
 *
 */
public class XldyxxBean extends OperateBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5628059079397140127L;
	private  String  xldybh     ;   //  varchar2(25)  n      巡逻队员编号
	private  String  xldbh      ;   //  varchar2(25)  y      巡逻队编号
	private  String  xldyxm     ;   //  varchar2(20)  y      巡逻队员姓名
	private  String  xldyxb     ;   //  varchar2(2)  y      队员性别
	private  String  xldysfzh   ;   //  varchar2(18)  y      巡逻队员身份证号
	private  String  xldycsrq   ;   //  date  y      巡逻队员出生日期
	private  String  xldyhjdxz  ;   //  varchar2(120)  y      巡逻队员户籍地详址
	private  String  xldyxzdxz  ;   //  varchar2(120)  y      巡逻队员现住地详址
	private  String  xldylxdh   ;   //  varchar2(20)  y      手机号码
	private  String  sgrq       ;   //  date  y      参加保卫工作时间
	private  String  tcrq       ;   //  date  y      退出日期
	private  String  zgzt       ;   //  varchar2(2)  y      在岗状态；1：在岗；2：离岗
	private  String  bz         ;   //  varchar2(300)  y      备注
	private  String  djrxm      ;   //  varchar2(20)  y      登记人姓名
	private  String  djrjh      ;   //  varchar2(12)  y      登记人警号
	private  String  djdwdm     ;   //  varchar2(12)  y      登记单位代码
	private  String  djdwmc     ;   //  varchar2(120)  y      登记单位名称
	private  String  djsj       ;   //  date  y      登记时间
	private  String  gxsj       ;   //  date  y      更新时间
	private  String  djrsfzh    ;   //  varchar2(18)  y      登记人身份证号码
	private  String  bwzw       ;   //  varchar2(50)  y      保卫职务
	private  String  sfftjzry   ;   //  varchar2(1)  y      是否复退军转人员
	private  String  zzhjz      ;   //  varchar2(1)  y      专职或兼职 1：专职 2：兼职
	private  String  dwdh       ;   //  varchar2(20)  y      单位电话
	private  String  zzdh       ;   //  varchar2(20)  y      住宅电话
	private  String  tc         ;   //  varchar2(200)  y      特长
	private  String  jlqk       ;   //  clob  y      奖励情况
	private  String  grjl       ;   //  clob  y      个人简历
	private  String  jtcy       ;   //  varchar2(1000)  y      家庭成员
	private  String  xzzw       ;   //  varchar2(50)  y      行政职务
	public String getXldybh() {
		return xldybh;
	}
	public void setXldybh(String xldybh) {
		this.xldybh = xldybh;
	}
	public String getXldbh() {
		return xldbh;
	}
	public void setXldbh(String xldbh) {
		this.xldbh = xldbh;
	}
	public String getXldyxm() {
		return xldyxm;
	}
	public void setXldyxm(String xldyxm) {
		this.xldyxm = xldyxm;
	}
	public String getXldyxb() {
		return xldyxb;
	}
	public void setXldyxb(String xldyxb) {
		this.xldyxb = xldyxb;
	}
	public String getXldysfzh() {
		return xldysfzh;
	}
	public void setXldysfzh(String xldysfzh) {
		this.xldysfzh = xldysfzh;
	}
	public String getXldycsrq() {
		return xldycsrq;
	}
	public void setXldycsrq(String xldycsrq) {
		this.xldycsrq = xldycsrq;
	}
	public String getXldyhjdxz() {
		return xldyhjdxz;
	}
	public void setXldyhjdxz(String xldyhjdxz) {
		this.xldyhjdxz = xldyhjdxz;
	}
	public String getXldyxzdxz() {
		return xldyxzdxz;
	}
	public void setXldyxzdxz(String xldyxzdxz) {
		this.xldyxzdxz = xldyxzdxz;
	}
	public String getXldylxdh() {
		return xldylxdh;
	}
	public void setXldylxdh(String xldylxdh) {
		this.xldylxdh = xldylxdh;
	}
	public String getSgrq() {
		return sgrq;
	}
	public void setSgrq(String sgrq) {
		this.sgrq = sgrq;
	}
	public String getTcrq() {
		return tcrq;
	}
	public void setTcrq(String tcrq) {
		this.tcrq = tcrq;
	}
	public String getZgzt() {
		return zgzt;
	}
	public void setZgzt(String zgzt) {
		this.zgzt = zgzt;
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
	public String getGxsj() {
		return gxsj;
	}
	public void setGxsj(String gxsj) {
		this.gxsj = gxsj;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getBwzw() {
		return bwzw;
	}
	public void setBwzw(String bwzw) {
		this.bwzw = bwzw;
	}
	public String getSfftjzry() {
		return sfftjzry;
	}
	public void setSfftjzry(String sfftjzry) {
		this.sfftjzry = sfftjzry;
	}
	public String getZzhjz() {
		return zzhjz;
	}
	public void setZzhjz(String zzhjz) {
		this.zzhjz = zzhjz;
	}
	public String getDwdh() {
		return dwdh;
	}
	public void setDwdh(String dwdh) {
		this.dwdh = dwdh;
	}
	public String getZzdh() {
		return zzdh;
	}
	public void setZzdh(String zzdh) {
		this.zzdh = zzdh;
	}
	public String getTc() {
		return tc;
	}
	public void setTc(String tc) {
		this.tc = tc;
	}
	public String getJlqk() {
		return jlqk;
	}
	public void setJlqk(String jlqk) {
		this.jlqk = jlqk;
	}
	public String getGrjl() {
		return grjl;
	}
	public void setGrjl(String grjl) {
		this.grjl = grjl;
	}
	public String getJtcy() {
		return jtcy;
	}
	public void setJtcy(String jtcy) {
		this.jtcy = jtcy;
	}
	public String getXzzw() {
		return xzzw;
	}
	public void setXzzw(String xzzw) {
		this.xzzw = xzzw;
	}
	
}
