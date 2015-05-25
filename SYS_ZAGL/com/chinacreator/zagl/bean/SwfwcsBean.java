package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 上网服务场所
 */
public class SwfwcsBean extends BaseValue{

	private static final long serialVersionUID = -230140676969426795L;
	
	/**
	 * 主键ID
	 */
	private String jlbh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 网吧编号
	 */
	private String wbbh;
	
	/**
	 * 网络文化经营许可证号
	 */
	private String wlwhxkzh;
	
	/**
	 * 宽带接入服务商
	 */
	private String kdjrfws;
	
	/**
	 * 电脑台数
	 */
	private String dnts;
	
	/**
	 * 营业面积
	 */
	private String yymj;
	
	/**
	 * 网络安全审核意见书号
	 */
	private String wlaqshyjsh;
	
	/**
	 * 临时上网卡数量
	 */
	private String lsswksl;
	
	/**
	 * 接入方式
	 */
	private String jrfs;
	
	private String jrfsmc;
	
	/**
	 * 消防审核意见书号
	 */
	private String xfshyjsh;
	
	/**
	 * 现使用IP
	 */
	private String xsyip;
	
	/**
	 * 备注
	 */
	private String bz;

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getWbbh() {
		return wbbh;
	}

	public void setWbbh(String wbbh) {
		this.wbbh = wbbh;
	}

	public String getWlwhxkzh() {
		return wlwhxkzh;
	}

	public void setWlwhxkzh(String wlwhxkzh) {
		this.wlwhxkzh = wlwhxkzh;
	}

	public String getKdjrfws() {
		return kdjrfws;
	}

	public void setKdjrfws(String kdjrfws) {
		this.kdjrfws = kdjrfws;
	}

	public String getDnts() {
		return dnts;
	}

	public void setDnts(String dnts) {
		this.dnts = dnts;
	}

	public String getYymj() {
		return yymj;
	}

	public void setYymj(String yymj) {
		this.yymj = yymj;
	}

	public String getWlaqshyjsh() {
		return wlaqshyjsh;
	}

	public void setWlaqshyjsh(String wlaqshyjsh) {
		this.wlaqshyjsh = wlaqshyjsh;
	}

	public String getLsswksl() {
		return lsswksl;
	}

	public void setLsswksl(String lsswksl) {
		this.lsswksl = lsswksl;
	}

	public String getJrfs() {
		return jrfs;
	}

	public void setJrfs(String jrfs) {
		this.jrfs = jrfs;
	}

	public String getXfshyjsh() {
		return xfshyjsh;
	}

	public void setXfshyjsh(String xfshyjsh) {
		this.xfshyjsh = xfshyjsh;
	}

	public String getXsyip() {
		return xsyip;
	}

	public void setXsyip(String xsyip) {
		this.xsyip = xsyip;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getJlbh()
	{
		return jlbh;
	}

	public void setJlbh(String jlbh)
	{
		this.jlbh = jlbh;
	}

	public String getJrfsmc() {
		if(ValidateHelper.isNotEmptyString(this.jrfs)){
			jrfsmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_JRFS", this.jrfs);
		}
		return jrfsmc;
	}

	public void setJrfsmc(String jrfsmc) {
		this.jrfsmc = jrfsmc;
	}
	
	
}
