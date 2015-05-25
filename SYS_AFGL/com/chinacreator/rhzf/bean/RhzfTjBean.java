package com.chinacreator.rhzf.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.ValidateHelper;

public class RhzfTjBean extends BaseValue {

	private static final long serialVersionUID = 4149454624760789088L;

	/**
	 * 单位名称
	 */
	private String dwmc;
	
	private String jwsdm;
	
	/**
	 * 单位代码
	 */
	private String dwdm;
	
	/**
	 * 单位级别
	 */
	private String dwLeve;
	
	/**
	 * 街道/乡镇干部
	 */
	private String jdgb;
	
	/**
	 * 社区/村干部
	 */
	private String sqgb;
	
	/**
	 * 小区/组干部
	 */
	private String xqgb;
	
	/**
	 * 单位法人
	 */
	private String dwfr;
	
	/**
	 * 治安保卫人员
	 */
	private String zbry;
	
	/**
	 * 办公室主任
	 */
	private String bgszr;
	
	/**
	 * 人大代表
	 */
	private String rddb;
	
	/**
	 * 政协委员	
	 */
	private String zxwy;
	
	/**
	 * 物管负责人
	 */
	private String wgfzr;
	
	/**
	 * 业主委员会成员
	 */
	private String ywhcy;
	
	/**
	 * 楼栋长
	 */
	private String ldz;
	
	/**
	 * 入室盗窃回访	
	 */
	private String rsdqhf;
	
	/**
	 * 一般走访
	 */
	private String ybzf;
	
	/**
	 * 合计
	 */
	private String hj;

	public String getDwmc() {
		if(ValidateHelper.isNotEmptyString(dwLeve)){
			if(Integer.parseInt(dwLeve) < 6){
				dwmc = "<span class=\"cps_span_href\" onclick=\"down('" + dwdm + "'," + dwLeve + ")\" style=\"color:green\">" + dwmc + "</span>";
			}
		}
		if(dwmc == null && dwdm == null){
			dwmc ="<span style='color:red'>合计</span>";
		}
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getDwdm() {
		return dwdm;
	}

	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}

	public String getDwLeve() {
		return dwLeve;
	}

	public void setDwLeve(String dwLeve) {
		this.dwLeve = dwLeve;
	}

	public String getJdgb() {
		return jdgb;
	}

	public void setJdgb(String jdgb) {
		this.jdgb = jdgb;
	}

	public String getSqgb() {
		return sqgb;
	}

	public void setSqgb(String sqgb) {
		this.sqgb = sqgb;
	}

	public String getXqgb() {
		return xqgb;
	}

	public void setXqgb(String xqgb) {
		this.xqgb = xqgb;
	}

	public String getDwfr() {
		return dwfr;
	}

	public void setDwfr(String dwfr) {
		this.dwfr = dwfr;
	}

	public String getZbry() {
		return zbry;
	}

	public void setZbry(String zbry) {
		this.zbry = zbry;
	}

	public String getRddb() {
		return rddb;
	}

	public void setRddb(String rddb) {
		this.rddb = rddb;
	}

	public String getZxwy() {
		return zxwy;
	}

	public void setZxwy(String zxwy) {
		this.zxwy = zxwy;
	}

	public String getWgfzr() {
		return wgfzr;
	}

	public void setWgfzr(String wgfzr) {
		this.wgfzr = wgfzr;
	}

	public String getYwhcy() {
		return ywhcy;
	}

	public void setYwhcy(String ywhcy) {
		this.ywhcy = ywhcy;
	}

	public String getLdz() {
		return ldz;
	}

	public void setLdz(String ldz) {
		this.ldz = ldz;
	}

	public String getRsdqhf() {
		return rsdqhf;
	}

	public void setRsdqhf(String rsdqhf) {
		this.rsdqhf = rsdqhf;
	}

	public String getYbzf() {
		return ybzf;
	}

	public void setYbzf(String ybzf) {
		this.ybzf = ybzf;
	}

	public String getHj() {
		/*hj = Integer.parseInt(sqgb) + 
		     Integer.parseInt(xqgb) +
		     Integer.parseInt(dwfr) +
		     Integer.parseInt(zbry) +
		     Integer.parseInt(rddb) +
		     Integer.parseInt(zxwy) +
		     Integer.parseInt(wgfzr) +
		     Integer.parseInt(ywhcy) +
		     Integer.parseInt(ldz) +
		     Integer.parseInt(rsdqhf) +
		     Integer.parseInt(ybzf) +
		     Integer.parseInt(jdgb) + "";*/
		return hj;
	}

	public void setHj(String hj) {
		this.hj = hj;
	}

	public String getJwsdm() {
		return jwsdm;
	}

	public void setJwsdm(String jwsdm) {
		this.jwsdm = jwsdm;
	}

	public String getBgszr() {
		return bgszr;
	}

	public void setBgszr(String bgszr) {
		this.bgszr = bgszr;
	}
}
