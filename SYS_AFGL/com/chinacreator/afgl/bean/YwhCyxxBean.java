package com.chinacreator.afgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
/**
 * 业主委员会成员
 * @author Administrator
 *
 */
public class YwhCyxxBean  extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private  String   id  	    ;  //   varchar2(22)  y      6位行政编码+6位日期+10位序列号
	private  String   wyxqmc    ;  //   varchar2(150)  y      业主委员会名称
	private  String   xm  	    ;  //   varchar2(30)  y      委员会成员姓名
	private  String   sfzh      ;  //   varchar2(18)  y      成员身份证
	private  String   xb        ;  //   varchar2(2)  y      成员性别
	private  String   xbms      ; // 性别描述
	private  String   lxdh      ;  //   varchar2(30)  y      成员联系电话
	private  String   djrxm     ;  //   varchar2(30)  y      登记人姓名
	private  String   djrjh     ;  //   varchar2(30)  y      登记人警号
	private  String   djrsfzh   ;  //   varchar2(18)  y      登记人身份证号
	private  String   djdwdm    ;  //   varchar2(12)  y      登记单位代码
	private  String   djdwmc    ;  //   varchar2(150)  y      登记单位名称
	private  String   ssjwqdm   ;  //   varchar2(12)  y      所属警务区代码
	private  String   ssjwqmc   ;  //   varchar2(150)  y      所属警务区名称
	private  String   zxbs      ;  //   varchar2(1)  y      注销标识 0：正常 ， 1：注销
	private  String   zxbsms    ; // 注销标识描述
	private  String   zxsj      ;  //   date  y      注销时间
	private  String   ip        ;  //   varchar2(150)  y      ip地址
	private  String   xgrxm     ;  //   varchar2(30)  y      修改人姓名
	private  String   xgrjh     ;  //   varchar2(30)  y      修改人警号
	private  String   xgsj      ;  //   date  y      修改时间
	private  String   djsj      ;  //   date  y      登记时间
	private  String   csrq      ;  //   date  y      出生日期
	private  String   zzmm      ;  //   varchar2(10)  y      政治面貌
	private  String   sqdm      ;  //   varchar2(12)  y      社区代码
	private  String   sqmc      ;  //   varchar2(120)  y      社区名称
	private  String   yzwyhid   ;  //   varchar2(22)  y      业主委员会id，关联业主委员会表
	private  String   jrrq      ;  //   date  y      加入业主委员会日期
	private  String   zw ;  // 职务  1：主席 ；2：副主席；3：成员
	private  String   zwms ; // 职务描述
	
	public String getZw() {
		return zw;
	}
	public void setZw(String zw) {
		this.zw = zw;
	}
	public String getZwms() {
		// 1：主席 ；2：副主席；3：成员
		String strs = "";
		if("1".equals(zw)){
			strs ="主席";
		}else if("2".equals(zw)){
			strs ="副主席";
		}else if("3".equals(zw)){
			strs ="成员";
		}
		zwms = strs ;
		
		return zwms;
	}
	public void setZwms(String zwms) {
		this.zwms = zwms;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWyxqmc() {
		return wyxqmc;
	}
	public void setWyxqmc(String wyxqmc) {
		this.wyxqmc = wyxqmc;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
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
	public String getZzmm() {
		return zzmm;
	}
	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
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
	public String getYzwyhid() {
		return yzwyhid;
	}
	public void setYzwyhid(String yzwyhid) {
		this.yzwyhid = yzwyhid;
	}
	public String getJrrq() {
		return jrrq;
	}
	public void setJrrq(String jrrq) {
		this.jrrq = jrrq;
	}
	public String getXbms() {
		xbms  =  DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		return xbms;
	}
	public void setXbms(String xbms) {
		this.xbms = xbms;
	}
	public String getZxbsms() {
		String str = "" ;
		if("0".equals(zxbs)){
			str ="正常";
		}else if("1".equals(zxbs)){
			str ="注销";
		}
		zxbsms = str ;
		return zxbsms;
	}
	public void setZxbsms(String zxbsms) {
		this.zxbsms = zxbsms;
	}
	
	
}
