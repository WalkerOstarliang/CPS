package com.chinacreator.lsgl.query;

public class TjQueryBean {
	
	/**
	 * 机构级别
	 */
	private String orgLeve; 
	
	/**
	 * 警务区分类
	 */
	private String jwqfl;
	
	/**
	 * 派出所等级
	 */
	private String pcsdj;
	/**
	 * 统计开始时间
	 */
	private String tjkssj;
	
	/**
	 * 统计结束时间
	 */
	private String tjjssj;
	
	/**
	 * 统计单位
	 */
	private String tjdwdm;
	
	/**
	 * 统计级别：市局、分县局、派出所、警务区
	 */
	private String tjjb;

	public String getOrgLeve() {
		return orgLeve;
	}

	public void setOrgLeve(String orgLeve) {
		this.orgLeve = orgLeve;
	}

	public String getJwqfl() {
		return jwqfl;
	}

	public void setJwqfl(String jwqfl) {
		this.jwqfl = jwqfl;
	}

	public String getPcsdj() {
		return pcsdj;
	}

	public void setPcsdj(String pcsdj) {
		this.pcsdj = pcsdj;
	}

	public String getTjkssj() {
		return tjkssj;
	}

	public void setTjkssj(String tjkssj) {
		this.tjkssj = tjkssj;
	}

	public String getTjjssj() {
		return tjjssj;
	}

	public void setTjjssj(String tjjssj) {
		this.tjjssj = tjjssj;
	}

	public String getTjdwdm() {
		return tjdwdm;
	}

	public void setTjdwdm(String tjdwdm) {
		this.tjdwdm = tjdwdm;
	}

	public String getTjjb() {
		return tjjb;
	}

	public void setTjjb(String tjjb) {
		this.tjjb = tjjb;
	}
}
