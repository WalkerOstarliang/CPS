package com.chinacreator.afgl.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 实体信息
 * @author Administrator
 *
 */
public class StxxBean  extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String stid;
	private String stmc ;
	private String stdz ;
	private String sqdm ;
	private String sqmc ;
	public String getSqdm() {
		return sqdm;
	}
	public void setSqdm(String sqdm) {
		this.sqdm = sqdm;
	}
	public String getSqmc() {
		return sqmc;
	}
	public void setSqmc(String sqmc) {
		this.sqmc = sqmc;
	}
	public String getStid() {
		return stid;
	}
	public void setStid(String stid) {
		this.stid = stid;
	}
	public String getStmc() {
		return stmc;
	}
	public void setStmc(String stmc) {
		this.stmc = stmc;
	}
	public String getStdz() {
		return stdz;
	}
	public void setStdz(String stdz) {
		this.stdz = stdz;
	}
	
}
