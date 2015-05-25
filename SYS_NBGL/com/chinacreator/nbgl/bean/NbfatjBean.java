package com.chinacreator.nbgl.bean;

import com.chinacreator.zagl.bean.OperateBean;
/**
 * 内保单位发案统计bean
 * @author Administrator
 *
 */
public class NbfatjBean  extends OperateBean {

	private static final long serialVersionUID = -8602236291161561570L;
	
	/*
	 * 扒窃：1
	 * 其他盗窃:2
	 * 其他入室盗窃:3
	 * 入户盗窃:4
	 * 抢劫:5
	 * 抢夺:6
	 * 电信诈骗:7
	 * 其他:8
	 */
	
	private String  djdwdm           ; //  单位代码
	private String  djdwmc           ; //  单位名称
	private String  pqsl             ; //  扒窃
	private String  qtdqsl           ; //  其他盗窃
	private String  qtrsdqsl         ; //  其他入室盗窃
	private String  rhdqsl           ; //  入户盗窃
	private String  qjsl             ; //  抢劫
	private String  qdsl             ; //  抢夺
	private String  dxzpsl           ; //  电信诈骗
	private String  hjsl             ; //  合计
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
	public String getPqsl() {
		return pqsl;
	}
	public void setPqsl(String pqsl) {
		this.pqsl = pqsl;
	}
	public String getQtdqsl() {
		return qtdqsl;
	}
	public void setQtdqsl(String qtdqsl) {
		this.qtdqsl = qtdqsl;
	}
	public String getQtrsdqsl() {
		return qtrsdqsl;
	}
	public void setQtrsdqsl(String qtrsdqsl) {
		this.qtrsdqsl = qtrsdqsl;
	}
	public String getRhdqsl() {
		return rhdqsl;
	}
	public void setRhdqsl(String rhdqsl) {
		this.rhdqsl = rhdqsl;
	}
	public String getQjsl() {
		return qjsl;
	}
	public void setQjsl(String qjsl) {
		this.qjsl = qjsl;
	}
	public String getQdsl() {
		return qdsl;
	}
	public void setQdsl(String qdsl) {
		this.qdsl = qdsl;
	}
	public String getDxzpsl() {
		return dxzpsl;
	}
	public void setDxzpsl(String dxzpsl) {
		this.dxzpsl = dxzpsl;
	}
	public String getHjsl() {
		return hjsl;
	}
	public void setHjsl(String hjsl) {
		this.hjsl = hjsl;
	}
	
	
}
