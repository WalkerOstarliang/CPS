package com.chinacreator.zagl.bean.nbtj;

import com.chinacreator.common.bean.BaseValue;

public class Wyxqtb extends BaseValue {

	private static final long serialVersionUID = 4566125529901297308L;

	/**
	 * 物业小区id
	 */
	private String id;
	
	/**
	 * 区县局
	 */
	private String qxj;
	
	/**
	 * 派出所
	 */
	private String pcs;
	
	/**
	 * 物业小区
	 */
	private String wyxq;
	
	/**
	 * 物业公司
	 */
	private String wygs;
	
	/**
	 * 发案数
	 */
	private String fas;

	public String getQxj() {
		return qxj;
	}

	public void setQxj(String qxj) {
		this.qxj = qxj;
	}

	public String getPcs() {
		return pcs;
	}

	public void setPcs(String pcs) {
		this.pcs = pcs;
	}

	public String getWyxq() {
		return wyxq;
	}

	public void setWyxq(String wyxq) {
		this.wyxq = wyxq;
	}

	public String getWygs() {
		return wygs;
	}

	public void setWygs(String wygs) {
		this.wygs = wygs;
	}

	public String getFas() {
		return fas;
	}

	public void setFas(String fas) {
		this.fas = fas;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
