package com.chinacreator.gzgl.bean;


public class EmfyqkxxBean extends GzglBaseBean{

	/**
	 * 信息员（耳目）反映情况登记bean
	 */
	private static final long serialVersionUID = -2146887231060638925L;
	private String id;  
	private String zaembh; //治安耳目编号
	private String xxtgsj;  //信息提供时间
	private String fyqkxx; //反应情况
	private String djrxm;
	private String djmjjh;
	private String djsj;
	private String djdwdm;
	private String djdwmc;
	private String djrsfzh;
	
	private String cz;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZaembh() {
		return zaembh;
	}
	public void setZaembh(String zaembh) {
		this.zaembh = zaembh;
	}
	
	public String getXxtgsj() {
		return xxtgsj;
	}
	public void setXxtgsj(String xxtgsj) {
		this.xxtgsj = xxtgsj;
	}
	public String getFyqkxx() {
		return fyqkxx;
	}
	public void setFyqkxx(String fyqkxx) {
		this.fyqkxx = fyqkxx;
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
	public String getDjmjjh() {
		return djmjjh;
	}
	public void setDjmjjh(String djmjjh) {
		this.djmjjh = djmjjh;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openFkxx('" + id + "','detail')\" style=\"color:green\">详情</span>";
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	
	
}
