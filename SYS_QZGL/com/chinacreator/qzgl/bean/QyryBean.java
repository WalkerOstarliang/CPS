package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
/**
 * 为民服务--工作管理--弃婴信息bean
 * @author Administrator
 *
 */
public class QyryBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7494985879825794701L;
	private String  id            ;  //  varchar2(22)  y      6位行政编码+6位日期+10位序列号
	private String  qyryxm        ;  //  varchar2(30)  n      弃婴人员姓名
	private String  qyryxmbm      ;  //  varchar2(30)  y      弃婴人员姓名别名
	private String  qyryxb        ;  //  varchar2(2)  n      弃婴人员性别（参照“性别”字典）
	private String  qyryxbms      ;  // 性别描述
	private String  qyrynl        ;  //  varchar2(3)  y      弃婴人员年龄
	private String  qyrycsrq      ;  //  date  y      弃婴人员出生日期
	private String  qyryzjlb      ;  //  varchar2(10)  y      弃婴人员证件类别（参照“证件种类”字典）
	private String  qyryzjlbms    ;  // 弃婴人员证件类别描述
	private String  qyryzjhm      ;  //  varchar2(30)  y      弃婴人员证件号码
	private String  qyryjg        ;  //  varchar2(10)  y      弃婴人员籍贯（参照“籍贯”字典）
	private String  qyryjgms      ;  //  弃婴人员籍贯描述
	private String  qyrytqyz      ;  //  varchar2(10)  n      弃婴人员体貌特征（参照“特殊特征”字典）
	private String  qyrytqyzms      ;  // 弃婴人员体貌特征描述
	
	private String  qyrytbbj      ;  //  varchar2(10)  n      弃婴人员体表标记
	private String  qyrystzk      ;  //  varchar2(30)  y      弃婴人员身体状况
	private String  qyryly        ;  //  varchar2(30)  n      弃婴人员来源
	private String  qyryzwcj      ;  //  varchar2(10)  y      弃婴人员指纹采集
	private String  qyrydnacj     ;  //  varchar2(10)  y      弃婴人员dna采集
	private String  qyryxx        ;  //  varchar2(10)  y      弃婴人员血型（参照“血型”字典）
	private String  qyryxxms ; //弃婴人员血型描述
	private String  qyryzmzp      ;  //  blob  y      弃婴人员正面照片
	private String  qyryyztz      ;  //  varchar2(400)  n      弃婴人员衣着特征
	private String  qyrysswp      ;  //  varchar2(400)  n      弃婴人员随身物品
	private String  qyrybfxsj     ;  //  date  n      弃婴人员被发现时间
	private String  qyrybfxdd     ;  //  varchar2(100)  y      弃婴人员被发现地点
	private String  qyryqyjg      ;  //  varchar2(400)  y      弃婴人员弃婴经过
	private String  qyrydssj      ;  //  date  n      弃婴人员到所时间
	private String  qyryjbrxm     ;  //  varchar2(30)  n      弃婴人员经办人姓名
	private String  qyrysjrxm     ;  //  varchar2(30)  y      弃婴人员送交人姓名
	private String  qyrysjrzjlb   ;  //  varchar2(10)  y      弃婴人员送交人证件类别（参照“证件种类”字典）
	private String  qyrysjrzjlbms ; //弃婴人员送交人证件类别描述
	
	private String  qyrysjrzjhm   ;  //  varchar2(30)  y      弃婴人员送交人证件号码
	private String  qyrysjrlxfs   ;  //  varchar2(30)  y      弃婴人员送交人联系方式
	private String  qyrysjrzz     ;  //  varchar2(120)  y      弃婴人员送交人员地址
	private String  qyrybz        ;  //  varchar2(200)  y      备注
	private String  ssjwqdm       ;  //  varchar2(12)  y      所属警务区代码
	private String  ssjwqmc       ;  //  varchar2(120)  y      所属警务区名称
	private String  djsj          ;  //  date  y      登记时间
	private String  djrxm         ;  //  varchar2(30)  y      登记人姓名
	private String  djrjh         ;  //  varchar2(30)  y      登记人警号
	private String  djdwdm        ;  //  varchar2(12)  y      登记单位代码
	private String  djdwmc        ;  //  varchar2(120)  y      登记单位名称
	private String  czrxm         ;  //  varchar2(30)  y      操作人姓名
	private String  czrjh         ;  //  varchar2(30)  y      操作人警号
	private String  czsj          ;  //  date  y      操作时间（如跟登记时间不一致，代表修改时间）
	private String  czdwdm        ;  //  varchar2(12)  y      操作单位代码
	private String  czdwmc        ;  //  varchar2(120)  y      操作单位名称
	private String  zxbs          ;  //  varchar2(2)  y      注销标识（'0':正常；'1':注销；'2':删除）
	private String  scsj          ;  //  date  y      删除时间
	
	private String  qyryfxrxm     ;  //  varchar2(30)  y      弃婴人员发现人姓名
	private String  qyryfxrsfzh   ;  //  varchar2(18)  y      弃婴人员发现人身份证号码
	private String  qyryfxrzjlb   ;  //  varchar2(10)  y      弃婴人员发现人证件类别（参照“证件种类”字典）
	private String  qyryfxrzjlbms ; // 弃婴人员发现人证件类别描述
	private String  qyryfxrzjhm   ;  //  varchar2(30)  y      弃婴人员发现人证件号码
	private String  qyryfxrzz     ;  // varchar2(200)  y      弃婴人员发现人住址
	
	private String  qyryfxrlxfs ;// 发现人联系方式
	
	/* 以下字段属移送信息*/
	
	private String qyrylssj      ;  //  date  y      弃婴离所时间（属移送信息）
	private String qyrylsqx      ;  //  varchar2(120)  y      弃婴离所去向（属移送信息）
	private String qyryjsdwmc    ;  //  varchar2(120)  y      弃婴接收单位名称（属移送信息）
	private String qyryjsdwdh    ;  //  varchar2(50)  y      弃婴接收单位电话（属移送信息）
	private String qyryjsdwdz    ;  //  varchar2(120)  y      弃婴接收单位地址（属移送信息）
	private String qyryrlrxm     ;  //  varchar2(30)  y      弃婴认领人姓名（属移送信息）
	private String qyryrlrsfzh   ;  //  varchar2(18)  y      弃婴认领人身份证号码（属移送信息）
	private String qyryrlrzjlb   ;  //  varchar2(10)  y      弃婴认领人证件类别（属移送信息）
	private String qyryrlrzjhm   ;  //  varchar2(30)  y      弃婴认领人证件号码（属移送信息）
	private String qyryrlrlxfs   ;  //  varchar2(30)  y      弃婴认领人联系方式（属移送信息）
	private String qyryyrlrgx    ;  //  varchar2(10)  y      弃婴与认领人关系（参考“与户主关系”字典）（属移送信息）
	
	private String qyryyrlrgxms ; //  弃婴与认领人关系描述
	
	private String qyryrlrzz     ;  //  varchar2(120)  y      认领人住址（属移送信息）
	private String qyryysjbrxm   ;  //  varchar2(30)  y      认领经办人姓名（属移送信息）
	private String qyryyssprxm   ;  //  varchar2(30)  y      弃婴认领审批人姓名（属移送信息）
	private String qyryysbz      ;  //  varchar2(200)  y      弃婴认领备注（属移送信息）
	private String qyysssjwqdm   ;  //  varchar2(12)  y      弃婴移送所属警务区代码（属移送信息）
	private String qyysssjwqmc   ;  //  varchar2(120)  y      弃婴移送所属警务区名称（属移送信息）
	private String qyysdjrxm     ;  //  varchar2(30)  y      弃婴移送登记人姓名（属移送信息）
	private String qyysdjsj      ;  //  date  y      弃婴移送登记时间（属移送信息）
	private String qyysdjdwdm    ;  //  varchar2(12)  y      弃婴移送信息登记单位代码（属移送信息）
	private String qyysdjdwmc    ;  //  varchar2(120)  y      弃婴移送信息登记单位名称（属移送信息）
	
	
	
	
	
	public String getQyrylssj() {
		return qyrylssj;
	}
	public void setQyrylssj(String qyrylssj) {
		this.qyrylssj = qyrylssj;
	}
	public String getQyrylsqx() {
		return qyrylsqx;
	}
	public void setQyrylsqx(String qyrylsqx) {
		this.qyrylsqx = qyrylsqx;
	}
	public String getQyryjsdwmc() {
		return qyryjsdwmc;
	}
	public void setQyryjsdwmc(String qyryjsdwmc) {
		this.qyryjsdwmc = qyryjsdwmc;
	}
	public String getQyryjsdwdh() {
		return qyryjsdwdh;
	}
	public void setQyryjsdwdh(String qyryjsdwdh) {
		this.qyryjsdwdh = qyryjsdwdh;
	}
	public String getQyryjsdwdz() {
		return qyryjsdwdz;
	}
	public void setQyryjsdwdz(String qyryjsdwdz) {
		this.qyryjsdwdz = qyryjsdwdz;
	}
	public String getQyryrlrxm() {
		return qyryrlrxm;
	}
	public void setQyryrlrxm(String qyryrlrxm) {
		this.qyryrlrxm = qyryrlrxm;
	}
	public String getQyryrlrsfzh() {
		return qyryrlrsfzh;
	}
	public void setQyryrlrsfzh(String qyryrlrsfzh) {
		this.qyryrlrsfzh = qyryrlrsfzh;
	}
	public String getQyryrlrzjlb() {
		return qyryrlrzjlb;
	}
	public void setQyryrlrzjlb(String qyryrlrzjlb) {
		this.qyryrlrzjlb = qyryrlrzjlb;
	}
	public String getQyryrlrzjhm() {
		return qyryrlrzjhm;
	}
	public void setQyryrlrzjhm(String qyryrlrzjhm) {
		this.qyryrlrzjhm = qyryrlrzjhm;
	}
	public String getQyryrlrlxfs() {
		return qyryrlrlxfs;
	}
	public void setQyryrlrlxfs(String qyryrlrlxfs) {
		this.qyryrlrlxfs = qyryrlrlxfs;
	}
	public String getQyryyrlrgx() {
		return qyryyrlrgx;
	}
	public void setQyryyrlrgx(String qyryyrlrgx) {
		this.qyryyrlrgx = qyryyrlrgx;
	}
	public String getQyryrlrzz() {
		return qyryrlrzz;
	}
	public void setQyryrlrzz(String qyryrlrzz) {
		this.qyryrlrzz = qyryrlrzz;
	}
	public String getQyryysjbrxm() {
		return qyryysjbrxm;
	}
	public void setQyryysjbrxm(String qyryysjbrxm) {
		this.qyryysjbrxm = qyryysjbrxm;
	}
	public String getQyryyssprxm() {
		return qyryyssprxm;
	}
	public void setQyryyssprxm(String qyryyssprxm) {
		this.qyryyssprxm = qyryyssprxm;
	}
	public String getQyryysbz() {
		return qyryysbz;
	}
	public void setQyryysbz(String qyryysbz) {
		this.qyryysbz = qyryysbz;
	}
	public String getQyysssjwqdm() {
		return qyysssjwqdm;
	}
	public void setQyysssjwqdm(String qyysssjwqdm) {
		this.qyysssjwqdm = qyysssjwqdm;
	}
	public String getQyysssjwqmc() {
		return qyysssjwqmc;
	}
	public void setQyysssjwqmc(String qyysssjwqmc) {
		this.qyysssjwqmc = qyysssjwqmc;
	}
	public String getQyysdjrxm() {
		return qyysdjrxm;
	}
	public void setQyysdjrxm(String qyysdjrxm) {
		this.qyysdjrxm = qyysdjrxm;
	}
	public String getQyysdjsj() {
		return qyysdjsj;
	}
	public void setQyysdjsj(String qyysdjsj) {
		this.qyysdjsj = qyysdjsj;
	}
	public String getQyysdjdwdm() {
		return qyysdjdwdm;
	}
	public void setQyysdjdwdm(String qyysdjdwdm) {
		this.qyysdjdwdm = qyysdjdwdm;
	}
	public String getQyysdjdwmc() {
		return qyysdjdwmc;
	}
	public void setQyysdjdwmc(String qyysdjdwmc) {
		this.qyysdjdwmc = qyysdjdwmc;
	}
	public String getQyryfxrlxfs() {
		return qyryfxrlxfs;
	}
	public void setQyryfxrlxfs(String qyryfxrlxfs) {
		this.qyryfxrlxfs = qyryfxrlxfs;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQyryxm() {
		return qyryxm;
	}
	public void setQyryxm(String qyryxm) {
		this.qyryxm = qyryxm;
	}
	public String getQyryxmbm() {
		return qyryxmbm;
	}
	public void setQyryxmbm(String qyryxmbm) {
		this.qyryxmbm = qyryxmbm;
	}
	public String getQyryxb() {
		return qyryxb;
	}
	public void setQyryxb(String qyryxb) {
		this.qyryxb = qyryxb;
	}
	public String getQyrynl() {
		return qyrynl;
	}
	public void setQyrynl(String qyrynl) {
		this.qyrynl = qyrynl;
	}
	public String getQyrycsrq() {
		return qyrycsrq;
	}
	public void setQyrycsrq(String qyrycsrq) {
		this.qyrycsrq = qyrycsrq;
	}
	public String getQyryzjlb() {
		return qyryzjlb;
	}
	public void setQyryzjlb(String qyryzjlb) {
		this.qyryzjlb = qyryzjlb;
	}
	public String getQyryzjhm() {
		return qyryzjhm;
	}
	public void setQyryzjhm(String qyryzjhm) {
		this.qyryzjhm = qyryzjhm;
	}
	public String getQyryjg() {
		return qyryjg;
	}
	public void setQyryjg(String qyryjg) {
		this.qyryjg = qyryjg;
	}
	public String getQyrytqyz() {
		return qyrytqyz;
	}
	public void setQyrytqyz(String qyrytqyz) {
		this.qyrytqyz = qyrytqyz;
	}
	
	public String getQyrytbbj() {
		return qyrytbbj;
	}
	public void setQyrytbbj(String qyrytbbj) {
		this.qyrytbbj = qyrytbbj;
	}
	public String getQyrystzk() {
		return qyrystzk;
	}
	public void setQyrystzk(String qyrystzk) {
		this.qyrystzk = qyrystzk;
	}
	public String getQyryly() {
		return qyryly;
	}
	public void setQyryly(String qyryly) {
		this.qyryly = qyryly;
	}
	public String getQyryzwcj() {
		return qyryzwcj;
	}
	public void setQyryzwcj(String qyryzwcj) {
		this.qyryzwcj = qyryzwcj;
	}
	public String getQyrydnacj() {
		return qyrydnacj;
	}
	public void setQyrydnacj(String qyrydnacj) {
		this.qyrydnacj = qyrydnacj;
	}
	public String getQyryxx() {
		return qyryxx;
	}
	public void setQyryxx(String qyryxx) {
		this.qyryxx = qyryxx;
	}
	public String getQyryzmzp() {
		return qyryzmzp;
	}
	public void setQyryzmzp(String qyryzmzp) {
		this.qyryzmzp = qyryzmzp;
	}
	public String getQyryyztz() {
		return qyryyztz;
	}
	public void setQyryyztz(String qyryyztz) {
		this.qyryyztz = qyryyztz;
	}
	public String getQyrysswp() {
		return qyrysswp;
	}
	public void setQyrysswp(String qyrysswp) {
		this.qyrysswp = qyrysswp;
	}
	public String getQyrybfxsj() {
		return qyrybfxsj;
	}
	public void setQyrybfxsj(String qyrybfxsj) {
		this.qyrybfxsj = qyrybfxsj;
	}
	public String getQyrybfxdd() {
		return qyrybfxdd;
	}
	public void setQyrybfxdd(String qyrybfxdd) {
		this.qyrybfxdd = qyrybfxdd;
	}
	public String getQyryqyjg() {
		return qyryqyjg;
	}
	public void setQyryqyjg(String qyryqyjg) {
		this.qyryqyjg = qyryqyjg;
	}
	public String getQyrydssj() {
		return qyrydssj;
	}
	public void setQyrydssj(String qyrydssj) {
		this.qyrydssj = qyrydssj;
	}
	public String getQyryjbrxm() {
		return qyryjbrxm;
	}
	public void setQyryjbrxm(String qyryjbrxm) {
		this.qyryjbrxm = qyryjbrxm;
	}
	public String getQyrysjrxm() {
		return qyrysjrxm;
	}
	public void setQyrysjrxm(String qyrysjrxm) {
		this.qyrysjrxm = qyrysjrxm;
	}
	public String getQyrysjrzjlb() {
		return qyrysjrzjlb;
	}
	public void setQyrysjrzjlb(String qyrysjrzjlb) {
		this.qyrysjrzjlb = qyrysjrzjlb;
	}
	public String getQyrysjrzjhm() {
		return qyrysjrzjhm;
	}
	public void setQyrysjrzjhm(String qyrysjrzjhm) {
		this.qyrysjrzjhm = qyrysjrzjhm;
	}
	public String getQyrysjrlxfs() {
		return qyrysjrlxfs;
	}
	public void setQyrysjrlxfs(String qyrysjrlxfs) {
		this.qyrysjrlxfs = qyrysjrlxfs;
	}
	public String getQyrysjrzz() {
		return qyrysjrzz;
	}
	public void setQyrysjrzz(String qyrysjrzz) {
		this.qyrysjrzz = qyrysjrzz;
	}
	public String getQyrybz() {
		return qyrybz;
	}
	public void setQyrybz(String qyrybz) {
		this.qyrybz = qyrybz;
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
	public String getQyryxbms() {
		qyryxbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", qyryxb); 
		return qyryxbms;
	}
	public void setQyryxbms(String qyryxbms) {
		this.qyryxbms = qyryxbms;
	}
	public String getQyryzjlbms() {
		qyryzjlbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", qyryzjlb);
		return qyryzjlbms;
	}
	public void setQyryzjlbms(String qyryzjlbms) {
		this.qyryzjlbms = qyryzjlbms;
	}
	public String getQyryjgms() {
		qyryjgms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", qyryjg);
		return qyryjgms;
	}
	public void setQyryjgms(String qyryjgms) {
		this.qyryjgms = qyryjgms;
	}
	public String getQyrytqyzms() {
		qyrytqyzms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_TSTZ", qyrytqyz);
		return qyrytqyzms;
	}
	public void setQyrytqyzms(String qyrytqyzms) {
		this.qyrytqyzms = qyrytqyzms;
	}
	public String getQyrysjrzjlbms() {
		qyrysjrzjlbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", qyrysjrzjlb);
		return qyrysjrzjlbms;
	}
	public void setQyrysjrzjlbms(String qyrysjrzjlbms) {
		this.qyrysjrzjlbms = qyrysjrzjlbms;
	}
	public String getQyryxxms() {
		qyryxxms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XX", qyryxx);
		return qyryxxms;
	}
	public void setQyryxxms(String qyryxxms) {
		this.qyryxxms = qyryxxms;
	}
	public String getQyryfxrxm() {
		return qyryfxrxm;
	}
	public void setQyryfxrxm(String qyryfxrxm) {
		this.qyryfxrxm = qyryfxrxm;
	}
	public String getQyryfxrsfzh() {
		return qyryfxrsfzh;
	}
	public void setQyryfxrsfzh(String qyryfxrsfzh) {
		this.qyryfxrsfzh = qyryfxrsfzh;
	}
	
	public String getQyryfxrzjlb() {
		return qyryfxrzjlb;
	}
	public void setQyryfxrzjlb(String qyryfxrzjlb) {
		this.qyryfxrzjlb = qyryfxrzjlb;
	}
	public String getQyryfxrzjlbms() {
		qyryfxrzjlbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", qyryfxrzjlb);
		return qyryfxrzjlbms;
	}
	public void setQyryfxrzjlbms(String qyryfxrzjlbms) {
		this.qyryfxrzjlbms = qyryfxrzjlbms;
	}
	public String getQyryfxrzjhm() {
		return qyryfxrzjhm;
	}
	public void setQyryfxrzjhm(String qyryfxrzjhm) {
		this.qyryfxrzjhm = qyryfxrzjhm;
	}
	public String getQyryfxrzz() {
		return qyryfxrzz;
	}
	public void setQyryfxrzz(String qyryfxrzz) {
		this.qyryfxrzz = qyryfxrzz;
	}
	public String getQyryyrlrgxms() {
		qyryyrlrgxms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("YHZGL", qyryyrlrgx);
		return qyryyrlrgxms;
	}
	public void setQyryyrlrgxms(String qyryyrlrgxms) {
		this.qyryyrlrgxms = qyryyrlrgxms;
	}
	
}
