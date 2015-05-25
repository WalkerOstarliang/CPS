package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;

public class LxdjQueryBean extends QueryBean
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8885664601438709006L;

	
	private String xjzt; 	//信件主题==>来访主题
	
	private String lflxsj_from;	//登记时间（开始）
	
	private String lflxsj_to;		//登记时间（结束）
	
	/*******************************************************************************
	 *                        Getter & Setter                                      *
	 *******************************************************************************/
	
	public String getXjzt() {
		return xjzt;
	}

	public void setXjzt(String xjzt) {
		this.xjzt = xjzt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

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

	

}
