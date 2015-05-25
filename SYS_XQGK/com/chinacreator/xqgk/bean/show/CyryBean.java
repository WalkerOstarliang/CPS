package com.chinacreator.xqgk.bean.show;

import java.text.NumberFormat;

import com.chinacreator.common.bean.BaseValue;

public class CyryBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2580458562621776651L;
	
	private String deptCode;
	
	private String deptName;
	
	private int cyrys;
	
	@SuppressWarnings("unused")
	private String showCyrys;

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getCyrys() {
		return cyrys;
	}

	public void setCyrys(int cyrys) {
		this.cyrys = cyrys;
	}

	public String getShowCyrys() {
		return NumberFormat.getNumberInstance().format(getCyrys());
	}

	public void setShowCyrys(String showCyrys) {
		this.showCyrys = showCyrys;
	}
}
