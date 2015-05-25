package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;

public class SqjwsxxQuery extends QueryBean {

	private static final long serialVersionUID = 2255842038447633107L;

	private String orgid;
	private String orgname;
	private String jwslb; // 警务室类别；一类二类三类
	private String zrmj;
	private String sspcsdm;
	private String ssxzqh;
	private String fgdwldxm;
	private String czrxm;
	private String czdwmc;
	private String czsj_from;
	private String czsj_to;
	private String bgcslx; // 办公场所类型；独立办公场所；合署办公场所

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getJwslb() {
		return jwslb;
	}

	public void setJwslb(String jwslb) {
		this.jwslb = jwslb;
	}

	public String getZrmj() {
		return zrmj;
	}

	public void setZrmj(String zrmj) {
		this.zrmj = zrmj;
	}

	public String getSspcsdm() {
		return sspcsdm;
	}

	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}

	public String getSsxzqh() {
		return ssxzqh;
	}

	public void setSsxzqh(String ssxzqh) {
		this.ssxzqh = ssxzqh;
	}

	public String getFgdwldxm() {
		return fgdwldxm;
	}

	public void setFgdwldxm(String fgdwldxm) {
		this.fgdwldxm = fgdwldxm;
	}

	public String getCzrxm() {
		return czrxm;
	}

	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}

	public String getCzdwmc() {
		return czdwmc;
	}

	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}

	public String getCzsj_from() {
		return czsj_from;
	}

	public void setCzsj_from(String czsj_from) {
		this.czsj_from = czsj_from;
	}

	public String getCzsj_to() {
		return czsj_to;
	}

	public void setCzsj_to(String czsj_to) {
		this.czsj_to = czsj_to;
	}

	public String getBgcslx() {
		return bgcslx;
	}

	public void setBgcslx(String bgcslx) {
		this.bgcslx = bgcslx;
	}

}
