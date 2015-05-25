package com.chinacreator.ckyj.query;

import com.chinacreator.common.bean.QueryBean;

public class CkyjQueryBean extends QueryBean {

	private static final long serialVersionUID = 3750581512587364943L;
	
	//发布时间
	private String fbsj;
	//重点人员姓名
	private String zdryxm;
	//身份证号码
	private String sfzh;
	//重点人员细类
	private String zdryxl;
	//预警级别
	private String yjjb;
	//预警接收单位
	private String yjjsdw;
	//是否反馈
	private String sffk;
	public String getFbsj() {
		return fbsj;
	}
	public void setFbsj(String fbsj) {
		this.fbsj = fbsj;
	}
	public String getZdryxm() {
		return zdryxm;
	}
	public void setZdryxm(String zdryxm) {
		this.zdryxm = zdryxm;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getZdryxl() {
		return zdryxl;
	}
	public void setZdryxl(String zdryxl) {
		this.zdryxl = zdryxl;
	}
	public String getYjjb() {
		return yjjb;
	}
	public void setYjjb(String yjjb) {
		this.yjjb = yjjb;
	}
	public String getYjjsdw() {
		return yjjsdw;
	}
	public void setYjjsdw(String yjjsdw) {
		this.yjjsdw = yjjsdw;
	}
	public String getSffk() {
		return sffk;
	}
	public void setSffk(String sffk) {
		this.sffk = sffk;
	}
}
