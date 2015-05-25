package com.chinacreator.lsgl.bean;

import com.chinacreator.common.cps.bean.RkJbxxBean;

public class JzzDayinBean {
	
	private RkxxBean rkBean = new RkxxBean();
	private RkJbxxBean jbxxBean = new RkJbxxBean();
	private LdrkJzzxxBean jzzBean =  new LdrkJzzxxBean();
	
	private String year;
	private String month;
	private String day;
	
	public RkxxBean getRkBean() {
		return rkBean;
	}
	public void setRkBean(RkxxBean rkBean) {
		this.rkBean = rkBean;
	}
	public LdrkJzzxxBean getJzzBean() {
		return jzzBean;
	}
	public void setJzzBean(LdrkJzzxxBean jzzBean) {
		this.jzzBean = jzzBean;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public RkJbxxBean getJbxxBean()
	{
		return jbxxBean;
	}
	public void setJbxxBean(RkJbxxBean jbxxBean)
	{
		this.jbxxBean = jbxxBean;
	}
	
	
}
