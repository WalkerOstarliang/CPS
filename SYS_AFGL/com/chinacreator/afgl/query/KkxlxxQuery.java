package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 卡口巡逻信息；查询条件
 *
 */
public class KkxlxxQuery extends QueryBean{
	
	private static final long serialVersionUID = 6017917682280779069L;
	
	private String xlbh;			//巡逻编号
	private String kkbh;			//卡口编号
	private String kkmc;			//卡口名称
	private String xljssj;			//巡逻结束时间
	private String xlkssj;			//巡逻开始时间
	private String xlmj;			//巡逻民警
	private String djrxm;			//登记人姓名
	private String djsj_from;		//登记时间
	private String djsj_to;			//登记时间
	private String czbs;			//操作标识
	public String getKkmc() {
		return kkmc;
	}
	public void setKkmc(String kkmc) {
		this.kkmc = kkmc;
	}
	public String getXljssj() {
		return xljssj;
	}
	public void setXljssj(String xljssj) {
		this.xljssj = xljssj;
	}
	public String getXlkssj() {
		return xlkssj;
	}
	public void setXlkssj(String xlkssj) {
		this.xlkssj = xlkssj;
	}
	public String getXlmj() {
		return xlmj;
	}
	public void setXlmj(String xlmj) {
		this.xlmj = xlmj;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
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
	public String getXlbh() {
		return xlbh;
	}
	public void setXlbh(String xlbh) {
		this.xlbh = xlbh;
	}
	public String getKkbh() {
		return kkbh;
	}
	public void setKkbh(String kkbh) {
		this.kkbh = kkbh;
	}
	
}
