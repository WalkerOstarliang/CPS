package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class ZyzzcxxBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 233479787399073090L;
	private String bh;
	private String zyzbh;
	private String zcdm;
	private String zcmc;
	private String jysm;
	private String operType;
	private String cz;
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getZyzbh() {
		return zyzbh;
	}
	public void setZyzbh(String zyzbh) {
		this.zyzbh = zyzbh;
	}
	public String getZcdm() {
		return zcdm;
	}
	public void setZcdm(String zcdm) {
		this.zcdm = zcdm;
	}
	public String getJysm() {
		return jysm;
	}
	public void setJysm(String jysm) {
		this.jysm = jysm;
	}
	public String getZcmc() {
		if(ValidateHelper.isNotEmptyString(zcdm)){
			zcmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZC", zcdm);
		}
		return zcmc;
	}
	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}
	public String getOperType() {
		return operType;
	}
	public void setOperType(String operType) {
		this.operType = operType;
	}
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	
	
}
