package com.chinacreator.gzgl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;


public class JqtbBean {
	private String id;	//主键ID
	private String orgcode;
	private String orgname;
	private String parent_code;
	private String tjyf;
	private String tjsj;
	private String xsaj;	//刑事案件
	private String zaaj;	//治安案件
	private String tcjf;	//调处纠纷
	private String zhsg;	//灾害事故
	private String qjqdaj;	//抢劫抢夺案件
	private String qjajs;	//抢劫案件数
	private String qdajs;	//抢夺案件数
	private String rsdqaj;	//入室盗窃案件
	private String dqjdclaj;	//盗窃机动车辆案件
	private String qtaj;	//其他案件
	private String jftjs;
	private String znsgs;
	private String dqffzd;	//当前防范重点
	private String dxaj;    //典型案例
	private String djrxm;	//登记人姓名
	private String djsj;	//登记时间
	private String zrdwdm;	//填报单位代码
	private String zrdwmc;	//填报单位名称
	private String djdwdm;
	private String djdwmc;
	private int leve;
	private String num;
	
	private String ny;
	private String cz;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXsaj() {
		return xsaj;
	}
	public void setXsaj(String xsaj) {
		this.xsaj = xsaj;
	}
	public String getZaaj() {
		return zaaj;
	}
	public void setZaaj(String zaaj) {
		this.zaaj = zaaj;
	}
	public String getTcjf() {
		return tcjf;
	}
	public void setTcjf(String tcjf) {
		this.tcjf = tcjf;
	}
	public String getZhsg() {
		return zhsg;
	}
	public void setZhsg(String zhsg) {
		this.zhsg = zhsg;
	}
	public String getQjqdaj() {
		return qjqdaj;
	}
	public void setQjqdaj(String qjqdaj) {
		this.qjqdaj = qjqdaj;
	}
	public String getRsdqaj() {
		return rsdqaj;
	}
	public void setRsdqaj(String rsdqaj) {
		this.rsdqaj = rsdqaj;
	}
	public String getDqjdclaj() {
		return dqjdclaj;
	}
	public void setDqjdclaj(String dqjdclaj) {
		this.dqjdclaj = dqjdclaj;
	}
	public String getQtaj() {
		return qtaj;
	}
	public void setQtaj(String qtaj) {
		this.qtaj = qtaj;
	}
	public String getDqffzd() {
		return dqffzd;
	}
	public void setDqffzd(String dqffzd) {
		this.dqffzd = dqffzd;
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
	public String getZrdwdm() {
		return zrdwdm;
	}
	public void setZrdwdm(String zrdwdm) {
		this.zrdwdm = zrdwdm;
	}
	public String getZrdwmc() {
		return zrdwmc;
	}
	public void setZrdwmc(String zrdwmc) {
		this.zrdwmc = zrdwmc;
	}
	public String getCz() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"openJqtbPage('detail','" + (getId() != null ? getId() : "") + "','" +ny + "','" + zrdwdm +"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		if (loginInfo.getLeve() <= leve)
		{
			sb.append("<span onclick=\"openJqtbPage('update','" + (getId() != null ? getId() : "") + "','" +ny + "','" + zrdwdm +"')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
		}
		cz = sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getNy() {
		return ny;
	}
	public void setNy(String ny) {
		this.ny = ny;
	}
	public String getDxaj() {
		return dxaj;
	}
	public void setDxaj(String dxaj) {
		this.dxaj = dxaj;
	}
	public int getLeve()
	{
		return leve;
	}
	public void setLeve(int leve)
	{
		this.leve = leve;
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
	public String getQjajs()
	{
		return qjajs;
	}
	public void setQjajs(String qjajs)
	{
		this.qjajs = qjajs;
	}
	public String getQdajs()
	{
		return qdajs;
	}
	public void setQdajs(String qdajs)
	{
		this.qdajs = qdajs;
	}
	public String getOrgcode()
	{
		return orgcode;
	}
	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
	}
	public String getOrgname()
	{
		return orgname;
	}
	public void setOrgname(String orgname)
	{
		this.orgname = orgname;
	}
	public String getParent_code()
	{
		return parent_code;
	}
	public void setParent_code(String parent_code)
	{
		this.parent_code = parent_code;
	}
	public String getTjyf()
	{
		return tjyf;
	}
	public void setTjyf(String tjyf)
	{
		this.tjyf = tjyf;
	}
	public String getTjsj()
	{
		return tjsj;
	}
	public void setTjsj(String tjsj)
	{
		this.tjsj = tjsj;
	}
	public String getJftjs()
	{
		return jftjs;
	}
	public void setJftjs(String jftjs)
	{
		this.jftjs = jftjs;
	}
	public String getZnsgs()
	{
		return znsgs;
	}
	public void setZnsgs(String znsgs)
	{
		this.znsgs = znsgs;
	}
	public String getNum()
	{
		return num;
	}
	public void setNum(String num)
	{
		this.num = num;
	}
	
}
