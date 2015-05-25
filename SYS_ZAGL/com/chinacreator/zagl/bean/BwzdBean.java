package com.chinacreator.zagl.bean;


/**
 * 保卫制度
 */
public class BwzdBean extends OperateBean{

	private static final long serialVersionUID = 2211327746509015805L;
	
	/**
	 * 制度编号
	 */
	private String zdbh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 保卫制度名称
	 */
	private String bwzdmc;
	
	/**
	 * 修订时间
	 */
	private String xdsj;
	
	/**
	 * 内容
	 */
	private String nr;
	
	/**
	 * 操作
	 */
	private String cz;

	public String getZdbh() {
		return zdbh;
	}

	public void setZdbh(String zdbh) {
		this.zdbh = zdbh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getBwzdmc() {
		return bwzdmc;
	}

	public void setBwzdmc(String bwzdmc) {
		this.bwzdmc = bwzdmc;
	}

	public String getXdsj() {
		return xdsj;
	}

	public void setXdsj(String xdsj) {
		this.xdsj = xdsj;
	}

	public String getNr() {
		return nr;
	}

	public void setNr(String nr) {
		this.nr = nr;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openBwjg('toBwzd','update','"+this.zdbh+"')\">修改</span>";
		cz += "&nbsp;|&nbsp;<span class=\"cps_span_href\" onclick=\"delBwzd('"+this.zdbh +"')\">删除</span>";
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
}
