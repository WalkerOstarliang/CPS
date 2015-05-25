package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;
/**
 * 查询省厅治安系统开展排查填报
 * @author Administrator
 *
 */
public class StZapcQueryBean  extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String djdwdm;
	private String tjyf;
	private String parentcode ;
	
	private String titless="" ; //标题
	private  String tbdwmc =""; // 填报单位名称
	private  String tbrxm ="" ; // 填报人姓名
	
	private String jb ; // 单位级别(治安：0   派出所：1)
	
	public String getJb() {
		return jb;
	}
	public void setJb(String jb) {
		this.jb = jb;
	}
	public String getDjdwdm() {
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}
	public String getTjyf() {
		return tjyf;
	}
	public void setTjyf(String tjyf) {
		this.tjyf = tjyf;
	}
	public String getParentcode() {
		return parentcode;
	}
	public void setParentcode(String parentcode) {
		this.parentcode = parentcode;
	}
	public String getTitless() {
		return titless;
	}
	public void setTitless(String titless) {
		this.titless = titless;
	}
	public String getTbdwmc() {
		return tbdwmc;
	}
	public void setTbdwmc(String tbdwmc) {
		this.tbdwmc = tbdwmc;
	}
	public String getTbrxm() {
		return tbrxm;
	}
	public void setTbrxm(String tbrxm) {
		this.tbrxm = tbrxm;
	}
	
}
