package com.chinacreator.zagl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;

public class JfdwNsxxBean extends JfdwBean {

	private static final long serialVersionUID = -2951966182065011113L;
	
	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 年审时间
	 */
	private String nsrj;
	
	/**
	 * 备案等级
	 */
	private String badj;
	
	/**
	 * 备案等级时间
	 */
	private String badjmc;
	
	/**
	 * 内容
	 */
	private String nr;
	
	/**
	 * 备注
	 */
	private String bz;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 法人代表
	 */
	private String frdb;
	
	/**
	 * 是否检测
	 */
	private String sfjc;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getNsrj() {
		return nsrj;
	}

	public void setNsrj(String nsrj) {
		this.nsrj = nsrj;
	}

	public String getBadj() {
		return badj;
	}

	public void setBadj(String badj) {
		this.badj = badj;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getNr() {
		return nr;
	}

	public void setNr(String nr) {
		this.nr = nr;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getFrdb() {
		return frdb;
	}

	public void setFrdb(String frdb) {
		this.frdb = frdb;
	}

	public String getBadjmc() {
		badjmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_BADJ", this.badj);
		return badjmc;
	}

	public void setBadjmc(String badjmc) {
		this.badjmc = badjmc;
	}

	public String getSfjc() {
		return sfjc;
	}

	public void setSfjc(String sfjc) {
		this.sfjc = sfjc;
	}
	
}
