package com.chinacreator.nbgl.bean;

import com.chinacreator.common.bean.QueryBean;
/**
 * 内保单位发案统计查询条件
 * @author Administrator
 *
 */
public class NbdwfaQueryBean extends QueryBean{
	private static final long serialVersionUID = 3735346684430492103L;
	private String djdwdm ; // 单位代码
	private String dwjb ; // 单位级别
	private String ksrq ; // 开始日期
	private String jzrq ; // 截止日期
	public String getDjdwdm() {
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}
	public String getDwjb() {
		return dwjb;
	}
	public void setDwjb(String dwjb) {
		this.dwjb = dwjb;
	}
	public String getKsrq() {
		return ksrq;
	}
	public void setKsrq(String ksrq) {
		this.ksrq = ksrq;
	}
	public String getJzrq() {
		return jzrq;
	}
	public void setJzrq(String jzrq) {
		this.jzrq = jzrq;
	}
	
}
