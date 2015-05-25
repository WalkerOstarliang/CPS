package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.cps.bean.RkJbxxBean;

public class RkDzxxBean extends BaseValue{
	private static final long serialVersionUID = -8938355073308760047L;
	
	/**
	 * 人口基本信息
	 */
	private RkJbxxBean rk = new RkJbxxBean();
	
	/**
	 * 房屋信息
	 */
	private FwJbxxBean fw = new FwJbxxBean();

	/**
	 * 人口房屋关联
	 */
	private RkfwglBean rkfw = new RkfwglBean();

	public RkfwglBean getRkfw() {
		return rkfw;
	}

	public void setRkfw(RkfwglBean rkfw) {
		this.rkfw = rkfw;
	}

	public RkJbxxBean getRk() {
		return rk;
	}

	public void setRk(RkJbxxBean rk) {
		this.rk = rk;
	}

	public FwJbxxBean getFw() {
		return fw;
	}

	public void setFw(FwJbxxBean fw) {
		this.fw = fw;
	}
}
