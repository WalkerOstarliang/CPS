package com.chinacreator.zagl.query;

import com.chinacreator.common.bean.QueryBean;

public class WlsqQuery extends QueryBean {

	/**
	 * 网络社区管理
	 */
	private static final long serialVersionUID = -3755292894083775588L;
	
	private String wlsqbh;
	private String sssqbh;
	private String sssqmc;
	private String djrxm;
	private String djsj_from;
	private String djsj_to;
	
	public String getWlsqbh() {
		return wlsqbh;
	}
	public void setWlsqbh(String wlsqbh) {
		this.wlsqbh = wlsqbh;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjsj_from() {
		return djsj_from;
	}
	public void setDjsj_from(String djsj_from) {
		this.djsj_from = djsj_from;
	}
	public String getDjsj_to() {
		return djsj_to;
	}
	public void setDjsj_to(String djsj_to) {
		this.djsj_to = djsj_to;
	}
	public String getSssqbh() {
		return sssqbh;
	}
	public void setSssqbh(String sssqbh) {
		this.sssqbh = sssqbh;
	}
	public String getSssqmc() {
		return sssqmc;
	}
	public void setSssqmc(String sssqmc) {
		this.sssqmc = sssqmc;
	}
}
