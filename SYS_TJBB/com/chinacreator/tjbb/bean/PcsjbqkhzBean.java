package com.chinacreator.tjbb.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 派出所基本情况汇总
 */
public class PcsjbqkhzBean extends BaseValue {

	private static final long serialVersionUID = -5541644443966877476L;
	
	private String title;
	
	private String orgcode;
	
	private String orgname;
	
	/**
	 * 实有人数
	 */
	private String syrs;
	
	/**
	 * 县级公安机关总警力数
	 */
	private String xjgajgzjls;
	
	/**
	 * 派出所实有警力占县级公安机关总警力的比例小于40％的县区局数
	 */
	private String syjlzxjlbl;
	
	/**
	 * 当年（统计期）接受过集中业务培训的民警数
	 */
	private String cjpxmjs;
	
	/**
	 * 派出所数（个）
	 */
	private String pcss;
	
	/**
	 * 城区户籍所数（个）
	 */
	private String cqhjs;
	
	/**
	 * 20人及以上的城区派出所数（个）
	 */
	private String cqs;
	
	/**
	 * 建制镇派出所数（个）
	 */
	private String zpcs1;
	
	/**
	 * 10人及以上的建制镇派出所数（个）
	 */
	private String zpcs2;
	
	
	/**
	 * 建制乡派出所数(个)
	 */
	private String xpcs;
	
	/**
	 * 5人及以上的建制乡派出所数（个）
	 */
	private String xpcs2;
	
	/**
	 * 治安所
	 */
	private String zas;
	
	/**
	 * 水上派出所数
	 */
	private String sss;
	
	
	/**
	 * 一级所
	 */
	private String yijs;
	
	/**
	 * 二级所
	 */
	private String erjs;
	
	/**
	 * 三级所
	 */
	private String sanjs;
	
	/**
	 * 四级所
	 */
	private String sijs;
	
	/**
	 * 五级所
	 */
	private String wujs;
	
	/**
	 * 汽车（辆）
	 */
	private String qcs;
	
	/**
	 * 无车派出所数
	 */
	private String wcpcs;
	
	/**
	 * 计算机数
	 */
	private String jsjs;
	
	/**
	 * 无电脑派出所数
	 */
	private String wjsjs;
	
	/**
	 * 防弹头盔数
	 */
	private String fdtks;
	
	/**
	 * 未装备防弹头盔的派出所数
	 */
	private String wfdtkpcss;
	
	/**
	 * 防弹背心（件）
	 */
	private String fdbxs;
	
	/**
	 * 未装备防弹背心的派出所数
	 */
	private String wfdbxpcss; 
	
	/**
	 * 防刺背心（件）
	 */
	private String fcbxs;
	
	/**
	 * 未装备防刺背心的派出所数
	 */
	private String wfcbxpcss; 
	
	/**
	 * 所长数
	 */
	private String szs;
	
	
	/**
	 * 副科级以下
	 */
	private String fkjyx;
	
	/**
	 * 副科级
	 */
	private String fkj;
	
	/**
	 * 正科级
	 */
	private String zkj;
	
	/**
	 * 副处级
	 */
	private String fcj;
	
	/**
	 * 副处级以上
	 */
	private String fcjys;
	
	/**
	 * 已建社区警务室数（个）
	 */
	private String jljwqs;
	
	/**
	 * 社区民警（人）
	 */
	private String sqmjs;
	
	/**
	 * 社区民警中专职社区民警数
	 */
	private String zzmjs;
	
	/**
	 * 社区数（个）
	 */
	private String sqs;
	
	/**
	 * 已建农村警务室数（个）
	 */
	private String ncjwss;
	
	/**
	 * 驻村民警
	 */
	private String zcmjs;
	
	
	/**
	 * 驻村民警中专职驻村民警数
	 */
	private String zczzmjs;
	
	/**
	 * 行政村数（个）
	 */
	private String xzcs;
	
	/**
	 * 警务区数（个）
	 */
	private String jwqs;

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getSyrs() {
		return syrs;
	}

	public void setSyrs(String syrs) {
		this.syrs = syrs;
	}

	public String getXjgajgzjls() {
		return xjgajgzjls;
	}

	public void setXjgajgzjls(String xjgajgzjls) {
		this.xjgajgzjls = xjgajgzjls;
	}

	public String getSyjlzxjlbl() {
		return syjlzxjlbl;
	}

	public void setSyjlzxjlbl(String syjlzxjlbl) {
		this.syjlzxjlbl = syjlzxjlbl;
	}

	public String getCjpxmjs() {
		return cjpxmjs;
	}

	public void setCjpxmjs(String cjpxmjs) {
		this.cjpxmjs = cjpxmjs;
	}

	public String getPcss() {
		return pcss;
	}

	public void setPcss(String pcss) {
		this.pcss = pcss;
	}

	public String getCqhjs() {
		return cqhjs;
	}

	public void setCqhjs(String cqhjs) {
		this.cqhjs = cqhjs;
	}

	public String getCqs() {
		return cqs;
	}

	public void setCqs(String cqs) {
		this.cqs = cqs;
	}

	public String getZpcs1() {
		return zpcs1;
	}

	public void setZpcs1(String zpcs1) {
		this.zpcs1 = zpcs1;
	}

