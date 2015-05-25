package com.chinacreator.xtgl.bean;

import com.chinacreator.common.bean.BaseValue;

public class JjrzdBean extends BaseValue {

	/**
	 * 节假日
	 */
	private static final long serialVersionUID = 6032918182844552609L;
	
	private String id;
	private String dm;
	private String mc;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDm() {
		return dm;
	}
	public void setDm(String dm) {
		this.dm = dm;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}

}
