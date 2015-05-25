package com.chinacreator.dwdj.bean;

import java.io.Serializable;

import com.chinacreator.zagl.bean.DwfwglBean;

//单位签收信息
public class DwQsBean implements Serializable {

	private static final long serialVersionUID = -4384760214017841482L;

	//单位基本信息
	private DwBaseBean dwxx = new DwBaseBean();
	
	//单位操作bean
	private DwOpLogBean log = new DwOpLogBean();
	
	//单位房屋关联
	private DwfwglBean dwfwgl = new DwfwglBean();

	public DwBaseBean getDwxx() {
		return dwxx;
	}

	public void setDwxx(DwBaseBean dwxx) {
		this.dwxx = dwxx;
	}

	public DwOpLogBean getLog() {
		return log;
	}

	public void setLog(DwOpLogBean log) {
		this.log = log;
	}

	public DwfwglBean getDwfwgl() {
		return dwfwgl;
	}

	public void setDwfwgl(DwfwglBean dwfwgl) {
		this.dwfwgl = dwfwgl;
	}
	
}
