package com.chinacreator.tjbb.query;

import com.chinacreator.common.bean.QueryBean;

public class JdTbQueryBean extends QueryBean {

	private static final long serialVersionUID = 2689304693611904042L;
	
	private String tjnf;
	
	private String dwdm;
	
	private String jds;
	
	private String tjsj_start;
	
	private String tjsj_end;
	
	private String dwleve;

	public String getDwdm() {
		return dwdm;
	}

	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}

	public String getJds() {
		return jds;
	}

	public void setJds(String jds) {
		this.jds = jds;
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

	public String getTjnf() {
		return tjnf;
	}

	public void setTjnf(String tjnf) {
		this.tjnf = tjnf;
	}

	public String getDwleve() {
		return dwleve;
	}

	public void setDwleve(String dwleve) {
		this.dwleve = dwleve;
	}
}
