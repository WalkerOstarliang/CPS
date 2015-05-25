package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.cps.bean.RkJbxxBean;

public class LdrkExportBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private RkJbxxBean jbxxBean;
	
	private LdrkxxBean ldrkxxBean;
	
	private FwJbxxBean fwxxBean;

	public RkJbxxBean getJbxxBean() {
		return jbxxBean;
	}

	public void setJbxxBean(RkJbxxBean jbxxBean) {
		this.jbxxBean = jbxxBean;
	}

	public LdrkxxBean getLdrkxxBean() {
		return ldrkxxBean;
	}

	public void setLdrkxxBean(LdrkxxBean ldrkxxBean) {
		this.ldrkxxBean = ldrkxxBean;
	}

	public FwJbxxBean getFwxxBean() {
		return fwxxBean;
	}

	public void setFwxxBean(FwJbxxBean fwxxBean) {
		this.fwxxBean = fwxxBean;
	}
	
	
}
