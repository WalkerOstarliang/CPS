package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 卡口信息
 *
 */
public class KkxxQuery extends QueryBean{
	
	private static final long serialVersionUID = -4430187498905624536L;
	
	private String kkbh;			//卡口编号
	private String kkmc;			//卡口名称
	private String kkcjsj_from;		//卡口创建时间
	private String kkcjsj_to;		//卡口创建时间
	private String kkwz;			//卡口位置
	private String sszrqdm;			//所属责任区代码
	private String djrxm;			//登记人姓名
	private String djsj_from;		//登记时间
	private String djsj_to;			//登记时间
	private String zxbs;			//注销标识
	private String czbs;			//操作标识；标记新增1；修改2；删除3
	
	public String getKkmc() {
		return kkmc;
	}
	public void setKkmc(String kkmc) {
		this.kkmc = kkmc;
	}
	public String getKkcjsj_from() {
		return kkcjsj_from;
	}
	public void setKkcjsj_from(String kkcjsj_from) {
		this.kkcjsj_from = kkcjsj_from;
	}
	public String getKkcjsj_to() {
		return kkcjsj_to;
	}
	public void setKkcjsj_to(String kkcjsj_to) {
		this.kkcjsj_to = kkcjsj_to;
	}
	public String getKkwz() {
		return kkwz;
	}
	public void setKkwz(String kkwz) {
		this.kkwz = kkwz;
	}
	public String getSszrqdm() {
		return sszrqdm;
	}
	public void setSszrqdm(String sszrqdm) {
		this.sszrqdm = sszrqdm;
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
	public String getKkbh() {
		return kkbh;
	}
	public void setKkbh(String kkbh) {
		this.kkbh = kkbh;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

}
