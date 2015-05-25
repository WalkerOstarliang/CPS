package com.chinacreator.rhzf.query;

import com.chinacreator.common.bean.QueryBean;

public class RhzfQuery extends QueryBean {
	private static final long serialVersionUID = -6640374966648202309L;
	
	/**
	 * 走访id
	 */
	private String id;
	
	/**
	 * 走访人
	 */
	private String zfrxm;
	
	/**
	 * 走访时间
	 */
	private String zfsj_s;
	
	private String zfsj_e;
	
	/**
	 * 走访类型
	 */
	private String zflx;
	
	/**
	 * 地址ID
	 */
	private String dzid;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getZfrxm() {
		return zfrxm;
	}

	public void setZfrxm(String zfrxm) {
		this.zfrxm = zfrxm;
	}

	public String getZfsj_s() {
		return zfsj_s;
	}

	public void setZfsj_s(String zfsjS) {
		zfsj_s = zfsjS;
	}

	public String getZfsj_e() {
		return zfsj_e;
	}

	public void setZfsj_e(String zfsjE) {
		zfsj_e = zfsjE;
	}

	public String getZflx() {
		return zflx;
	}

	public void setZflx(String zflx) {
		this.zflx = zflx;
	}

	public String getDzid() {
		return dzid;
	}

	public void setDzid(String dzid) {
		this.dzid = dzid;
	}
}
