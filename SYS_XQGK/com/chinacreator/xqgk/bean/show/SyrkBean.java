package com.chinacreator.xqgk.bean.show;

import java.text.NumberFormat;

import com.chinacreator.common.bean.BaseValue;
@SuppressWarnings("unused")
public class SyrkBean extends BaseValue {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 6763678796562045843L;

	private String deptCode;
	
	private String deptName;
	
	private int czrk;
	
	private int ldrk;
	
	private int jzrk;
	
	private int wlhrk;
	
	private int jwry;
	
	private int rkSum;
	
	private String showCzrk;
	private String showLdrk;
	private String showJzrk;
	private String showWlhrk;
	private String showJwry;
	private String showRkSum;
	
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

	public int getCzrk() {
		return czrk;
	}

	public void setCzrk(int czrk) {
		this.czrk = czrk;
	}

	public int getLdrk() {
		return ldrk;
	}

	public void setLdrk(int ldrk) {
		this.ldrk = ldrk;
	}

	public int getJzrk() {
		return jzrk;
	}

	public void setJzrk(int jzrk) {
		this.jzrk = jzrk;
	}

	public int getWlhrk() {
		return wlhrk;
	}

	public void setWlhrk(int wlhrk) {
		this.wlhrk = wlhrk;
	}

	public int getJwry() {
		return jwry;
	}

	public void setJwry(int jwry) {
		this.jwry = jwry;
	}

	public int getRkSum() {
		return czrk + ldrk + jzrk + wlhrk;
	}

	public void setRkSum(int rkSum) {
		this.rkSum = rkSum;
	}

	public String getShowCzrk() {
		return NumberFormat.getNumberInstance().format(getCzrk());
	}

	public String getShowLdrk() {
		return NumberFormat.getNumberInstance().format(getLdrk());
	}

	public String getShowJzrk() {
		return NumberFormat.getNumberInstance().format(getJzrk());
	}

	public String getShowWlhrk() {
		return NumberFormat.getNumberInstance().format(getWlhrk());
	}

	public String getShowJwry() {
		return NumberFormat.getNumberInstance().format(getJwry());
	}

	public String getShowRkSum() {
		return NumberFormat.getNumberInstance().format(getRkSum());
	}
}
