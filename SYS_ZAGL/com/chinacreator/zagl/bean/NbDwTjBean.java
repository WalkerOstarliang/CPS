package com.chinacreator.zagl.bean;

import com.chinacreator.common.helper.ValidateHelper;


public class NbDwTjBean extends OperateBean{


	/**
	 * 内保单位，类别统计bean
	 */
	private static final long serialVersionUID = 5346478590740393740L;
	private String orgname;
	private String dzjg ;
	private String  gx ;
	private String  zxxx ;
	private String  yy ;
	private String  sc ;
	private String  qy ;
	private String  yh ;
	private String  sdyq ;
	private String  zdgc ;
	private String  wyxq ;
	private String  qt ;
	private String hj;
	
	public String getDzjg() {
		return dzjg;
	}
	public void setDzjg(String dzjg) {
		this.dzjg = dzjg;
	}
	public String getGx() {
		return gx;
	}
	public void setGx(String gx) {
		this.gx = gx;
	}
	public String getZxxx() {
		return zxxx;
	}
	public void setZxxx(String zxxx) {
		this.zxxx = zxxx;
	}
	public String getYy() {
		return yy;
	}
	public void setYy(String yy) {
		this.yy = yy;
	}
	public String getSc() {
		return sc;
	}
	public void setSc(String sc) {
		this.sc = sc;
	}
	public String getQy() {
		return qy;
	}
	public void setQy(String qy) {
		this.qy = qy;
	}
	public String getYh() {
		return yh;
	}
	public void setYh(String yh) {
		this.yh = yh;
	}
	public String getSdyq() {
		return sdyq;
	}
	public void setSdyq(String sdyq) {
		this.sdyq = sdyq;
	}
	public String getZdgc() {
		return zdgc;
	}
	public void setZdgc(String zdgc) {
		this.zdgc = zdgc;
	}
	public String getWyxq() {
		return wyxq;
	}
	public void setWyxq(String wyxq) {
		this.wyxq = wyxq;
	}
	public String getQt() {
		return qt;
	}
	public void setQt(String qt) {
		this.qt = qt;
	}
	public String getOrgname() {
		if(ValidateHelper.isEmptyString(orgname)){
			orgname = "<font color='red'>合计</font>";
		}
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getHj() {
		return hj;
	}
	public void setHj(String hj) {
		this.hj = hj;
	}
}
