package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
/**
 * 其他服务bean
 * @author Administrator
 *
 */
public class QtfwBean  extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1363362065728002660L;
	private  String  id          ;  //   varchar2(22)  y      6位行政编码+6位日期+10位序列号
	private  String  fwsj        ;  //   date  y      服务时间
	private  String  fwnr        ;  //   varchar2(400)  y      服务内容
	private  String  bz          ;  //   varchar2(400)  y      备注
	private  String  ssjwqdm     ;  //   varchar2(12)  y      所属警务区代码
	private  String  ssjwqmc     ;  //   varchar2(120)  y      所属警务区名称
	private  String  jbrxm       ;  //   varchar2(30)  y      经办人姓名
	private  String  djsj        ;  //   date  y      登记时间
	private  String  djrxm       ;  //   varchar2(30)  y      登记人姓名
	private  String  djrjh       ;  //   varchar2(30)  y      登记人警号
	private  String  djdwdm      ;  //   varchar2(12)  y      登记单位代码
	private  String  djdwmc      ;  //   varchar2(120)  y      登记单位名称
	private  String  czrxm       ;  //   varchar2(30)  y      操作人姓名
	private  String  czsj        ;  //   date  y      操作时间
	private  String  czdwdm      ;  //   varchar2(12)  y      操作单位代码
	private  String  czdwmc      ;  //   varchar2(120)  y      操作单位名称
	private  String  czrjh       ;  //   varchar2(30)  y      操作人警号
	private  String  zxbs        ;  //   varchar2(2)  y      注销标识（'0':正常；'1':注销；'2':删除）
	private  String  scsj        ;  //   date  y      删除时间
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFwsj() {
		return fwsj;
	}
	public void setFwsj(String fwsj) {
		this.fwsj = fwsj;
	}
	public String getFwnr() {
		return fwnr;
	}
	public void setFwnr(String fwnr) {
		this.fwnr = fwnr;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getSsjwqdm() {
		return ssjwqdm;
	}
	public void setSsjwqdm(String ssjwqdm) {
		this.ssjwqdm = ssjwqdm;
	}
	public String getSsjwqmc() {
		return ssjwqmc;
	}
	public void setSsjwqmc(String ssjwqmc) {
		this.ssjwqmc = ssjwqmc;
	}
	public String getJbrxm() {
		return jbrxm;
	}
	public void setJbrxm(String jbrxm) {
		this.jbrxm = jbrxm;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
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
	public String getCzrjh() {
		return czrjh;
	}
	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getScsj() {
		return scsj;
	}
	public void setScsj(String scsj) {
		this.scsj = scsj;
	}
	
}
