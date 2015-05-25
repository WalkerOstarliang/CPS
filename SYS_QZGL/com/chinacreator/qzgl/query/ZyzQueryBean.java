package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;

public class ZyzQueryBean extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3894630650311853906L;
	private String sfzh;
	private String csrq_from;
	private String csrq_to;
	private String xm;
    
	public String getCsrq_from() {
		return csrq_from;
	}
	public void setCsrq_from(String csrq_from) {
		this.csrq_from = csrq_from;
	}
	public String getCsrq_to() {
		return csrq_to;
	}
	public void setCsrq_to(String csrq_to) {
		this.csrq_to = csrq_to;
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

}
