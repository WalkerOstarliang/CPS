package com.chinacreator.zagl.bean.nbtj;

import com.chinacreator.common.bean.BaseValue;

public class ZddwFa extends BaseValue {

	private static final long serialVersionUID = -1074277199197681045L;
	
	/**
	 * id
	 */
	private String id;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 抢劫抢夺
	 */
	private  String qjqd;
	
	/**
	 * 扒窃
	 */
	private  String pq;
	
	/**
	 * 入室盗窃
	 */
	private  String rsdq;
	
	/**
	 * 其他盗窃
	 */
	private String qtdq;
	
	/**
	 * 其他案件
	 */
	private String qtaj;
	
	/**
	 * 合计
	 */
	private String hj;

	public String getQjqd() {
		return qjqd;
	}

	public void setQjqd(String qjqd) {
		this.qjqd = qjqd;
	}

	public String getPq() {
		return pq;
	}

	public void setPq(String pq) {
		this.pq = pq;
	}

	public String getRsdq() {
		return rsdq;
	}

	public void setRsdq(String rsdq) {
		this.rsdq = rsdq;
	}

	public String getQtdq() {
		return qtdq;
	}

	public void setQtdq(String qtdq) {
		this.qtdq = qtdq;
	}

	public String getQtaj() {
		return qtaj;
	}

	public void setQtaj(String qtaj) {
		this.qtaj = qtaj;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHj() {
		return hj;
	}

	public void setHj(String hj) {
		this.hj = hj;
	}
}
