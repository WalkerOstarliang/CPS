package com.chinacreator.zagl.bean.nbtj;

import com.chinacreator.common.bean.QueryBean;

public class NbtjQuery extends QueryBean {

	private static final long serialVersionUID = -2206105282421546585L;
	
	private  String orgcode;
	
	private String orgname;
	
	private String orgLeve;
	
	private  String tjsj_start;
	
	private  String tjsj_end;
	
	private String tjrq;
	
	private String dwmc;
	
	/**
	 * 重点单位标识
	 */
	private String zddwbz;
	
	/**
	 * 是否导出
	 */
	private String sfdc; 
	
	/**
	 * lx: wygs:物业公司  zdddw:重点单位
	 */
	private String lx;
	
	private String id;
	
	/**
	 * 单位分类
	 */
	private String dwfl;
	
	/**
	 * 案件类型 1:扒窃 2:入室盗窃 3：内保单位其他盗窃 4：抢劫抢夺 5:其他案件
     *       6:盗窃机动车 7:盗窃摩托车 8:盗窃电动车 9:盗窃车内财物 10:物业小区其他盗窃 
	 */
	private String ajlx;

	public String getTjsj_start() {
		return tjsj_start;
	}

	public void setTjsj_start(String tjsjStart) {
		tjsj_start = tjsjStart;
	}

	public String getTjsj_end() {
		return tjsj_end;
	}

	public void setTjsj_end(String tjsjEnd) {
		tjsj_end = tjsjEnd;
	}

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getOrgLeve() {
		return orgLeve;
	}

	public void setOrgLeve(String orgLeve) {
		this.orgLeve = orgLeve;
	}

	public String getTjrq() {
		return tjrq;
	}

	public void setTjrq(String tjrq) {
		this.tjrq = tjrq;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSfdc() {
		return sfdc;
	}

	public void setSfdc(String sfdc) {
		this.sfdc = sfdc;
	}

	public String getDwfl() {
		return dwfl;
	}

	public void setDwfl(String dwfl) {
		this.dwfl = dwfl;
	}

	public String getAjlx() {
		return ajlx;
	}

	public void setAjlx(String ajlx) {
		this.ajlx = ajlx;
	}

	public String getZddwbz() {
		return zddwbz;
	}

	public void setZddwbz(String zddwbz) {
		this.zddwbz = zddwbz;
	}
}
