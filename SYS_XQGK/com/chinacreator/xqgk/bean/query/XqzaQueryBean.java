package com.chinacreator.xqgk.bean.query;

import com.chinacreator.common.bean.BaseValue;

public class XqzaQueryBean extends BaseValue {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 4698826189248707447L;

	private String deptCode;
	
	private int childLevel;
	
	private String tjDate;

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public int getChildLevel() {
		return childLevel;
	}

	public void setChildLevel(int deptLevel) {
		this.childLevel = deptLevel;
	}

	public String getTjDate() {
		return tjDate;
	}

	public void setTjDate(String tjDate) {
		this.tjDate = tjDate;
	}

}
