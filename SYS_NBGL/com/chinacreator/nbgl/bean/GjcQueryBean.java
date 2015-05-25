package com.chinacreator.nbgl.bean;

import com.chinacreator.common.bean.QueryBean;

public class GjcQueryBean extends QueryBean {

	private static final long serialVersionUID = -1131723339537659296L;
	
	/**
	 * 关键词
	 */
	private String gjc;
	
	private String id;

	public String getGjc() {
		return gjc;
	}

	public void setGjc(String gjc) {
		this.gjc = gjc;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
