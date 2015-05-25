package com.chinacreator.zagl.bean;


/**
 * 保卫机构
 */
public class BwjgBean extends OperateBean {

	private static final long serialVersionUID = 3332404544128671796L;

	/**
	 * 保卫机构编号（主键）
	 */
	private String bwjgbh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 保卫机构名称
	 */
	private String jgmc;
	
	/**
	 * 隶属关系
	 */
	private String lsgx;
	
	/**
	 * 负责人
	 */
	private String fzr;
	
	/**
	 * 负责人身份证号
	 */
	private String fzrsfzh;
	
	/**
	 * 负责人联系方式
	 */
	private String fzrlxfs;
	
	/**
	 * 操作
	 */
	private String cz;

	public String getBwjgbh() {
		return bwjgbh;
	}

	public void setBwjgbh(String bwjgbh) {
		this.bwjgbh = bwjgbh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getJgmc() {
		return jgmc;
	}

	public void setJgmc(String jgmc) {
		this.jgmc = jgmc;
	}

	public String getLsgx() {
		return lsgx;
	}

	public void setLsgx(String lsgx) {
		this.lsgx = lsgx;
	}

	public String getFzr() {
		return fzr;
	}

	public void setFzr(String fzr) {
		this.fzr = fzr;
	}

	public String getFzrsfzh() {
		return fzrsfzh;
	}

	public void setFzrsfzh(String fzrsfzh) {
		this.fzrsfzh = fzrsfzh;
	}

	public String getFzrlxfs() {
		return fzrlxfs;
	}

	public void setFzrlxfs(String fzrlxfs) {
		this.fzrlxfs = fzrlxfs;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openBwjg('toBwjg','update','"+this.bwjgbh+"')\">修改</span>";
		cz += "&nbsp;|&nbsp;<span class=\"cps_span_href\" onclick=\"delBwjg('"+this.bwjgbh +"')\">删除</span>";
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
}
