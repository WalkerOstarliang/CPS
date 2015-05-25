package com.chinacreator.zagl.bean;
/**
 * 通过单位名称校验单位是否有相同名称的存在
 * @author Administrator
 *
 */
public class DwjbxxExistsBean extends OperateBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1707274797614870529L;

	/**
	 * 机构编号 主键
	 */
	private String jgbh;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 单位地址
	 */
	private String dwdz;

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getDwdz() {
		return dwdz;
	}

	public void setDwdz(String dwdz) {
		this.dwdz = dwdz;
	}
	
	
	
}
