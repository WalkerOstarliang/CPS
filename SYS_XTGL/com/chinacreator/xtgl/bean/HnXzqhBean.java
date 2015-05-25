package com.chinacreator.xtgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 湖南行政区划对象
 * @author mingchun.xiong
 *
 */
public class HnXzqhBean extends BaseValue
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= -6454407892280621L;
	private String dm; 
	private String mc;
	private String parent_dm; 
	private String parent_mc;
	private String leve; 
	private String jc;
	private String isvalid; 
	private String len;
	
	private String gxsqjwsdm;
	private String gxsqjwsmc;
	
	private String sspcsdm;
	private String sspcsmc;
	
	public String getDm() {
		return dm;
	}
	public void setDm(String dm) {
		this.dm = dm;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getParent_dm() {
		return parent_dm;
	}
	
	public void setParent_dm(String parent_dm) {
		this.parent_dm = parent_dm;
	}
	public String getLeve() {
		return leve;
	}
	public void setLeve(String leve) {
		this.leve = leve;
	}
	public String getJc() {
		return jc;
	}
	public void setJc(String jc) {
		this.jc = jc;
	}
	public String getIsvalid() {
		return isvalid;
	}
	public void setIsvalid(String isvalid) {
		this.isvalid = isvalid;
	}
	public String getLen() {
		return len;
	}
	public void setLen(String len) {
		this.len = len;
	}
	public String getParent_mc() {
		parent_mc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.HN_XZQH, parent_dm);
		return parent_mc;
	}
	
	public String getGxsqjwsdm() {
		return gxsqjwsdm;
	}
	public void setGxsqjwsdm(String gxsqjwsdm) {
		this.gxsqjwsdm = gxsqjwsdm;
	}
	public String getGxsqjwsmc() {
		gxsqjwsmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(gxsqjwsdm);
		return gxsqjwsmc;
	}
	public void setGxsqjwsmc(String gxsqjwsmc) {
		this.gxsqjwsmc = gxsqjwsmc;
	}
	public String getSspcsdm() {
		return sspcsdm;
	}
	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}
	public String getSspcsmc() {
		sspcsmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(sspcsdm);
		return sspcsmc;
	}
	public void setSspcsmc(String sspcsmc) {
		this.sspcsmc = sspcsmc;
	}
	public void setParent_mc(String parent_mc) {
		this.parent_mc = parent_mc;
	} 
	
	
	
}
