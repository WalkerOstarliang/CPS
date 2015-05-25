package com.chinacreator.xqgk.bean.show;

import java.text.NumberFormat;

import com.chinacreator.common.bean.BaseValue;
@SuppressWarnings("unused")
public class SyjzBean extends BaseValue {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -5066597184697706025L;

	private String deptCode;
	
	private String deptName;
	
	private int stjz;
	
	private String showStjz;
	
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

	public int getStjz() {
		return stjz;
	}

	public void setStjz(int stjz) {
		this.stjz = stjz;
	}

	public String getShowStjz() {
		return NumberFormat.getNumberInstance().format(getStjz());
	}

}
