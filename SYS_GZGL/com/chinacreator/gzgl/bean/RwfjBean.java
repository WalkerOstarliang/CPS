package com.chinacreator.gzgl.bean;



import java.io.File;

import com.chinacreator.common.bean.BaseValue;

public class RwfjBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3379818501608710216L;
	private String id;
	private String title;
	private String fjlx;
	private File fj;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFjlx() {
		return fjlx;
	}
	public void setFjlx(String fjlx) {
		this.fjlx = fjlx;
	}
	public File getFj() {
		return fj;
	}
	public void setFj(File fj) {
		this.fj = fj;
	}
	
	

}
