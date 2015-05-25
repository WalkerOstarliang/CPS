package com.chinacreator.khkp.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 两实数据统计
 */
public class LssjTjBean extends BaseValue {

	private static final long serialVersionUID = 3626403867099169374L;
	
	/**
	 * 单位代码
	 */
	private String orgcode;
	
	/**
	 * 机构名称
	 */
	private String orgname; 
	
	/**
	 * 数量
	 */
	private String sl;

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getSl() {
		return sl;
	}

	public void setSl(String sl) {
		this.sl = sl;
	}

}
