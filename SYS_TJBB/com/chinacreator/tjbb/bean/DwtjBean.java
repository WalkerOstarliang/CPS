package com.chinacreator.tjbb.bean;

import java.io.Serializable;

import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 单位统计Bean
 */
public class DwtjBean implements Serializable {

	private static final long serialVersionUID = 1211385504748918067L;
	/**
	 * 单位代码
	 */
	private String 	dwdm;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 特种行业
	 */
	private String tzhy;
	
	/**
	 * 公共场所
	 */
	private String ggcs;
	
	/**
	 * 内保单位
	 */
	private String nbdw;
	
	/**
	 * 危爆单位
	 */
	private String wbdw;
	
	/**
	 * 网吧
	 */
	private String wb;
	
	/**
	 * 涉外单位
	 */
	private String swdw;
	
	/**
	 * 旅馆
	 */
	private String lg;
	
	/**
	 * 开锁单位
	 */
	private String ksdw;
	
	/**
	 * 技防单位
	 */
	private String jfdw;
	
	/**
	 * 其他单位
	 */
	private String qtdw;
	
	/**
	 * 商铺
	 */
	private String sp;
	
	/**
	 * 物流单位
	 */
	private String wldw;
	
	/**
	 * 典当行
	 */
	private String ddh;
	
	/**
	 * 拍卖行
	 */
	private String pmh;
	
	/**
	 * 其他特行
	 */
	private String qtth;
	
	/**
	 * 总数
	 */
	private String zs;
	
	/**
	 * 计算时间
	 */
	private String jssj;
	
	/**
	 * 统计开始时间
	 */
	private String tjsj_s;
	
	/**
	 * 统计结束时间
	 */
	private String tjsj_e;

	public String getDwdm() {
		return dwdm;
	}

	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}

	public String getTzhy() {
		return tzhy;
	}

	public void setTzhy(String tzhy) {
		this.tzhy = tzhy;
	}

	public String getGgcs() {
		return ggcs;
	}

	public void setGgcs(String ggcs) {
		this.ggcs = ggcs;
	}

	public String getNbdw() {
		return nbdw;
	}

	public void setNbdw(String nbdw) {
		this.nbdw = nbdw;
	}

	public String getWbdw() {
		return wbdw;
	}

	public void setWbdw(String wbdw) {
		this.wbdw = wbdw;
	}

	public String getWb() {
		return wb;
	}

	public void setWb(String wb) {
		this.wb = wb;
	}

	public String getSwdw() {
		return swdw;
	}

	public void setSwdw(String swdw) {
		this.swdw = swdw;
	}

	public String getLg() {
		return lg;
	}

	public void setLg(String lg) {
		this.lg = lg;
	}

	public String getKsdw() {
		return ksdw;
	}

	public void setKsdw(String ksdw) {
		this.ksdw = ksdw;
	}

	public String getJfdw() {
		return jfdw;
	}

	public void setJfdw(String jfdw) {
		this.jfdw = jfdw;
	}

	public String getQtdw() {
		return qtdw;
	}

	public void setQtdw(String qtdw) {
		this.qtdw = qtdw;
	}

	public String getSp() {
		return sp;
	}

	public void setSp(String sp) {
		this.sp = sp;
	}

	public String getWldw() {
		return wldw;
	}

	public void setWldw(String wldw) {
		this.wldw = wldw;
	}

	public String getDdh() {
		return ddh;
	}

	public void setDdh(String ddh) {
		this.ddh = ddh;
	}

	public String getPmh() {
		return pmh;
	}

	public void setPmh(String pmh) {
		this.pmh = pmh;
	}

	public String getQtth() {
		return qtth;
	}

	public void setQtth(String qtth) {
		this.qtth = qtth;
	}

	public String getZs() {
		return zs;
	}

	public void setZs(String zs) {
		this.zs = zs;
	}

	public String getJssj() {
		return jssj;
	}

	public void setJssj(String jssj) {
		this.jssj = jssj;
	}

	public String getTjsj_s() {
		return tjsj_s;
	}

	public void setTjsj_s(String tjsj_s) {
		this.tjsj_s = tjsj_s;
	}

	public String getTjsj_e() {
		return tjsj_e;
	}

	public void setTjsj_e(String tjsj_e) {
		this.tjsj_e = tjsj_e;
	}

	public String getDwmc() {
		if(ValidateHelper.isNotEmptyString(dwdm)){
			dwmc = DictionaryCacheHellper.getOrganizationBeanByOrgCode(dwdm).getOrgjc();
			if(CommonDBBaseHelper.getOrgLeve(dwdm)<5){
				dwmc ="<span class=\"cps_span_href\" onclick=\"downQuery('"+dwdm+"')\">" + dwmc + "</span>";
			}
		}else{
			dwmc = "<font color='red'>合计</font>"; 
		}
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}
}
