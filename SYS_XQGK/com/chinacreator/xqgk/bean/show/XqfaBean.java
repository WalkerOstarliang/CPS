package com.chinacreator.xqgk.bean.show;

import java.text.NumberFormat;

import com.chinacreator.common.bean.BaseValue;
@SuppressWarnings("unused")
public class XqfaBean extends BaseValue {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -8433427738254697199L;

	private String deptCode;
	
	private String deptName;
	
	private int qja;
	
	private int qda;
	
	private int dqa;
	
	private int zpa;
	
	private int qtaj;
	
	private int ajSum;
	
	private String showQja;
	private String showQda;
	private String showDqa;
	private String showZpa;
	private String showQtaj;
	private String showAjSum;
	
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

	public int getQja() {
		return qja;
	}

	public void setQja(int qja) {
		this.qja = qja;
	}

	public int getQda() {
		return qda;
	}

	public void setQda(int qda) {
		this.qda = qda;
	}

	public int getDqa() {
		return dqa;
	}

	public void setDqa(int dqa) {
		this.dqa = dqa;
	}

	public int getZpa() {
		return zpa;
	}

	public void setZpa(int zpa) {
		this.zpa = zpa;
	}

	public int getQtaj() {
		return qtaj;
	}

	public void setQtaj(int qtaj) {
		this.qtaj = qtaj;
	}

	public int getAjSum() {
		return ajSum;
	}

	public void setAjSum(int ajSum) {
		this.ajSum = ajSum;
	}

	public String getShowQja() {
		return NumberFormat.getNumberInstance().format(getQja());
	}

	public String getShowQda() {
		return NumberFormat.getNumberInstance().format(getQda());
	}

	public String getShowDqa() {
		return NumberFormat.getNumberInstance().format(getDqa());
	}

	public String getShowZpa() {
		return NumberFormat.getNumberInstance().format(getZpa());
	}

	public String getShowQtaj() {
		return NumberFormat.getNumberInstance().format(getQtaj());
	}

	public String getShowAjSum() {
		return NumberFormat.getNumberInstance().format(getAjSum());
	}
}
