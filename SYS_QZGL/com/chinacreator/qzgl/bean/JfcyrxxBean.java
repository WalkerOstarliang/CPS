package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class JfcyrxxBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = -437690312602190088L;
	
	private String bh;
	private String jfbh; //纠纷编号
	private String xm;
	private String sfzh;
	private String lxdh;
	private String xzdz;
	private String mz;
	private String mzmc;
	private String operType;
	
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getJfbh() {
		return jfbh;
	}
	public void setJfbh(String jfbh) {
		this.jfbh = jfbh;
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
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getXzdz() {
		return xzdz;
	}
	public void setXzdz(String xzdz) {
		this.xzdz = xzdz;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getOperType() {
		return operType;
	}
	public void setOperType(String operType) {
		this.operType = operType;
	}
	public String getMzmc() {
		if(ValidateHelper.isNotEmptyString(mz)){
			mzmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_MZ", mz);
		}
		return mzmc;
	}
	public void setMzmc(String mzmc) {
		this.mzmc = mzmc;
	}
	

}
