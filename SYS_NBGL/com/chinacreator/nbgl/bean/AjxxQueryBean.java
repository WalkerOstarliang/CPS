package com.chinacreator.nbgl.bean;

import com.chinacreator.common.bean.QueryBean;

/**
 * 案件信息查询条件
 */
public class AjxxQueryBean extends QueryBean {

	private static final long serialVersionUID = 2179700563417839470L;
	
	/**
	 * 立案日期
	 */
	private String larq_s;
	
	private String larq_e;
	
	/**
	 * 立案单位
	 */
	private String ladw;
	
	/**
	 * 案件类型
	 */
	private String ajlx;
	
	/**
	 * 是否核实
	 */
	private String sfhs;
	
	/**
	 * 是否重点单位发案
	 */
	private String sfzddwfa;
	
	/**
	 * 案件编号
	 */
	private String ajbh;
	
	/**
	 * 关键词
	 */
	private String gjc;
	
	/**
	 * 发案社区代码
	 */
	private String fasqdm;

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

	public String getSfhs() {
		return sfhs;
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

	public String getAjbh() {
		return ajbh;
	}

	public void setAjbh(String ajbh) {
		this.ajbh = ajbh;
	}

	public String getGjc() {
		return gjc;
	}

	public void setGjc(String gjc) {
		this.gjc = gjc;
	}

	public String getLarq_s() {
		return larq_s;
	}

	public void setLarq_s(String larqS) {
		larq_s = larqS;
	}

	public String getLarq_e() {
		return larq_e;
	}

	public void setLarq_e(String larqE) {
		larq_e = larqE;
	}

	public String getFasqdm() {
		return fasqdm;
	}

	public void setFasqdm(String fasqdm) {
		this.fasqdm = fasqdm;
	}
}
