package com.chinacreator.gzgl.bean;

import java.io.File;

import com.chinacreator.zagl.bean.OperateBean;

/**
 * 宣传活动照片
 */
public class PcsXcHdZpBean extends OperateBean {

	private static final long serialVersionUID = 6132156023082355154L;
	
	private String id;
	
	/**
	 * 活动ID
	 */
	private String hdid;
	
	/**
	 * 照片
	 */
	private File zp;  

	/**
	 * 标题
	 */
	private String zpFileName;
	
	private String zpContentType;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHdid() {
		return hdid;
	}

	public void setHdid(String hdid) {
		this.hdid = hdid;
	}

	public File getZp() {
		return zp;
	}

	public void setZp(File zp) {
		this.zp = zp;
	}

	public String getZpFileName() {
		return zpFileName;
	}

	public void setZpFileName(String zpFileName) {
		this.zpFileName = zpFileName;
	}

	public String getZpContentType() {
		return zpContentType;
	}

	public void setZpContentType(String zpContentType) {
		this.zpContentType = zpContentType;
	}
}
