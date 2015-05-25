package com.chinacreator.gzgl.bean;

import java.io.File;

public class TzmbBean {
	private String id;	//台账编号
	private String tzmc;	//台账名称
	private File tzmb;  //台账模本
	private String scsj; //上传时间
	private String cz;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTzmc() {
		return tzmc;
	}
	public void setTzmc(String tzmc) {
		this.tzmc = tzmc;
	}
	
	public File getTzmb() {
		return tzmb;
	}
	public void setTzmb(File tzmb) {
		this.tzmb = tzmb;
	}
	public String getScsj() {
		return scsj;
	}
	public void setScsj(String scsj) {
		this.scsj = scsj;
	}
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	
	

}
