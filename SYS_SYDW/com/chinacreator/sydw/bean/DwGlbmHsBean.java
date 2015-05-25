package com.chinacreator.sydw.bean;

import java.io.Serializable;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class DwGlbmHsBean implements Serializable 
{

	private static final long serialVersionUID = 7853255717818914658L;

	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 单位分类
	 */
	private String dwfl;
	
	/**
	 * 管理部门
	 */
	private String glbm;
	
	/**
	 * 是否管理
	 */
	private String sfgl;
	
	/**
	 * 管理部门描述
	 */
	private String glbmms;
	
	/**
	 * 内保核查
	 */
	private String nbhc;
	
	/**
	 * 治安核查
	 */
	private String zahc;
	
	/**
	 * 消防核查
	 */
	private String xfhc;
	
	/**
	 * 网监核查
	 */
	private String wjhc;
	
	/**
	 * 核查人姓名
	 */
	private String hcrxm;
	
	/**
	 * 核查人警号
	 */
	private String hcrjh;
	
	/**
	 * 核查人身份证号
	 */
	private String hcrsfzh;
	
	/**
	 * 核查单位代码
	 */
	private String hcdwdm;
	
	/**
	 * 核查单位名称
	 */
	private String hcdwmc;
	
	/**
	 * 核查时间
	 */
	private String hcsj;
	
	/**
	 * 重点单位标识
	 */
	private String zddwbz;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getGlbm() {
		return glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public String getNbhc() {
		return nbhc;
	}

	public void setNbhc(String nbhc) {
		this.nbhc = nbhc;
	}

	public String getZahc() {
		return zahc;
	}

	public void setZahc(String zahc) {
		this.zahc = zahc;
	}

	public String getXfhc() {
		return xfhc;
	}

	public void setXfhc(String xfhc) {
		this.xfhc = xfhc;
	}

	public String getWjhc() {
		return wjhc;
	}

	public void setWjhc(String wjhc) {
		this.wjhc = wjhc;
	}

	public String getHcrxm() {
		return hcrxm;
	}

	public void setHcrxm(String hcrxm) {
		this.hcrxm = hcrxm;
	}

	public String getHcrjh() {
		return hcrjh;
	}

	public void setHcrjh(String hcrjh) {
		this.hcrjh = hcrjh;
	}

	public String getHcrsfzh() {
		return hcrsfzh;
	}

	public void setHcrsfzh(String hcrsfzh) {
		this.hcrsfzh = hcrsfzh;
	}

	public String getHcdwdm() {
		return hcdwdm;
	}

	public void setHcdwdm(String hcdwdm) {
		this.hcdwdm = hcdwdm;
	}

	public String getHcdwmc() {
		return hcdwmc;
	}

	public void setHcdwmc(String hcdwmc) {
		this.hcdwmc = hcdwmc;
	}

	public String getHcsj() {
		return hcsj;
	}

	public void setHcsj(String hcsj) {
		this.hcsj = hcsj;
	}

	public String getDwfl() {
		return dwfl;
	}

	public void setDwfl(String dwfl) {
		this.dwfl = dwfl;
	}

	public String getGlbmms() {
		if(ValidateHelper.isNotEmptyString(this.glbm)){
			glbmms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_GLBM", this.glbm);
		}
		return glbmms;
	}

	public void setGlbmms(String glbmms) {
		this.glbmms = glbmms;
	}

	public String getSfgl() {
		return sfgl;
	}

	public void setSfgl(String sfgl) {
		this.sfgl = sfgl;
	}

	public String getZddwbz() {
		return zddwbz;
	}

	public void setZddwbz(String zddwbz) {
		this.zddwbz = zddwbz;
	}
}
