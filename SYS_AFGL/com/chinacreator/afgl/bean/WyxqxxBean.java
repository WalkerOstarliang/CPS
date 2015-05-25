package com.chinacreator.afgl.bean;

import com.chinacreator.common.bean.BaseValue;
/**
 * 物业小区信息
 * @author Administrator
 *
 */
public class WyxqxxBean  extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id ;
	private String xqmc ;
	private String sqdm;
	private String sqmc ;
	private String dzmc ;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXqmc() {
		return xqmc;
	}
	public void setXqmc(String xqmc) {
		this.xqmc = xqmc;
	}
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
	public String getDzmc() {
		return dzmc;
	}
	public void setDzmc(String dzmc) {
		this.dzmc = dzmc;
	}
	
}
