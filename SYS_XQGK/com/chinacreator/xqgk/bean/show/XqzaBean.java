package com.chinacreator.xqgk.bean.show;

import java.text.NumberFormat;

import com.chinacreator.common.bean.BaseValue;
@SuppressWarnings("unused")
public class XqzaBean extends BaseValue {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 3933949786828752573L;

	private String deptCode;
	
	private String deptName;
	
	private int qjsl;
	
	private int qdsl;
	
	private int dqsl;
	
	private int zpsl;
	
	private int dfxqcsl;
	
	private int qtsl;
	
	private int rsdqsl; // 入室盗窃
	
	private int zs;
	
	private String showQjsl;
	private String showQdsl;
	private String showDqsl;
	private String showZpsl;
	private String showDfxqcsl;
	private String showQtsl;
	private String showZs;
	private String showRsdqsl;
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

	public int getQjsl() {
		return qjsl;
	}

	public void setQjsl(int qjsl) {
		this.qjsl = qjsl;
	}

	public int getQdsl() {
		return qdsl;
	}

	public void setQdsl(int qdsl) {
		this.qdsl = qdsl;
	}

	public int getDqsl() {
		return dqsl;
	}

	public void setDqsl(int dqsl) {
		this.dqsl = dqsl;
	}

	public int getZpsl() {
		return zpsl;
	}

	public void setZpsl(int zpsl) {
		this.zpsl = zpsl;
	}

	public int getDfxqcsl() {
		return dfxqcsl;
	}

	public void setDfxqcsl(int dfxqcsl) {
		this.dfxqcsl = dfxqcsl;
	}

	public int getQtsl() {
		return qtsl;
	}

	public void setQtsl(int qtsl) {
		this.qtsl = qtsl;
	}

	public int getZs() {
		return zs;
	}

	public void setZs(int zs) {
		this.zs = zs;
	}

	public String getShowQjsl() {
		return NumberFormat.getNumberInstance().format(getQjsl());
	}

	public String getShowQdsl() {
		return NumberFormat.getNumberInstance().format(getQdsl());
	}

	public String getShowDqsl() {
		return NumberFormat.getNumberInstance().format(getDqsl());
	}

	public String getShowZpsl() {
		return NumberFormat.getNumberInstance().format(getZpsl());
	}

	public String getShowDfxqcsl() {
		return NumberFormat.getNumberInstance().format(getDfxqcsl());
	}

	public String getShowQtsl() {
		return NumberFormat.getNumberInstance().format(getQtsl());
	}

	public String getShowZs() {
		return NumberFormat.getNumberInstance().format(getZs());
	}

	public int getRsdqsl() {
		return rsdqsl;
	}

	public void setShowZpsl(String showZpsl) {
		this.showZpsl = showZpsl;
	}

	public String getShowRsdqsl() {
		return NumberFormat.getNumberInstance().format(getRsdqsl());
	}

	public void setRsdqsl(int rsdqsl) {
		this.rsdqsl = rsdqsl;
	}

}
