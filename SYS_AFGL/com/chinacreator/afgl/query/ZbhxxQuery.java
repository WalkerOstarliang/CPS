package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 治保会信息
 *
 */
public class ZbhxxQuery  extends QueryBean{

	private static final long serialVersionUID = -5126403871063942290L;
	
	private String zbhbh;				//治保会编号
	private String  zbhmc; 				//治保会名称
	private String  sssqjwdm; 			//所属社区警务代码
	private String  sspcsdm; 			//所属派出所代码
	private String  zbhfzrxm; 			//治保会责任人姓名
	private String  zbhfzrlxdh; 		//治保会负责人联系电话
	private String  cjsj_from; 				//创建时间
	private String  cjsj_to; 				//创建时间
	private String  zxsj_from; 				//注销时间
	private String  zxsj_to; 				//注销时间
	private String  djrxm; 				//登记人姓名
	private String  djdwdm; 			//登记单位代码
	private String  djsj_from;				//登记时间
	private String  djsj_to;				//登记时间
	private String  czbs;
	private String zxbs;
	
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getZbhbh() {
		return zbhbh;
	}
	public void setZbhbh(String zbhbh) {
		this.zbhbh = zbhbh;
	}
	public String getZbhmc() {
		return zbhmc;
	}
	public void setZbhmc(String zbhmc) {
		this.zbhmc = zbhmc;
	}
	public String getSssqjwdm() {
		return sssqjwdm;
	}
	public void setSssqjwdm(String sssqjwdm) {
		this.sssqjwdm = sssqjwdm;
	}
	public String getSspcsdm() {
		return sspcsdm;
	}
	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}
	public String getZbhfzrxm() {
		return zbhfzrxm;
	}
	public void setZbhfzrxm(String zbhfzrxm) {
		this.zbhfzrxm = zbhfzrxm;
	}
	public String getZbhfzrlxdh() {
		return zbhfzrlxdh;
	}
	public void setZbhfzrlxdh(String zbhfzrlxdh) {
		this.zbhfzrlxdh = zbhfzrlxdh;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjdwdm() {
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}
	public String getCjsj_from() {
		return cjsj_from;
	}
	public void setCjsj_from(String cjsj_from) {
		this.cjsj_from = cjsj_from;
	}
	public String getCjsj_to() {
		return cjsj_to;
	}
	public void setCjsj_to(String cjsj_to) {
		this.cjsj_to = cjsj_to;
	}
	public String getZxsj_from() {
		return zxsj_from;
	}
	public void setZxsj_from(String zxsj_from) {
		this.zxsj_from = zxsj_from;
	}
	public String getZxsj_to() {
		return zxsj_to;
	}
	public void setZxsj_to(String zxsj_to) {
		this.zxsj_to = zxsj_to;
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
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
}
