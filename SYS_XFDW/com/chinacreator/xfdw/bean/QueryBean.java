package com.chinacreator.xfdw.bean;

import java.io.Serializable;

public class QueryBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String kssj;
	private String jssj;
	private String last_code;//导出用code。
	private String p_code;
	private String org_code;
	private String leve = "3";
	private String hzdj;
	private String key; //last,this,other
	
	
	public String getKssj() {
		return kssj;
	}
	public void setKssj(String kssj) {
		this.kssj = kssj;
	}
	public String getJssj() {
		return jssj;
	}
	public void setJssj(String jssj) {
		this.jssj = jssj;
	}
	public String getOrg_code() {
		return org_code;
	}
	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}
	public String getLeve() {
		return leve;
	}
	public void setLeve(String leve) {
		this.leve = leve;
	}
	public String getHzdj() {
		return hzdj;
	}
	public void setHzdj(String hzdj) {
		this.hzdj = hzdj;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getLast_code() {
		return last_code;
	}
	public void setLast_code(String last_code) {
		this.last_code = last_code;
	}
	
	
	
}
