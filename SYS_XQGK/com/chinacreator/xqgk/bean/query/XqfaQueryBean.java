package com.chinacreator.xqgk.bean.query;

import com.chinacreator.common.bean.BaseValue;

public class XqfaQueryBean extends BaseValue {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -2569830336601542643L;

	private String queryCode;
	
	private String startTime;
	
	private String endTime;

	public String getQueryCode() {
		return queryCode;
	}

	public void setQueryCode(String queryCode) {
		this.queryCode = queryCode;
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
