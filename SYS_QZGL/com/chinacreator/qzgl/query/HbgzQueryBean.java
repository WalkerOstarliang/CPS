package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;

public class HbgzQueryBean extends QueryBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4973185167156831969L;

	private String hbsj_from;
	
	private String hbsj_to;
	
	private String bggzzt;

	/*******************************************************************************
	 *                        Getter & Setter                                      *
	 *******************************************************************************/

	
	public String getHbsj_from() {
		return hbsj_from;
	}

	public void setHbsj_from(String hbsj_from) {
		this.hbsj_from = hbsj_from;
	}

	public String getHbsj_to() {
		return hbsj_to;
	}

	public void setHbsj_to(String hbsj_to) {
		this.hbsj_to = hbsj_to;
	}

	public String getBggzzt() {
		return bggzzt;
	}

	public void setBggzzt(String bggzzt) {
		this.bggzzt = bggzzt;
	}
	
	
	
}
