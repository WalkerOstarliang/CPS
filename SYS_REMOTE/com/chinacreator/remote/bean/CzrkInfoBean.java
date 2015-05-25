package com.chinacreator.remote.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 常驻人口信息
 * 
 * @filename CzrkInfoBean.java
 * @author mingchun.xiong
 * @date 2013-8-23
 *
 */
public class CzrkInfoBean extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1386093110312434529L;

	private String xm;
	private String cym;
	private String xb;
	private String mz;
	private String csrq;
	private String zzssxq;				//户籍地区划
	private String zzssxqmc;			//新增自定义
	private String zzxz;				//户籍地详址
	private String qtzzxq;
	private String qtzzxz;
	private String csd;
	private String sfzh;
	private String whcd;
	private String hyzk;
	private String sg;
	private String zy;
	private String fwcs;
	private String bdrq;
	private String bdyy;
	private String hsqr;
	private String hdqr;
	private String xp;
	private String sspcsjgdm;
	private String sspcsmc;
	private String ssgajgjgdm;
	private String ssgajgmc;
	private String hlx;
	private String hh;
	private String yhzgx;
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getCym() {
		return cym;
	}
	public void setCym(String cym) {
		this.cym = cym;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getZzssxq() {
		return zzssxq;
	}
	public void setZzssxq(String zzssxq) {
		this.zzssxq = zzssxq;
	}
	public String getZzxz() {
		return zzxz;
	}
	public void setZzxz(String zzxz) {
		this.zzxz = zzxz;
	}
	public String getQtzzxq() {
		return qtzzxq;
	}
	public void setQtzzxq(String qtzzxq) {
		this.qtzzxq = qtzzxq;
	}
	public String getQtzzxz() {
		return qtzzxz;
	}
	public void setQtzzxz(String qtzzxz) {
		this.qtzzxz = qtzzxz;
	}
	public String getCsd() {
		return csd;
	}
	public void setCsd(String csd) {
		this.csd = csd;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getWhcd() {
		return whcd;
	}
	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}
	public String getHyzk() {
		return hyzk;
	}
	public void setHyzk(String hyzk) {
		this.hyzk = hyzk;
	}
	public String getSg() {
		return sg;
	}
	public void setSg(String sg) {
		this.sg = sg;
	}
	public String getZy() {
		return zy;
	}
	public void setZy(String zy) {
		this.zy = zy;
	}
	public String getFwcs() {
		return fwcs;
	}
	public void setFwcs(String fwcs) {
		this.fwcs = fwcs;
	}
	public String getBdrq() {
		return bdrq;
	}
	public void setBdrq(String bdrq) {
		this.bdrq = bdrq;
	}
	public String getBdyy() {
		return bdyy;
	}
	public void setBdyy(String bdyy) {
		this.bdyy = bdyy;
	}
	public String getHsqr() {
		return hsqr;
	}
	public void setHsqr(String hsqr) {
		this.hsqr = hsqr;
	}
	public String getXp() {
		return xp;
	}
	public void setXp(String xp) {
		this.xp = xp;
	}
	public String getSspcsjgdm() {
		return sspcsjgdm;
	}
	public void setSspcsjgdm(String sspcsjgdm) {
		this.sspcsjgdm = sspcsjgdm;
	}
	public String getSspcsmc() {
		return sspcsmc;
	}
	public void setSspcsmc(String sspcsmc) {
		this.sspcsmc = sspcsmc;
	}
	public String getSsgajgjgdm() {
		return ssgajgjgdm;
	}
	public void setSsgajgjgdm(String ssgajgjgdm) {
		this.ssgajgjgdm = ssgajgjgdm;
	}
	public String getSsgajgmc() {
		return ssgajgmc;
	}
	public void setSsgajgmc(String ssgajgmc) {
		this.ssgajgmc = ssgajgmc;
	}
	public String getHlx() {
		return hlx;
	}
	public void setHlx(String hlx) {
		this.hlx = hlx;
	}
	public String getHh() {
		return hh;
	}
	public void setHh(String hh) {
		this.hh = hh;
	}
	public String getYhzgx() {
		return yhzgx;
	}
	public void setYhzgx(String yhzgx) {
		this.yhzgx = yhzgx;
	}
	public String getHdqr() {
		return hdqr;
	}
	public void setHdqr(String hdqr) {
		this.hdqr = hdqr;
	}
	public String getZzssxqmc() {
		zzssxqmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", zzssxq);
		return zzssxqmc;
	}
	public void setZzssxqmc(String zzssxqmc) {
		this.zzssxqmc = zzssxqmc;
	}
	
	
	
	
}
