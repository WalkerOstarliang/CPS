package com.chinacreator.rhzf.bean;

import com.chinacreator.common.bean.QueryBean;

public class RhzfTjQueryBean extends QueryBean {

	private static final long serialVersionUID = -671045862806918283L;
	
	private String orgcode;
	
	private String orgleve;
	
	private String parent_dm;
	
	private String tjsj_start;
	
	private String tjsj_end;

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

	public String getParent_dm() {
		return parent_dm;
	}

	public void setParent_dm(String parentDm) {
		parent_dm = parentDm;
	}

	public String getTjsj_start() {
		return tjsj_start;
	}

	public void setTjsj_start(String tjsjStart) {
		tjsj_start = tjsjStart;
	}

	public String getTjsj_end() {
		return tjsj_end;
	}

	public void setTjsj_end(String tjsjEnd) {
		tjsj_end = tjsjEnd;
	}
}
