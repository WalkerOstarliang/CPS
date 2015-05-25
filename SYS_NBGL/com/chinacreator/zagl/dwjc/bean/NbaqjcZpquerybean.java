package com.chinacreator.zagl.dwjc.bean;

import java.io.File;

import com.chinacreator.zagl.bean.OperateBean;

public class NbaqjcZpquerybean extends OperateBean{

	/**
	 * 内保安全检查照片查询Bean
	 */
	private static final long serialVersionUID = 2078150214267901540L;
	
	private String  zpid ;   // 内保安全检查隐患照片ID
	private String  yhdd ;   // 内保安全检查隐患地点（存放安全检查表的字段名称）
	private File  yhddzp ;   // 内保安全检查隐患地点照片
	
	private String  aqjcid ;   // 内保安全检查表ID

	public String getZpid() {
		return zpid;
	}

	public void setZpid(String zpid) {
		this.zpid = zpid;
	}

	public String getYhdd() {
		return yhdd;
	}

	public void setYhdd(String yhdd) {
		this.yhdd = yhdd;
	}

	public File getYhddzp() {
		return yhddzp;
	}

	public void setYhddzp(File yhddzp) {
		this.yhddzp = yhddzp;
	}

	public String getAqjcid() {
		return aqjcid;
	}

	public void setAqjcid(String aqjcid) {
		this.aqjcid = aqjcid;
	}

	
	
}
