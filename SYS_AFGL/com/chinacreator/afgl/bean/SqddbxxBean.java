package com.chinacreator.afgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
/**
 * 社区 党代表
 * @author Administrator
 *
 */
public class SqddbxxBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private  String  id        ;  //  varchar2(22)  y      6位行政编码+6位日期+10位序列号
	private  String  ddbxm     ;  //  varchar2(30)  y      党代表姓名
	private  String  ddbsfzh   ;  //  varchar2(18)  y      党代表身份证号
	private  String  ddblxdh   ;  //  varchar2(30)  y      党代表联系电话
	private  String  zzmm      ;  //  varchar2(10)  y      政治面貌
	private  String  hjdqh     ;  //  varchar2(6)  y      户籍区划
	private  String  hjdqhmc   ; //  户籍区划名称
	private  String  xzzxz     ;  //  varchar2(150)  y      现住地详址
	private  String  drsj      ;  //  date  y      调入日期
	private  String  sfrddb    ;  //  varchar2(1)  y      是否人大代表（0：否，1：是）
	private  String  sfzxwy    ;  //  varchar2(1)  y      是否政协委员（0：否，1：是）
	private  String  zwms ; // 职务描述 
	private  String  sfdc      ;  //  varchar2(1)  y      是否调出（0：否，1：是）
	private  String  dcrq      ;  //  date  y      调出日期
	private  String  djrxm     ;  //  varchar2(30)  y      登记人姓名
	private  String  djrjh     ;  //  varchar2(30)  y      登记人警号
	private  String  djrsfzh   ;  //  varchar2(18)  y      登记人身份证号
	private  String  djdwdm    ;  //  varchar2(12)  y      登记单位代码
	private  String  djdwmc    ;  //  varchar2(150)  y      登记单位名称
	private  String  ssjwqdm   ;  //  varchar2(12)  y      所属警务区代码
	private  String  ssjwqmc   ;  //  varchar2(150)  y      所属警务区名称
	private  String  sqdm      ;  //  varchar2(12)  y      所属社区代码
	private  String  sqmc      ;  //  varchar2(150)  y      所属社区名称
	private  String  zxbs      ;  //  varchar2(1)  y      注销标识（0：正常，1：注销）
	private  String  zxsj      ;  //  date  y      注销时间
	private  String  ip        ;  //  varchar2(150)  y      ip地址
	private  String  xgrxm     ;  //  varchar2(30)  y      修改人姓名
	private  String  xgrjh     ;  //  varchar2(30)  y      修改人警号
	private  String  xgsj      ;  //  date  y      修改时间
	private  String  djsj ; // 登记时间
	private  String  csrq ; // 出生日期
	private String cz ; // 操作
	

	private String xb ; // 性别
	
	private String xbms ; //性别描述
	
	public String getXbms() {
		xbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		return xbms;
	}
	public void setXbms(String xbms) {
		this.xbms = xbms;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDdbxm() {
		return ddbxm;
	}
	public void setDdbxm(String ddbxm) {
		this.ddbxm = ddbxm;
	}
	public String getDdbsfzh() {
		return ddbsfzh;
	}
	public void setDdbsfzh(String ddbsfzh) {
		this.ddbsfzh = ddbsfzh;
	}
	public String getDdblxdh() {
		return ddblxdh;
	}
	public void setDdblxdh(String ddblxdh) {
		this.ddblxdh = ddblxdh;
	}
	public String getZzmm() {
		return zzmm;
	}
	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	public String getHjdqh() {
		return hjdqh;
	}
	public void setHjdqh(String hjdqh) {
		this.hjdqh = hjdqh;
	}
	public String getXzzxz() {
		return xzzxz;
	}
	public void setXzzxz(String xzzxz) {
		this.xzzxz = xzzxz;
	}
	public String getDrsj() {
		return drsj;
	}
	public void setDrsj(String drsj) {
		this.drsj = drsj;
	}
	public String getSfrddb() {
		return sfrddb;
	}
	public void setSfrddb(String sfrddb) {
		this.sfrddb = sfrddb;
	}
	public String getSfzxwy() {
		return sfzxwy;
	}
	public void setSfzxwy(String sfzxwy) {
		this.sfzxwy = sfzxwy;
	}
	public String getSfdc() {
		return sfdc;
	}
	public void setSfdc(String sfdc) {
		this.sfdc = sfdc;
	}
	public String getDcrq() {
		return dcrq;
	}
	public void setDcrq(String dcrq) {
		this.dcrq = dcrq;
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
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
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
	public String getSqdm() {
		return sqdm;
	}
	public void setSqdm(String sqdm) {
		this.sqdm = sqdm;
	}
	public String getSqmc() {
		return sqmc;
	}
	public void setSqmc(String sqmc) {
		this.sqmc = sqmc;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getZxsj() {
		return zxsj;
	}
	public void setZxsj(String zxsj) {
		this.zxsj = zxsj;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getXgrxm() {
		return xgrxm;
	}
	public void setXgrxm(String xgrxm) {
		this.xgrxm = xgrxm;
	}
	public String getXgrjh() {
		return xgrjh;
	}
	public void setXgrjh(String xgrjh) {
		this.xgrjh = xgrjh;
	}
	public String getXgsj() {
		return xgsj;
	}
	public void setXgsj(String xgsj) {
		this.xgsj = xgsj;
	}
	public String getZwms() {
		String a ="";
		String b ="";
		if(sfrddb != null && "1".equals(sfrddb)){
			  //是否人大代表（0：否，1：是）
			  a ="人大代表";
			  if(sfzxwy != null && "1".equals(sfzxwy)){
				 // 是否政协委员（0：否，1：是）
				  b ="，政协委员";
			  }
		  }else{
			  if(sfzxwy != null && "1".equals(sfzxwy)){
				 // 是否政协委员（0：否，1：是）
				  b ="政协委员";
			  } 
		  } ;  
		  
		 zwms = a+b;
		return zwms;
	}
	public void setZwms(String zwms) {
		this.zwms = zwms;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getHjdqhmc() {
		hjdqhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", hjdqh);
		return hjdqhmc;
	}
	public void setHjdqhmc(String hjdqhmc) {
		this.hjdqhmc = hjdqhmc;
	}
	
}
