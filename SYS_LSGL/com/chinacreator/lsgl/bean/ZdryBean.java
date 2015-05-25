package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 重点人员
 */
public class ZdryBean extends BaseValue {
	private static final long serialVersionUID = -8808544936520461514L;
	
	/**
	 * 重点人员基本信息
	 */
	private ZdryJbxxBean jbxx = new ZdryJbxxBean();
	
	/**
	 * 监视居住
	 */
	private ZdryJsjzBean jsjz = new ZdryJsjzBean();
	
	/**
	 * 取保候审
	 */
	private ZdryQbhsBean qbhs = new ZdryQbhsBean();
	
	
	/**
	 * 社区戒毒
	 */
	private ZdrySqjdBean sqjd = new ZdrySqjdBean();
	
	
	/**
	 * 社区康复
	 */
	private ZdrySqkfBean sqkf = new ZdrySqkfBean();


	public ZdryJbxxBean getJbxx() {
		return jbxx;
	}


	public void setJbxx(ZdryJbxxBean jbxx) {
		this.jbxx = jbxx;
	}


	public ZdryJsjzBean getJsjz() {
		return jsjz;
	}


	public void setJsjz(ZdryJsjzBean jsjz) {
		this.jsjz = jsjz;
	}


	public ZdryQbhsBean getQbhs() {
		return qbhs;
	}


	public void setQbhs(ZdryQbhsBean qbhs) {
		this.qbhs = qbhs;
	}


	public ZdrySqjdBean getSqjd() {
		return sqjd;
	}


	public void setSqjd(ZdrySqjdBean sqjd) {
		this.sqjd = sqjd;
	}


	public ZdrySqkfBean getSqkf() {
		return sqkf;
	}


	public void setSqkf(ZdrySqkfBean sqkf) {
		this.sqkf = sqkf;
	}
}
