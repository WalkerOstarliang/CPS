package com.chinacreator.zagl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;


/**
 * 安防设施
 */
public class DwabssBean extends OperateBean{
	private static final long serialVersionUID = -349874299680211351L;
	
	/**
	 * 设施编号（主键）
	 */
	private String 	ssbh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 系统名称
	 */
	private String xtmc;
	
	/**
	 * 使用单位名称
	 */
	private String sydwmc;
	
	/**
	 * 验收单位
	 */
	private String ysdw;
	private String ysdwmc;
	
	/**
	 * 使用单位地址
	 */
	private String sydwdz;
	
	/**
	 * 系统检测情况
	 */
	private String xtjcqk;
	private String xtjcqkmc;
	
	/**
	 * 安防管理属性
	 */
	private String afglsxdl;
	private String afglsx;
	private String afglsxmc;
	
	/**
	 * 案发系统管理员
	 */
	private String afxtgly;
	
	/**
	 * 安防系统值守电话
	 */
	private String afxtzsdh;
	
	/**
	 * 有无入侵报警子系统
	 */
	private String ywrqbjzxt;
	
	/**
	 * 探测器数量
	 */
	private String tcqsl;
	
	/**
	 * 固定目标数
	 */
	private String gdmbs;
	
	/**
	 * 移动目标数
	 */
	private String ydmbs;
	
	/**
	 * 入侵报警子系统联网情况
	 */
	private String rqxtlwqk;
	private String rqxtlwqkmc;
	
	/**
	 * 有无视频监控子系统
	 */
	private String ywspjkzxt;
	
	/**
	 * 施工单位
	 */
	private String sgdw;
	
	/**
	 * 摄像机数量
	 */
	private String sxjsl;
	
	/**
	 * 视频监控子系统联网情况
	 */
	private String spjkxtlwqk;
	private String spjkxtlwqkmc;
	
	/**
	 * 图像保存天数
	 */
	private String txbcts;
	
	/**
	 * 运行情况
	 */
	private String yxqk;
	private String yxqkmc;
	
	/**
	 * 系统造价
	 */
	private String xtzj;
	
	/**
	 * 有无出入口监控子系统
	 */
	private String ywcrkjkzxt;
	
	/**
	 * 有无电子巡查系统
	 */
	private String ywdzxcxt;
	
	/**
	 * 有无停车库管理子系统
	 */
	private String ywtckglzxt;
	
	private String cz;

	public String getSsbh() {
		return ssbh;
	}

