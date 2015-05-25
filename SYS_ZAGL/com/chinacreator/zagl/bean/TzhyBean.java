package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;



/**
 * 特种行业
 */
public class TzhyBean extends BaseValue{
	private static final long serialVersionUID = -5193499805118613047L;
	/**
	 * 特行编号（主键：10位单位代码+8位日期+7位流水号)
	 */
	private String thbh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 特种行业名称
	 */
	private String thmc;
	
	/**
	 * 特行类别
	 */
	private String thlb;
	private String thlb_mc;
	
	/**
	 * 特行细类
	 */
	private String thxl;
	
	private String thxlmc;
	
	/**
	 * 经营类别
	 */
	private String jylb;
	private String jylbmc;
	
	/**
	 * 特行是否发证
	 */
	private String thsffz;
	
	/**
	 * 特种行业许可证号
	 */
	private String tzhyxkz;
	
	/**
	 * 特行编码
	 */
	private String thbm;
	
	/**
	 * 核发人
	 */
	private String hfr;
	
	/**
	 * 许可证核发单位
	 */
	private String xkzhfdw;
	
	/**
	 * 许可证有效日期
	 */
	private String xkzyxrq;
	
	/**
	 * 建档日期
	 */
	private String thjdrq;
	
	/**
	 * 备案时间
	 */
	private String barq;
	
	/**
	 * 变更情况
	 */
	private String bgqk;
	
	/**
	 * 备注
	 */
	private String bz;
	
	/**
	 * 经营负责人姓名
	 */
	private String jyfzr;
	
	/**
	 * 经营负责人身份证号
	 */
	private String jyfzrsfzh;
	
	/**
	 * 经营负责人联系电话
	 */
	private String jyfzrlxdh;
	
	/**
	 * 安保负责人姓名
	 */
	private String abfzrxm;
	
	/**
	 * 安保负责人身份证号
	 */
	private String abfzrsfzh;
	
	/**
	 * 安保负责人联系电话
	 */
	private String abfzrlxdh;
	
	/**
	 * 责任民警
	 */
	private String zrmj;
	
	/**
	 * 民警电话
	 */
	private String mjdh;
	
	/**
	 * 派出所电话
	 */
	private String pcsdh;
	
	/**
	 * 治安责任单位名称
	 */
	private String zazrdwmc;
	
	/**
	 * 治安责任单位代码
	 */
	private String zazrdwdm;
	
	/**
	 * 领证人
	 */
	private String lzr;
	
	public String getThbh() {
		return thbh;
	}

	public void setThbh(String thbh) {
		this.thbh = thbh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getThmc() {
		return thmc;
	}

	public void setThmc(String thmc) {
		this.thmc = thmc;
	}

	public String getThlb() {
		return thlb;
	}

	public void setThlb(String thlb) {
		this.thlb = thlb;
	}

	public String getThxl() {
		return thxl;
	}

	public void setThxl(String thxl) {
		this.thxl = thxl;
	}

	public String getJylb() {
		return jylb;
	}

	public void setJylb(String jylb) {
		this.jylb = jylb;
	}

	public String getThsffz() {
		return thsffz;
	}

	public void setThsffz(String thsffz) {
		this.thsffz = thsffz;
	}

	public String getTzhyxkz() {
		return tzhyxkz;
	}

	public void setTzhyxkz(String tzhyxkz) {
		this.tzhyxkz = tzhyxkz;
	}

	public String getThbm() {
		return thbm;
	}

	public void setThbm(String thbm) {
		this.thbm = thbm;
	}

	public String getHfr() {
		return hfr;
	}

	public void setHfr(String hfr) {
		this.hfr = hfr;
	}

	public String getXkzhfdw() {
		return xkzhfdw;
	}

	public void setXkzhfdw(String xkzhfdw) {
		this.xkzhfdw = xkzhfdw;
	}

	public String getXkzyxrq() {
		return xkzyxrq;
	}

	public void setXkzyxrq(String xkzyxrq) {
		this.xkzyxrq = xkzyxrq;
	}

	public String getThjdrq() {
		return thjdrq;
	}

	public void setThjdrq(String thjdrq) {
		this.thjdrq = thjdrq;
	}

	public String getBarq() {
		return barq;
	}

	public void setBarq(String barq) {
		this.barq = barq;
	}

	public String getBgqk() {
		return bgqk;
	}

	public void setBgqk(String bgqk) {
		this.bgqk = bgqk;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getJyfzr() {
		return jyfzr;
	}

	public void setJyfzr(String jyfzr) {
		this.jyfzr = jyfzr;
	}

	public String getJyfzrsfzh() {
		return jyfzrsfzh;
	}

	public void setJyfzrsfzh(String jyfzrsfzh) {
		this.jyfzrsfzh = jyfzrsfzh;
	}

	public String getJyfzrlxdh() {
		return jyfzrlxdh;
	}

	public void setJyfzrlxdh(String jyfzrlxdh) {
		this.jyfzrlxdh = jyfzrlxdh;
	}

	public String getAbfzrxm() {
		return abfzrxm;
	}

	public void setAbfzrxm(String abfzrxm) {
		this.abfzrxm = abfzrxm;
	}

	public String getAbfzrsfzh() {
		return abfzrsfzh;
	}

	public void setAbfzrsfzh(String abfzrsfzh) {
		this.abfzrsfzh = abfzrsfzh;
	}

	public String getAbfzrlxdh() {
		return abfzrlxdh;
	}

	public void setAbfzrlxdh(String abfzrlxdh) {
		this.abfzrlxdh = abfzrlxdh;
	}

	public String getLzr()
	{
		return lzr;
	}

	public void setLzr(String lzr)
	{
		this.lzr = lzr;
	}

	public String getThxlmc() {
		if(ValidateHelper.isNotEmptyString(this.thxl)){
			thxlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_THLB",this.thxl);
		}
		return thxlmc;
	}

	public void setThxlmc(String thxlmc) {
		this.thxlmc = thxlmc;
	}

	public String getThlb_mc() {
		if(ValidateHelper.isNotEmptyString(this.thlb)){
			thlb_mc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_THLB",this.thlb);
		}
		return thlb_mc;
	}

	public void setThlb_mc(String thlb_mc) {
		this.thlb_mc = thlb_mc;
	}

	public String getJylbmc() {
		if(ValidateHelper.isNotEmptyString(this.jylb)){
			jylbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_JYLB", this.jylb);
		}
		return jylbmc;
	}

	public void setJylbmc(String jylbmc) {
		this.jylbmc = jylbmc;
	}

	public String getZrmj() {
		return zrmj;
	}

	public void setZrmj(String zrmj) {
		this.zrmj = zrmj;
	}

	public String getMjdh() {
		return mjdh;
	}

	public void setMjdh(String mjdh) {
		this.mjdh = mjdh;
	}

	public String getPcsdh() {
		return pcsdh;
	}

	public void setPcsdh(String pcsdh) {
		this.pcsdh = pcsdh;
	}

	public String getZazrdwmc() {
		return zazrdwmc;
	}

	public void setZazrdwmc(String zazrdwmc) {
		this.zazrdwmc = zazrdwmc;
	}

	public String getZazrdwdm() {
		return zazrdwdm;
	}

	public void setZazrdwdm(String zazrdwdm) {
		this.zazrdwdm = zazrdwdm;
	}
}
