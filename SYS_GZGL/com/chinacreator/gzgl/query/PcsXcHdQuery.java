package com.chinacreator.gzgl.query;

import com.chinacreator.common.bean.QueryBean;

public class PcsXcHdQuery extends QueryBean {

	private static final long serialVersionUID = -2244484854616821347L;
	
	/**
	 * 活动ID
	 */
	private String id;
	
	/**
	 * 活动时间（开始）
	 */
	private String hdsj_start;
	
	/**
	 * 活动时间（结束）
	 */
	private String hdsj_end;
	
	/**
	 * 活动开展民警
	 */
	private String hdkzmj;
	
	private String orgcode;
	
	private String orgleve;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHdsj_start() {
		return hdsj_start;
	}

	public void setHdsj_start(String hdsjStart) {
		hdsj_start = hdsjStart;
	}

	public String getHdsj_end() {
		return hdsj_end;
	}

	public void setHdsj_end(String hdsjEnd) {
		hdsj_end = hdsjEnd;
	}

	public String getHdkzmj() {
		return hdkzmj;
	}

	public void setHdkzmj(String hdkzmj) {
		this.hdkzmj = hdkzmj;
	}

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getOrgleve() {
		return orgleve;
	}

	public void setOrgleve(String orgleve) {
		this.orgleve = orgleve;
	}
}
