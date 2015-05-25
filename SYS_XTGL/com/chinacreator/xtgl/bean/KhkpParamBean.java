package com.chinacreator.xtgl.bean;

import com.chinacreator.common.bean.BaseValue;

public class KhkpParamBean extends BaseValue {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 单位代码
	 */
	private String orgcode;
	
	/**
	 * 考核类型
	 */
	private String khlx;
	
	/**
	 * 统计月份
	 */
	private String tjyf;
	
	/**
	 * 统计阶段
	 */
	private String tjjd;
	
	/**
	 * 计算时间
	 */
	private String jssj;

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getKhlx() {
		return khlx;
	}

	public void setKhlx(String khlx) {
		this.khlx = khlx;
	}

	public String getTjyf() {
		return tjyf;
	}

	public void setTjyf(String tjyf) {
		this.tjyf = tjyf;
	}

	public String getTjjd() {
		return tjjd;
	}

	public void setTjjd(String tjjd) {
		this.tjjd = tjjd;
	}

	public String getJssj() {
		return jssj;
	}

	public void setJssj(String jssj) {
		this.jssj = jssj;
	}
}
