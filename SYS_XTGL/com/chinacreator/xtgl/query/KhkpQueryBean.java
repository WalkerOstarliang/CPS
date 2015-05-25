package com.chinacreator.xtgl.query;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class KhkpQueryBean extends QueryBean {

	private static final long serialVersionUID = -7394033854440413658L;
	
	
	/**
	 * 统计月份
	 */
	private String tjsj;
	private String tjsjms;
	
	/**
	 * 统计阶段
	 */
	private String tjsjfw;
	
	/**
	 * 统计级别：市局、分县局、派出所、警务区
	 */
	private String tjjb;
	
	/**
	 * 统计类别：大类、细类
	 */
	private String tjlb;
	
	/**
	 * 考核单位
	 */
	private String khdwdm;
	private String khdwmc;
	
	/**
	 * 统计开始时间
	 */
	private String tjkssj;
	
	/**
	 * 统计结束时间
	 */
	private String tjjssj;
	
	/**
	 * 排序字段
	 */
	private String order_sn;
	
	/**
	 * 机构级别
	 */
	private String orgLeve; 
	
	/**
	 * 警务区分类
	 */
	private String jwqfl;
	
	/**
	 * 派出所等级
	 */
	private String pcsdj;

	public String getTjjb() {
		return tjjb;
	}

	public void setTjjb(String tjjb) {
		this.tjjb = tjjb;
	}

	public String getTjlb() {
		return tjlb;
	}

	public void setTjlb(String tjlb) {
		this.tjlb = tjlb;
	}

	public String getKhdwdm() {
		return khdwdm;
	}

	public void setKhdwdm(String khdwdm) {
		this.khdwdm = khdwdm;
	}

	public String getTjsj() {
		return tjsj;
	}

	public void setTjsj(String tjsj) {
		this.tjsj = tjsj;
	}

	public String getTjsjfw() {
		return tjsjfw;
	}

	public void setTjsjfw(String tjsjfw) {
		this.tjsjfw = tjsjfw;
	}

	public String getOrder_sn() {
		return order_sn;
	}

	public void setOrder_sn(String order_sn) {
		this.order_sn = order_sn;
	}

	public String getOrgLeve() {
		return orgLeve;
	}

	public void setOrgLeve(String orgLeve) {
		this.orgLeve = orgLeve;
	}

	public String getTjkssj() {
		return tjkssj;
	}

	public void setTjkssj(String tjkssj) {
		this.tjkssj = tjkssj;
	}

	public String getTjjssj() {
		return tjjssj;
	}

	public void setTjjssj(String tjjssj) {
		this.tjjssj = tjjssj;
	}

	public String getJwqfl() {
		return jwqfl;
	}

	public void setJwqfl(String jwqfl) {
		this.jwqfl = jwqfl;
	}

	public String getPcsdj() {
		return pcsdj;
	}

	public void setPcsdj(String pcsdj) {
		this.pcsdj = pcsdj;
	}

	public String getKhdwmc() {
		if(ValidateHelper.isNotEmptyString(this.khdwdm)){
			khdwmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(this.khdwdm);
		}
		return khdwmc;
	}

	public void setKhdwmc(String khdwmc) {
		this.khdwmc = khdwmc;
	}

	public String getTjsjms() {
		if(ValidateHelper.isNotEmptyString(this.tjsj)){
			tjsjms = this.tjsj.split("-")[0] + "年" 
					+ this.tjsj.split("-")[1] + "月";
		}
		return tjsjms;
	}

	public void setTjsjms(String tjsjms) {
		this.tjsjms = tjsjms;
	}
	
}
