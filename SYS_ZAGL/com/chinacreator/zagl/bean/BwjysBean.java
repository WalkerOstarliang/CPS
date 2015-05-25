package com.chinacreator.zagl.bean;


/**
 * 保卫建议书
 */
public class BwjysBean extends OperateBean{

	private static final long serialVersionUID = 3433590568187666550L;
	
	/**
	 * 建议书编号
	 */
	private String jysbh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 建议书名称
	 */
	private String jysmc;
	
	/**
	 * 下达单位代码
	 */
	private String xddwdm;
	
	/**
	 * 下达单位名称
	 */
	private String xddwmc;
	
	/**
	 * 下达时间
	 */
	private String xdsj;
	
	/**
	 * 内容
	 */
	private String nr;
	
	private String cz;

	public String getJysbh() {
		return jysbh;
	}

	public void setJysbh(String jysbh) {
		this.jysbh = jysbh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getJysmc() {
		return jysmc;
	}

	public void setJysmc(String jysmc) {
		this.jysmc = jysmc;
	}

	public String getXddwdm() {
		return xddwdm;
	}

	public void setXddwdm(String xddwdm) {
		this.xddwdm = xddwdm;
	}

	public String getXddwmc() {
		return xddwmc;
	}
	
	public String getXdsj() {
		return xdsj;
	}

	public void setXdsj(String xdsj) {
		this.xdsj = xdsj;
	}

	public void setXddwmc(String xddwmc) {
		this.xddwmc = xddwmc;
	}

	public String getNr() {
		return nr;
	}

	public void setNr(String nr) {
		this.nr = nr;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openBwjg('toBwjys','update','"+this.jysbh+"')\">修改</span>";
		cz += "&nbsp;|&nbsp;<span class=\"cps_span_href\" onclick=\"delBwjys('"+this.jysbh +"')\">删除</span>";
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
}
