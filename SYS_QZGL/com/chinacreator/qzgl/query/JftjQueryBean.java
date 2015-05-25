package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;

public class JftjQueryBean extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6998694836519779792L;
	private String tjsj_from;
	private String tjsj_to;
	private String jflx;
	public String getTjsj_from() {
		return tjsj_from;
	}
	public void setTjsj_from(String tjsj_from) {
		this.tjsj_from = tjsj_from;
	}
	public String getTjsj_to() {
		return tjsj_to;
	}
	public void setTjsj_to(String tjsj_to) {
		this.tjsj_to = tjsj_to;
	}
	public String getJflx() {
		return jflx;
	}
	public void setJflx(String jflx) {
		this.jflx = jflx;
	}
}
