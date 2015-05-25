package com.chinacreator.xtgl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;

public class FwjcpzBean {
	private String id;	//ID
	private String fwzdlb;	//房屋重点类别
	private String fwzdlbms;
	private String jczq;	//检查周期
	private String tqtxts;	//提前检查天数
	private String djrq;	//登记日期
	private String djdwdm;	//登记单位代码
	private String djdwmc;	//登记单位名称
	private String djrxm;	//登记人姓名
	private String czdwdm;	//操作单位代码
	private String czdwmc;	//操作单位名称
	private String czrxm;	//操作人姓名
	private String czsj;	//操作时间
	private String czbs;	//操作标识 1 :新增 2：修改 3：删除
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFwzdlb() {
		return fwzdlb;
	}
	public void setFwzdlb(String fwzdlb) {
		this.fwzdlb = fwzdlb;
	}
	public String getJczq() {
		return jczq;
	}
	public void setJczq(String jczq) {
		this.jczq = jczq;
	}
	public String getTqtxts() {
		return tqtxts;
	}
	public void setTqtxts(String tqtxts) {
		this.tqtxts = tqtxts;
	}
	public String getDjrq() {
		return djrq;
	}
	public void setDjrq(String djrq) {
		this.djrq = djrq;
	}
	public String getDjdwdm() {
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}
	public String getDjdwmc() {
		return djdwmc;
	}
	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getCzdwdm() {
		return czdwdm;
	}
	public void setCzdwdm(String czdwdm) {
		this.czdwdm = czdwdm;
	}
	public String getCzdwmc() {
		return czdwmc;
	}
	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}
	public String getCzrxm() {
		return czrxm;
	}
	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}
	public String getCzsj() {
		return czsj;
	}
	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getFwzdlbms() {
		fwzdlbms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_FWZDGLLB", fwzdlb);
		return fwzdlbms;
	}
	public void setFwzdlbms(String fwzdlbms) {
		this.fwzdlbms = fwzdlbms;
	}
	
	
}
