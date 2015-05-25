package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class ZdrySwryBean extends BaseValue{

	/**
	 * 工作对象涉稳人员
	 */
	private static final long serialVersionUID = -6543202396187393033L;
	private String swrybh;	//涉稳人员编号
	private String gzdxbh;	//工作对象编号
	private String rybh;	//人员编号
	private String sfzh;	//身份证号
	private String swrylb;	//涉稳人员类别
	private String xxlb;	//信息来源
	private String wtlb;	//问题类别
	private String swzt;	//涉稳状态
	private String sfdqx;	//事发地区县
	private String sfdqxmc;
	private String sfcyd;	//事发成因地
	private String sfzrq;	//	事发责任区
	private String sfzrqmc;
	private String gldw;	//管理单位
	private String zywt;	//主要问题
	private String gzcs;	//工作措施
	private String gllb;	//管理类别
	private String gllllb;	//管理力量类别
	private String glrxm;	//管理人姓名
	private String glrsfzh;	//管理人身份证号
	private String glrxzdz;	//管理人现在地址
	private String glrlxdh;	//管理人联系电话
	private String xswjb;	//现涉稳级别
	private String zgswdj;	//最高涉稳等级
	private String gxpcsdm;	//管辖派出所代码
	private String gxpcsmc;	//管辖派出所名称
	private String gxjwqdm;	//管辖警务区代码
	private String gxjwqmc;	//管辖警务区名称
	private String gxsq;	//管辖社区
	private String zrmjjh;	//责任民警警号
	private String zrmjxm;	//责任民警姓名
	private String zrmjlxdh;	//责任民警联系电话
	
	private String djsj;
	public String getSwrybh() {
		return swrybh;
	}
	public void setSwrybh(String swrybh) {
		this.swrybh = swrybh;
	}
	public String getGzdxbh() {
		return gzdxbh;
	}
	public void setGzdxbh(String gzdxbh) {
		this.gzdxbh = gzdxbh;
	}
	public String getRybh() {
		return rybh;
	}
	public void setRybh(String rybh) {
		this.rybh = rybh;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getSwrylb() {
		return swrylb;
	}
	public void setSwrylb(String swrylb) {
		this.swrylb = swrylb;
	}
	public String getXxlb() {
		return xxlb;
	}
	public void setXxlb(String xxlb) {
		this.xxlb = xxlb;
	}
	public String getWtlb() {
		return wtlb;
	}
	public void setWtlb(String wtlb) {
		this.wtlb = wtlb;
	}
	public String getSwzt() {
		return swzt;
	}
	public void setSwzt(String swzt) {
		this.swzt = swzt;
	}
	public String getSfdqx() {
		return sfdqx;
	}
	public void setSfdqx(String sfdqx) {
		this.sfdqx = sfdqx;
	}
	public String getSfcyd() {
		return sfcyd;
	}
	public void setSfcyd(String sfcyd) {
		this.sfcyd = sfcyd;
	}
	public String getSfzrq() {
		return sfzrq;
	}
	public void setSfzrq(String sfzrq) {
		this.sfzrq = sfzrq;
	}
	public String getGldw() {
		return gldw;
	}
	public void setGldw(String gldw) {
		this.gldw = gldw;
	}
	public String getZywt() {
		return zywt;
	}
	public void setZywt(String zywt) {
		this.zywt = zywt;
	}
	public String getGzcs() {
		return gzcs;
	}
	public void setGzcs(String gzcs) {
		this.gzcs = gzcs;
	}
	public String getGllb() {
		return gllb;
	}
	public void setGllb(String gllb) {
		this.gllb = gllb;
	}
	public String getGllllb() {
		return gllllb;
	}
	public void setGllllb(String gllllb) {
		this.gllllb = gllllb;
	}
	public String getGlrxm() {
		return glrxm;
	}
	public void setGlrxm(String glrxm) {
		this.glrxm = glrxm;
	}
	public String getGlrsfzh() {
		return glrsfzh;
	}
	public void setGlrsfzh(String glrsfzh) {
		this.glrsfzh = glrsfzh;
	}
	public String getGlrxzdz() {
		return glrxzdz;
	}
	public void setGlrxzdz(String glrxzdz) {
		this.glrxzdz = glrxzdz;
	}
	public String getGlrlxdh() {
		return glrlxdh;
	}
	public void setGlrlxdh(String glrlxdh) {
		this.glrlxdh = glrlxdh;
	}
	public String getXswjb() {
		return xswjb;
	}
	public void setXswjb(String xswjb) {
		this.xswjb = xswjb;
	}
	public String getZgswdj() {
		return zgswdj;
	}
	public void setZgswdj(String zgswdj) {
		this.zgswdj = zgswdj;
	}
	public String getGxpcsdm() {
		return gxpcsdm;
	}
	public void setGxpcsdm(String gxpcsdm) {
		this.gxpcsdm = gxpcsdm;
	}
	public String getGxpcsmc() {
		return gxpcsmc;
	}
	public void setGxpcsmc(String gxpcsmc) {
		this.gxpcsmc = gxpcsmc;
	}
	public String getGxjwqdm() {
		return gxjwqdm;
	}
	public void setGxjwqdm(String gxjwqdm) {
		this.gxjwqdm = gxjwqdm;
	}
	public String getGxjwqmc() {
		return gxjwqmc;
	}
	public void setGxjwqmc(String gxjwqmc) {
		this.gxjwqmc = gxjwqmc;
	}
	public String getGxsq() {
		return gxsq;
	}
	public void setGxsq(String gxsq) {
		this.gxsq = gxsq;
	}
	public String getZrmjjh() {
		return zrmjjh;
	}
	public void setZrmjjh(String zrmjjh) {
		this.zrmjjh = zrmjjh;
	}
	public String getZrmjxm() {
		return zrmjxm;
	}
	public void setZrmjxm(String zrmjxm) {
		this.zrmjxm = zrmjxm;
	}
	public String getZrmjlxdh() {
		return zrmjlxdh;
	}
	public void setZrmjlxdh(String zrmjlxdh) {
		this.zrmjlxdh = zrmjlxdh;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getSfdqxmc() {
		sfdqxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH",sfdqx);
		return sfdqxmc;
	}
	public void setSfdqxmc(String sfdqxmc) {
		this.sfdqxmc = sfdqxmc;
	}
	public String getSfzrqmc() {
		sfzrqmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH",sfzrq);
		return sfzrqmc;
	}
	public void setSfzrqmc(String sfzrqmc) {
		this.sfzrqmc = sfzrqmc;
	}
	
	

}
