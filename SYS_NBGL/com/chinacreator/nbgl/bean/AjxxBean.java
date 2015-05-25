package com.chinacreator.nbgl.bean;

import com.chinacreator.zagl.bean.OperateBean;

/**
 * 案件信息
 */
public class AjxxBean extends OperateBean {

	private static final long serialVersionUID = 5216654082250899168L;
	
	/**
	 * 案件编号
	 */
	private String ajbh;
	
	/**
	 * 立案日期
	 */
	private String larq;
	
	/**
	 * 立案单位
	 */
	private String ladw;
	
	/**
	 * 案件类型
	 */
	private String ajlx;
	
	/**
	 * 简要案情
	 */
	private String jyaq;
	
	/**
	 * 是否核实
	 */
	private String sfhs;
	private String sfhs_ms;
	
	/**
	 * 是否重点单位发案
	 */
	private String sfzddwfa;
	private String sfzddwfams;
	
	
	/**
	 * 重点单位代码
	 */
	private String zddwdm;
	
	/**
	 * 重点单位名称
	 */
	private String zddwmc;
	
	/**
	 * 关键词
	 */
	private String gjc;
	
	/**
	 * 案件名称
	 */
	private String ajmc;
	
	/**
	 * 操作
	 */
	private String cz;
	
	/**
	 *  发案社区代码
	 */
	private String fasqdm;
	
	private String fasqmc;
	

	public String getAjbh() {
		return ajbh;
	}

	public void setAjbh(String ajbh) {
		this.ajbh = ajbh;
	}

	public String getLarq() {
		return larq;
	}

	public void setLarq(String larq) {
		this.larq = larq;
	}

	public String getLadw() {
		return ladw;
	}

	public void setLadw(String ladw) {
		this.ladw = ladw;
	}

	public String getAjlx() {
		return ajlx;
	}

	public void setAjlx(String ajlx) {
		this.ajlx = ajlx;
	}

	public String getJyaq() {
		return jyaq;
	}

	public void setJyaq(String jyaq) {
		this.jyaq = jyaq;
	}

	public String getSfhs() {
		return sfhs;
	}

	public String getSfhs_ms() {
		if("0".equals(sfhs)){
			sfhs_ms = "否";
		}else{
			sfhs_ms = "是";
		}
		return sfhs_ms;
	}

	public void setSfhs_ms(String sfhsMs) {
		sfhs_ms = sfhsMs;
	}

	public void setSfhs(String sfhs) {
		this.sfhs = sfhs;
	}

	public String getSfzddwfa() {
		return sfzddwfa;
	}

	public void setSfzddwfa(String sfzddwfa) {
		this.sfzddwfa = sfzddwfa;
	}

	public String getZddwdm() {
		return zddwdm;
	}

	public void setZddwdm(String zddwdm) {
		this.zddwdm = zddwdm;
	}

	public String getGjc() {
		return gjc;
	}

	public void setGjc(String gjc) {
		this.gjc = gjc;
	}

	public String getAjmc() {
		return ajmc;
	}

	public void setAjmc(String ajmc) {
		this.ajmc = ajmc;
	}

	public String getZddwmc() {
		return zddwmc;
	}

	public void setZddwmc(String zddwmc) {
		this.zddwmc = zddwmc;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openAjxxInfoWin('" + ajbh + "','detail')\" style=\"color:green\">详情</span>&nbsp;";
		if("0".equals(sfhs)){
			cz += "<span class=\"cps_span_href\" onclick=\"openAjxxInfoWin('" + ajbh + "','update','" + fasqdm + "')\" style=\"color:green\">核实</span>";
		}
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getFasqdm() {
		return fasqdm;
	}

	public void setFasqdm(String fasqdm) {
		this.fasqdm = fasqdm;
	}

	public String getSfzddwfams() {
		if("1".equals(sfzddwfa)){
			sfzddwfams = "是";
		}else{
			sfzddwfams = "否";
		}
		return sfzddwfams;
	}

	public void setSfzddwfams(String sfzddwfams) {
		this.sfzddwfams = sfzddwfams;
	}

	public String getFasqmc() {
		return fasqmc;
	}

	public void setFasqmc(String fasqmc) {
		this.fasqmc = fasqmc;
	}
}
