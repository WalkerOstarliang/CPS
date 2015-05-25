package com.chinacreator.afgl.zaxl.bean;

import com.chinacreator.common.bean.QueryBean;

/**
 * 治安巡逻查询条件
 */
public class ZaxlQueryBean extends QueryBean {

	private static final long serialVersionUID = 6201704105435899111L;
	
	private String id;
	
	/**
	 * 巡逻日期
	 */
	private String xlsj_s;
	
	private String xlsj_e;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getXlsj_s() {
		return xlsj_s;
	}

	public void setXlsj_s(String xlsjS) {
		xlsj_s = xlsjS;
	}

	public String getXlsj_e() {
		return xlsj_e;
	}

	public void setXlsj_e(String xlsjE) {
		xlsj_e = xlsjE;
	}
}
