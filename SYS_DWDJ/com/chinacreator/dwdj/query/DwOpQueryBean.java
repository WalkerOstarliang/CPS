package com.chinacreator.dwdj.query;

import com.chinacreator.common.bean.QueryBean;

public class DwOpQueryBean extends QueryBean {

	private static final long serialVersionUID = 748687360417929615L;
	
	/**
	 * 单位ID
	 */
	private String dwid;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 单位类型
	 */
	private String lx;
	
	/**
	 * 派发状态
	 */
	private String pfzt;
	
	/**
	 * 签收状态
	 */
	private String qszt;
	
	/**
	 * 锁定状态
	 */
	private String sdzt;
	
	/**
	 * 行业类别
	 */
	private String hylb;
	
	
	/**
	 * 操作状态 1：派发 2：签收 3：退回
	 */
	private String czzt;
	
	/**
	 * 管理部门
	 */
	private String glbm; 

	public String getDwid() {
		return dwid;
	}

	public void setDwid(String dwid) {
		this.dwid = dwid;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}

	public String getPfzt() {
		return pfzt;
	}

	public void setPfzt(String pfzt) {
		this.pfzt = pfzt;
	}

	public String getHylb() {
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}

	public String getCzzt() {
		return czzt;
	}

	public void setCzzt(String czzt) {
		this.czzt = czzt;
	}

	public String getQszt() {
		return qszt;
	}

	public void setQszt(String qszt) {
		this.qszt = qszt;
	}

	public String getSdzt() {
		return sdzt;
	}

	public void setSdzt(String sdzt) {
		this.sdzt = sdzt;
	}

	public String getGlbm() {
		return glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}
}