	public String getZpcs2() {
		return zpcs2;
	}

	public void setZpcs2(String zpcs2) {
		this.zpcs2 = zpcs2;
	}

	public String getXpcs() {
		return xpcs;
	}

	public void setXpcs(String xpcs) {
		this.xpcs = xpcs;
	}

	public String getXpcs2() {
		return xpcs2;
	}

	public void setXpcs2(String xpcs2) {
		this.xpcs2 = xpcs2;
	}

	public String getZas() {
		return zas;
	}

	public void setZas(String zas) {
		this.zas = zas;
	}

	public String getSss() {
		return sss;
	}

	public void setSss(String sss) {
		this.sss = sss;
	}

	public String getYijs() {
		return yijs;
	}

	public void setYijs(String yijs) {
		this.yijs = yijs;
	}

	public String getErjs() {
		return erjs;
	}

	public void setErjs(String erjs) {
		this.erjs = erjs;
	}

	public String getSanjs() {
		return sanjs;
	}

	public void setSanjs(String sanjs) {
		this.sanjs = sanjs;
	}

	public String getSijs() {
		return sijs;
	}

	public void setSijs(String sijs) {
		this.sijs = sijs;
	}

	public String getWujs() {
		return wujs;
	}

	public void setWujs(String wujs) {
		this.wujs = wujs;
	}

	public String getQcs() {
		return qcs;
	}

	public void setQss(String qcs) {
		this.qcs = qcs;
	}

	public String getWcpcs() {
		return wcpcs;
	}

	public void setWcpcs(String wcpcs) {
		this.wcpcs = wcpcs;
	}

	public String getJsjs() {
		return jsjs;
	}

	public void setJsjs(String jsjs) {
		this.jsjs = jsjs;
	}

	public String getWjsjs() {
		return wjsjs;
	}

	public void setWjsjs(String wjsjs) {
		this.wjsjs = wjsjs;
	}

	public String getFdtks() {
		return fdtks;
	}

	public void setFdtks(String fdtks) {
		this.fdtks = fdtks;
	}

	public String getWfdtkpcss() {
		return wfdtkpcss;
	}

	public void setWfdtkpcss(String wfdtkpcss) {
		this.wfdtkpcss = wfdtkpcss;
	}

	public String getFdbxs() {
		return fdbxs;
	}

	public void setFdbxs(String fdbxs) {
		this.fdbxs = fdbxs;
	}

	public String getWfdbxpcss() {
		return wfdbxpcss;
	}

	public void setWfdbxpcss(String wfdbxpcss) {
		this.wfdbxpcss = wfdbxpcss;
	}

	public String getFcbxs() {
		return fcbxs;
	}

	public void setFcbxs(String fcbxs) {
		this.fcbxs = fcbxs;
	}

	public String getWfcbxpcss() {
		return wfcbxpcss;
	}

	public void setWfcbxpcss(String wfcbxpcss) {
		this.wfcbxpcss = wfcbxpcss;
	}

	public String getSzs() {
		return szs;
	}

	public void setSzs(String szs) {
		this.szs = szs;
	}

	public String getFkjyx() {
		return fkjyx;
	}

	public void setFkjyx(String fkjyx) {
		this.fkjyx = fkjyx;
	}

	public String getFkj() {
		return fkj;
	}

	public void setFkj(String fkj) {
		this.fkj = fkj;
	}

	public String getZkj() {
		return zkj;
	}

	public void setZkj(String zkj) {
		this.zkj = zkj;
	}

	public String getFcj() {
		return fcj;
	}

	public void setFcj(String fcj) {
		this.fcj = fcj;
	}

	public String getFcjys() {
		return fcjys;
	}

	public void setFcjys(String fcjys) {
		this.fcjys = fcjys;
	}

	public String getJljwqs() {
		return jljwqs;
	}

	public void setJljwqs(String jljwqs) {
		this.jljwqs = jljwqs;
	}

	public String getSqmjs() {
		return sqmjs;
	}

	public void setSqmjs(String sqmjs) {
		this.sqmjs = sqmjs;
	}

	public String getZzmjs() {
		return zzmjs;
	}

	public void setZzmjs(String zzmjs) {
		this.zzmjs = zzmjs;
	}

	public String getSqs() {
		return sqs;
	}

	public void setSqs(String sqs) {
		this.sqs = sqs;
	}

	public String getNcjwss() {
		return ncjwss;
	}

	public void setNcjwss(String ncjwss) {
		this.ncjwss = ncjwss;
	}

	public String getZcmjs() {
		return zcmjs;
	}

	public void setZcmjs(String zcmjs) {
		this.zcmjs = zcmjs;
	}

	public String getZczzmjs() {
		return zczzmjs;
	}

	public void setZczzmjs(String zczzmjs) {
		this.zczzmjs = zczzmjs;
	}

	public String getXzcs() {
		return xzcs;
	}

	public void setXzcs(String xzcs) {
		this.xzcs = xzcs;
	}

	public String getJwqs() {
		return jwqs;
	}

	public void setJwqs(String jwqs) {
		this.jwqs = jwqs;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setQcs(String qcs) {
		this.qcs = qcs;
	}
}
