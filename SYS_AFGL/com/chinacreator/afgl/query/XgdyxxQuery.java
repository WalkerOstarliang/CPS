package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 协管队员信息
 * @author Administrator
 *
 */
public class XgdyxxQuery extends QueryBean{

	private static final long serialVersionUID = -6225178248314427723L;
	
	private String dybh;				//			队员编号
	private String xgdbh;				//			所属协管队编号
	private String xgdmc;				//			所属协管队名称
	private String dyxm;				//			队员姓名
	private String dysfzh;				//			队员身份证号
	private String sgrq_from;				//			上岗日期
	private String sgrq_to;				//			上岗日期
	private String lgrq_from;				//			离岗日期
	private String lgrq_to;				//			离岗日期
	private String djrxm;				//			登记人
	private String czbs;
	private String zxbs;
	
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getDybh() {
		return dybh;
	}
	public void setDybh(String dybh) {
		this.dybh = dybh;
	}
	public String getDyxm() {
		return dyxm;
	}
	public void setDyxm(String dyxm) {
		this.dyxm = dyxm;
	}
	public String getDysfzh() {
		return dysfzh;
	}
	public void setDysfzh(String dysfzh) {
		this.dysfzh = dysfzh;
	}
	public String getSgrq_from() {
		return sgrq_from;
	}
	public void setSgrq_from(String sgrq_from) {
		this.sgrq_from = sgrq_from;
	}
	public String getSgrq_to() {
		return sgrq_to;
	}
	public void setSgrq_to(String sgrq_to) {
		this.sgrq_to = sgrq_to;
	}
	public String getLgrq_from() {
		return lgrq_from;
	}
	public void setLgrq_from(String lgrq_from) {
		this.lgrq_from = lgrq_from;
	}
	public String getLgrq_to() {
		return lgrq_to;
	}
	public void setLgrq_to(String lgrq_to) {
		this.lgrq_to = lgrq_to;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getXgdbh() {
		return xgdbh;
	}
	public void setXgdbh(String xgdbh) {
		this.xgdbh = xgdbh;
	}
	public String getXgdmc() {
		return xgdmc;
	}
	public void setXgdmc(String xgdmc) {
		this.xgdmc = xgdmc;
	}
}
