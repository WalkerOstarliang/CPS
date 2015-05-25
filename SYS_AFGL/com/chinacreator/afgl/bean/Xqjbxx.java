package com.chinacreator.afgl.bean;

import com.chinacreator.common.bean.BaseValue;
//辖区基本情况统计
public class Xqjbxx extends BaseValue {
	private static final long serialVersionUID = 6687115757718862948L;
	
	//人口
	private String czrk;    //常驻人口 f_get_czrkcount
	private String ldrk;    //流动人口 f_get_ldrkcount
	private String jzrk;    //寄住人口 f_get_jzrkcount
	private String jwrk;    //境外人口 f_get_jwrkcount
	
	private String zdrk;	//重点人口 f_get_zdrycount
	private String ztry;    //在逃人员 f_get_ztrybylbcount(v_code,'01','3')	
	private String xdry;	//吸毒人员 f_get_ztrybylbcount(v_code,'01','4')
	private String jsbr;    //精神病人 f_get_ztrybylbcount(v_code,'01','6')
	
	//单位
	private String tzhy;	//特种行业 f_get_dwbyhylb(v_code,'01')
	private String ggcs;	//公共场所 f_get_dwbyhylb(v_code,'02')
	private String ylcs;	//娱乐场所 f_get_ylcscount
	private String qsydw;	//企事业单位 f_get_dwbyhylb(v_code,'03')
	
	private String wxwp;	//危险物品单位 f_get_dwbyhylb(v_code,'04')
	private String zddws;	//重点单位 f_get_zddwcount
	private String xx;		//学校 f_get_xxcount
	private String yey;		//幼儿园 f_get_yrycount
	private String lg;		//旅馆 f_get_lgcount
	private String wb;		//网吧 f_get_dwbyhylb(v_code,'05')
	
	private String fw;		//房屋 f_get_fwcount
	private String czw;		//出租屋 f_get_czfwcount
	private String sq;		//社区 F_GET_GXXZSQCCOUNT
	private String zbh;		//治保会 f_get_zbhcount
	private String sqgb;	//社区干部 f_get_sqgbcount
	private String xld;  	//巡逻队 f_get_xldcount
	
	public String getCzrk() {
		return czrk;
	}
	public void setCzrk(String czrk) {
		this.czrk = czrk;
	}
	public String getLdrk() {
		return ldrk;
	}
	public void setLdrk(String ldrk) {
		this.ldrk = ldrk;
	}
	public String getJzrk() {
		return jzrk;
	}
	public void setJzrk(String jzrk) {
		this.jzrk = jzrk;
	}
	public String getJwrk() {
		return jwrk;
	}
	public void setJwrk(String jwrk) {
		this.jwrk = jwrk;
	}
	public String getZdrk() {
		return zdrk;
	}
	public void setZdrk(String zdrk) {
		this.zdrk = zdrk;
	}
	public String getZtry() {
		return ztry;
	}
	public void setZtry(String ztry) {
		this.ztry = ztry;
	}
	public String getXdry() {
		return xdry;
	}
	public void setXdry(String xdry) {
		this.xdry = xdry;
	}
	public String getJsbr() {
		return jsbr;
	}
	public void setJsbr(String jsbr) {
		this.jsbr = jsbr;
	}
	public String getTzhy() {
		return tzhy;
	}
	public void setTzhy(String tzhy) {
		this.tzhy = tzhy;
	}
	public String getGgcs() {
		return ggcs;
	}
	public void setGgcs(String ggcs) {
		this.ggcs = ggcs;
	}
	public String getYlcs() {
		return ylcs;
	}
	public void setYlcs(String ylcs) {
		this.ylcs = ylcs;
	}
	public String getQsydw() {
		return qsydw;
	}
	public void setQsydw(String qsydw) {
		this.qsydw = qsydw;
	}
	public String getWxwp() {
		return wxwp;
	}
	public void setWxwp(String wxwp) {
		this.wxwp = wxwp;
	}
	public String getZddws() {
		return zddws;
	}
	public void setZddws(String zddws) {
		this.zddws = zddws;
	}
	public String getXx() {
		return xx;
	}
	public void setXx(String xx) {
		this.xx = xx;
	}
	public String getYey() {
		return yey;
	}
	public void setYey(String yey) {
		this.yey = yey;
	}
	public String getLg() {
		return lg;
	}
	public void setLg(String lg) {
		this.lg = lg;
	}
	public String getWb() {
		return wb;
	}
	public void setWb(String wb) {
		this.wb = wb;
	}
	public String getFw() {
		return fw;
	}
	public void setFw(String fw) {
		this.fw = fw;
	}
	public String getCzw() {
		return czw;
	}
	public void setCzw(String czw) {
		this.czw = czw;
	}
	public String getZbh() {
		return zbh;
	}
	public void setZbh(String zbh) {
		this.zbh = zbh;
	}
	public String getSqgb() {
		return sqgb;
	}
	public void setSqgb(String sqgb) {
		this.sqgb = sqgb;
	}
	public String getXld() {
		return xld;
	}
	public void setXld(String xld) {
		this.xld = xld;
	}
	public String getSq() {
		return sq;
	}
	public void setSq(String sq) {
		this.sq = sq;
	}
}
