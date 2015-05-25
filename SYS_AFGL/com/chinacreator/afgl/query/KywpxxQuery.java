package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 可疑物品信息
 *
 */
public class KywpxxQuery extends QueryBean{
	
	private static final long serialVersionUID = -6663280797034075473L;
	
	private String kywpbh;			
	private String wpmc;			//物品名称
	private String pcbh;			//盘查编号
	private String wplx;			//物品类型
	private String clzt;			//处理状态
	private String djrxm;			//登记人姓名
	private String djsj_from;		//登记时间
	private String djsj_to;			//登记时间
	private String czbs;
	public String getWpmc() {
		return wpmc;
	}
	public void setWpmc(String wpmc) {
		this.wpmc = wpmc;
	}
	public String getWplx() {
		return wplx;
	}
	public void setWplx(String wplx) {
		this.wplx = wplx;
	}
	public String getClzt() {
		return clzt;
	}
	public void setClzt(String clzt) {
		this.clzt = clzt;
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
	public String getKywpbh() {
		return kywpbh;
	}
	public void setKywpbh(String kywpbh) {
		this.kywpbh = kywpbh;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getPcbh() {
		return pcbh;
	}
	public void setPcbh(String pcbh) {
		this.pcbh = pcbh;
	}
	
}
