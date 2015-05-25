package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;

public class FwdzQyBean extends BaseValue{
	/**
	 * 房屋地址合并迁移Bean
	 */
	private static final long serialVersionUID = -8835588536656105052L;
	
	private String fwid; //目标房屋ID
	private String oldfwid; // 需要迁移房屋id
	public String getFwid() {
		return fwid;
	}
	public void setFwid(String fwid) {
		this.fwid = fwid;
	}
	public String getOldfwid() {
		return oldfwid;
	}
	public void setOldfwid(String oldfwid) {
		this.oldfwid = oldfwid;
	}
	
}
