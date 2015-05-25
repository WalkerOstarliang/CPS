package com.chinacreator.xtgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
//数据采集数量
public class SjcjslBean extends BaseValue {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 分数
	 */
	private String fs;
	private String id;
	/**
	 * 开始时间
	 */
	private String kssj;
	
	/**
	 * 结束时间
	 */
	private String jssj;
	
	/**
	 * 警务区代码
	 */
	private String jwqdm;
	private String orgcode;
	
	/**
	 * 警务区名称
	 */
	private String jwqmc;
	
	private String orgname;
	
	/**
	 * 基础数据总数
	 */
	private String jcsjzs;
	
	/**
	 * 常住人口数
	 */
	private String czrkzs;
	
	/**
	 * 寄住人口数
	 */
	private String jzrkzs;
	
	/**
	 * 流动人口数
	 */
	private String ldrkzs;
	
	/**
	 * 流动人口延期
	 */
	private String ldrkyqs;
	
	/**
	 * 未落户人口数
	 */
	private String wlhrks;
	
	/**
	 * 房屋数
	 */
	private String fwxxs;
	
	/**
	 * 实体数
	 */
	private String stxxs;
	
	/**
	 * 单位信息数
	 */
	private String dwxxs;
	
	/**
	 * 从业人员数
	 */
	private String cyrys;
	
	/**
	 * 出租房屋数
	 */
	private String czfws;
	
	/**
	 * 统计时间
	 */
	private String tjsj;
	
	/**
	 * 统计月份
	 */
	private String tjyf;
	
	/**
	 * 级别
	 */
	private String leve;
	
	/**
	 * 结算阶段
	 */
	private String jsjd;
	
	/**
	 * 出租房屋巡查数
	 */
	private String czfwxcs; 

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKssj() {
		return kssj;
	}

	public void setKssj(String kssj) {
		this.kssj = kssj;
	}

	public String getJssj() {
		return jssj;
	}

	public void setJssj(String jssj) {
		this.jssj = jssj;
	}

	public String getJwqdm() {
		return jwqdm;
	}

	public void setJwqdm(String jwqdm) {
		this.jwqdm = jwqdm;
	}

	public String getJwqmc() {
		return jwqmc;
	}

	public void setJwqmc(String jwqmc) {
		this.jwqmc = jwqmc;
	}

	public String getJcsjzs() {
		return jcsjzs;
	}

	public void setJcsjzs(String jcsjzs) {
		this.jcsjzs = jcsjzs;
	}

	public String getCzrkzs() {
		return czrkzs;
	}

	public void setCzrkzs(String czrkzs) {
		this.czrkzs = czrkzs;
	}

	public String getJzrkzs() {
		return jzrkzs;
	}

	public void setJzrkzs(String jzrkzs) {
		this.jzrkzs = jzrkzs;
	}

	public String getLdrkzs() {
		return ldrkzs;
	}

	public void setLdrkzs(String ldrkzs) {
		this.ldrkzs = ldrkzs;
	}

	public String getLdrkyqs() {
		return ldrkyqs;
	}

	public void setLdrkyqs(String ldrkyqs) {
		this.ldrkyqs = ldrkyqs;
	}

	public String getWlhrks() {
		return wlhrks;
	}

	public void setWlhrks(String wlhrks) {
		this.wlhrks = wlhrks;
	}

	public String getFwxxs() {
		return fwxxs;
	}

	public void setFwxxs(String fwxxs) {
		this.fwxxs = fwxxs;
	}

	public String getStxxs() {
		return stxxs;
	}

	public void setStxxs(String stxxs) {
		this.stxxs = stxxs;
	}

	public String getDwxxs() {
		return dwxxs;
	}

	public void setDwxxs(String dwxxs) {
		this.dwxxs = dwxxs;
	}

	public String getCyrys() {
		return cyrys;
	}

	public void setCyrys(String cyrys) {
		this.cyrys = cyrys;
	}

	public String getCzfws() {
		return czfws;
	}

	public void setCzfws(String czfws) {
		this.czfws = czfws;
	}

	public String getTjsj() {
		return tjsj;
	}

	public void setTjsj(String tjsj) {
		this.tjsj = tjsj;
	}

	public String getTjyf() {
		return tjyf;
	}

	public void setTjyf(String tjyf) {
		this.tjyf = tjyf;
	}

	public String getLeve() {
		return leve;
	}

	public void setLeve(String leve) {
		this.leve = leve;
	}

	public String getJsjd() {
		return jsjd;
	}

	public void setJsjd(String jsjd) {
		this.jsjd = jsjd;
	}

	public String getFs() {
		return fs;
	}

	public void setFs(String fs) {
		this.fs = fs;
	}

	public String getOrgname() {
		if(ValidateHelper.isEmptyString(orgname))
		{
			if(ValidateHelper.isNotEmptyString(this.orgcode))
			{
				orgname = DictionaryCacheHellper.getOrganizationOrgNameByCode(this.orgcode);
			}
			else
			{
				orgname = "<font color='red'>合计</color>";
			}
		}
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getCzfwxcs() {
		return czfwxcs;
	}

	public void setCzfwxcs(String czfwxcs) {
		this.czfwxcs = czfwxcs;
	} 
}
