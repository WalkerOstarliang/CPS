package com.chinacreator.zagl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 电动车查询条件
 */
public class DdcQueryBean extends QueryBean {

	private static final long serialVersionUID = -2355750209179752999L;
	
	/**
	 * 销售时间 开始时间
	 */
	private String xssj_start;
	
	/**
	 * 销售时间 结束时间
	 */
	private String xssj_end;
	
	/**
	 * 品牌
	 */
	private String pp;
	
	/**
	 * 车架号
	 */
	private String clsbh;
	
	/**
	 * 电机号
	 */
	private String djh;
	
	/**
	 * 销售单位
	 */
	private String xsdw;

	public String getXssj_start() {
		return xssj_start;
	}

	public void setXssj_start(String xssj_start) {
		this.xssj_start = xssj_start;
	}

	public String getXssj_end() {
		return xssj_end;
	}

	public void setXssj_end(String xssj_end) {
		this.xssj_end = xssj_end;
	}

	public String getPp() {
		return pp;
	}

	public void setPp(String pp) {
		this.pp = pp;
	}

	public String getClsbh() {
		return clsbh;
	}

	public void setClsbh(String clsbh) {
		this.clsbh = clsbh;
	}

	public String getDjh() {
		return djh;
	}

	public void setDjh(String djh) {
		this.djh = djh;
	}

	public String getXsdw() {
		return xsdw;
	}

	public void setXsdw(String xsdw) {
		this.xsdw = xsdw;
	}
}
