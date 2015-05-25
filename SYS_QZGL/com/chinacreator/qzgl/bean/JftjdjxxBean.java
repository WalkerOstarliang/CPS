package com.chinacreator.qzgl.bean;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class JftjdjxxBean extends BaseValue{

	/**
	 * 	纠纷调解登记信息
	 */
	private static final long serialVersionUID = 3647024811661363388L;
	private String bh;
	private String jfwtms; //纠纷问题描述
	private String jflx;   //纠纷类型
	private String jflxmc; //纠纷类型名称
	private String jfgm;   //纠纷规模
	private String jfbxxs; //纠纷表现形式
	private String tjjg;   //调节结果
	private String tjjgmc; //调解结果名称
	private String jffjqk; //纠纷化解情况
	private String sfsfjd; //是否司法鉴定
	private String dcxynr;   //达成协定
	private String tjsj;   //调节时间
	private String tjdd;   //调节地点
	private String tjdwdm; //调节单位代码
	private String tjdwmc; //调节单位名称
	private String tjmjjh; //调节民警警号
	private String tjmjxm; //调节民警姓名
	private String djrxm;  //登记人姓名
	private String djrjh;  //登记人警号
	private String djsj;   //登记时间
	private String djdwdm; //登记单位代码
	private String djdwmc; //登记单位名称
	private String cz;     //操作
	private String zxbs;
	private String zxbsmc;
	private String zxsj;
	private String zxyy;
	
	private String zcrxm;
	private String zcrdwjzw;
	private String tjjzrxm;
	private String tjjzrjtzz;
	private String tjjzrlxfs;
	private String zyss;
	
	private String dsryxm;
	private String dsryxb;
	private String dsrynl;
	private String dsrysfhm;
	private String dsrygzdwjzy;
	private String dsryjtzz;
	
	private String dsrexm;
	private String dsrexb;
	private String dsrenl;
	private String dsresfhm;
	private String dsregzdwjzy;
	private String dsrejtzz;
	
	private String zatjlx;
	
	private List<JfcyrxxBean> jfcyList;
	private String djrsfzh;
	
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public List<JfcyrxxBean> getJfcyList() {
		return jfcyList;
	}
	public void setJfcyList(List<JfcyrxxBean> jfcyList) {
		this.jfcyList = jfcyList;
	}
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getJfwtms() {
		return jfwtms;
	}
	public void setJfwtms(String jfwtms) {
		this.jfwtms = jfwtms;
	}
	public String getJflx() {
		return jflx;
	}
	public void setJflx(String jflx) {
		this.jflx = jflx;
	}
	public String getJfgm() {
		return jfgm;
	}
	public void setJfgm(String jfgm) {
		this.jfgm = jfgm;
	}
	public String getJfbxxs() {
		return jfbxxs;
	}
	public void setJfbxxs(String jfbxxs) {
		this.jfbxxs = jfbxxs;
	}
	public String getTjjg() {
		return tjjg;
	}
	public void setTjjg(String tjjg) {
		this.tjjg = tjjg;
	}
	public String getJffjqk() {
		return jffjqk;
	}
	public void setJffjqk(String jffjqk) {
		this.jffjqk = jffjqk;
	}
	public String getSfsfjd() {
		return sfsfjd;
	}
	public void setSfsfjd(String sfsfjd) {
		this.sfsfjd = sfsfjd;
	}
	
	public String getDcxynr()
	{
		return dcxynr;
	}
	public void setDcxynr(String dcxynr)
	{
		this.dcxynr = dcxynr;
	}
	public String getTjsj() {
		return tjsj;
	}
	public void setTjsj(String tjsj) {
		this.tjsj = tjsj;
	}
	public String getTjdd() {
		return tjdd;
	}
	public void setTjdd(String tjdd) {
		this.tjdd = tjdd;
	}
	public String getTjdwdm() {
		return tjdwdm;
	}
	public void setTjdwdm(String tjdwdm) {
		this.tjdwdm = tjdwdm;
	}
	public String getTjdwmc() {
		return tjdwmc;
	}
	public void setTjdwmc(String tjdwmc) {
		this.tjdwmc = tjdwmc;
	}
	public String getTjmjjh() {
		return tjmjjh;
	}
	public void setTjmjjh(String tjmjjh) {
		this.tjmjjh = tjmjjh;
	}
	public String getTjmjxm() {
		return tjmjxm;
	}
	public void setTjmjxm(String tjmjxm) {
		this.tjmjxm = tjmjxm;
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
	public String getCz() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"openInfoWin('detail','").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">详细</span>&nbsp;");
		if(loginInfo.getOrgcode().equals(djdwdm))
		{
			sb.append("<span onclick=\"openInfoWin('update','").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
			sb.append("<span onclick=\"deleteInfoByBh('").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
		}
		cz=sb.toString();
		return cz;
	}
	 
	public void setCz(String cz) 
	{
		this.cz = cz;
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
	
	public String getZxbsmc() {
		if("1".equals(zxbs)){
			zxbsmc = "已注销";
		}else{
			zxbsmc = "使用中";
		}
		return zxbsmc;
	}
	public void setZxbsmc(String zxbsmc) {
		this.zxbsmc = zxbsmc;
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
	public String getJflxmc() {
		if(ValidateHelper.isNotEmptyString(jflx)){
		jflxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("QZFW_JFTJ_JFLX",jflx);
		}
		return jflxmc;
	}
	public void setJflxmc(String jflxmc) {
		this.jflxmc = jflxmc;
	}
	public String getTjjgmc() {
		if(ValidateHelper.isNotEmptyString(tjjg)){
			tjjgmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("QZFW_JFTJ_TJJG", tjjg);
		}
		return tjjgmc;
	}
	public void setTjjgmc(String tjjgmc) {
		this.tjjgmc = tjjgmc;
	}
	public String getZcrxm()
	{
		return zcrxm;
	}
	public void setZcrxm(String zcrxm)
	{
		this.zcrxm = zcrxm;
	}
	public String getZcrdwjzw()
	{
		return zcrdwjzw;
	}
	public void setZcrdwjzw(String zcrdwjzw)
	{
		this.zcrdwjzw = zcrdwjzw;
	}
	public String getTjjzrxm()
	{
		return tjjzrxm;
	}
	public void setTjjzrxm(String tjjzrxm)
	{
		this.tjjzrxm = tjjzrxm;
	}
	public String getTjjzrjtzz()
	{
		return tjjzrjtzz;
	}
	public void setTjjzrjtzz(String tjjzrjtzz)
	{
		this.tjjzrjtzz = tjjzrjtzz;
	}
	public String getTjjzrlxfs()
	{
		return tjjzrlxfs;
	}
	public void setTjjzrlxfs(String tjjzrlxfs)
	{
		this.tjjzrlxfs = tjjzrlxfs;
	}
	public String getZyss()
	{
		return zyss;
	}
	public void setZyss(String zyss)
	{
		this.zyss = zyss;
	}
	public String getDsryxm()
	{
		return dsryxm;
	}
	public void setDsryxm(String dsryxm)
	{
		this.dsryxm = dsryxm;
	}
	public String getDsryxb()
	{
		return dsryxb;
	}
	public void setDsryxb(String dsryxb)
	{
		this.dsryxb = dsryxb;
	}
	public String getDsrynl()
	{
		return dsrynl;
	}
	public void setDsrynl(String dsrynl)
	{
		this.dsrynl = dsrynl;
	}
	public String getDsrysfhm()
	{
		return dsrysfhm;
	}
	public void setDsrysfhm(String dsrysfhm)
	{
		this.dsrysfhm = dsrysfhm;
	}
	 
	public String getDsrygzdwjzy()
	{
		return dsrygzdwjzy;
	}
	public void setDsrygzdwjzy(String dsrygzdwjzy)
	{
		this.dsrygzdwjzy = dsrygzdwjzy;
	}
	public String getDsregzdwjzy()
	{
		return dsregzdwjzy;
	}
	public void setDsregzdwjzy(String dsregzdwjzy)
	{
		this.dsregzdwjzy = dsregzdwjzy;
	}
	public String getDsryjtzz()
	{
		return dsryjtzz;
	}
	public void setDsryjtzz(String dsryjtzz)
	{
		this.dsryjtzz = dsryjtzz;
	}
	public String getDsrexm()
	{
		return dsrexm;
	}
	public void setDsrexm(String dsrexm)
	{
		this.dsrexm = dsrexm;
	}
	public String getDsrexb()
	{
		return dsrexb;
	}
	public void setDsrexb(String dsrexb)
	{
		this.dsrexb = dsrexb;
	}
	public String getDsrenl()
	{
		return dsrenl;
	}
	public void setDsrenl(String dsrenl)
	{
		this.dsrenl = dsrenl;
	}
	public String getDsresfhm()
	{
		return dsresfhm;
	}
	public void setDsresfhm(String dsresfhm)
	{
		this.dsresfhm = dsresfhm;
	}
	public String getDsrejtzz()
	{
		return dsrejtzz;
	}
	public void setDsrejtzz(String dsrejtzz)
	{
		this.dsrejtzz = dsrejtzz;
	}
	public String getZatjlx()
	{
		return zatjlx;
	}
	public void setZatjlx(String zatjlx)
	{
		this.zatjlx = zatjlx;
	}
}
