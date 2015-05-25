package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 治保会成员信息
 *
 */
public class ZbhcyxxQuery  extends QueryBean{
	
	private static final long serialVersionUID = 2213150589528885771L;
	
	private String zbhcybh; 		//治保会成员编号
	private String zbhbh; 			//治保会编号
	private String zbhmc; 			//治保会名称
	private String xm; 				//姓名
	private String sfzh; 			//身份证号
	private String whcd; 			//文化程度
	private String hyzk; 			//婚姻状况
	private String gzbx; 			//工作表现
	private String cjrq_from; 			//参加日期
	private String cjrq_to; 			//参加日期
	private String tcrq_from; 			//退出日期
	private String tcrq_to; 			//退出日期
	private String djrxm; 			//登记人姓名
	private String djsj_from; 			//登记时间
	private String djsj_to; 			//登记时间
	private String zbhzw;			//治保会职务
	private String czbs;
	public String getZbhcybh() {
		return zbhcybh;
	}
	public void setZbhcybh(String zbhcybh) {
		this.zbhcybh = zbhcybh;
	}
	public String getZbhbh() {
		return zbhbh;
	}
	public void setZbhbh(String zbhbh) {
		this.zbhbh = zbhbh;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	
	
	public String getWhcd() {
		return whcd;
	}
	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}
	public String getHyzk() {
		return hyzk;
	}
	public void setHyzk(String hyzk) {
		this.hyzk = hyzk;
	}
	public String getGzbx() {
		return gzbx;
	}
	public void setGzbx(String gzbx) {
		this.gzbx = gzbx;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	
	public String getZbhzw() {
		return zbhzw;
	}
	public void setZbhzw(String zbhzw) {
		this.zbhzw = zbhzw;
	}
	public String getCjrq_from() {
		return cjrq_from;
	}
	public void setCjrq_from(String cjrq_from) {
		this.cjrq_from = cjrq_from;
	}
	public String getCjrq_to() {
		return cjrq_to;
	}
	public void setCjrq_to(String cjrq_to) {
		this.cjrq_to = cjrq_to;
	}
	public String getTcrq_from() {
		return tcrq_from;
	}
	public void setTcrq_from(String tcrq_from) {
		this.tcrq_from = tcrq_from;
	}
	public String getTcrq_to() {
		return tcrq_to;
	}
	public void setTcrq_to(String tcrq_to) {
		this.tcrq_to = tcrq_to;
	}
	public String getDjsj_from() {
		return djsj_from;
	}
	public void setDjsj_from(String djsj_from) {
		this.djsj_from = djsj_from;
	}
	public String getDjsj_to() {
		return djsj_to;
	}
	public void setDjsj_to(String djsj_to) {
		this.djsj_to = djsj_to;
	}
	public String getZbhmc() {
		return zbhmc;
	}
	public void setZbhmc(String zbhmc) {
		this.zbhmc = zbhmc;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
}
