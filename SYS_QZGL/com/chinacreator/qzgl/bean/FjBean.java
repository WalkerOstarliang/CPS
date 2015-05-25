package com.chinacreator.qzgl.bean;

import java.io.File;

import com.chinacreator.common.bean.BaseValue;

public class FjBean extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = 872393266283888884L;
	
	private String bh;
	private String djbh;
	private String fjlx;
	private String fjmc;
	private File fj;
	private File fjxx;
	
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getDjbh() {
		return djbh;
	}
	public void setDjbh(String djbh) {
		this.djbh = djbh;
	}
	public String getFjlx() {
		return fjlx;
	}
	public void setFjlx(String fjlx) {
		this.fjlx = fjlx;
	}
	public String getFjmc() {
		return fjmc;
	}
	public void setFjmc(String fjmc) {
		this.fjmc = fjmc;
	}

	public File getFj() {
		return fj;
	}
	public void setFj(File fj) {
		this.fj = fj;
	}
	public File getFjxx() {
		return fjxx;
	}
	public void setFjxx(File fjxx) {
		this.fjxx = fjxx;
	}
	
	
	

}
