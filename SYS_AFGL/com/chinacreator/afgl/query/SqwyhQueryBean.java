package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;
/**
 * 业主委员会查询条件
 * @author Administrator
 *
 */
public class SqwyhQueryBean  extends QueryBean{
  private static final long serialVersionUID = 1L;
  
  private  String  wyxqmc   ;   //  varchar2(150)  y      业主委员会名称
  private  String  stmc     ;   //  varchar2(200)  y      实体名称
  private  String  stdz     ;   //  varchar2(300)  y      实体地址
  private  String  fzrxm    ;   // 负责人姓名
  private  String  fzrsfzh  ;  // 负责人身份证号
  private  String  cyxm  ; // 委员会成员姓名
  private  String  cysfzh ; // 委员会成员身份证号
  private  String  zxbs  ; // 注销标识
  private  String  clstartdate ; // 查询成立开始日期
  private  String  clenddate ; // 查询成立结束日期
	public String getWyxqmc() {
		return wyxqmc;
	}
	public void setWyxqmc(String wyxqmc) {
		this.wyxqmc = wyxqmc;
	}
	public String getStmc() {
		return stmc;
	}
	public void setStmc(String stmc) {
		this.stmc = stmc;
	}
	public String getStdz() {
		return stdz;
	}
	public void setStdz(String stdz) {
		this.stdz = stdz;
	}
	public String getFzrxm() {
		return fzrxm;
	}
	public void setFzrxm(String fzrxm) {
		this.fzrxm = fzrxm;
	}
	public String getFzrsfzh() {
		return fzrsfzh;
	}
	public void setFzrsfzh(String fzrsfzh) {
		this.fzrsfzh = fzrsfzh;
	}
	public String getCyxm() {
		return cyxm;
	}
	public void setCyxm(String cyxm) {
		this.cyxm = cyxm;
	}
	public String getCysfzh() {
		return cysfzh;
	}
	public void setCysfzh(String cysfzh) {
		this.cysfzh = cysfzh;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getClstartdate() {
		return clstartdate;
	}
	public void setClstartdate(String clstartdate) {
		this.clstartdate = clstartdate;
	}
	public String getClenddate() {
		return clenddate;
	}
	public void setClenddate(String clenddate) {
		this.clenddate = clenddate;
	}
	  
}
