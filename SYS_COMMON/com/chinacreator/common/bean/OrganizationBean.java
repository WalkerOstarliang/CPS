package com.chinacreator.common.bean;

import com.chinacreator.common.bean.BaseValue;

public class OrganizationBean extends BaseValue
{
	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= -4613892649151232945L;

	private String orgid;
	
	private String orgcode;
	
	private String orgname;
	
	private String parent_code;
	
	private String orgjc;

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

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

	public String getParent_code() {
		return parent_code;
	}

	public void setParent_code(String parentCode) {
		parent_code = parentCode;
	}

	public String getOrgjc() {
		return orgjc;
	}

	public void setOrgjc(String orgjc) {
		this.orgjc = orgjc;
	}
	
}
