package com.chinacreator.gzgl.query;

import com.chinacreator.common.bean.QueryBean;

public class TzmbQuery extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3072000892770931966L;
	private String tzmc; //台账名称
	private String scsj_from;
	private String scsj_to;
	public String getTzmc() {
		return tzmc;
	}
	public void setTzmc(String tzmc) {
		this.tzmc = tzmc;
	}
	public String getScsj_from() {
		return scsj_from;
	}
	public void setScsj_from(String scsj_from) {
		this.scsj_from = scsj_from;
	}
	public String getScsj_to() {
		return scsj_to;
	}
	public void setScsj_to(String scsj_to) {
		this.scsj_to = scsj_to;
	}
	

}
