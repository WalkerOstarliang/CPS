package com.chinacreator.xqgk.bean.show;

import java.text.NumberFormat;

import com.chinacreator.common.bean.BaseValue;
@SuppressWarnings("unused")
public class SyfwBean extends BaseValue {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 36927283138318364L;

	private String deptCode;
	
	private String deptName;
	
	private int fw;
	
	private int czfw;
	
	private int stjz;
	
	
	private String showFw;
	private String showCzfw;
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

	public int getFw() {
		return fw;
	}

	public void setFw(int fw) {
		this.fw = fw;
	}

	public int getCzfw() {
		return czfw;
	}

	public void setCzfw(int czfw) {
		this.czfw = czfw;
	}

	public int getStjz() {
		return stjz;
	}

	public void setStjz(int stjz) {
		this.stjz = stjz;
	}

	public String getShowFw() {
		return NumberFormat.getNumberInstance().format(getFw());
	}

	public String getShowCzfw() {
		return NumberFormat.getNumberInstance().format(getCzfw());
	}

	public String getShowStjz() {
		return NumberFormat.getNumberInstance().format(getStjz());
	}
	
}
