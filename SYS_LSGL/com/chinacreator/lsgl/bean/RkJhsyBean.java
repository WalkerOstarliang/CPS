package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 计划生育
 * @company  chinacreator
 * @author zhun.liu
 * @date  Feb 14, 2014  11:07:00 AM
 */
public class RkJhsyBean{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1428879042696472123L;
	
	/** 人员基本信息 */
	private String xm;
	private String sfzh;
	private String xb;
	private String xbms;
	private String xzzxz;
	private String rylb;
	private String rylbms;
	private String hjdxz;
	private String mz;
	private String mzms;
	
	
	private String id;	//主键ID
	private String jlbh;	//记录编号
	private String jhsyyq;	//计划生育孕情
	private String jszhm;	//计生证号码
	private String fzrq;	//发证日期
	private String znqk;	//子女情况
	private String byjycs;	//避孕节育措施
	private String djrxm;	//登记人姓名
	private String djrjh;	//登记人警号
	private String djdwdm;	//登记单位代码
	private String djdwmc;	//登记单位名称
	private String djsj;	//登记时间
	private String rybh;
	private String djrsfzh;
	
	private String cz;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJlbh() {
		return jlbh;
	}
	public void setJlbh(String jlbh) {
		this.jlbh = jlbh;
	}
	public String getJhsyyq() {
		return jhsyyq;
	}
	public void setJhsyyq(String jhsyyq) {
		this.jhsyyq = jhsyyq;
	}
	public String getJszhm() {
		return jszhm;
	}
	public void setJszhm(String jszhm) {
		this.jszhm = jszhm;
	}
	public String getFzrq() {
		return fzrq;
	}
	public void setFzrq(String fzrq) {
		this.fzrq = fzrq;
	}
	public String getZnqk() {
		return znqk;
	}
	public void setZnqk(String znqk) {
		this.znqk = znqk;
	}
	public String getByjycs() {
		return byjycs;
	}
	public void setByjycs(String byjycs) {
		this.byjycs = byjycs;
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
	public String getCz() {
		StringBuffer sb = new StringBuffer();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		sb.append("<span onclick=\"openJhsyPage('detail','" + id + "')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		if(loginInfo.getOrgcode().equals(djdwdm)){
			sb.append("<span onclick=\"openJhsyPage('update','" + id + "')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
			sb.append("<span onclick=\"deleteJhsyBean('" + id + "')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
		}
		cz=sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getRybh() {
		return rybh;
	}
	public void setRybh(String rybh) {
		this.rybh = rybh;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getXbms() {
		xbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		return xbms;
	}
	public void setXbms(String xbms) {
		this.xbms = xbms;
	}
	public String getXzzxz() {
		return xzzxz;
	}
	public void setXzzxz(String xzzxz) {
		this.xzzxz = xzzxz;
	}
	public String getRylb() {
		return rylb;
	}
	public void setRylb(String rylb) {
		this.rylb = rylb;
	}
	public String getRylbms() {
		return rylbms;
	}
	public void setRylbms(String rylbms) {
		this.rylbms = rylbms;
	}
	public String getHjdxz() {
		return hjdxz;
	}
	public void setHjdxz(String hjdxz) {
		this.hjdxz = hjdxz;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getMzms() {
		return mzms;
	}
	public void setMzms(String mzms) {
		this.mzms = mzms;
	}
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
}
