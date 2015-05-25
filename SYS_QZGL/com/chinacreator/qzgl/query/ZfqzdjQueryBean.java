package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;

public class ZfqzdjQueryBean extends QueryBean
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2609747460319771196L;
	private String sfjwdc;        //调查情况
	private String xxsfss;    //信息真伪
	private String zfdxxm;         //走访对象姓名
	private String zfmjxm;           //走访民警姓名  
	private String zfmjjh;           // 走访民警警号
	private String zfsj_from;     //走访时间  开始
	private String zfsj_to;       //走访时间  结束
	
	
	
	public String getZfmjjh() {
		return zfmjjh;
	}
	public void setZfmjjh(String zfmjjh) {
		this.zfmjjh = zfmjjh;
	}
	public String getSfjwdc() {
		return sfjwdc;
	}
	public void setSfjwdc(String sfjwdc) {
		this.sfjwdc = sfjwdc;
	}
	public String getXxsfss() {
		return xxsfss;
	}
	public void setXxsfss(String xxsfss) {
		this.xxsfss = xxsfss;
	}
	public String getZfdxxm() {
		return zfdxxm;
	}
	public void setZfdxxm(String zfdxxm) {
		this.zfdxxm = zfdxxm;
	}
	public String getZfmjxm() {
		return zfmjxm;
	}
	public void setZfmjxm(String zfmjxm) {
		this.zfmjxm = zfmjxm;
	}
	public String getZfsj_from() {
		return zfsj_from;
	}
	public void setZfsj_from(String zfsj_from) {
		this.zfsj_from = zfsj_from;
	}
	public String getZfsj_to() {
		return zfsj_to;
	}
	public void setZfsj_to(String zfsj_to) {
		this.zfsj_to = zfsj_to;
	}
	
	
	
}
