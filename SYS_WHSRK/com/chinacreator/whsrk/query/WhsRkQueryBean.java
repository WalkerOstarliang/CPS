package com.chinacreator.whsrk.query;

import com.chinacreator.common.bean.QueryBean;

public class WhsRkQueryBean extends QueryBean {

	private static final long serialVersionUID = 4406751142850714020L;
	
	private String rkid;
	
	private String czzt;
	
	private String fkzt;
	
	private String xm;
	
	private String sfzh;
	
	private String hjdxz;
	
	private String pfsj_s; 
	
	private String pfsj_e; 

	public String getRkid() {
		return rkid;
	}

	public void setRkid(String rkid) {
		this.rkid = rkid;
	}

	public String getCzzt() {
		return czzt;
	}

	public void setCzzt(String czzt) {
		this.czzt = czzt;
	}

	public String getFkzt() {
		return fkzt;
	}

	public void setFkzt(String fkzt) {
		this.fkzt = fkzt;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getHjdxz() {
		return hjdxz;
	}

	public void setHjdxz(String hjdxz) {
		this.hjdxz = hjdxz;
	}

	public String getPfsj_s() {
		return pfsj_s;
	}

	public void setPfsj_s(String pfsjS) {
		pfsj_s = pfsjS;
	}

	public String getPfsj_e() {
		return pfsj_e;
	}

	public void setPfsj_e(String pfsjE) {
		pfsj_e = pfsjE;
	}
}
