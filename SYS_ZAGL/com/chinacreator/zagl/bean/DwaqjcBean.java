package com.chinacreator.zagl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 单位安全检查信息
 */
public class DwaqjcBean extends OperateBean {

	private static final long serialVersionUID = -1122718257410989437L;
	
	/**
	 * 编号
	 */
	private String jlbh;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 检查单位代码
	 */
	private String jcdwdm;
	
	/**
	 * 检查单位名称
	 */
	private String jcdwmc;
	
	/**
	 * 检查人员
	 */
	private String jcryxm;
	
	/**
	 * 检查部位
	 */
	private String jcbw;
	
	/**
	 * 检查内容
	 */
	private String jcnr;
	
	/**
	 * 发现问题
	 */
	private String fxwt;
	
	/**
	 * 检查情况
	 */
	private String jcqk;
	
	/**
	 * 检查处理情况
	 */
	private String jcclqk;
	
	/**
	 * 检查处理情况名称
	 */
	private String jcclqkmc;
	
	/**
	 * 检查处理意见
	 */
	private String jcclyj;
	
	/**
	 * 检查时间
	 */
	private String jcsj;
	
	/**
	 * 检查见证人
	 */
	private String jcjzr;
	
	/**
	 * 检查记录人
	 */
	private String jcjlr;
	
	/**
	 * 被检查单位负责人
	 */
	private String bjcdwfzr;
	
	/**
	 * 检查限期整改日期
	 */
	private String jcxqzgrq;
	
	/**
	 * 检查整改结果
	 */
	private String jczgjg;
	
	/**
	 * 被检查单位意见
	 */
	private String bjcdwyj;
	
	/**
	 * 检查备注
	 */
	private String bz;
	
	/**
	 * 行业类别
	 */
	private String hylb;
	
	/**
	 * 单位分类
	 */
	private String dwfl;
	
	/**
	 * 是否内保管理
	 */
	private String sfnbgl;
	
	/**
	 * 是否治安管理
	 */
	private String sfzagl;
	
	/**
	 * 检查类别
	 */
	private String jclb;
	
	/**
	 * 是否发现问题
	 */
	private String sffxwt;
	
	/**
	 * 是否发现问题描述
	 */
	private String sffxwtms;
	
	/**
	 * 整改情况
	 */
	private String zgqk;
	
	/**
	 * 整改情况描述
	 */
	private String zgqkms;

	public String getJlbh() {
		return jlbh;
	}

	public void setJlbh(String jlbh) {
		this.jlbh = jlbh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getJcdwdm() {
		return jcdwdm;
	}

	public void setJcdwdm(String jcdwdm) {
		this.jcdwdm = jcdwdm;
	}

	public String getJcdwmc() {
		return jcdwmc;
	}

	public void setJcdwmc(String jcdwmc) {
		this.jcdwmc = jcdwmc;
	}

	public String getJcryxm() {
		return jcryxm;
	}

	public void setJcryxm(String jcryxm) {
		this.jcryxm = jcryxm;
	}

	public String getJcbw() {
		return jcbw;
	}

	public void setJcbw(String jcbw) {
		this.jcbw = jcbw;
	}

	public String getJcnr() {
		return jcnr;
	}

	public void setJcnr(String jcnr) {
		this.jcnr = jcnr;
	}

	public String getFxwt() {
		return fxwt;
	}

	public void setFxwt(String fxwt) {
		this.fxwt = fxwt;
	}

	public String getJcqk() {
		return jcqk;
	}

	public void setJcqk(String jcqk) {
		this.jcqk = jcqk;
	}

	public String getJcclqk() {
		return jcclqk;
	}

	public void setJcclqk(String jcclqk) {
		this.jcclqk = jcclqk;
	}

	public String getJcclyj() {
		return jcclyj;
	}

	public void setJcclyj(String jcclyj) {
		this.jcclyj = jcclyj;
	}

	public String getJcsj() {
		return jcsj;
	}

	public void setJcsj(String jcsj) {
		this.jcsj = jcsj;
	}

	public String getJcjzr() {
		return jcjzr;
	}

	public void setJcjzr(String jcjzr) {
		this.jcjzr = jcjzr;
	}

	public String getJcjlr() {
		return jcjlr;
	}

	public void setJcjlr(String jcjlr) {
		this.jcjlr = jcjlr;
	}

	public String getBjcdwfzr() {
		return bjcdwfzr;
	}

	public void setBjcdwfzr(String bjcdwfzr) {
		this.bjcdwfzr = bjcdwfzr;
	}

	public String getJcxqzgrq() {
		return jcxqzgrq;
	}

	public void setJcxqzgrq(String jcxqzgrq) {
		this.jcxqzgrq = jcxqzgrq;
	}

	public String getJczgjg() {
		return jczgjg;
	}

	public void setJczgjg(String jczgjg) {
		this.jczgjg = jczgjg;
	}

	public String getBjcdwyj() {
		return bjcdwyj;
	}

	public void setBjcdwyj(String bjcdwyj) {
		this.bjcdwyj = bjcdwyj;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getJcclqkmc() {
		jcclqkmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_CLQK", this.jcclqk);
		return jcclqkmc;
	}

	public void setJcclqkmc(String jcclqkmc) {
		this.jcclqkmc = jcclqkmc;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getHylb() {
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}

	public String getDwfl() {
		return dwfl;
	}

	public void setDwfl(String dwfl) {
		this.dwfl = dwfl;
	}

	public String getSfnbgl() {
		return sfnbgl;
	}

	public void setSfnbgl(String sfnbgl) {
		this.sfnbgl = sfnbgl;
	}

	public String getSfzagl() {
		return sfzagl;
	}

	public void setSfzagl(String sfzagl) {
		this.sfzagl = sfzagl;
	}

	public String getJclb()
	{
		return jclb;
	}

	public void setJclb(String jclb)
	{
		this.jclb = jclb;
	}

	public String getSffxwt()
	{
		return sffxwt;
	}

	public void setSffxwt(String sffxwt)
	{
		this.sffxwt = sffxwt;
	}

	public String getZgqk()
	{
		return zgqk;
	}

	public void setZgqk(String zgqk)
	{
		this.zgqk = zgqk;
	}

	public String getSffxwtms()
	{
		if ("1".equals(sffxwt))
		{
			sffxwtms = "发现";
		}
		else
		{
			sffxwtms = "未发现";
		}
		return sffxwtms;
	}

	public void setSffxwtms(String sffxwtms)
	{
		this.sffxwtms = sffxwtms;
	}

	public String getZgqkms()
	{
		return zgqkms;
	}

	public void setZgqkms(String zgqkms)
	{
		this.zgqkms = zgqkms;
	}
	
}
