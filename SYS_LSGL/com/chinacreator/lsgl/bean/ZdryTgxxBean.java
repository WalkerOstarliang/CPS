package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;


//重点人员托管信息
public class ZdryTgxxBean extends RkJbxxBean {

	private static final long serialVersionUID = 1L;
	
	private String gzdxbh;
	private String rybh;
	private String rylb;
	private String zdrybh;
	private String dxlb;
	private String dxlbmc;	
	
	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 重点人员身份证号
	 */
	private String sfzh;
	
	/**
	 * 委托人姓名
	 */
	private String wtrxm;
	
	/**
	 * 委托人联系方式
	 */
	private String wtrlxfs;
	
	/**
	 * 委托人警号
	 */
	private String wtrjh;
	
	/**
	 * 委托单位代码
	 */
	private String wtdwdm;
	
	/**
	 * 委托单位名称
	 */
	private String wtdwmc;
	
	/**
	 * 委托时间
	 */
	private String wtsj;
	
	/**
	 * 委托原因
	 */
	private String wtyy;
	
	/**
	 * 接管人姓名
	 */
	private String jgrxm;
	
	/**
	 * 接管人警号
	 */
	private String jgrjh;
	
	/**
	 * 接管人联系方式
	 */
	private String jgrlxfs;
	
	/**
	 * 接管单位名称
	 */
	private String jgdwmc;
	
	/**
	 * 接管单位代码
	 */
	private String jgdwdm;
	
	/**
	 * 接管时间
	 */
	private String jgsj;
	
	/**
	 * 退回原因
	 */
	private String thyy;
	
	/**
	 * 接管状态
	 * 0：未接管
	 * 1：已接管
	 * 2：退回
	 */
	private String jgzt;
	
	/**
	 * 行政社区代码
	 */
	private String xzsqdm;
	
	/**
	 * 行政社区名称
	 */
	private String xzsqmc;
	
	private String cz;
	
	private String wtrsfzh;
	private String jgrsfzh;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getWtrxm() {
		return wtrxm;
	}

	public void setWtrxm(String wtrxm) {
		this.wtrxm = wtrxm;
	}

	public String getWtrjh() {
		return wtrjh;
	}

	public void setWtrjh(String wtrjh) {
		this.wtrjh = wtrjh;
	}

	public String getWtdwdm() {
		return wtdwdm;
	}

	public void setWtdwdm(String wtdwdm) {
		this.wtdwdm = wtdwdm;
	}

	public String getWtdwmc() {
		return wtdwmc;
	}

	public void setWtdwmc(String wtdwmc) {
		this.wtdwmc = wtdwmc;
	}

	public String getWtsj() {
		return wtsj;
	}

	public void setWtsj(String wtsj) {
		this.wtsj = wtsj;
	}

	public String getWtyy() {
		return wtyy;
	}

	public void setWtyy(String wtyy) {
		this.wtyy = wtyy;
	}

	public String getJgrxm() {
		return jgrxm;
	}

	public void setJgrxm(String jgrxm) {
		this.jgrxm = jgrxm;
	}

	public String getJgrjh() {
		return jgrjh;
	}

	public void setJgrjh(String jgrjh) {
		this.jgrjh = jgrjh;
	}

	public String getJgdwmc() {
		return jgdwmc;
	}

	public void setJgdwmc(String jgdwmc) {
		this.jgdwmc = jgdwmc;
	}

	public String getJgdwdm() {
		return jgdwdm;
	}

	public void setJgdwdm(String jgdwdm) {
		this.jgdwdm = jgdwdm;
	}

	public String getJgsj() {
		return jgsj;
	}

	public void setJgsj(String jgsj) {
		this.jgsj = jgsj;
	}

	public String getThyy() {
		return thyy;
	}

	public void setThyy(String thyy) {
		this.thyy = thyy;
	}

	public String getJgzt() {
		return jgzt;
	}

	public void setJgzt(String jgzt) {
		this.jgzt = jgzt;
	}

	public String getWtrlxfs() {
		return wtrlxfs;
	}

	public void setWtrlxfs(String wtrlxfs) {
		this.wtrlxfs = wtrlxfs;
	}

	public String getJgrlxfs() {
		return jgrlxfs;
	}

	public void setJgrlxfs(String jgrlxfs) {
		this.jgrlxfs = jgrlxfs;
	}

	public String getCz() {
		StringBuffer czbuff = new StringBuffer();
		czbuff.append("<span onclick=\"openRyjgWin('" + this.rybh + "','" + this.id + "','detail')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(loginInfo.getLeve() == 4 || loginInfo.getLeve() == 5 ){
			if(loginInfo.getOrgcode().equals(this.jgdwdm)){
				czbuff.append("<span onclick=\"openRyjgWin('" + this.rybh + "','" + this.id + "','update')\" style=\"color:green\" class=\"cps_span_href\">接管</span>&nbsp;");
			}
		}
		
		cz = czbuff.toString();
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getGzdxbh() {
		return gzdxbh;
	}

	public void setGzdxbh(String gzdxbh) {
		this.gzdxbh = gzdxbh;
	}

	public String getRybh() {
		return rybh;
	}

	public void setRybh(String rybh) {
		this.rybh = rybh;
	}

	public String getRylb() {
		return rylb;
	}

	public void setRylb(String rylb) {
		this.rylb = rylb;
	}

	public String getZdrybh() {
		return zdrybh;
	}

	public void setZdrybh(String zdrybh) {
		this.zdrybh = zdrybh;
	}

	public String getDxlb() {
		return dxlb;
	}

	public void setDxlb(String dxlb) {
		this.dxlb = dxlb;
	}

	public String getDxlbmc() {
		if(ValidateHelper.isNotEmptyString(this.dxlb)){
			dxlbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDDXLB", dxlb);
		}
		return dxlbmc;
	}

	public void setDxlbmc(String dxlbmc) {
		this.dxlbmc = dxlbmc;
	}

	public String getXzsqdm() {
		return xzsqdm;
	}

	public void setXzsqdm(String xzsqdm) {
		this.xzsqdm = xzsqdm;
	}

	public String getXzsqmc() {
		return xzsqmc;
	}

	public void setXzsqmc(String xzsqmc) {
		this.xzsqmc = xzsqmc;
	}

	public String getWtrsfzh() {
		return wtrsfzh;
	}

	public void setWtrsfzh(String wtrsfzh) {
		this.wtrsfzh = wtrsfzh;
	}

	public String getJgrsfzh() {
		return jgrsfzh;
	}

	public void setJgrsfzh(String jgrsfzh) {
		this.jgrsfzh = jgrsfzh;
	}
	
}
