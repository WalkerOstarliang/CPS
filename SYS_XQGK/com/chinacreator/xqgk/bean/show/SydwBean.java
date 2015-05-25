package com.chinacreator.xqgk.bean.show;

import java.text.NumberFormat;

import com.chinacreator.common.bean.BaseValue;
@SuppressWarnings("unused")
public class SydwBean extends BaseValue {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -6479867916141684726L;

	private String deptCode;
	
	private String deptName;
	
	private int tzhy;
	
	private int ggcs;
	
	private int qsydw;
	
	private int swdw;
	
	private int swfwdw;
	
	private int wxpdw;
	
	private int ksy;
	
	private int jfdw;
	
	private int lgy;
	
	private int qtdw;
	
	private int dwSum;
	
	private String showTzhy;
	private String showGgcs;
	private String showQsydw;
	private String showSwdw;
	private String showSwfwdw;
	private String showWxpdw;
	private String showKsy;
	private String showJfdw;
	private String showLgy;
	private String showQtdw;
	private String showDwSum;
	
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
	public int getTzhy() {
		return tzhy;
	}
	public void setTzhy(int tzhy) {
		this.tzhy = tzhy;
	}
	public int getGgcs() {
		return ggcs;
	}
	public void setGgcs(int ggcs) {
		this.ggcs = ggcs;
	}
	public int getQsydw() {
		return qsydw;
	}
	public void setQsydw(int qsydw) {
		this.qsydw = qsydw;
	}
	public int getSwdw() {
		return swdw;
	}
	public void setSwdw(int swdw) {
		this.swdw = swdw;
	}
	public int getSwfwdw() {
		return swfwdw;
	}
	public void setSwfwdw(int swfwdw) {
		this.swfwdw = swfwdw;
	}
	public int getWxpdw() {
		return wxpdw;
	}
	public void setWxpdw(int wxpdw) {
		this.wxpdw = wxpdw;
	}
	public int getKsy() {
		return ksy;
	}
	public void setKsy(int ksy) {
		this.ksy = ksy;
	}
	public int getJfdw() {
		return jfdw;
	}
	public void setJfdw(int jfdw) {
		this.jfdw = jfdw;
	}
	public int getLgy() {
		return lgy;
	}
	public void setLgy(int lgy) {
		this.lgy = lgy;
	}
	public int getQtdw() {
		return qtdw;
	}
	public void setQtdw(int qtdw) {
		this.qtdw = qtdw;
	}
	public int getDwSum() {
		return tzhy + ggcs + qsydw + swdw + swfwdw + wxpdw + ksy + jfdw + lgy + qtdw;
	}
	public void setDwSum(int dwSum) {
		this.dwSum = dwSum;
	}
	
	public String getShowTzhy() {
		return NumberFormat.getNumberInstance().format(getTzhy());
	}
	public String getShowGgcs() {
		return NumberFormat.getNumberInstance().format(getGgcs());
	}
	public String getShowQsydw() {
		return NumberFormat.getNumberInstance().format(getQsydw());
	}
	public String getShowSwdw() {
		return NumberFormat.getNumberInstance().format(getSwdw());
	}
	public String getShowSwfwdw() {
		return NumberFormat.getNumberInstance().format(getSwfwdw());
	}
	public String getShowWxpdw() {
		return NumberFormat.getNumberInstance().format(getWxpdw());
	}
	public String getShowKsy() {
		return NumberFormat.getNumberInstance().format(getKsy());
	}
	public String getShowJfdw() {
		return NumberFormat.getNumberInstance().format(getJfdw());
	}
	public String getShowLgy() {
		return NumberFormat.getNumberInstance().format(getLgy());
	}
	public String getShowQtdw() {
		return NumberFormat.getNumberInstance().format(getQtdw());
	}
	public String getShowDwSum() {
		return NumberFormat.getNumberInstance().format(getDwSum());
	}
	
}
