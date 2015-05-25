package com.chinacreator.gzgl.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 派出所宣传活动统计
 */
public class PcsXcHdTjBean extends BaseValue {
	private static final long serialVersionUID = 3536973736160302101L;
	
	private String orgcode;
	
	private String orgleve;
	
	private String orgname;
	
	/**
	 * 消防安全
	 */
	private String xfaq;
	
	/**
	 * 防电信诈骗
	 */
	private String fdxzp;
	
	/**
	 * 防入室盗窃
	 */
	private String frsdq;
	
	/**
	 * 反家庭暴力
	 */
	private String fjtbl;
	
	/**
	 * 防扒窃
	 */
	private String fpq;
	
	/**
	 * 其他
	 */
	private String qt;
	
	/**
	 * 合计
	 */
	private String hj;

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getOrgleve() {
		return orgleve;
	}

	public void setOrgleve(String orgleve) {
		this.orgleve = orgleve;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getXfaq() {
		return xfaq;
	}

	public void setXfaq(String xfaq) {
		this.xfaq = xfaq;
	}

	public String getFdxzp() {
		return fdxzp;
	}

	public void setFdxzp(String fdxzp) {
		this.fdxzp = fdxzp;
	}

	public String getFrsdq() {
		return frsdq;
	}

	public void setFrsdq(String frsdq) {
		this.frsdq = frsdq;
	}

	public String getFjtbl() {
		return fjtbl;
	}

	public void setFjtbl(String fjtbl) {
		this.fjtbl = fjtbl;
	}

	public String getFpq() {
		return fpq;
	}

	public void setFpq(String fpq) {
		this.fpq = fpq;
	}

	public String getQt() {
		return qt;
	}

	public void setQt(String qt) {
		this.qt = qt;
	}

	public String getHj() {
		return hj;
	}

	public void setHj(String hj) {
		this.hj = hj;
	}
}