package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class HbgzyhrBean extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8490233785774922261L;
	private String bh;
	private String bgbh;
	private String xm;
	private String lxdh;
	private String dwmc;
	private String zw;
	private String zwmc;
	private String operType;
	private String cz;
	
	/*******************************************************************************
	 *                        Getter & Setter                                      *
	 *******************************************************************************/
	
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getBgbh() {
		return bgbh;
	}
	public void setBgbh(String bgbh) {
		this.bgbh = bgbh;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getDwmc() {
		return dwmc;
	}
	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}
	public String getZw() {
		return zw;
	}
	public void setZw(String zw) {
		this.zw = zw;
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
	public String getZwmc() {
		zwmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_RY_ZW", zw);
		return zwmc;
	}
	public void setZwmc(String zwmc) {
		this.zwmc = zwmc;
	}
	
	
	
}
