package com.chinacreator.xqgk.bean.query;

import com.chinacreator.common.bean.BaseValue;

public class CyryQueryBean extends BaseValue {
/**
	 * 
	 */
	private static final long serialVersionUID = 8725286240028444500L;

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

	public void setChildLevel(int childLevel) {
		this.childLevel = childLevel;
	}

	public String getTjDate() {
		return tjDate;
	}

	public void setTjDate(String tjDate) {
		this.tjDate = tjDate;
	}

}
