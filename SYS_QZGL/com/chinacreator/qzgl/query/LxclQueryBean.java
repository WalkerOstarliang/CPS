package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;

public class LxclQueryBean extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2946619510559110934L;
	
	private String lflxsj_from;				//来访来信时间（起始）
		
	private String lflxsj_to;				//来访来信时间（截止）
	
	private String xjzt;					//信件主题（来访主题）
	
	private String cllx;					//处理类型

	/*******************************************************************************
	 *                        Getter & Setter                                      *
	 *******************************************************************************/


	public String getLflxsj_from() {
		return lflxsj_from;
	}

	public void setLflxsj_from(String lflxsjFrom) {
		lflxsj_from = lflxsjFrom;
	}

	public String getLflxsj_to() {
		return lflxsj_to;
	}

	public void setLflxsj_to(String lflxsjTo) {
		lflxsj_to = lflxsjTo;
	}

	public String getXjzt() {
		return xjzt;
	}

	public void setXjzt(String xjzt) {
		this.xjzt = xjzt;
	}

	public String getCllx() {
		return cllx;
	}

	public void setCllx(String cllx) {
		this.cllx = cllx;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

	
}
