package com.chinacreator.xfdw.bean;

import java.io.Serializable;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * @ClassName: HzldBean
 * @author 禹文超
 * @mail wenchao.yu@163.com
 * @date Mar 19, 20153:41:02 PM
 * @Description: TODO 火灾落地信息实体类
 * 
 * 
 */

public class HzldBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7450737605677427120L;
	
	/**
	 * 0.未处理，1.待处理，2.已签收
	 */
	public static final String HZLD_WCL = "0";
	public static final String HZLD_DCL = "1";
	public static final String HZLD_YQS = "2";
	
	private String hzxh;
	private String xzqybm;
	private String qhsj;
	private String qhdd;
	private String hzmc;
	private String swrs;
	private String ssrs;
	private String zjccss;
	private String szhs;
	private String hzyy;
	private String qhcs;
	private String hzdj;
	private String ssdwdm;
	private String bzdz;
	private String zt;
	private String ssdwmc;
	private String rksj;
	
	private String hzdjmc;
	
	private String cz;

	public String getHzxh() {
		return hzxh;
	}

	public void setHzxh(String hzxh) {
		this.hzxh = hzxh;
	}

	public String getXzqybm() {
		return xzqybm;
	}

	public void setXzqybm(String xzqybm) {
		this.xzqybm = xzqybm;
	}

	public String getQhsj() {
		return qhsj;
	}

	public void setQhsj(String qhsj) {
		this.qhsj = qhsj;
	}

	public String getQhdd() {
		return qhdd;
	}

	public void setQhdd(String qhdd) {
		this.qhdd = qhdd;
	}

	public String getHzmc() {
		return hzmc;
	}

	public void setHzmc(String hzmc) {
		this.hzmc = hzmc;
	}

	public String getSwrs() {
		return swrs;
	}

	public void setSwrs(String swrs) {
		this.swrs = swrs;
	}

	public String getSsrs() {
		return ssrs;
	}

	public void setSsrs(String ssrs) {
		this.ssrs = ssrs;
	}

	public String getZjccss() {
		return zjccss;
	}

	public void setZjccss(String zjccss) {
		this.zjccss = zjccss;
	}

	public String getSzhs() {
		return szhs;
	}

	public void setSzhs(String szhs) {
		this.szhs = szhs;
	}

	public String getHzyy() {
		return hzyy;
	}

	public void setHzyy(String hzyy) {
		this.hzyy = hzyy;
	}

	public String getQhcs() {
		return qhcs;
	}

	public void setQhcs(String qhcs) {
		this.qhcs = qhcs;
	}

	public String getHzdj() {
		return hzdj;
	}

	public void setHzdj(String hzdj) {
		this.hzdj = hzdj;
	}

	public String getSsdwdm() {
		return ssdwdm;
	}

	public void setSsdwdm(String ssdwdm) {
		this.ssdwdm = ssdwdm;
	}

	public String getBzdz() {
		return bzdz;
	}

	public void setBzdz(String bzdz) {
		this.bzdz = bzdz;
	}

	public String getZt() {
		return zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	public String getCz() {
		cz = "";
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		
		String charTemp = "待处理";
		
		if(HzldBean.HZLD_YQS.equals(this.getZt())){
			cz += "已签收";
			return cz;
		}
		
		//市局用户
		if(loginInfo.getLeve() == 2){
			if(loginInfo.getOrgcode().equals(this.getSsdwdm()) || StringUtils.isBlank(this.getSsdwdm())){
				cz += "<span class='cps_span_href' onclick=\"hzldPf('" + this.getHzxh() + "','" + this.getSsdwdm() + "')\">派发</span> ";
			}else{
				cz += charTemp;
			}
		}else if(loginInfo.getLeve() == 3){//区县局
			if(loginInfo.getOrgcode().equals(this.getSsdwdm())){
				cz += "<span class='cps_span_href'  onclick=\"hzldPf('" + this.getHzxh() + "','" + this.getSsdwdm() + "')\">派发</span> ";
				cz += "<span class='cps_span_href'  onclick=\"hzldTh('" + this.hzxh + "')\">退回</span>";
			}else{
				cz += charTemp;
			}
		}else if(loginInfo.getLeve() == 4){ //派出所
			if(loginInfo.getOrgcode().equals(this.getSsdwdm())){
				cz += "<span class='cps_span_href'  onclick=\"hzldPf('" + this.getHzxh() + "','" + this.getSsdwdm() + "')\">派发</span> ";
//				cz += "<span class='cps_span_href'  onclick=\"openHzQs('" + this.getHzxh() + "','queryHzld')\">签收</span> ";
				cz += "<span class='cps_span_href'  onclick=\"hzldTh('" + this.getHzxh() + "')\">退回</span>";
			}else{
				cz += charTemp;
			}
		}else if(loginInfo.getLeve() == 5){ //警务区
			if(loginInfo.getOrgcode().equals(this.getSsdwdm())){
				cz += "<span class='cps_span_href' onclick=\"openHzQs('" + this.getHzxh() + "')\">签收</span> ";
				cz += "<span class='cps_span_href'  onclick=\"hzldTh('" + this.getHzxh() + "')\">退回</span>";
			}else{
				cz += charTemp;
			}
		}
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getSsdwmc() {
		ssdwmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(this.getSsdwdm());
		return ssdwmc;
	}

	public void setSsdwmc(String ssdwmc) {
		this.ssdwmc = ssdwmc;
	}

	public String getRksj() {
		return rksj;
	}

	public void setRksj(String rksj) {
		this.rksj = rksj;
	}

	public String getHzdjmc() {
		hzdjmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(XFxxExportBean.XFDW_HZDJ_ZDLB, this.getHzdj());
		return hzdjmc;
	}

	public void setHzdjmc(String hzdjmc) {
		this.hzdjmc = hzdjmc;
	}
}
