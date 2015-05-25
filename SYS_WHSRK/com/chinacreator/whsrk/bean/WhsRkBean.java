package com.chinacreator.whsrk.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.OperateBean;

/**
 * 未核实人口信息
 */
public class WhsRkBean extends OperateBean {
	private static final long serialVersionUID = -6485770363622669653L;
	/**
	 * csrk_st表ID
	 */
	private String rkid;
	
	/**
	 * 所属社区代码
	 */
	private String sssqdm;
	
	/**
	 * 所属社区名称
	 */
	private String sssqmc;
	
	/**
	 * 所属单位代码
	 */
	private String ssdwdm;
	
	/**
	 * 所属单位名称
	 */
	private String ssdwmc;
	
	/**
	 * 操作状态
	 */
	private String czzt;
	private String czztms;
	
	/**
	 * 操作时间
	 */
	private String czsj;
	
	/**
	 * 反馈状态
	 */
	private String fkzt;
	private String fkztms;
	
	/**
	 * 反馈时间
	 */
	private String fksj;
	
	/**
	 * 是否登记实有人口
	 */
	private String sfdjsyrk;
	
	/**
	 * 入库时间
	 */
	private String rksj;
	
	/**
	 * 住址详址
	 */
	private String zzxz;
	
	/**
	 * 姓名
	 */
	private String xm;
	
	/**
	 * 性别
	 */
	private String xb;
	private String xbms;
	
	/**
	 * 出生日期
	 */
	private String csrq;
	
	/**
	 * 身份证
	 */
	private String sfhm;
	
	/**
	 * 联系方式
	 */
	private String lxfs;
	
	/**
	 * 户籍地
	 */
	private String hjdxz;

	public String getRkid() {
		return rkid;
	}

	public void setRkid(String rkid) {
		this.rkid = rkid;
	}

	public String getSssqdm() {
		return sssqdm;
	}

	public void setSssqdm(String sssqdm) {
		this.sssqdm = sssqdm;
	}

	public String getSssqmc() {
		return sssqmc;
	}

	public void setSssqmc(String sssqmc) {
		this.sssqmc = sssqmc;
	}

	public String getSsdwdm() {
		return ssdwdm;
	}

	public void setSsdwdm(String ssdwdm) {
		this.ssdwdm = ssdwdm;
	}

	public String getSsdwmc() {
		return ssdwmc;
	}

	public void setSsdwmc(String ssdwmc) {
		this.ssdwmc = ssdwmc;
	}

	public String getCzzt() {
		return czzt;
	}

	public void setCzzt(String czzt) {
		this.czzt = czzt;
	}

	public String getCzsj() {
		return czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public String getFkzt() {
		return fkzt;
	}

	public void setFkzt(String fkzt) {
		this.fkzt = fkzt;
	}

	public String getFksj() {
		return fksj;
	}

	public void setFksj(String fksj) {
		this.fksj = fksj;
	}

	public String getSfdjsyrk() {
		return sfdjsyrk;
	}

	public void setSfdjsyrk(String sfdjsyrk) {
		this.sfdjsyrk = sfdjsyrk;
	}

	public String getRksj() {
		return rksj;
	}

	public void setRksj(String rksj) {
		this.rksj = rksj;
	}

	public String getZzxz() {
		return zzxz;
	}

	public void setZzxz(String zzxz) {
		this.zzxz = zzxz;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getXb() {
		return xb;
	}

	public void setXb(String xb) {
		this.xb = xb;
	}

	public String getXbms() {
		if(ValidateHelper.isNotEmptyString(xb)){
			xbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		}
		return xbms;
	}

	public void setXbms(String xbms) {
		this.xbms = xbms;
	}

	public String getCsrq() {
		return csrq;
	}

	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}

	public String getSfhm() {
		return sfhm;
	}

	public void setSfhm(String sfhm) {
		this.sfhm = sfhm;
	}

	public String getCzztms() {
		if("0".equals(czzt)){
			czztms = "<span style='color:red'>未派发</span>";
		}else if("1".equals(czzt)){
			czztms = "<span style='color:green'>已派发</span>";
		}else if("2".equals(czzt)){
			czztms = "已退回";
		}
		return czztms;
	}

	public void setCzztms(String czztms) {
		this.czztms = czztms;
	}

	public String getFkztms() {
		if("0".equals(fkzt)){
			fkztms = "未反馈";
		}else if("1".equals(fkzt)){
			fkztms = "已反馈";
		}
		return fkztms;
	}

	public void setFkztms(String fkztms) {
		this.fkztms = fkztms;
	}

	public String getLxfs() {
		return lxfs;
	}

	public void setLxfs(String lxfs) {
		this.lxfs = lxfs;
	}

	public String getHjdxz() {
		return hjdxz;
	}

	public void setHjdxz(String hjdxz) {
		this.hjdxz = hjdxz;
	}
}
