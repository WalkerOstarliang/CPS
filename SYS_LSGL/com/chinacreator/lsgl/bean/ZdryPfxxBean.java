package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 重点人员派发信息
 */
public class ZdryPfxxBean extends BaseValue {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 主键ID
	 */
	 private String id;
	 /**
	  * 重点人员编号
	  */
	 private String zdrybh;
	 
	 /**
	  * 身份证号
	  */
	 private String sfzh;
	 
	 /**
	  * 派发人姓名
	  */
	 private String pfrxm;
	 
	 /**
	  * 派发人警号
	  */
	 private String pfrjh;
	 
	 /**
	  * 派发单位代码
	  */
	 private String pfdwdm;
	 
	 /**
	  * 派发单位名称
	  */
	 private String pfdwmc;
	 
	 /**
	  * 派发单位级别
	  */
	 private String pfdwdj;
	 
	 /**
	  * 目标单位代码
	  */
	 private String mbdwdm;
	 
	 /**
	  * 目标单位名称
	  */
	 private String mbdwmc;
	 
	 /**
	  * 行政社区代码
	  */
	 private String xzsqdm;
	 
	 /**
	  * 行政社区名称
	  */
	 private String xzsqmc;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPfrxm() {
		return pfrxm;
	}

	public void setPfrxm(String pfrxm) {
		this.pfrxm = pfrxm;
	}

	public String getPfrjh() {
		return pfrjh;
	}

	public void setPfrjh(String pfrjh) {
		this.pfrjh = pfrjh;
	}

	public String getPfdwdm() {
		return pfdwdm;
	}

	public void setPfdwdm(String pfdwdm) {
		this.pfdwdm = pfdwdm;
	}

	public String getPfdwmc() {
		return pfdwmc;
	}

	public void setPfdwmc(String pfdwmc) {
		this.pfdwmc = pfdwmc;
	}

	public String getPfdwdj() {
		return pfdwdj;
	}

	public void setPfdwdj(String pfdwdj) {
		this.pfdwdj = pfdwdj;
	}

	public String getMbdwdm() {
		return mbdwdm;
	}

	public void setMbdwdm(String mbdwdm) {
		this.mbdwdm = mbdwdm;
	}

	public String getMbdwmc() {
		return mbdwmc;
	}

	public void setMbdwmc(String mbdwmc) {
		this.mbdwmc = mbdwmc;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getZdrybh() {
		return zdrybh;
	}

	public void setZdrybh(String zdrybh) {
		this.zdrybh = zdrybh;
	}

	public String getXzsqdm() {
		return xzsqdm;
	}

	public void setXzsqdm(String xzsqdm) {
		this.xzsqdm = xzsqdm;
	}

	public String getXzsqmc() {
		return xzsqmc;
	}

	public void setXzsqmc(String xzsqmc) {
		this.xzsqmc = xzsqmc;
	}
}
