package com.chinacreator.zagl.dwjc.bean;


import java.io.File;

import com.chinacreator.zagl.bean.OperateBean;

public class NbAqJcZpBean extends OperateBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -645368090370340794L;
	/**
	 * 内保安全检查隐患照片处理Bean
	 */
	
	private String  zpid ;   // 内保安全检查隐患照片ID
	private String  yhdd ;   // 内保安全检查隐患地点（存放安全检查表的字段名称）
	private File  yhddzp  ;   // 内保安全检查隐患地点照片
	private String  djsj  ;   // 内保安全检查隐患照片上传时间
	private String aqjcid  ;   // 内保安全检查表ID
	private String  jgbh  ;   // 内保单位机构编号
	private String  dwlb  ;   // 内保单位类别
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
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getAqjcid() {
		return aqjcid;
	}
	public void setAqjcid(String aqjcid) {
		this.aqjcid = aqjcid;
	}
	public String getJgbh() {
		return jgbh;
	}
	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}
	public String getDwlb() {
		return dwlb;
	}
	public void setDwlb(String dwlb) {
		this.dwlb = dwlb;
	}
	
	
 
}
