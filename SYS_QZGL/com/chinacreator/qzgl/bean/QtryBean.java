package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
/**
 * 为民服务-- 流浪乞讨人员bean
 * @author Administrator
 *
 */
public class QtryBean  extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String  id          ;  //  varchar2(22)  y      6位行政编码+6位日期+10位序列号
	private String  qtrylb      ;  //  varchar2(10)  y      人员类别（参考“人员类别”字典）
	private String  qtrylbms    ;  // 人员类别描述
	private String  qtryxm      ;  //  varchar2(30)  y      乞讨人员姓名
	private String  qtrycym     ;  //  varchar2(30)  y      乞讨人员曾用名
	private String  qtryxb      ;  //  varchar2(10)  y      乞讨人员性别（参照“性别”字典）
	private String  qtryxbms    ;  //  性别描述
	private String  qtrynl      ;  //  varchar2(3)  y      乞讨人员年龄
	private String  qtryjg      ;  //  varchar2(10)  y      乞讨人员籍贯（参照“行政区划”字典）
	private String  qtryjgms    ;  // 籍贯描述
	private String  qtrymz      ;  //  varchar2(10)  y      乞讨人员民族（参照“民族”字典）
	private String  qtrymzms    ; // 民族描述
	private String  qtrywhcd    ;  //  varchar2(10)  y      乞讨人员文化程度（参照“文化程度”字典）
	private String  qtrywhcdms  ; // 文化程度描述
	private String  qtryjkzk    ;  //  varchar2(10)  y      乞讨人员健康状况（参照“健康状况”字典）
	private String  qtryjkzkms  ; // 健康状况描述
	private String  qtrybfxsj   ;  //  date  y      乞讨人员被发现时间
	private String  qtrybfxdd   ;  //  varchar2(120)  y      乞讨人员被发现地点
	private String  qtryhjxz    ;  //  varchar2(120)  y      乞讨人员户籍详址
	private String  qtrycw      ;  //  varchar2(200)  y      乞讨人员携带物品财物
	private String  qtryjsrxm   ;  //  varchar2(30)  y      乞讨人员接收人姓名
	private String  qtryjssj    ;  //  date  y      乞讨人员接收时间
	private String  qtryjsdwmc  ;  //  varchar2(120)  y      乞讨人员接收单位名称
	private String  qtryjsdwld  ;  //  varchar2(30)  y      乞讨人员接收单位领导
	private String  qtrybz      ;  //  varchar2(200)  y      乞讨人员备注
	private String  ssjwqdm     ;  //  varchar2(12)  y      乞讨人员所属警务区代码
	private String  ssjwqmc     ;  //  varchar2(120)  y      乞讨人员所属警务区名称
	private String  djrxm       ;  //  varchar2(30)  y      登记人姓名
	private String  djrjh       ;  //  varchar2(30)  y      登记人警号
	private String  djsj        ;  //  date  y      登记时间
	private String  djdwdm      ;  //  varchar2(12)  y      登记单位代码
	private String  djdwmc      ;  //  varchar2(120)  y      登记单位名称
	private String  czrxm       ;  //  varchar2(30)  y      操作人姓名
	private String  czrjh       ;  //  varchar2(30)  y      操作人警号
	private String  czsj        ;  //  date  y      操作时间
	private String  czdwdm      ;  //  varchar2(12)  y      操作单位代码
	private String  czdwmc      ;  //  varchar2(120)  y      操作单位名称
	private String  zxbs        ;  //  varchar2(2)  y      注销标识（'0':正常；'1':注销；'2':删除）
	private String  scsj        ;  //  date  y      删除时间
	
	/*
	 * 以下字段属移送信息
	 * */
	
	private  String   sydwyj      ;   //  varchar2(200)  y      送院单位意见（属移送信息）
	private  String   sysj        ;   //  date  y      送院时间（属移送信息）
	private  String   szyy        ;   //  varchar2(120)  y      收治医院名称（属移送信息）
	private  String   zyh         ;   //  varchar2(30)  y      住院号（属移送信息）
	private  String   ryqk        ;   //  varchar2(200)  y      入院情况（属移送信息）
	private  String   syryxm      ;   //  varchar2(30)  y      送院人员姓名（属移送信息）
	private  String   jsysxm      ;   //  varchar2(30)  y      接收医生姓名（属移送信息）
	private  String   rysj        ;   //  date  y      入院时间（属移送信息）
	private  String   jzzshyj     ;   //  varchar2(200)  y      救助站审核意见（属移送信息）
	private  String   jzzshrxm    ;   //  varchar2(30)  y      救助站审核人姓名（属移送信息）
	private  String   jzzshsj     ;   //  date  y      救助站审核时间（属移送信息）
	private  String   cyqkclyj    ;   //  varchar2(200)  y      出院情况处理意见（属移送信息）
	private  String   ylfy        ;   //  varchar2(30)  y      医疗费用（属移送信息）
	private  String   zzysxm      ;   //  varchar2(30)  y      主治医生姓名（属移送信息）
	private  String   yssj        ;   //  date  y      移送时间（属移送信息）
	private  String   yscbrxm     ;   //  varchar2(30)  y      移送承办人姓名（属移送信息）
	private  String   jsrxm       ;   //  varchar2(30)  y      接收人姓名（属移送信息）
	private  String   jssj        ;   //  date  y      接收时间（属移送信息）
	private  String   jsdwmc      ;   //  varchar2(30)  y      接收单位名称（属移送信息）
	private  String   jsdwld      ;   //  varchar2(30)  y      接收单位领导（属移送信息）
	private  String   ysxxbz      ;   //  varchar2(200)  y      移送信息备注（属移送信息）
	private  String   ysdjsj      ;   //  date  y      移送登记时间（属移送信息）
	private  String   ysdjrxm     ;   //  varchar2(30)  y      移送登记人姓名（属移送信息）
	private  String   ysdjdwdm    ;   //  varchar2(12)  y      移送登记单位代码（属移送信息）
	private  String   ysdjdwmc    ;   //  varchar2(120)  y      移送登记单位名称（属移送信息）
	
	
	
	
	public String getSydwyj() {
		return sydwyj;
	}
	public void setSydwyj(String sydwyj) {
		this.sydwyj = sydwyj;
	}
	public String getSysj() {
		return sysj;
	}
	public void setSysj(String sysj) {
		this.sysj = sysj;
	}
	public String getSzyy() {
		return szyy;
	}
	public void setSzyy(String szyy) {
		this.szyy = szyy;
	}
	public String getZyh() {
		return zyh;
	}
	public void setZyh(String zyh) {
		this.zyh = zyh;
	}
	public String getRyqk() {
		return ryqk;
	}
	public void setRyqk(String ryqk) {
		this.ryqk = ryqk;
	}
	public String getSyryxm() {
		return syryxm;
	}
	public void setSyryxm(String syryxm) {
		this.syryxm = syryxm;
	}
	public String getJsysxm() {
		return jsysxm;
	}
	public void setJsysxm(String jsysxm) {
		this.jsysxm = jsysxm;
	}
	public String getRysj() {
		return rysj;
	}
	public void setRysj(String rysj) {
		this.rysj = rysj;
	}
	public String getJzzshyj() {
		return jzzshyj;
	}
	public void setJzzshyj(String jzzshyj) {
		this.jzzshyj = jzzshyj;
	}
	public String getJzzshrxm() {
		return jzzshrxm;
	}
	public void setJzzshrxm(String jzzshrxm) {
		this.jzzshrxm = jzzshrxm;
	}
	public String getJzzshsj() {
		return jzzshsj;
	}
	public void setJzzshsj(String jzzshsj) {
		this.jzzshsj = jzzshsj;
	}
	public String getCyqkclyj() {
		return cyqkclyj;
	}
	public void setCyqkclyj(String cyqkclyj) {
		this.cyqkclyj = cyqkclyj;
	}
	public String getYlfy() {
		return ylfy;
	}
	public void setYlfy(String ylfy) {
		this.ylfy = ylfy;
	}
	public String getZzysxm() {
		return zzysxm;
	}
	public void setZzysxm(String zzysxm) {
		this.zzysxm = zzysxm;
	}
	public String getYssj() {
		return yssj;
	}
	public void setYssj(String yssj) {
		this.yssj = yssj;
	}
	public String getYscbrxm() {
		return yscbrxm;
	}
	public void setYscbrxm(String yscbrxm) {
		this.yscbrxm = yscbrxm;
	}
	public String getJsrxm() {
		return jsrxm;
	}
	public void setJsrxm(String jsrxm) {
		this.jsrxm = jsrxm;
	}
	public String getJssj() {
		return jssj;
	}
	public void setJssj(String jssj) {
		this.jssj = jssj;
	}
	public String getJsdwmc() {
		return jsdwmc;
	}
	public void setJsdwmc(String jsdwmc) {
		this.jsdwmc = jsdwmc;
	}
	public String getJsdwld() {
		return jsdwld;
	}
	public void setJsdwld(String jsdwld) {
		this.jsdwld = jsdwld;
	}
	public String getYsxxbz() {
		return ysxxbz;
	}
	public void setYsxxbz(String ysxxbz) {
		this.ysxxbz = ysxxbz;
	}
	public String getYsdjsj() {
		return ysdjsj;
	}
	public void setYsdjsj(String ysdjsj) {
		this.ysdjsj = ysdjsj;
	}
	public String getYsdjrxm() {
		return ysdjrxm;
	}
	public void setYsdjrxm(String ysdjrxm) {
		this.ysdjrxm = ysdjrxm;
	}
	public String getYsdjdwdm() {
		return ysdjdwdm;
	}
	public void setYsdjdwdm(String ysdjdwdm) {
		this.ysdjdwdm = ysdjdwdm;
	}
	public String getYsdjdwmc() {
		return ysdjdwmc;
	}
	public void setYsdjdwmc(String ysdjdwmc) {
		this.ysdjdwmc = ysdjdwmc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQtrylb() {
		return qtrylb;
	}
	public void setQtrylb(String qtrylb) {
		this.qtrylb = qtrylb;
	}
	public String getQtryxm() {
		return qtryxm;
	}
	public void setQtryxm(String qtryxm) {
		this.qtryxm = qtryxm;
	}
	public String getQtrycym() {
		return qtrycym;
	}
	public void setQtrycym(String qtrycym) {
		this.qtrycym = qtrycym;
	}
	public String getQtryxb() {
		return qtryxb;
	}
	public void setQtryxb(String qtryxb) {
		this.qtryxb = qtryxb;
	}
	public String getQtrynl() {
		return qtrynl;
	}
	public void setQtrynl(String qtrynl) {
		this.qtrynl = qtrynl;
	}
	public String getQtryjg() {
		return qtryjg;
	}
	public void setQtryjg(String qtryjg) {
		this.qtryjg = qtryjg;
	}
	public String getQtrymz() {
		return qtrymz;
	}
	public void setQtrymz(String qtrymz) {
		this.qtrymz = qtrymz;
	}
	public String getQtrywhcd() {
		return qtrywhcd;
	}
	public void setQtrywhcd(String qtrywhcd) {
		this.qtrywhcd = qtrywhcd;
	}
	public String getQtryjkzk() {
		return qtryjkzk;
	}
	public void setQtryjkzk(String qtryjkzk) {
		this.qtryjkzk = qtryjkzk;
	}
	public String getQtrybfxsj() {
		return qtrybfxsj;
	}
	public void setQtrybfxsj(String qtrybfxsj) {
		this.qtrybfxsj = qtrybfxsj;
	}
	public String getQtrybfxdd() {
		return qtrybfxdd;
	}
	public void setQtrybfxdd(String qtrybfxdd) {
		this.qtrybfxdd = qtrybfxdd;
	}
	public String getQtryhjxz() {
		return qtryhjxz;
	}
	public void setQtryhjxz(String qtryhjxz) {
		this.qtryhjxz = qtryhjxz;
	}
	public String getQtrycw() {
		return qtrycw;
	}
	public void setQtrycw(String qtrycw) {
		this.qtrycw = qtrycw;
	}
	public String getQtryjsrxm() {
		return qtryjsrxm;
	}
	public void setQtryjsrxm(String qtryjsrxm) {
		this.qtryjsrxm = qtryjsrxm;
	}
	public String getQtryjssj() {
		return qtryjssj;
	}
	public void setQtryjssj(String qtryjssj) {
		this.qtryjssj = qtryjssj;
	}
	public String getQtryjsdwmc() {
		return qtryjsdwmc;
	}
	public void setQtryjsdwmc(String qtryjsdwmc) {
		this.qtryjsdwmc = qtryjsdwmc;
	}
	public String getQtryjsdwld() {
		return qtryjsdwld;
	}
	public void setQtryjsdwld(String qtryjsdwld) {
		this.qtryjsdwld = qtryjsdwld;
	}
	public String getQtrybz() {
		return qtrybz;
	}
	public void setQtrybz(String qtrybz) {
		this.qtrybz = qtrybz;
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
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
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
	public String getCzrjh() {
		return czrjh;
	}
	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
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
	public String getQtrylbms() {
		qtrylbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_RYLB", qtrylb); 
		return qtrylbms;
	}
	public void setQtrylbms(String qtrylbms) {
		this.qtrylbms = qtrylbms;
	}
	public String getQtryxbms() {
		qtryxbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", qtryxb); 
		return qtryxbms;
	}
	public void setQtryxbms(String qtryxbms) {
		this.qtryxbms = qtryxbms;
	}
	public String getQtryjgms() {
		qtryjgms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", qtryjg); 
		return qtryjgms;
	}
	public void setQtryjgms(String qtryjgms) {
		this.qtryjgms = qtryjgms;
	}
	public String getQtrymzms() {
		qtrymzms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_MZ", qtrymz); 
		return qtrymzms;
	}
	public void setQtrymzms(String qtrymzms) {
		this.qtrymzms = qtrymzms;
	}
	public String getQtrywhcdms() {
		qtrywhcdms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_WHCD", qtrywhcd);
		return qtrywhcdms;
	}
	public void setQtrywhcdms(String qtrywhcdms) {
		this.qtrywhcdms = qtrywhcdms;
	}
	public String getQtryjkzkms() {
		qtryjkzkms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_JKZK", qtryjkzk);
		return qtryjkzkms;
	}
	public void setQtryjkzkms(String qtryjkzkms) {
		this.qtryjkzkms = qtryjkzkms;
	}
	
}
