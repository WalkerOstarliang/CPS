package com.chinacreator.dwdj.query;

import com.chinacreator.common.bean.QueryBean;

public class WbdwShQueryBean extends QueryBean {

	private static final long serialVersionUID = 7465407620979939524L;
	
	/**
	 * 审核ID
	 */
	private String id;
	
	/**
	 * 审核状态
	 */
	private String shzt;
	
	/**
	 * 操作状态
	 */
	private String czzt;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 提交时间
	 */
	private String tjsj_start;
	
	private String tjsj_end; 
	
	/**
	 * 审核时间
	 */
	private String shsj_start;
	
	private String shsj_end;

	public String getShzt() {
		return shzt;
	}

	public void setShzt(String shzt) {
		this.shzt = shzt;
	}

	public String getCzzt() {
		return czzt;
	}

	public void setCzzt(String czzt) {
		this.czzt = czzt;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getTjsj_start() {
		return tjsj_start;
	}

	public void setTjsj_start(String tjsjStart) {
		tjsj_start = tjsjStart;
	}

	public String getTjsj_end() {
		return tjsj_end;
	}

	public void setTjsj_end(String tjsjEnd) {
		tjsj_end = tjsjEnd;
	}

	public String getShsj_start() {
		return shsj_start;
	}

	public void setShsj_start(String shsjStart) {
		shsj_start = shsjStart;
	}

	public String getShsj_end() {
		return shsj_end;
	}

	public void setShsj_end(String shsjEnd) {
		shsj_end = shsjEnd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
