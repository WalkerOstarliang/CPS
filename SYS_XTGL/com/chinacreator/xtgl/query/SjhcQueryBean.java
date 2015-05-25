package com.chinacreator.xtgl.query;

import com.chinacreator.common.bean.QueryBean;

public class SjhcQueryBean extends QueryBean {

	private static final long serialVersionUID = 2969351963472800873L;
	
	/**
	 * 考核类型
	 */
	private String khlx;

	/**
	 * 开始时间
	 */
	private String startTime;
	
	/**
	 * 结束时间
	 */
	private String endTime;

	public String getKhlx() {
		return khlx;
	}

	public void setKhlx(String khlx) {
		this.khlx = khlx;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
}
