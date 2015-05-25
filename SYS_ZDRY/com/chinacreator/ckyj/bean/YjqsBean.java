package com.chinacreator.ckyj.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 预警签收信息
 */
public class YjqsBean extends CkyjxxBean {

	private static final long serialVersionUID = -4194573262292619001L;
	
	private String id;
	private String ldxxbh;
	private String yjxxbh;
	private String qssj;
	private String qsrsfzh;
	private String qsrxm;
	private String qsdw;
	private String qsdwjgdm;
	private String rksj;
	private String sfwzdqs;
	private String fszt;
	private String sffk;
	private String sffkmc;
	
	private String cz;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLdxxbh() {
		return ldxxbh;
	}
	public void setLdxxbh(String ldxxbh) {
		this.ldxxbh = ldxxbh;
	}
	public String getYjxxbh() {
		return yjxxbh;
	}
	public void setYjxxbh(String yjxxbh) {
		this.yjxxbh = yjxxbh;
	}
	public String getQssj() {
		return qssj;
	}
	public void setQssj(String qssj) {
		this.qssj = qssj;
	}
	public String getQsrsfzh() {
		return qsrsfzh;
	}
	public void setQsrsfzh(String qsrsfzh) {
		this.qsrsfzh = qsrsfzh;
	}
	public String getQsrxm() {
		return qsrxm;
	}
	public void setQsrxm(String qsrxm) {
		this.qsrxm = qsrxm;
	}
	public String getQsdw() {
		return qsdw;
	}
	public void setQsdw(String qsdw) {
		this.qsdw = qsdw;
	}
	public String getQsdwjgdm() {
		return qsdwjgdm;
	}
	public void setQsdwjgdm(String qsdwjgdm) {
		this.qsdwjgdm = qsdwjgdm;
	}
	public String getRksj() {
		return rksj;
	}
	public void setRksj(String rksj) {
		this.rksj = rksj;
	}
	public String getSfwzdqs() {
		return sfwzdqs;
	}
	public void setSfwzdqs(String sfwzdqs) {
		this.sfwzdqs = sfwzdqs;
	}
	public String getFszt() {
		return fszt;
	}
	public void setFszt(String fszt) {
		this.fszt = fszt;
	}
	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openYjqsfk('"+this.yjxxbh+"')\" style=\"color:green\">详情</span>&nbsp;";
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(loginInfo.getOrgcode().equals(getYjjsdw())){
			cz += "<span class=\"cps_span_href\" onclick=\"openFkxx('','"+this.yjxxbh+"','add')\" style=\"color:green\">反馈</span>&nbsp;";
		}
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getSffk() {
		return sffk;
	}
	public void setSffk(String sffk) {
		this.sffk = sffk;
	}
	public String getSffkmc() {
		if(ValidateHelper.isNotEmptyString(this.sffk)){
			if("1".equals(this.sffk)){
				sffkmc = "已反馈";
			}else if("0".equals(this.sffk)){
				sffkmc = "<font color='red'>未反馈</font>";
			}
		}
		return sffkmc;
	}
	public void setSffkmc(String sffkmc) {
		this.sffkmc = sffkmc;
	}
}
