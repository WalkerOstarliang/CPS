package com.chinacreator.zdry.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(重点人员关系人实体类)
 * @date Mar 5, 2013 5:13:33 PM
 */
public class Gxr extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6325077236734102421L;
	private String bh;
	private String sfzh;
	private String gxrxm;
	private String gxrsfzh;
	private String gxrlxdh;
	private String gxrxzdxz;
	private String ydsrgx;
	private String isgdzy;
	private String djrxm;
	private String djsj;
	private String djdwdm;
	private String djdwmc;
	private String czrxm;
	private String czdwdm;
	private String czdwmc;
	private String czsj;
	private String czbs;
	private String lgzt;
	private String xb;
	
	/**
	 * 证件类型
	 */
	private String zjlx;
	private String zjlxmc;
	
	/**
	 * 外文姓
	 */
	private String wwx;
	
	/**
	 * 外文名
	 */
	private String wwm;
	
	private String cz;
	
	private String xbmc;
	private String ydsrgxmc;

	public String getXbmc() {
		xbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.ZDRY_ZDLB_XB, xb);
		return xbmc;
	}

	public String getYdsrgxmc() {
		ydsrgxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.ZDRY_GXR_JTGX, ydsrgx);
		return ydsrgxmc;
	}

	public String getXb() {
		return xb;
	}

	public void setXb(String xb) {
		this.xb = xb;
	}

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getGxrxm() {
		return gxrxm;
	}

	public void setGxrxm(String gxrxm) {
		this.gxrxm = gxrxm;
	}

	public String getGxrsfzh() {
		return gxrsfzh;
	}

	public void setGxrsfzh(String gxrsfzh) {
		this.gxrsfzh = gxrsfzh;
	}

	public String getGxrlxdh() {
		return gxrlxdh;
	}

	public void setGxrlxdh(String gxrlxdh) {
		this.gxrlxdh = gxrlxdh;
	}

	public String getGxrxzdxz() {
		return gxrxzdxz;
	}

	public void setGxrxzdxz(String gxrxzdxz) {
		this.gxrxzdxz = gxrxzdxz;
	}

	public String getYdsrgx() {
		return ydsrgx;
	}

	public void setYdsrgx(String ydsrgx) {
		this.ydsrgx = ydsrgx;
	}

	public String getIsgdzy() {
		return isgdzy;
	}

	public void setIsgdzy(String isgdzy) {
		this.isgdzy = isgdzy;
	}

	public String getDjrxm() {
		return djrxm;
	}

	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}

	public String getDjsj() {
		return djsj;
	}

	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}

	public String getDjdwdm() {
		return djdwdm;
	}

	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}

	public String getDjdwmc() {
		return djdwmc;
	}

	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}

	public String getCzrxm() {
		return czrxm;
	}

	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}

	public String getCzdwdm() {
		return czdwdm;
	}

	public void setCzdwdm(String czdwdm) {
		this.czdwdm = czdwdm;
	}

	public String getCzdwmc() {
		return czdwmc;
	}

	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}

	public String getCzsj() {
		return czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public String getCzbs() {
		return czbs;
	}

	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

	public String getLgzt() {
		return lgzt;
	}

	public void setLgzt(String lgzt) {
		this.lgzt = lgzt;
	}

	public String getZjlx() {
		return zjlx;
	}

	public void setZjlx(String zjlx) {
		this.zjlx = zjlx;
	}

	public String getZjlxmc() {
		return zjlxmc;
	}

	public void setZjlxmc(String zjlxmc) {
		this.zjlxmc = zjlxmc;
	}

	public String getWwx() {
		return wwx;
	}

	public void setWwx(String wwx) {
		this.wwx = wwx;
	}

	public String getWwm() {
		return wwm;
	}

	public void setWwm(String wwm) {
		this.wwm = wwm;
	}

	public String getCz() {
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}

	public void setYdsrgxmc(String ydsrgxmc) {
		this.ydsrgxmc = ydsrgxmc;
	}
}
