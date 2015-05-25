package com.chinacreator.zdry.bean;

import java.io.File;
import java.sql.Blob;
import java.util.Date;

import com.chinacreator.common.bean.BaseValue;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(照片信息实体类)
 * @date Mar 20, 2013 9:21:30 AM
 */
public class Zpxx extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7078030465544455685L;
	private String id;
	private String sfzh;
	private Date pzrq;
	private String zpms;
	private Blob zp;
	private File upload;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public Date getPzrq() {
		return pzrq;
	}

	public void setPzrq(Date pzrq) {
		this.pzrq = pzrq;
	}

	public String getZpms() {
		return zpms;
	}

	public void setZpms(String zpms) {
		this.zpms = zpms;
	}

	public Blob getZp() {
		return zp;
	}

	public void setZp(Blob zp) {
		this.zp = zp;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}
}
