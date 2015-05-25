package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 卡口盘查信息；查询条件
 *
 */
public class KkpcxxQuery extends QueryBean{
	
	private static final long serialVersionUID = 7843064987506988583L;
	
	private String pcbh;			//盘查编号
	private String kkbh;			//卡口编号
	private String kkmc;			//卡口名称
	private String pcsj_from;		//盘查时间
	private String pcsj_to;			//盘查时间
	private String pcmjxm;			//盘查民警
	private String djrxm;			//登记人姓名
	private String djsj_from;		//登记时间
	private String djsj_to;			//登记时间
	private String czbs;			//操作标识
	private String pclb;			//盘查类别
	private String pcyy;			//盘查原因
	
	public String getKkmc() {
		return kkmc;
	}
	public void setKkmc(String kkmc) {
		this.kkmc = kkmc;
	}
	public String getPcsj_from() {
		return pcsj_from;
	}
	public void setPcsj_from(String pcsj_from) {
		this.pcsj_from = pcsj_from;
	}
	public String getPcsj_to() {
		return pcsj_to;
	}
	public void setPcsj_to(String pcsj_to) {
		this.pcsj_to = pcsj_to;
	}
	public String getPcmjxm() {
		return pcmjxm;
	}
	public void setPcmjxm(String pcmjxm) {
		this.pcmjxm = pcmjxm;
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
	public String getPcbh() {
		return pcbh;
	}
	public void setPcbh(String pcbh) {
		this.pcbh = pcbh;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getKkbh() {
		return kkbh;
	}
	public void setKkbh(String kkbh) {
		this.kkbh = kkbh;
	}
	public String getPclb() {
		return pclb;
	}
	public void setPclb(String pclb) {
		this.pclb = pclb;
	}
	public String getPcyy() {
		return pcyy;
	}
	public void setPcyy(String pcyy) {
		this.pcyy = pcyy;
	}
	
}
