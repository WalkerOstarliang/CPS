package com.chinacreator.xqgk.bean.show;

import java.text.NumberFormat;

import com.chinacreator.common.bean.BaseValue;
@SuppressWarnings("unused")
public class ZdryBean extends BaseValue {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 1937592674137365267L;

	private String deptCode;
	
	private String deptName;
	
	private int skry;
	
	private int swry;
	
	private int ztry;
	
	private int sdry;
	
	private int qkry;
	
	private int jsbr;
	
	private int sfry;
	
	private int gzdx;
	
	private int rySum;
	
	private String showSkry;
	private String showSwry;
	private String showZtry;
	private String showSdry;
	private String showQkry;
	private String showJsbr;
	private String showSfry;
	private String showGzdx;
	private String showRySum;
	
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

	public int getSkry() {
		return skry;
	}

	public void setSkry(int skry) {
		this.skry = skry;
	}

	public int getSwry() {
		return swry;
	}

	public void setSwry(int swry) {
		this.swry = swry;
	}

	public int getZtry() {
		return ztry;
	}

	public void setZtry(int ztry) {
		this.ztry = ztry;
	}

	public int getSdry() {
		return sdry;
	}

	public void setSdry(int sdry) {
		this.sdry = sdry;
	}

	public int getQkry() {
		return qkry;
	}

	public void setQkry(int qkry) {
		this.qkry = qkry;
	}

	public int getJsbr() {
		return jsbr;
	}

	public void setJsbr(int jsbr) {
		this.jsbr = jsbr;
	}

	public int getSfry() {
		return sfry;
	}

	public void setSfry(int sfry) {
		this.sfry = sfry;
	}

	public int getGzdx() {
		return gzdx;
	}

	public void setGzdx(int gzdx) {
		this.gzdx = gzdx;
	}
	
	public int getRySum() {
		return skry + swry + ztry + sdry + qkry + jsbr + sfry;
	}

	public void setRySum(int rySum) {
		this.rySum = rySum;
	}

	public String getShowSkry() {
		return NumberFormat.getNumberInstance().format(getSkry());
	}

	public String getShowSwry() {
		return NumberFormat.getNumberInstance().format(getSwry());
	}

	public String getShowZtry() {
		return NumberFormat.getNumberInstance().format(getZtry());
	}

	public String getShowSdry() {
		return NumberFormat.getNumberInstance().format(getSdry());
	}

	public String getShowQkry() {
		return NumberFormat.getNumberInstance().format(getQkry());
	}

	public String getShowJsbr() {
		return NumberFormat.getNumberInstance().format(getJsbr());
	}

	public String getShowSfry() {
		return NumberFormat.getNumberInstance().format(getSfry());
	}

	public String getShowGzdx() {
		return NumberFormat.getNumberInstance().format(getGzdx());
	}
	
	public String getShowRySum() {
		return NumberFormat.getNumberInstance().format(getRySum());
	}

}
