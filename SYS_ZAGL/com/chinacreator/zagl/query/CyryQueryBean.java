package com.chinacreator.zagl.query;

import com.chinacreator.common.bean.QueryBean;

public class CyryQueryBean extends QueryBean{

	private static final long serialVersionUID = 1228499175841138766L;
	
	/**
	 * 从业人员编号
	 */
	private String cyrybh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 姓名
	 */
	private String xm;
	
	/**
	 * 身份证号码
	 */
	private String sfzh;
	
	/**
	 * 单位名称
	 */
	private String jgmc;
	
	/**
	 * 注销标识
	 */
	private String zxbs;
	
	/**
	 * 人员编号
	 */
	private String rybh;
	
	/**
	 * 是否安保人员
	 */
	private String sfabry;
	
	/**
	 * 职务
	 */
	private String zwlb;
	
	/**
	 * 登记时间开始时间
	 */
	private String djsj_start;
	
	/**
	 * 登记时间结束时间
	 */
	private String djsj_end;
	
	private String ywx;
	
	private String ywm;
	
	private String gj;
	
	private String zjzl;
	
	private String zjhm;
	
	private String sfjwry;
	
	private String sfjwtdj ; // 数据来源标识 0：内网PC登记 1：警务通登记  2：外网平台登记
	
	public String getSfjwtdj() {
		return sfjwtdj;
	}

	public void setSfjwtdj(String sfjwtdj) {
		this.sfjwtdj = sfjwtdj;
	}

	public String getRybh() {
		return rybh;
	}

	public void setRybh(String rybh) {
		this.rybh = rybh;
	}

	public String getCyrybh() {
		return cyrybh;
	}

	public void setCyrybh(String cyrybh) {
		this.cyrybh = cyrybh;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getJgmc() {
		return jgmc;
	}

	public void setJgmc(String jgmc) {
		this.jgmc = jgmc;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getZxbs() {
		return zxbs;
	}

	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}

	public String getSfabry() {
		return sfabry;
	}

	public void setSfabry(String sfabry) {
		this.sfabry = sfabry;
	}

	public String getZwlb() {
		return zwlb;
	}

	public void setZwlb(String zwlb) {
		this.zwlb = zwlb;
	}

	public String getDjsj_start() {
		return djsj_start;
	}

	public void setDjsj_start(String djsj_start) {
		this.djsj_start = djsj_start;
	}

	public String getDjsj_end() {
		return djsj_end;
	}

	public void setDjsj_end(String djsj_end) {
		this.djsj_end = djsj_end;
	}

	public String getYwx()
	{
		return ywx;
	}

	public void setYwx(String ywx)
	{
		this.ywx = ywx;
	}

	public String getYwm()
	{
		return ywm;
	}

	public void setYwm(String ywm)
	{
		this.ywm = ywm;
	}

	public String getGj()
	{
		return gj;
	}

	public void setGj(String gj)
	{
		this.gj = gj;
	}

	public String getZjzl()
	{
		return zjzl;
	}

	public void setZjzl(String zjzl)
	{
		this.zjzl = zjzl;
	}

	public String getZjhm()
	{
		return zjhm;
	}

	public void setZjhm(String zjhm)
	{
		this.zjhm = zjhm;
	}

	public String getSfjwry()
	{
		return sfjwry;
	}

	public void setSfjwry(String sfjwry)
	{
		this.sfjwry = sfjwry;
	}
	
	
}
