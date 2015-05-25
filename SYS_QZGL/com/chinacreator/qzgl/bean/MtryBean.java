package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
/**
 * 迷途人员Bean
 * @author Administrator
 *
 */
public class MtryBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 773203979694426839L;
	private String  id           ; //  varchar2(22)  y      6位行政编码+6位日期+10位序列号
	private String  mtryxm       ; //  varchar2(30)  n      迷途人员姓名
	private String  mtryxmbm     ; //  varchar2(30)  y      迷途人员姓名别名
	private String  mtryxb       ; //  varchar2(2)  n      迷途人员性别（参照“性别”字典）
	private String  mtryxbms     ; //  迷途人员性别描述
	private String  mtrynl       ; //  varchar2(3)  y      迷途人员年龄
	private String  mtrycsrq     ; //  date  y      迷途人员出生日期
	private String  mtryzjlb     ; //  varchar2(10)  y      迷途人员证件类别（参照“证件种类”字典）
	private String  mtryzjlbms   ; //  迷途人员证件类别描述
	private String  mtryzjhm     ; //  varchar2(30)  y      迷途人员证件号码
	private String  mtryjg       ; //  varchar2(10)  y      迷途人员籍贯（参照“籍贯”字典）
	private String  mtryjgms     ; // 迷途人员籍贯描述
	private String  mtrytmtz     ; //  varchar2(10)  n      迷途人员体貌特征（参照“特殊特征”字典）
	private String  mtrytmtzms   ; //  迷途人员体貌特征描述
	private String  mtryky       ; //  varchar2(10)  y      迷途人员口音（参照“口音代码”字典）
	private String  mtrykyms     ; // 迷途人员口音描述
	private String  mtrytbbj     ; //  varchar2(10)  n      迷途人员体表标记
	private String  mtrystzk     ; //  varchar2(30)  y      迷途人员身体状况
	private String  mtryly       ; //  varchar2(30)  n      迷途人员来源
	private String  mtryzwcj     ; //  varchar2(10)  y      迷途人员指纹采集
	private String  mtrydnacj    ; //  varchar2(10)  y      迷途人员dna采集
	private String  mtryxx       ; //  varchar2(10)  y      迷途人员血型（参照“血型”字典）
	private String  mtryxxms     ; // 迷途人员血型描述
	//private String  mtryzmzp     ; //  blob  y      迷途人员正面照片
	private String  mtryyztz     ; //  varchar2(400)  n      迷途人员衣着特征
	private String  mtrysswp     ; //  varchar2(400)  n      迷途人员随身物品
	private String  mtrybfxsj    ; //  date  n      迷途人员被发现时间
	private String  mtrybfxdd    ; //  date  y      迷途人员被发现地点
	private String  mtrymtjg     ; //  varchar2(400)  y      迷途人员迷途经过
	private String  mtrydssj     ; //  date  n      迷途人员到所时间
	private String  mtryjbrxm    ; //  varchar2(30)  n      迷途人员经办人姓名
	private String  mtrysjrxm    ; //  varchar2(30)  y      迷途人员送交人姓名
	private String  mtrysjrzjlb  ; //  varchar2(10)  y      迷途人员送交人证件类别（参照“证件种类”字典）
	private String  mtrysjrzjlbms ; // 迷途人员送交人证件类别描述
	private String  mtrysjrzjhm  ; //  varchar2(30)  y      迷途人员送交人证件号码
	private String  mtrysjrlxfs  ; //  varchar2(30)  y      迷途人员送交人联系方式
	private String  mtrysjrzz    ; //  varchar2(120)  y      迷途人员送交人员地址
	private String  mtrybz       ; //  varchar2(200)  y      备注
	private String  ssjwqdm      ; //  varchar2(12)  y      所属警务区代码
	private String  ssjwqmc      ; //  varchar2(120)  y      所属警务区名称
	private String  djsj         ; //  date  y      登记时间
	private String  djrxm        ; //  varchar2(30)  y      登记人姓名
	private String  djrjh        ; //  varchar2(30)  y      登记人警号
	private String  djdwdm       ; //  varchar2(12)  y      登记单位代码
	private String  djdwmc       ; //  varchar2(120)  y      登记单位名称
	private String  czrxm        ; //  varchar2(30)  y      操作人姓名
	private String  czrjh        ; //  varchar2(30)  y      操作人警号
	private String  czsj         ; //  date  y      操作时间（如跟登记时间不一致，代表修改时间）
	private String  czdwdm       ; //  varchar2(12)  y      操作单位代码
	private String  czdwmc       ; //  varchar2(120)  y      操作单位名称
	private String  zxbs         ; // 注销标识（'0':正常；'1':注销；'2':删除）
	private String  scsj         ; // 删除时间
	private String  mtrysg       ; // 迷途人员身高，单位：厘米
	
	/********************
	 * 以下属移送信息
	 * *******************************/
	
	private String  mtrylssj      ;  //  date  y      迷途人员离所时间（属移送信息）
	private String  mtrylsqx      ;  //  varchar2(120)  y      迷途人员离所去向（属移送信息）
	private String  mtryjsdwmc    ;  //  varchar2(120)  y      迷途人员接收单位名称（属移送信息）
	private String  mtryjsdwdh    ;  //  varchar2(50)  y      迷途人员接收单位电话（属移送信息）
	private String  mtryjsdwdz    ;  //  varchar2(120)  y      迷途人员接收单位地址（属移送信息）
	private String  mtryrlrxm     ;  //  varchar2(30)  y      迷途人员认领人姓名（属移送信息）
	private String  mtryrlrzjlb   ;  //  varchar2(10)  y      迷途人员认领人证件类别（参照“证件种类”字典）（属移送信息）
	
	private String  mtryrlrzjlbms ; // 迷途人员认领人证件类别描述
	
	private String  mtryrlrzjhm   ;  //  varchar2(30)  y      迷途人员认领人证件号码（属移送信息）
	private String  mtryrlrlxfs   ;  //  varchar2(30)  y      迷途人员认领人联系方式（属移送信息）
	private String  mtryrlrgx     ;  //  varchar2(10)  y      迷途人员与认领人关系（参照“与户主关系”字典）（属移送信息）
	
	private String  mtryrlrgxms   ; // 迷途人员与认领人关系描述
	
	private String  mtryrlrzz     ;  //  varchar2(120)  y      迷途人员认领人住址（属移送信息）
	private String  mtryysbz      ;  //  varchar2(200)  y      迷途人员移送信息备注（属移送信息）
	private String  mtryysdjsj    ;  //  date  y      迷途人员移送信息登记时间（属移送信息）
	private String  mtryysdjdwdm  ;  //  varchar2(12)  y      迷途人员移送信息登记单位代码（属移送信息）
	private String  mtryysdjdwmc  ;  //  varchar2(120)  y      迷途人员移送信息登记单位名称（属移送信息）
	private String  mtryysdjrxm   ;  //  varchar2(30)  y      迷途人员移送信息登记人姓名（属移送信息）
	private String  mtryysdjrjh   ;  //  varchar2(30)  y      迷途人员移送信息登记人警号（属移送信息）
	private String  mtryysjbrxm   ;  // varchar2(30) y  迷途人员移送信息经办人姓名
 	
	private String  mtryysssjwqdm  ;  // varchar2(12)  y      迷途人员移送所属警务区代码（属移送信息）
	private String  mtryysssjwqmc  ;  // varchar2(120)  y      迷途人员移送所属警务区名称（属移送信息）
	
	public String getMtryysssjwqdm() {
		return mtryysssjwqdm;
	}
	public void setMtryysssjwqdm(String mtryysssjwqdm) {
		this.mtryysssjwqdm = mtryysssjwqdm;
	}
	public String getMtryysssjwqmc() {
		return mtryysssjwqmc;
	}
	public void setMtryysssjwqmc(String mtryysssjwqmc) {
		this.mtryysssjwqmc = mtryysssjwqmc;
	}
	public String getMtryysjbrxm() {
		return mtryysjbrxm;
	}
	public void setMtryysjbrxm(String mtryysjbrxm) {
		this.mtryysjbrxm = mtryysjbrxm;
	}
	public String getMtrylssj() {
		return mtrylssj;
	}
	public void setMtrylssj(String mtrylssj) {
		this.mtrylssj = mtrylssj;
	}
	public String getMtrylsqx() {
		return mtrylsqx;
	}
	public void setMtrylsqx(String mtrylsqx) {
		this.mtrylsqx = mtrylsqx;
	}
	public String getMtryjsdwmc() {
		return mtryjsdwmc;
	}
	public void setMtryjsdwmc(String mtryjsdwmc) {
		this.mtryjsdwmc = mtryjsdwmc;
	}
	public String getMtryjsdwdh() {
		return mtryjsdwdh;
	}
	public void setMtryjsdwdh(String mtryjsdwdh) {
		this.mtryjsdwdh = mtryjsdwdh;
	}
	public String getMtryjsdwdz() {
		return mtryjsdwdz;
	}
	public void setMtryjsdwdz(String mtryjsdwdz) {
		this.mtryjsdwdz = mtryjsdwdz;
	}
	public String getMtryrlrxm() {
		return mtryrlrxm;
	}
	public void setMtryrlrxm(String mtryrlrxm) {
		this.mtryrlrxm = mtryrlrxm;
	}
	public String getMtryrlrzjlb() {
		return mtryrlrzjlb;
	}
	public void setMtryrlrzjlb(String mtryrlrzjlb) {
		this.mtryrlrzjlb = mtryrlrzjlb;
	}
	public String getMtryrlrzjhm() {
		return mtryrlrzjhm;
	}
	public void setMtryrlrzjhm(String mtryrlrzjhm) {
		this.mtryrlrzjhm = mtryrlrzjhm;
	}
	public String getMtryrlrlxfs() {
		return mtryrlrlxfs;
	}
	public void setMtryrlrlxfs(String mtryrlrlxfs) {
		this.mtryrlrlxfs = mtryrlrlxfs;
	}
	public String getMtryrlrgx() {
		return mtryrlrgx;
	}
	public void setMtryrlrgx(String mtryrlrgx) {
		this.mtryrlrgx = mtryrlrgx;
	}
	public String getMtryrlrzz() {
		return mtryrlrzz;
	}
	public void setMtryrlrzz(String mtryrlrzz) {
		this.mtryrlrzz = mtryrlrzz;
	}
	public String getMtryysbz() {
		return mtryysbz;
	}
	public void setMtryysbz(String mtryysbz) {
		this.mtryysbz = mtryysbz;
	}
	public String getMtryysdjsj() {
		return mtryysdjsj;
	}
	public void setMtryysdjsj(String mtryysdjsj) {
		this.mtryysdjsj = mtryysdjsj;
	}
	public String getMtryysdjdwdm() {
		return mtryysdjdwdm;
	}
	public void setMtryysdjdwdm(String mtryysdjdwdm) {
		this.mtryysdjdwdm = mtryysdjdwdm;
	}
	public String getMtryysdjdwmc() {
		return mtryysdjdwmc;
	}
	public void setMtryysdjdwmc(String mtryysdjdwmc) {
		this.mtryysdjdwmc = mtryysdjdwmc;
	}
	public String getMtryysdjrxm() {
		return mtryysdjrxm;
	}
	public void setMtryysdjrxm(String mtryysdjrxm) {
		this.mtryysdjrxm = mtryysdjrxm;
	}
	public String getMtryysdjrjh() {
		return mtryysdjrjh;
	}
	public void setMtryysdjrjh(String mtryysdjrjh) {
		this.mtryysdjrjh = mtryysdjrjh;
	}
	public String getMtrysg() {
		return mtrysg;
	}
	public void setMtrysg(String mtrysg) {
		this.mtrysg = mtrysg;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMtryxm() {
		return mtryxm;
	}
	public void setMtryxm(String mtryxm) {
		this.mtryxm = mtryxm;
	}
	public String getMtryxmbm() {
		return mtryxmbm;
	}
	public void setMtryxmbm(String mtryxmbm) {
		this.mtryxmbm = mtryxmbm;
	}
	public String getMtryxb() {
		return mtryxb;
	}
	public void setMtryxb(String mtryxb) {
		this.mtryxb = mtryxb;
	}
	public String getMtrynl() {
		return mtrynl;
	}
	public void setMtrynl(String mtrynl) {
		this.mtrynl = mtrynl;
	}
	public String getMtrycsrq() {
		return mtrycsrq;
	}
	public void setMtrycsrq(String mtrycsrq) {
		this.mtrycsrq = mtrycsrq;
	}
	public String getMtryzjlb() {
		return mtryzjlb;
	}
	public void setMtryzjlb(String mtryzjlb) {
		this.mtryzjlb = mtryzjlb;
	}
	public String getMtryzjhm() {
		return mtryzjhm;
	}
	public void setMtryzjhm(String mtryzjhm) {
		this.mtryzjhm = mtryzjhm;
	}
	public String getMtryjg() {
		return mtryjg;
	}
	public void setMtryjg(String mtryjg) {
		this.mtryjg = mtryjg;
	}
	public String getMtrytmtz() {
		return mtrytmtz;
	}
	public void setMtrytmtz(String mtrytmtz) {
		this.mtrytmtz = mtrytmtz;
	}
	public String getMtryky() {
		return mtryky;
	}
	public void setMtryky(String mtryky) {
		this.mtryky = mtryky;
	}
	public String getMtrytbbj() {
		return mtrytbbj;
	}
	public void setMtrytbbj(String mtrytbbj) {
		this.mtrytbbj = mtrytbbj;
	}
	public String getMtrystzk() {
		return mtrystzk;
	}
	public void setMtrystzk(String mtrystzk) {
		this.mtrystzk = mtrystzk;
	}
	public String getMtryly() {
		return mtryly;
	}
	public void setMtryly(String mtryly) {
		this.mtryly = mtryly;
	}
	public String getMtryzwcj() {
		return mtryzwcj;
	}
	public void setMtryzwcj(String mtryzwcj) {
		this.mtryzwcj = mtryzwcj;
	}
	public String getMtrydnacj() {
		return mtrydnacj;
	}
	public void setMtrydnacj(String mtrydnacj) {
		this.mtrydnacj = mtrydnacj;
	}
	public String getMtryxx() {
		return mtryxx;
	}
	public void setMtryxx(String mtryxx) {
		this.mtryxx = mtryxx;
	}
	
	public String getMtryyztz() {
		return mtryyztz;
	}
	public void setMtryyztz(String mtryyztz) {
		this.mtryyztz = mtryyztz;
	}
	public String getMtrysswp() {
		return mtrysswp;
	}
	public void setMtrysswp(String mtrysswp) {
		this.mtrysswp = mtrysswp;
	}
	public String getMtrybfxsj() {
		return mtrybfxsj;
	}
	public void setMtrybfxsj(String mtrybfxsj) {
		this.mtrybfxsj = mtrybfxsj;
	}
	public String getMtrybfxdd() {
		return mtrybfxdd;
	}
	public void setMtrybfxdd(String mtrybfxdd) {
		this.mtrybfxdd = mtrybfxdd;
	}
	public String getMtrymtjg() {
		return mtrymtjg;
	}
	public void setMtrymtjg(String mtrymtjg) {
		this.mtrymtjg = mtrymtjg;
	}
	public String getMtrydssj() {
		return mtrydssj;
	}
	public void setMtrydssj(String mtrydssj) {
		this.mtrydssj = mtrydssj;
	}
	public String getMtryjbrxm() {
		return mtryjbrxm;
	}
	public void setMtryjbrxm(String mtryjbrxm) {
		this.mtryjbrxm = mtryjbrxm;
	}
	public String getMtrysjrxm() {
		return mtrysjrxm;
	}
	public void setMtrysjrxm(String mtrysjrxm) {
		this.mtrysjrxm = mtrysjrxm;
	}
	public String getMtrysjrzjlb() {
		return mtrysjrzjlb;
	}
	public void setMtrysjrzjlb(String mtrysjrzjlb) {
		this.mtrysjrzjlb = mtrysjrzjlb;
	}
	public String getMtrysjrzjhm() {
		return mtrysjrzjhm;
	}
	public void setMtrysjrzjhm(String mtrysjrzjhm) {
		this.mtrysjrzjhm = mtrysjrzjhm;
	}
	public String getMtrysjrlxfs() {
		return mtrysjrlxfs;
	}
	public void setMtrysjrlxfs(String mtrysjrlxfs) {
		this.mtrysjrlxfs = mtrysjrlxfs;
	}
	public String getMtrysjrzz() {
		return mtrysjrzz;
	}
	public void setMtrysjrzz(String mtrysjrzz) {
		this.mtrysjrzz = mtrysjrzz;
	}
	public String getMtrybz() {
		return mtrybz;
	}
	public void setMtrybz(String mtrybz) {
		this.mtrybz = mtrybz;
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
	public String getMtryxbms() {
		mtryxbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", mtryxb); 
		return mtryxbms;
	}
	public void setMtryxbms(String mtryxbms) {
		this.mtryxbms = mtryxbms;
	}
	public String getMtryzjlbms() {
		mtryzjlbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", mtryzjlb);
		return mtryzjlbms;
	}
	public void setMtryzjlbms(String mtryzjlbms) {
		this.mtryzjlbms = mtryzjlbms;
	}
	public String getMtryjgms() {
		mtryjgms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", mtryjg);
		return mtryjgms;
	}
	public void setMtryjgms(String mtryjgms) {
		this.mtryjgms = mtryjgms;
	}
	public String getMtrytmtzms() {
		mtrytmtzms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_TSTZ", mtrytmtz);
		return mtrytmtzms;
	}
	public void setMtrytmtzms(String mtrytmtzms) {
		this.mtrytmtzms = mtrytmtzms;
	}
	public String getMtrykyms() {
		mtrykyms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_KY", mtryky);
		return mtrykyms;
	}
	public void setMtrykyms(String mtrykyms) {
		this.mtrykyms = mtrykyms;
	}
	public String getMtryxxms() {
		mtryxxms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XX", mtryxx);
		return mtryxxms;
	}
	public void setMtryxxms(String mtryxxms) {
		this.mtryxxms = mtryxxms;
	}
	public String getMtrysjrzjlbms() {
		mtrysjrzjlbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", mtrysjrzjlb);
		return mtrysjrzjlbms;
	}
	public void setMtrysjrzjlbms(String mtrysjrzjlbms) {
		this.mtrysjrzjlbms = mtrysjrzjlbms;
	}
	public String getMtryrlrzjlbms() {
		mtryrlrzjlbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", mtryrlrzjlb);
		return mtryrlrzjlbms;
	}
	public void setMtryrlrzjlbms(String mtryrlrzjlbms) {
		this.mtryrlrzjlbms = mtryrlrzjlbms;
	}
	public String getMtryrlrgxms() {
		mtryrlrgxms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("YHZGL", mtryrlrgx);
		return mtryrlrgxms;
	}
	public void setMtryrlrgxms(String mtryrlrgxms) {
		this.mtryrlrgxms = mtryrlrgxms;
	}
	
	
	
}
