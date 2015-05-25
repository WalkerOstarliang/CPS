package com.chinacreator.xfdw.bean;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.annotation.Excel;
import com.chinacreator.common.bean.ExcelImportBean;
import com.chinacreator.common.helper.PropertiesUtil;

/**
 * @ClassName: XFxxExportBean
 * @author 邓进
 * @Description: TODO 消防信息导入类
 */
@Excel(
	zwfields="行政区域编码,火灾序号,起火时间,起火地点,起火场所,火灾原因分类,单位代码,受灾户数,直接财产损失,受伤人数,死亡人数,审核状态,正在调查",
	ywfields="xzqybm,hzxh,qhsj,qhdd,qhcs,hzyy,hzmc,szhs,zjccss,ssrs,swrs,shzt,zzdc",
	requiredfields="hzxh"
)
public class XFxxExportBean extends ExcelImportBean{

	public static final String XFDW_HZDJ_ZDLB="XFDW_HZ_HF";
	public static final String hzdj_yb="1";
	public static final String hzdj_zd="2";
	public static final String hzdj_td="3";
	private String xzqybm;
	private String hzxh;
	private String qhsj;
	private String qhdd;
	private String qhcs;
	private String hzyy;
	private String hzmc;
	private String szhs;
	private String zjccss;
	private String ssrs;
	private String swrs;
	private String shzt;
	private String zzdc;
	private String hzdj;
	private String ssdwdm;
	private String rksj;
	public String getShzt() {
		return shzt;
	}
	public void setShzt(String shzt) {
		this.shzt = shzt;
	}
	public String getZzdc() {
		return zzdc;
	}
	public void setZzdc(String zzdc) {
		this.zzdc = zzdc;
	}
	public String getXzqybm() {
		return xzqybm;
	}
	public void setXzqybm(String xzqybm) {
		xzqybm=qdyh(xzqybm);
		this.xzqybm = xzqybm;
	}
	public String getHzxh() {
		return hzxh;
	}
	public void setHzxh(String hzxh) {
		hzxh=qdyh(hzxh);
		this.hzxh = hzxh;
	}
	public String getQhsj() {
		return qhsj;
	}
	public void setQhsj(String qhsj) {
		qhsj=qdyh(qhsj);
		this.qhsj = qhsj;
	}
	public String getQhdd() {
		return qhdd;
	}
	public void setQhdd(String qhdd) {
		qhdd=qdyh(qhdd);
		this.qhdd = qhdd;
	}
	public String getQhcs() {
		return qhcs;
	}
	public void setQhcs(String qhcs) {
		qhcs=qdyh(qhcs);
		this.qhcs = qhcs;
	}
	public String getHzyy() {
		return hzyy;
	}
	public void setHzyy(String hzyy) {
		this.hzyy = hzyy;
	}
	
	
	public String getHzmc() {
		return hzmc;
	}
	public void setHzmc(String hzmc) {
		this.hzmc = hzmc;
	}
	public String getSzhs() {
		return szhs;
	}
	public void setSzhs(String szhs) {
		this.szhs = szhs;
	}
	public String getZjccss() {
		return zjccss;
	}
	public void setZjccss(String zjccss) {
		this.zjccss = zjccss;
	}
	public String getSsrs() {
		return ssrs;
	}
	public void setSsrs(String ssrs) {
		this.ssrs = ssrs;
	}
	public String getSwrs() {
		return swrs;
	}
	public void setSwrs(String swrs) {
		this.swrs = swrs;
	}
	public String getHzdj() {
		if(StringUtils.isBlank(this.hzdj)){
			this.hzdj=this.getHzdsbySSSZ();
		}
		return hzdj;
	}
	public void setHzdj(String hzdj) {
		this.hzdj = hzdj;
	}
	public String getSsdwdm() {
		if (StringUtils.isBlank(this.ssdwdm)) {
			this.ssdwdm = getCodeByName(this.xzqybm);
		}
		return ssdwdm;
	}
	public void setSsdwdm(String ssdwdm) {
		this.ssdwdm=ssdwdm;
	}
	public String getRksj() {
		return rksj;
	}
	public void setRksj(String rksj) {
		this.rksj = rksj;
	}
	/*
	 * 计算火灾等级
	 * 
	 * 
	 */
	private String getHzdsbySSSZ(){
		String hzdj="";
		int ssrs=0;
		int swrs=0;
		int zjccss=0;
		if(StringUtils.isNotEmpty(this.swrs)){
			swrs=Integer.parseInt(this.swrs);
		}
		if(StringUtils.isNotEmpty(this.zjccss)){
			zjccss =Integer.parseInt(this.zjccss);
		}
		if(StringUtils.isNotEmpty(this.ssrs)){
			ssrs =Integer.parseInt(this.ssrs);
		}
		
		if(swrs>=Integer.parseInt(PropertiesUtil.getValue("tdhzswrs")) || ssrs>=Integer.parseInt(PropertiesUtil.getValue("tdhzssrs")) ||zjccss>=Integer.parseInt(PropertiesUtil.getValue("tdhzzjccss"))){
			hzdj=XFxxExportBean.hzdj_td;
		}else if(swrs>=Integer.parseInt(PropertiesUtil.getValue("zdhzswrs")) || ssrs>=Integer.parseInt(PropertiesUtil.getValue("zdhzssrs")) || zjccss>=Integer.parseInt(PropertiesUtil.getValue("zdhzzjccss"))){
			hzdj=XFxxExportBean.hzdj_zd;
		}else{
			hzdj=XFxxExportBean.hzdj_yb;
		}
		return hzdj;
	}	
	private String qdyh(String str){
		if(StringUtils.isNotBlank(str)){
			if("\"".equals(str.substring(0, 1)) && "\"".equals(str.substring(str.length()-1, str.length()))){
				str=str.substring(1, str.length()-1);
			}
		}
		return str;
	}
	/*
	 * 匹配机构代码
	 * 
	 * 
	 */
	private String getCodeByName(String orgName){
		String code="";
		String orgjc = orgName.substring(orgName.lastIndexOf('-') + 1);
		code=PropertiesUtil.getValue(orgjc);
		if(StringUtils.isBlank(code)){
			code=PropertiesUtil.getValue("cssjdm");
		}
		return code;
	}
}
