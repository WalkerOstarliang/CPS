package com.chinacreator.tjbb.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 单位统计查询条件
 */
public class DwtjQueryBean extends QueryBean{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 单位代码
	 */
	private String dwdm;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 统计时间（开始）
	 */
	private String tjsj_start;
	
	/**
	 * 统计时间（结束）
	 */
	private String tjsj_end;

	public String getDwdm() {
		return dwdm;
	}

	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}

	public String getTjsj_start() {
		return tjsj_start;
	}

	public void setTjsj_start(String tjsj_start) {
		this.tjsj_start = tjsj_start;
	}

	public String getTjsj_end() {
		return tjsj_end;
	}

	public void setTjsj_end(String tjsj_end) {
		this.tjsj_end = tjsj_end;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}
}
