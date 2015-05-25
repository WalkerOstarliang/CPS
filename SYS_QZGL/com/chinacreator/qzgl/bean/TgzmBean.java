package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
/**
 * 为民服务--提供证明
 * @author Administrator
 *
 */
public class TgzmBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String  id       ; //  varchar2(20)        4位行政编码+6位日期+10位序列号
	private String  sqrxm    ; //  varchar2(30)        申请人姓名
	private String  sqrxb    ; //  varchar2(2)         申请人性别（参照“性别”字典）
	private String  sqrxbms  ; //   性别（翻译）
	private String  sqrzjzl  ; //  varchar2(10)        申请人证件种类（参照“证件种类”字典）
	private String  sqrzjzlms ; // 证件种类（翻译）
	private String  sqrzjhm  ; //  varchar2(30)        申请人证件号码
	private String  sqrlxfs  ; //  varchar2(30)        申请人联系方式
	private String  sqsj     ; //  date                申请时间
	private String  tgzmlx   ; //  varchar2(60)        提供证明类型
	private String  tgzmnr   ; //  clob                提供证明内容
	private String  cbsj     ; //  date                承办时间
	private String  cbdwdm   ; //  varchar2(12)        承办单位机构代码
	private String  cbdwmc   ; //  varchar2(100)       承办单位名称
	private String  cbrxm    ; //  varchar2(30)        承办人姓名
	private String  qfrxm    ; //  varchar2(30)        签发人姓名
	private String  cljg     ; //  varchar2(200)       处理结果
	private String  bz       ; //  varchar2(200)       备注
	private String  sssqdm   ; //  varchar2(12)        所属社区代码
	private String  sssqmc   ; //  varchar2(100)       所属社区名称
	private String  ssjwqdm  ; //  varchar2(12)        所属警务区代码
	private String  ssjwqmc  ; //  varchar2(100)       所属警务区名称
	private String  czrxm    ; //  varchar2(30)        录入人姓名（操作人姓名）
	private String  czrjh    ; //  varchar2(30)        操作人警号
	private String  czrsfzh  ; //  varchar2(18)        操作人身份证号
	private String  czsj     ; //  date                操作时间（初始为登记时间，如果跟登记时间不一致代表修改时间）
	private String  czdwdm   ; //  varchar2(12)        操作单位代码
	private String  czdwmc   ; //  varchar2(100)       操作单位名称
	private String  djrxm    ; //  varchar2(30)        登记人姓名
	private String  djrsfzh  ; //  varchar2(18)        登记人身份证号
	private String  djsj     ; //  date                登记时间
	private String  djdwdm   ; //  varchar2(12)        登记单位代码
	private String  djdwmc   ; //  varchar2(100)       登记单位名称
	private String  zxbs     ; //  varchar2(2)         注销标识（'0':正常；'1':注销；'2':删除）
	private String  zxbsms   ; //  注销标识描述
	private String  zxsj     ; //  date                注销时间
	private String  scsj     ; //  date                删除时间
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSqrxm() {
		return sqrxm;
	}
	public void setSqrxm(String sqrxm) {
		this.sqrxm = sqrxm;
	}
	public String getSqrxb() {
		return sqrxb;
	}
	public void setSqrxb(String sqrxb) {
		this.sqrxb = sqrxb;
	}
	public String getSqrzjzl() {
		return sqrzjzl;
	}
	public void setSqrzjzl(String sqrzjzl) {
		this.sqrzjzl = sqrzjzl;
	}
	public String getSqrzjhm() {
		return sqrzjhm;
	}
	public void setSqrzjhm(String sqrzjhm) {
		this.sqrzjhm = sqrzjhm;
	}
	public String getSqrlxfs() {
		return sqrlxfs;
	}
	public void setSqrlxfs(String sqrlxfs) {
		this.sqrlxfs = sqrlxfs;
	}
	public String getSqsj() {
		return sqsj;
	}
	public void setSqsj(String sqsj) {
		this.sqsj = sqsj;
	}
	public String getTgzmlx() {
		return tgzmlx;
	}
	public void setTgzmlx(String tgzmlx) {
		this.tgzmlx = tgzmlx;
	}
	public String getTgzmnr() {
		return tgzmnr;
	}
	public void setTgzmnr(String tgzmnr) {
		this.tgzmnr = tgzmnr;
	}
	public String getCbsj() {
		return cbsj;
	}
	public void setCbsj(String cbsj) {
		this.cbsj = cbsj;
	}
	public String getCbdwdm() {
		return cbdwdm;
	}
	public void setCbdwdm(String cbdwdm) {
		this.cbdwdm = cbdwdm;
	}
	public String getCbdwmc() {
		return cbdwmc;
	}
	public void setCbdwmc(String cbdwmc) {
		this.cbdwmc = cbdwmc;
	}
	public String getCbrxm() {
		return cbrxm;
	}
	public void setCbrxm(String cbrxm) {
		this.cbrxm = cbrxm;
	}
	public String getQfrxm() {
		return qfrxm;
	}
	public void setQfrxm(String qfrxm) {
		this.qfrxm = qfrxm;
	}
	public String getCljg() {
		return cljg;
	}
	public void setCljg(String cljg) {
		this.cljg = cljg;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getSssqdm() {
		return sssqdm;
	}
	public void setSssqdm(String sssqdm) {
		this.sssqdm = sssqdm;
	}
	public String getSssqmc() {
		return sssqmc;
	}
	public void setSssqmc(String sssqmc) {
		this.sssqmc = sssqmc;
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
	public String getCzrsfzh() {
		return czrsfzh;
	}
	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
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
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
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
	public String getScsj() {
		return scsj;
	}
	public void setScsj(String scsj) {
		this.scsj = scsj;
	}
	public String getZxbsms() {
		return zxbsms;
	}
	public void setZxbsms(String zxbsms) {
		this.zxbsms = zxbsms;
	}
	public String getSqrxbms() {
		this.sqrxbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", sqrxb); 
		return sqrxbms;
	}
	public void setSqrxbms(String sqrxbms) {
		this.sqrxbms = sqrxbms;
	}
	public String getSqrzjzlms() {
		this.sqrzjzlms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", sqrzjzl);
		return sqrzjzlms;
	}
	public void setSqrzjzlms(String sqrzjzlms) {
		this.sqrzjzlms = sqrzjzlms;
	}
	
}
