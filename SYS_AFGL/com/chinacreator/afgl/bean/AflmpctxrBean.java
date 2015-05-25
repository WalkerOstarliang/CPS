package com.chinacreator.afgl.bean;

import com.chinacreator.common.bean.BaseValue;

public class AflmpctxrBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1597017465352346096L;
	private String id;	//同行人编号
	private String pcbh;	//盘查记录编号
	private String txrxm;	//同行人姓名
	private String txrsfzh;	//同行人身份证号
	private String cz;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPcbh() {
		return pcbh;
	}
	public void setPcbh(String pcbh) {
		this.pcbh = pcbh;
	}
	public String getTxrxm() {
		return txrxm;
	}
	public void setTxrxm(String txrxm) {
		this.txrxm = txrxm;
	}
	public String getTxrsfzh() {
		return txrsfzh;
	}
	public void setTxrsfzh(String txrsfzh) {
		this.txrsfzh = txrsfzh;
	}
	public String getCz() {
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"deltxrxx('" + id +"')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
		cz = sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	

}
