package com.chinacreator.afgl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class SqjwsxxBean {
	private String orgid;
	private String orgcode;
	private String orgname;
	private String jwsdz;
	private String jwslb; // 警务室类别；一类二类三类
	private String jwslbmc; // 警务室类别；一类二类三类
	private String jwslx; // 警务室类型；社区，农村
	private String jwslxmc; // 警务室类型；社区，农村
	private String zrmj;
	private String mjlxdh;
	private String sspcsdm;
	private String sspcsmc; // 所属责任区
	private String ssxzqh; // 所属行政区划
	private String ssxzqhmc; // 所属行政区划
	private String fgdwldxm;
	private String fgdwldlxdh;

	private String zxbs;
	private String zxbsmc;
	private String zxrq;
	private String zxdwdm; // 注销信息
	private String zxdwmc;

	private String czrxm;//操作
	private String czrjh;
	private String czdwdm;
	private String czdwmc;
	private String czsj;
	
	private String gxqy; // 管辖区域
	private String bgcslx; // 办公场所类型；独立办公场所；合署办公场所
	private String bgcslxmc; // 办公场所类型；独立办公场所；合署办公场所
	private String cz;
	private String czbs;
	

	public String getJwsdz() {
		return jwsdz;
	}

	public void setJwsdz(String jwsdz) {
		this.jwsdz = jwsdz;
	}

	public String getJwslb() {
		return jwslb;
	}

	public void setJwslb(String jwslb) {
		this.jwslb = jwslb;
	}

	public String getJwslbmc() {
		if (ValidateHelper.isNotEmptyString(jwslb)) {
			jwslbmc = DictionaryCacheHellper
					.getSystemDictionaryValueByZdlbAndDm("AF_JWSLB", jwslb);
		}
		return jwslbmc;
	}

	public void setJwslbmc(String jwslbmc) {
		this.jwslbmc = jwslbmc;
	}

	public String getZxbs() {
		return zxbs;
	}

	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}

	public String getZxrq() {
		return zxrq;
	}

	public void setZxrq(String zxrq) {
		this.zxrq = zxrq;
	}

	public String getBgcslx() {
		return bgcslx;
	}

	public void setBgcslx(String bgcslx) {
		this.bgcslx = bgcslx;
	}

	public String getBgcslxmc() {
		if (ValidateHelper.isNotEmptyString(bgcslx)) {
			bgcslxmc = DictionaryCacheHellper
					.getSystemDictionaryValueByZdlbAndDm("AF_BGCSLX", bgcslx);
		}
		return bgcslxmc;
	}

	public void setBgcslxmc(String bgcslxmc) {
		this.bgcslxmc = bgcslxmc;
	}

	public String getCz() {
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getCzbs() {
		return czbs;
	}

	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

	public String getZxbsmc() {
		return zxbsmc;
	}

	public void setZxbsmc(String zxbsmc) {
		this.zxbsmc = zxbsmc;
	}

	public String getGxqy() {
		return gxqy;
	}

	public void setGxqy(String gxqy) {
		this.gxqy = gxqy;
	}
	public String getJwslx() {
		return jwslx;
	}

	public void setJwslx(String jwslx) {
		this.jwslx = jwslx;
	}

	public String getJwslxmc() {
		if (ValidateHelper.isNotEmptyString(jwslx)) {
			jwslxmc = DictionaryCacheHellper
					.getSystemDictionaryValueByZdlbAndDm("AF_JWSLX", jwslx);
		}
		return jwslxmc;
	}

	public void setJwslxmc(String jwslxmc) {
		this.jwslxmc = jwslxmc;
	}

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

	public String getZrmj() {
		return zrmj;
	}

	public void setZrmj(String zrmj) {
		this.zrmj = zrmj;
	}

	public String getMjlxdh() {
		return mjlxdh;
	}

	public void setMjlxdh(String mjlxdh) {
		this.mjlxdh = mjlxdh;
	}

	public String getSspcsdm() {
		return sspcsdm;
	}

	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}

	public String getSspcsmc() {
		return sspcsmc;
	}

	public void setSspcsmc(String sspcsmc) {
		this.sspcsmc = sspcsmc;
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

	public String getFgdwldlxdh() {
		return fgdwldlxdh;
	}

	public void setFgdwldlxdh(String fgdwldlxdh) {
		this.fgdwldlxdh = fgdwldlxdh;
	}

	public String getZxdwdm() {
		return zxdwdm;
	}

	public void setZxdwdm(String zxdwdm) {
		this.zxdwdm = zxdwdm;
	}

	public String getCzrxm() {
		return czrxm;
	}

	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}

	public String getCzrjh() {
		return czrjh;
	}

	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
	}

	public String getCzdwdm() {
		return czdwdm;
	}

	public void setCzdwdm(String czdwdm) {
		this.czdwdm = czdwdm;
	}

	public String getCzdwmc() {
		return czdwmc;
	}

	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}

	public String getCzsj() {
		return czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public String getSsxzqhmc() {
		if (ValidateHelper.isNotEmptyString(ssxzqh)) {
			ssxzqhmc = DictionaryCacheHellper
					.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", ssxzqh);
		}
		return ssxzqhmc;
	}

	public void setSsxzqhmc(String ssxzqhmc) {
		this.ssxzqhmc = ssxzqhmc;
	}

	public String getZxdwmc() {
		return zxdwmc;
	}

	public void setZxdwmc(String zxdwmc) {
		this.zxdwmc = zxdwmc;
	}

}
