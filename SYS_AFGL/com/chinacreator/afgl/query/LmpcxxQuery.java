package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;

public class LmpcxxQuery extends QueryBean{

	/**
	 * 路面盘查查询bean
	 */
	private static final long serialVersionUID = 7780261561930145523L;
	private String jlbh;
	private String pcdd; //盘查地点
	private String pcsj_from;
	private String pcsj_to;
	private String pcdxxm;
	private String pcdxsfzh;
	private String djrxm;
	private String djrjh;
	private String yxx;  // 有效性
	private String querydwdm; // 查询单位代码
	public String getQuerydwdm() {
		return querydwdm;
	}
	public void setQuerydwdm(String querydwdm) {
		this.querydwdm = querydwdm;
	}
	public String getYxx() {
		return yxx;
	}
	public void setYxx(String yxx) {
		this.yxx = yxx;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}
	public String getPcdxxm() {
		return pcdxxm;
	}
	public void setPcdxxm(String pcdxxm) {
		this.pcdxxm = pcdxxm;
	}
	public String getPcdxsfzh() {
		return pcdxsfzh;
	}
	public void setPcdxsfzh(String pcdxsfzh) {
		this.pcdxsfzh = pcdxsfzh;
	}
	public String getPcdd() {
		return pcdd;
	}
	public void setPcdd(String pcdd) {
		this.pcdd = pcdd;
	}
	public String getPcsj_from() {
		return pcsj_from;
	}
	public void setPcsj_from(String pcsj_from) {
		this.pcsj_from = pcsj_from;
	}
	public String getPcsj_to() {
		return pcsj_to;
	}
	public void setPcsj_to(String pcsj_to) {
		this.pcsj_to = pcsj_to;
	}
	public String getJlbh() {
		return jlbh;
	}
	public void setJlbh(String jlbh) {
		this.jlbh = jlbh;
	}
	

}
