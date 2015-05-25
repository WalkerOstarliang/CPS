package com.chinacreator.xtgl.query;

import com.chinacreator.common.bean.QueryBean;

public class DwjcpzQueryBean extends QueryBean {

	private static final long serialVersionUID = -125714577276122978L;
	
	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 行业类别
	 */
	private String hylb;
	
	/**
	 * 单位大类
	 */
	private String dwdl;
	
	/**
	 * 单位小类
	 */
	private String dwxl;
	
	/**
	 * 检查周期（单位天）
	 */
	private String jczq;
	
	/**
	 * 登记日期
	 */
	private String djrq;
	
	/**
	 * 登记单位代码
	 */
	private String djdwdm;
	
	/**
	 * 登记单位名称
	 */
	private String djdwmc;
	
	/**
	 * 登记人姓名
	 */
	private String djrxm;
	
	/**
	 * 操作单位代码
	 */
	private String czdwdm;
	
	/**
	 * 操作单位名称
	 */
	private String czdwmc;
	
	/**
	 * 操作人姓名
	 */
	private String czrxm;
	
	/**
	 * 操作时间
	 */
	private String czsj;
	
	/**
	 * 操作标识
	 */
	private String czbs;
	
	/**
	 * 检查周期单位
	 */
	private String dw;
	
	/**
	 * 检查周期数值
	 */
	private String sz;
	
	/**
	 * 单位检查周期显示
	 */
	private String showJczq;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHylb() {
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}

	public String getDwdl() {
		return dwdl;
	}

	public void setDwdl(String dwdl) {
		this.dwdl = dwdl;
	}

	public String getDwxl() {
		return dwxl;
	}

	public void setDwxl(String dwxl) {
		this.dwxl = dwxl;
	}

	public String getJczq() {
		return jczq;
	}

	public void setJczq(String jczq) {
		this.jczq = jczq;
	}

	public String getDjrq() {
		return djrq;
	}

	public void setDjrq(String djrq) {
		this.djrq = djrq;
	}

	public String getDjdwdm() {
		return djdwdm;
	}

	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}

	public String getDjdwmc() {
		return djdwmc;
	}

	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}

	public String getDjrxm() {
		return djrxm;
	}

	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}

	public String getCzdwdm() {
		return czdwdm;
	}

	public void setCzdwdm(String czdwdm) {
		this.czdwdm = czdwdm;
	}

	public String getCzdwmc() {
		return czdwmc;
	}

	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}

	public String getCzrxm() {
		return czrxm;
	}

	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}

	public String getCzsj() {
		return czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public String getCzbs() {
		return czbs;
	}

	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

	public String getDw() {
		return dw;
	}

	public void setDw(String dw) {
		this.dw = dw;
	}

	public String getSz() {
		return sz;
	}

	public void setSz(String sz) {
		this.sz = sz;
	}

	public String getShowJczq() {
		return showJczq;
	}

	public void setShowJczq(String showJczq) {
		this.showJczq = showJczq;
	}
}
