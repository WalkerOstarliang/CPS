package com.chinacreator.xfdw.bean;

import java.io.Serializable;

import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * @ClassName: HzpfBean
 * @author 禹文超
 * @mail wenchao.yu@163.com
 * @date Mar 19, 20153:41:31 PM
 * @Description: TODO 火灾派发实体类
 */

public class HzpfBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5227045485819784046L;
	
	/**
	 * 流转日志状态 1. 派发 2. 签收 3.退回
	 */
	public static final String HZPF_PF = "1";
	public static final String HZPF_QS = "2";
	public static final String HZPF_TH = "3";
	
	public static final String XFDW_HZZT_ZDLB="XFDW_HZ_PFZT";

	private String id;
	private String hzxh;
	private String czrjh;
	private String czrsfzh;
	private String czrdwdm;
	private String czsj;
	private String czip;
	private String cldwdm;
	private String clzt;
	private String bzsm;
	
	private String czrxm;
	private String czrdwmc;
	private String clztmc;
	private String cldwmc;

	public String getCldwmc() {
		cldwmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(this.getCldwdm());
		return cldwmc;
	}

	public void setCldwmc(String cldwmc) {
		this.cldwmc = cldwmc;
	}

	public String getCzrxm() {
		return czrxm;
	}

	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}

	public String getCzrdwmc() {
		czrdwmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(this.getCzrdwdm());
		return czrdwmc;
	}

	public void setCzrdwmc(String czrdwmc) {
		this.czrdwmc = czrdwmc;
	}

	public String getClztmc() {
		clztmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(HzpfBean.XFDW_HZZT_ZDLB, this.getClzt());
		return clztmc;
	}

	public void setClztmc(String clztmc) {
		this.clztmc = clztmc;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHzxh() {
		return hzxh;
	}

	public void setHzxh(String hzxh) {
		this.hzxh = hzxh;
	}

	public String getCzrjh() {
		return czrjh;
	}

	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
	}

	public String getCzrsfzh() {
		return czrsfzh;
	}

	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
	}

	public String getCzrdwdm() {
		return czrdwdm;
	}

	public void setCzrdwdm(String czrdwdm) {
		this.czrdwdm = czrdwdm;
	}

	public String getCzsj() {
		return czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public String getClzt() {
		return clzt;
	}

	public void setClzt(String clzt) {
		this.clzt = clzt;
	}

	public String getBzsm() {
		return bzsm;
	}

	public void setBzsm(String bzsm) {
		this.bzsm = bzsm;
	}

	public String getCldwdm() {
		return cldwdm;
	}

	public void setCldwdm(String cldwdm) {
		this.cldwdm = cldwdm;
	}

	public String getCzip() {
		return czip;
	}

	public void setCzip(String czip) {
		this.czip = czip;
	}

}