	public void setSsbh(String ssbh) {
		this.ssbh = ssbh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getXtmc() {
		return xtmc;
	}

	public void setXtmc(String xtmc) {
		this.xtmc = xtmc;
	}

	public String getSydwmc() {
		return sydwmc;
	}

	public void setSydwmc(String sydwmc) {
		this.sydwmc = sydwmc;
	}

	public String getYsdw() {
		return ysdw;
	}

	public void setYsdw(String ysdw) {
		this.ysdw = ysdw;
	}

	public String getYsdwmc() {
		if(ValidateHelper.isNotEmptyString(this.ysdw)){
			ysdwmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_AFXT_YSDW", this.ysdw);
		}
		return ysdwmc;
	}

	public void setYsdwmc(String ysdwmc) {
		this.ysdwmc = ysdwmc;
	}

	public String getSydwdz() {
		return sydwdz;
	}

	public void setSydwdz(String sydwdz) {
		this.sydwdz = sydwdz;
	}

	public String getXtjcqk() {
		return xtjcqk;
	}

	public void setXtjcqk(String xtjcqk) {
		this.xtjcqk = xtjcqk;
	}

	public String getXtjcqkmc() {
		if(ValidateHelper.isNotEmptyString(this.xtjcqk)){
			xtjcqkmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_AFXT_JCQK", this.xtjcqk);
		}
		return xtjcqkmc;
	}

	public void setXtjcqkmc(String xtjcqkmc) {
		this.xtjcqkmc = xtjcqkmc;
	}

	public String getAfglsx() {
		if(ValidateHelper.isNotEmptyString(this.afglsxdl) && ValidateHelper.isEmptyString(this.afglsx)){
			afglsx = afglsxdl;
		}
		return afglsx;
	}

	public void setAfglsx(String afglsx) {
		this.afglsx = afglsx;
	}

	public String getAfglsxdl() {
		if(ValidateHelper.isNotEmptyString(this.afglsx)){
			afglsxdl = this.afglsx.substring(0,1) + "0";
		}
		return afglsxdl;
	}

	public void setAfglsxdl(String afglsxdl) {
		this.afglsxdl = afglsxdl;
	}

	public String getAfglsxmc() {
		if(ValidateHelper.isNotEmptyString(getAfglsx())){
			afglsxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_AFGLSX", getAfglsx());
		}
		return afglsxmc;
	}

	public void setAfglsxmc(String afglsxmc) {
		this.afglsxmc = afglsxmc;
	}

	public String getAfxtgly() {
		return afxtgly;
	}

	public void setAfxtgly(String afxtgly) {
		this.afxtgly = afxtgly;
	}

	public String getAfxtzsdh() {
		return afxtzsdh;
	}

	public void setAfxtzsdh(String afxtzsdh) {
		this.afxtzsdh = afxtzsdh;
	}

	public String getYwrqbjzxt() {
		return ywrqbjzxt;
	}

	public void setYwrqbjzxt(String ywrqbjzxt) {
		this.ywrqbjzxt = ywrqbjzxt;
	}

	public String getTcqsl() {
		return tcqsl;
	}

	public void setTcqsl(String tcqsl) {
		this.tcqsl = tcqsl;
	}

	public String getGdmbs() {
		return gdmbs;
	}

	public void setGdmbs(String gdmbs) {
		this.gdmbs = gdmbs;
	}

	public String getYdmbs() {
		return ydmbs;
	}

	public void setYdmbs(String ydmbs) {
		this.ydmbs = ydmbs;
	}

	public String getRqxtlwqk() {
		return rqxtlwqk;
	}

	public void setRqxtlwqk(String rqxtlwqk) {
		this.rqxtlwqk = rqxtlwqk;
	}

	public String getRqxtlwqkmc() {
		if(ValidateHelper.isNotEmptyString(this.rqxtlwqk)){
			rqxtlwqkmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_AFXT_LWQK", this.rqxtlwqk);
		}
		return rqxtlwqkmc;
	}

	public void setRqxtlwqkmc(String rqxtlwqkmc) {
		this.rqxtlwqkmc = rqxtlwqkmc;
	}

	public String getYwspjkzxt() {
		return ywspjkzxt;
	}

	public void setYwspjkzxt(String ywspjkzxt) {
		this.ywspjkzxt = ywspjkzxt;
	}

	public String getSgdw() {
		return sgdw;
	}

	public void setSgdw(String sgdw) {
		this.sgdw = sgdw;
	}

	public String getSxjsl() {
		return sxjsl;
	}

	public void setSxjsl(String sxjsl) {
		this.sxjsl = sxjsl;
	}

	public String getSpjkxtlwqk() {
		return spjkxtlwqk;
	}

	public void setSpjkxtlwqk(String spjkxtlwqk) {
		this.spjkxtlwqk = spjkxtlwqk;
	}

	public String getSpjkxtlwqkmc() {
		if(ValidateHelper.isNotEmptyString(this.spjkxtlwqk)){
			spjkxtlwqkmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_AFXT_LWQK", this.spjkxtlwqk);
		}
		return spjkxtlwqkmc;
	}

	public void setSpjkxtlwqkmc(String spjkxtlwqkmc) {
		this.spjkxtlwqkmc = spjkxtlwqkmc;
	}

	public String getTxbcts() {
		return txbcts;
	}

	public void setTxbcts(String txbcts) {
		this.txbcts = txbcts;
	}

	public String getYxqk() {
		return yxqk;
	}

	public void setYxqk(String yxqk) {
		this.yxqk = yxqk;
	}

	public String getYxqkmc() {
		if(ValidateHelper.isNotEmptyString(this.yxqk)){
			yxqkmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_AFXT_YXQK", this.yxqk);
		}
		return yxqkmc;
	}

	public void setYxqkmc(String yxqkmc) {
		this.yxqkmc = yxqkmc;
	}

	public String getXtzj() {
		return xtzj;
	}

	public void setXtzj(String xtzj) {
		this.xtzj = xtzj;
	}

	public String getYwcrkjkzxt() {
		return ywcrkjkzxt;
	}

	public void setYwcrkjkzxt(String ywcrkjkzxt) {
		this.ywcrkjkzxt = ywcrkjkzxt;
	}

	public String getYwdzxcxt() {
		return ywdzxcxt;
	}

	public void setYwdzxcxt(String ywdzxcxt) {
		this.ywdzxcxt = ywdzxcxt;
	}

	public String getYwtckglzxt() {
		return ywtckglzxt;
	}

	public void setYwtckglzxt(String ywtckglzxt) {
		this.ywtckglzxt = ywtckglzxt;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"delAbss('"+this.ssbh +"')\">删除</span>";
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
}
