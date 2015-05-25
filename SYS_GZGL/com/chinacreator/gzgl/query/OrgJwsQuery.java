package com.chinacreator.gzgl.query;

import com.chinacreator.common.bean.QueryBean;

public class OrgJwsQuery extends QueryBean{
	
	/**
	 * 派出所警务室查询信息Bean
	 */
	private static final long serialVersionUID = -8756811349583269537L;
	private String bgddlx;
	private String orgcode;
	private String orgname;
	private String ispcs;
	public String getBgddlx() {
		return bgddlx;
	}
	public void setBgddlx(String bgddlx) {
		this.bgddlx = bgddlx;
	}
	public String getOrgcode() {
		return orgcode;
	}
	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}
	public String getIspcs() {
		return ispcs;
	}
	public void setIspcs(String ispcs) {
		this.ispcs = ispcs;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	

}
