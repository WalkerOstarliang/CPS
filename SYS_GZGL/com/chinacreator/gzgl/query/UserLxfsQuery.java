package com.chinacreator.gzgl.query;

import com.chinacreator.common.bean.QueryBean;

public class UserLxfsQuery extends QueryBean{

	/**
	 * 用户联系方式查询bean
	 *
	 */
	private static final long serialVersionUID = -7955739278821634498L;
	private String username;
	private String sfzh;
	private String userid;
	private String xm;
	private String citygajgjgdm;
	private String countrygajgjgdm;
	private String pcsdm;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getCitygajgjgdm() {
		return citygajgjgdm;
	}
	public void setCitygajgjgdm(String citygajgjgdm) {
		this.citygajgjgdm = citygajgjgdm;
	}
	public String getCountrygajgjgdm() {
		return countrygajgjgdm;
	}
	public void setCountrygajgjgdm(String countrygajgjgdm) {
		this.countrygajgjgdm = countrygajgjgdm;
	}
	public String getPcsdm() {
		return pcsdm;
	}
	public void setPcsdm(String pcsdm) {
		this.pcsdm = pcsdm;
	}
	
}
