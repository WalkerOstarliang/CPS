package com.chinacreator.zagl.bean;

import java.io.File;

import com.chinacreator.common.bean.BaseValue;


public class DwzpxxBean extends BaseValue{

	private static final long serialVersionUID = 3192189381832041691L;
	
	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 照片
	 */
	private File zp;
	
	private File [] zps;
	
	private String [] zpsFileName;
	
	private String[] zpsContentType;
	
	/**
	 * 描述
	 */
	private String ms;
	
	/**
	 * 登记人姓名
	 */
	private String djrxm;
	
	/**
	 * 登记时间
	 */
	private String djsj;
	
	/**
	 * 登记单位名称
	 */
	private String djdwmc;
	
	/**
	 * 登记单位代码
	 */
	private String djdwdm;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public File getZp() {
		return zp;
	}

	public void setZp(File zp) {
		this.zp = zp;
	}

	public String getDjsj() {
		return djsj;
	}

	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}

	public String getMs() {
		return ms;
	}

	public void setMs(String ms) {
		this.ms = ms;
	}

	public String getDjrxm() {
		return djrxm;
	}

	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}

	public String getDjdwmc() {
		return djdwmc;
	}

	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}

	public String getDjdwdm() {
		return djdwdm;
	}

	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}

	public File[] getZps() {
		return zps;
	}

	public void setZps(File[] zps) {
		this.zps = zps;
	}

	public String[] getZpsFileName() {
		return zpsFileName;
	}

	public void setZpsFileName(String[] zpsFileName) {
		this.zpsFileName = zpsFileName;
	}

	public String[] getZpsContentType() {
		return zpsContentType;
	}

	public void setZpsContentType(String[] zpsContentType) {
		this.zpsContentType = zpsContentType;
	}
	
}
