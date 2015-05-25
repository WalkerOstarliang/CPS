package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;


/**
 * 公共场所信息
 */
public class GgcsBean extends BaseValue{
	private static final long serialVersionUID = -2057695036783360258L;
	
	/**
	 * 场所编号
	 */
	private String ggcsbh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 备案登记号码
	 */
	private String badjhm;
	
	/**
	 * 场所名称
	 */
	private String csmc;
	
	/**
	 * 场所类别
	 */
	private String cslb;
	
	private String cslbmc;
	
	/**
	 * 场所细类
	 */
	private String csxl;
	
	private String csxlmc;
	
	/**
	 * 场所等级
	 */
	private String csdj;
	
	private String csdjmc;
	
	/**
	 * 场所负责人
	 */
	private String csfzr;
	
	/**
	 * 联系方式
	 */
	private String cslxfs;
	
	/**
	 * 场所地址
	 */
	private String csdz;
	
	/**
	 * 建筑物结构
	 */
	private String jzwjg;
	
	/**
	 * 场所内部结构
	 */
	private String csnbjg;
	
	/**
	 * 其它情况
	 */
	private String csqtqk;
	
	/**
	 * 通道口
	 */
	private String cstdk;
	
	/**
	 * 通道口数量
	 */
	private String csdksl;
	
	/**
	 * 有无小件寄存处
	 */
	private String ywxjjcc;
	
	/**
	 * 总面积
	 */
	private String cszmj;
	
	/**
	 * 营业面积
	 */
	private String yymj;
	
	/**
	 * 周围环境
	 */
	private String zwhj;

	private String lqzzsj;
	
	private String hdrs;
	
	private String ggcsmj;
	
	private String ktvbjs;
	
	private String bz;
	
	private String jlbh;
	
	public String getGgcsbh() {
		return ggcsbh;
	}

	public void setGgcsbh(String ggcsbh) {
		this.ggcsbh = ggcsbh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getBadjhm() {
		return badjhm;
	}

	public void setBadjhm(String badjhm) {
		this.badjhm = badjhm;
	}

	public String getCsmc() {
		return csmc;
	}

	public void setCsmc(String csmc) {
		this.csmc = csmc;
	}

	public String getCslb() {
		return cslb;
	}

	public void setCslb(String cslb) {
		this.cslb = cslb;
	}

	public String getCsxl() {
		return csxl;
	}

	public void setCsxl(String csxl) {
		this.csxl = csxl;
	}

	public String getCsdj() {
		return csdj;
	}

	public void setCsdj(String csdj) {
		this.csdj = csdj;
	}

	public String getCsfzr() {
		return csfzr;
	}

	public void setCsfzr(String csfzr) {
		this.csfzr = csfzr;
	}

	public String getCslxfs() {
		return cslxfs;
	}

	public void setCslxfs(String cslxfs) {
		this.cslxfs = cslxfs;
	}

	public String getCsdz() {
		return csdz;
	}

	public void setCsdz(String csdz) {
		this.csdz = csdz;
	}

	public String getJzwjg() {
		return jzwjg;
	}

	public void setJzwjg(String jzwjg) {
		this.jzwjg = jzwjg;
	}

	public String getCsnbjg() {
		return csnbjg;
	}

	public void setCsnbjg(String csnbjg) {
		this.csnbjg = csnbjg;
	}

	public String getCsqtqk() {
		return csqtqk;
	}

	public void setCsqtqk(String csqtqk) {
		this.csqtqk = csqtqk;
	}

	public String getCstdk() {
		return cstdk;
	}

	public void setCstdk(String cstdk) {
		this.cstdk = cstdk;
	}

	public String getCsdksl() {
		return csdksl;
	}

	public void setCsdksl(String csdksl) {
		this.csdksl = csdksl;
	}

	public String getYwxjjcc() {
		return ywxjjcc;
	}

	public void setYwxjjcc(String ywxjjcc) {
		this.ywxjjcc = ywxjjcc;
	}

	public String getCszmj() {
		return cszmj;
	}

	public void setCszmj(String cszmj) {
		this.cszmj = cszmj;
	}

	public String getYymj() {
		return yymj;
	}

	public void setYymj(String yymj) {
		this.yymj = yymj;
	}

	public String getZwhj() {
		return zwhj;
	}

	public void setZwhj(String zwhj) {
		this.zwhj = zwhj;
	}

	public String getLqzzsj()
	{
		return lqzzsj;
	}

	public void setLqzzsj(String lqzzsj)
	{
		this.lqzzsj = lqzzsj;
	}

	public String getHdrs()
	{
		return hdrs;
	}

	public void setHdrs(String hdrs)
	{
		this.hdrs = hdrs;
	}

	public String getGgcsmj()
	{
		return ggcsmj;
	}

	public void setGgcsmj(String ggcsmj)
	{
		this.ggcsmj = ggcsmj;
	}

	public String getKtvbjs()
	{
		return ktvbjs;
	}

	public void setKtvbjs(String ktvbjs)
	{
		this.ktvbjs = ktvbjs;
	}

	public String getBz()
	{
		return bz;
	}

	public void setBz(String bz)
	{
		this.bz = bz;
	}

	public String getJlbh()
	{
		return jlbh;
	}

	public void setJlbh(String jlbh)
	{
		this.jlbh = jlbh;
	}

	public String getCslbmc() {
		if(ValidateHelper.isNotEmptyString(this.cslb)){
			cslbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GGCSLB", this.getCslb());
		}
		return cslbmc;
	}

	public void setCslbmc(String cslbmc) {
		this.cslbmc = cslbmc;
	}

	public String getCsxlmc() {
		if(ValidateHelper.isNotEmptyString(this.getCsxl())){
			csxlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GGCSLB", this.getCsxl());
		}
		return csxlmc;
	}

	public void setCsxlmc(String csxlmc) {
		this.csxlmc = csxlmc;
	}

	public String getCsdjmc() {
		if(ValidateHelper.isNotEmptyString(this.csdj)){
			csdjmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_GGCSDJ", this.csdj);
		}
		return csdjmc;
	}

	public void setCsdjmc(String csdjmc) {
		this.csdjmc = csdjmc;
	}
	
	
}
