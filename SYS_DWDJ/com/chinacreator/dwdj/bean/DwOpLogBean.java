package com.chinacreator.dwdj.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 单位操作记录
 */
public class DwOpLogBean extends BaseValue {

	private static final long serialVersionUID = -3188390811543091230L;
	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 业务系统主键
	 */
	private String ywxtzj;
	
	/**
	 * 业务系统类型
	 */
	private String ywxtlx;
	
	/**
	 * 操作时间
	 */
	private String czsj;
	
	/**
	 * 操作人身份证
	 */
	private String czrsfzh;
	
	/**
	 * 操作人姓名
	 */
	private String czrxm;
	
	/**
	 * 操作单位代码
	 */
	private String czdwdm;
	
	/**
	 * 操作单位名称
	 */
	private String czdwmc;
	
	/**
	 * 派发单位代码
	 */
	private String pfdwdm;
	
	/**
	 * 派发单位名称
	 */
	private String pfdwmc;
	
	/**
	 * 操作状态
	 */
	private String czzt;
	
	/**
	 * 退回原因
	 */
	private String thyy;
	
	/**
	 * 被派发到的单位代码
	 */
	private String mbdwdm;
	
	/**
	 * 被派发到的单位名称
	 */
	private String mbdwmc;
	
	/**
	 * 签收后的地址
	 */
	private String qsdz;
	
	/**
	 * 签收后的单位名称
	 */
	private String qsdw;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getYwxtzj() {
		return ywxtzj;
	}

	public void setYwxtzj(String ywxtzj) {
		this.ywxtzj = ywxtzj;
	}

	public String getCzsj() {
		return czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public String getCzrsfzh() {
		return czrsfzh;
	}

	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
	}

	public String getCzrxm() {
		return czrxm;
	}

	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
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

	public String getCzzt() {
		return czzt;
	}

	public void setCzzt(String czzt) {
		this.czzt = czzt;
	}

	public String getThyy() {
		return thyy;
	}

	public void setThyy(String thyy) {
		this.thyy = thyy;
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

	public String getYwxtlx() {
		return ywxtlx;
	}

	public void setYwxtlx(String ywxtlx) {
		this.ywxtlx = ywxtlx;
	}

	public String getQsdz() {
		return qsdz;
	}

	public void setQsdz(String qsdz) {
		this.qsdz = qsdz;
	}

	public String getQsdw() {
		return qsdw;
	}

	public void setQsdw(String qsdw) {
		this.qsdw = qsdw;
	}
}
