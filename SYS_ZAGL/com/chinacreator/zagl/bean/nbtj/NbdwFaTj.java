package com.chinacreator.zagl.bean.nbtj;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.ValidateHelper;

public class NbdwFaTj extends BaseValue {

	private static final long serialVersionUID = 9190005837624376884L;
	
	/**
	 * 单位代码
	 */
	private  String orgcode;
	
	/**
	 * 单位级别
	 */
	private String orgleve;
	
	/**
	 * 单位名称
	 */
	private String orgname;
	
	/**
	 * 发案总数
	 */
	private String fazs;
	
	/**
	 * 扒窃
	 */
	private String pq;
	
	/**
	 * 入室盗窃
	 */
	private String rsdq;
	
	/**
	 * 其他盗窃
	 */
	private String qtdq;
	
	/**
	 * 抢劫抢夺
	 */
	private String qjqd;
	
	/**
	 * 其他案件
	 */
	private String qtaj;
	
	/**
	 * 党政机关
	 */
	private String dzjg;
	
	/**
	 * 高校
	 */
	private String gx;
	
	/**
	 * 中小学
	 */
	private String zxx;
	
	/**
	 * 医院
	 */
	private String yy;
	
	/**
	 * 商场
	 */
	private String sc;
	
	/**
	 * 企业
	 */
	private String qy;
	
	/**
	 * 银行
	 */
	private String yh;
	
	/**
	 * 三电油气
	 */
	private String sdyq;
	
	/**
	 * 重点工程
	 */
	private String zdgc;
	
	/**
	 * 其他
	 */
	private String qt;

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getOrgleve() {
		return orgleve;
	}

	public void setOrgleve(String orgleve) {
		this.orgleve = orgleve;
	}

	public String getOrgname() {
		if(ValidateHelper.isEmptyString(orgcode)){
			orgname = "合计";
		}
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getFazs() {
		return fazs;
	}

	public void setFazs(String fazs) {
		this.fazs = fazs;
	}

	public String getPq() {
		return pq;
	}

	public void setPq(String pq) {
		this.pq = pq;
	}

	public String getRsdq() {
		return rsdq;
	}

	public void setRsdq(String rsdq) {
		this.rsdq = rsdq;
	}

	public String getQtdq() {
		return qtdq;
	}

	public void setQtdq(String qtdq) {
		this.qtdq = qtdq;
	}

	public String getQjqd() {
		return qjqd;
	}

	public void setQjqd(String qjqd) {
		this.qjqd = qjqd;
	}

	public String getQtaj() {
		return qtaj;
	}

	public void setQtaj(String qtaj) {
		this.qtaj = qtaj;
	}

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

	public String getZxx() {
		return zxx;
	}

	public void setZxx(String zxx) {
		this.zxx = zxx;
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

	public String getQt() {
		return qt;
	}

	public void setQt(String qt) {
		this.qt = qt;
	}
}
