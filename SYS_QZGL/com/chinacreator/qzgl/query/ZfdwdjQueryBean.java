package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 走访单位登记 查询Bean
 * @author zhun.liu
 *
 */
public class ZfdwdjQueryBean extends QueryBean
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2915611732074292013L;
	private String sfjwdc;        //调查情况
	private String xxsfss;    //信息真伪
	private String zfdwmc;  //走访单位名称
	private String zfmjxm;   //走访民警姓名
	private String zfmjjh;      //走访民警警号
	private String zfsy;     //走访事由
	
	private String zfsj_from;     //走访时间 开始
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
	public String getZfdwmc() {
		return zfdwmc;
	}
	public void setZfdwmc(String zfdwmc) {
		this.zfdwmc = zfdwmc;
	}
	public String getZfmjxm() {
		return zfmjxm;
	}
	public void setZfmjxm(String zfmjxm) {
		this.zfmjxm = zfmjxm;
	}
	public String getZfsy() {
		return zfsy;
	}
	public void setZfsy(String zfsy) {
		this.zfsy = zfsy;
	}

	
}
