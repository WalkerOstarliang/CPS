package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;

public class ZdryThBean extends BaseValue {

	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 重点人员身份证号
	 */
	private String sfzh;
	
	/**
	 * 退回单位代码
	 */
	private String thdwdm;
	
	/**
	 * 退回单位名称
	 */
	private String thdwmc;
	
	/**
	 * 退回人联系方式
	 */
	private String thrlxfs;
	
	/**
	 * 退回人联系方式
	 */
	private String thrjh;
	
	/**
	 * 退回人姓名
	 */
	private String thrxm;
	
	/**
	 * 退回原因
	 */
	private String thyy;
	
	/**
	 * 退回时间
	 */
	private String thsj;
	
	/**
	 * 目标单位
	 */
	private String mbdwdm;
	
	/**
	 * 目标单位代码
	 */
	private String mbdwmc;
	
	/**
	 * 重点人员编号
	 */
	private String zdrybh;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getThdwdm() {
		return thdwdm;
	}

	public void setThdwdm(String thdwdm) {
		this.thdwdm = thdwdm;
	}

	public String getThdwmc() {
		return thdwmc;
	}

	public void setThdwmc(String thdwmc) {
		this.thdwmc = thdwmc;
	}

	public String getThrlxfs() {
		return thrlxfs;
	}

	public void setThrlxfs(String thrlxfs) {
		this.thrlxfs = thrlxfs;
	}

	public String getThrjh() {
		return thrjh;
	}

	public void setThrjh(String thrjh) {
		this.thrjh = thrjh;
	}

	public String getThrxm() {
		return thrxm;
	}

	public void setThrxm(String thrxm) {
		this.thrxm = thrxm;
	}

	public String getThyy() {
		return thyy;
	}

	public void setThyy(String thyy) {
		this.thyy = thyy;
	}

	public String getMbdwdm() {
		return mbdwdm;
	}

	public void setMbdwdm(String mbdwdm) {
		this.mbdwdm = mbdwdm;
	}

	public String getMbdwmc() {
		return mbdwmc;
	}

	public void setMbdwmc(String mbdwmc) {
		this.mbdwmc = mbdwmc;
	}

	public String getThsj() {
		return thsj;
	}

	public void setThsj(String thsj) {
		this.thsj = thsj;
	}

	public String getZdrybh() {
		return zdrybh;
	}

	public void setZdrybh(String zdrybh) {
		this.zdrybh = zdrybh;
	}
}
