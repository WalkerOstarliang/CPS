package com.chinacreator.zagl.bean.nbtj;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.ValidateHelper;
/**
 * 物业小区发案统计
 */
public class WyxqFaTj extends BaseValue {

	private static final long serialVersionUID = 8382317195553927905L;
	
	/**
	 * 单位代码
	 */
	private String orgCode;
	
	/**
	 * 单位名称
	 */
	private String orgName;
	
	/**
	 * 单位级别
	 */
	private String orgLeve;
	
	/**
	 * 抢劫抢夺
	 */
	private String qjqd;
	
	/**
	 * 入室盗窃
	 */
	private String rsdq;
	
	/**
	 * 盗窃机动车
	 */
	private String dqjdc;
	
	/**
	 * 盗窃摩托车
	 */
	private String dqmtc;
	
	/**
	 * 盗窃电动车
	 */
	private String dqddc;
	
	/**
	 * 盗窃车内财物
	 */
	private String dqcncw;
	
	/**
	 * 其他盗窃
	 */
	private String qtdq;
	
	/**
	 * 本月总数
	 */
	private  String  byzs;
	
	/**
	 * 上月总数
	 */
	private  String  syzs;
	
	/**
	 * 环比上月
	 */
	private String hb;

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getOrgName() {
		if(ValidateHelper.isEmptyString(orgCode)){
			orgName = "合计";
		}
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getQjqd() {
		return qjqd;
	}

	public void setQjqd(String qjqd) {
		this.qjqd = qjqd;
	}

	public String getRsdq() {
		return rsdq;
	}

	public void setRsdq(String rsdq) {
		this.rsdq = rsdq;
	}

	public String getDqjdc() {
		return dqjdc;
	}

	public void setDqjdc(String dqjdc) {
		this.dqjdc = dqjdc;
	}

	public String getDqmtc() {
		return dqmtc;
	}

	public void setDqmtc(String dqmtc) {
		this.dqmtc = dqmtc;
	}

	public String getDqddc() {
		return dqddc;
	}

	public void setDqddc(String dqddc) {
		this.dqddc = dqddc;
	}

	public String getDqcncw() {
		return dqcncw;
	}

	public void setDqcncw(String dqcncw) {
		this.dqcncw = dqcncw;
	}

	public String getQtdq() {
		return qtdq;
	}

	public void setQtdq(String qtdq) {
		this.qtdq = qtdq;
	}

	public String getByzs() {
		return byzs;
	}

	public void setByzs(String byzs) {
		this.byzs = byzs;
	}

	public String getSyzs() {
		return syzs;
	}

	public void setSyzs(String syzs) {
		this.syzs = syzs;
	}

	public String getHb() {
		return hb;
	}

	public void setHb(String hb) {
		this.hb = hb;
	}

	public String getOrgLeve() {
		return orgLeve;
	}

	public void setOrgLeve(String orgLeve) {
		this.orgLeve = orgLeve;
	}
}
