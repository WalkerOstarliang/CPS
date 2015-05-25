package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.CommonLogBean;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class ThlgyBean extends CommonLogBean{

	private static final long serialVersionUID = 948214572752280352L;
	
	/**
	 * 旅馆编号
	 */
	private String lgbh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 特行编号
	 */
	private String thbh;
	
	/**
	 * 旅馆名称
	 */
	private String lgmc;
	
	/**
	 * 旅馆类型
	 */
	private String lglx;
	private String lglxmc;
	/**
	 * 是否军队旅馆
	 */
	private String sfjdlg;
	
	/**
	 * 旅馆技防设备
	 */
	private String lgjfsb;
	
	/**
	 * 旅馆星级
	 */
	private String lgxj;
	private String lgxjmc;
	
	/**
	 * 旅馆等级
	 */
	private String lgdj;
	private String lgdjmc;
	
	/**
	 * 旅馆楼层数
	 */
	private String lglcs;
	
	/**
	 * 旅馆客房数
	 */
	private String lgkfs;
	
	/**
	 * 旅馆床位数
	 */
	private String lgcws;
	
	/**
	 * 旅馆车位数
	 */
	private String lgtcws;
	
	/**
	 * 旅馆状态
	 */
	private String lgzt;
	private String lgztmc;
	
	/**
	 * 旅馆是否联网
	 */
	private String lgsflw;
	
	/**
	 * 经营项目
	 */
	private String jyxm;
	private String jyxmmc;
	
	/**
	 * 装机状态
	 */
	private String zjzt;
	
	/**
	 * 装机方式
	 */
	private String zjfs;
	
	/**
	 * 建筑面积
	 */
	private String jzmj;
	
	/**
	 * 通道宽度
	 */
	private String tdkd;
	
	private String mtmj;
	
	private String hksmj;
	
	private String jcsmj;
	
	private String tcsmj;
	
	private String kfmj;
	
	private String ylcsmj;

	public String getLgbh() {
		return lgbh;
	}

	public void setLgbh(String lgbh) {
		this.lgbh = lgbh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getThbh() {
		return thbh;
	}

	public void setThbh(String thbh) {
		this.thbh = thbh;
	}

	public String getLgmc() {
		return lgmc;
	}

	public void setLgmc(String lgmc) {
		this.lgmc = lgmc;
	}

	public String getLglx() {
		return lglx;
	}

	public void setLglx(String lglx) {
		this.lglx = lglx;
	}

	public String getSfjdlg() {
		return sfjdlg;
	}

	public void setSfjdlg(String sfjdlg) {
		this.sfjdlg = sfjdlg;
	}

	public String getLgjfsb() {
		return lgjfsb;
	}

	public void setLgjfsb(String lgjfsb) {
		this.lgjfsb = lgjfsb;
	}

	public String getLgxj() {
		return lgxj;
	}

	public void setLgxj(String lgxj) {
		this.lgxj = lgxj;
	}

	public String getLgdj() {
		return lgdj;
	}

	public void setLgdj(String lgdj) {
		this.lgdj = lgdj;
	}

	public String getLglcs() {
		return lglcs;
	}

	public void setLglcs(String lglcs) {
		this.lglcs = lglcs;
	}

	public String getLgkfs() {
		return lgkfs;
	}

	public void setLgkfs(String lgkfs) {
		this.lgkfs = lgkfs;
	}

	public String getLgcws() {
		return lgcws;
	}

	public void setLgcws(String lgcws) {
		this.lgcws = lgcws;
	}

	public String getLgtcws() {
		return lgtcws;
	}

	public void setLgtcws(String lgtcws) {
		this.lgtcws = lgtcws;
	}

	public String getLgzt() {
		return lgzt;
	}

	public void setLgzt(String lgzt) {
		this.lgzt = lgzt;
	}

	public String getLgsflw() {
		return lgsflw;
	}

	public void setLgsflw(String lgsflw) {
		this.lgsflw = lgsflw;
	}

	public String getJyxm() {
		return jyxm;
	}

	public void setJyxm(String jyxm) {
		this.jyxm = jyxm;
	}
	
	public String getJyxmmc() {
		if(ValidateHelper.isNotEmptyString(this.jyxm)){
			jyxmmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_THJYXM", this.jyxm);
		}
		return jyxmmc;
	}

	public void setJyxmmc(String jyxmmc) {
		this.jyxmmc = jyxmmc;
	}

	public String getZjzt() {
		return zjzt;
	}

	public void setZjzt(String zjzt) {
		this.zjzt = zjzt;
	}

	public String getZjfs() {
		return zjfs;
	}

	public void setZjfs(String zjfs) {
		this.zjfs = zjfs;
	}

	public String getJzmj() {
		return jzmj;
	}

	public void setJzmj(String jzmj) {
		this.jzmj = jzmj;
	}

	public String getTdkd() {
		return tdkd;
	}

	public void setTdkd(String tdkd) {
		this.tdkd = tdkd;
	}

	public String getMtmj()
	{
		return mtmj;
	}

	public void setMtmj(String mtmj)
	{
		this.mtmj = mtmj;
	}

	public String getHksmj()
	{
		return hksmj;
	}

	public void setHksmj(String hksmj)
	{
		this.hksmj = hksmj;
	}

	public String getJcsmj()
	{
		return jcsmj;
	}

	public void setJcsmj(String jcsmj)
	{
		this.jcsmj = jcsmj;
	}

	public String getTcsmj()
	{
		return tcsmj;
	}

	public void setTcsmj(String tcsmj)
	{
		this.tcsmj = tcsmj;
	}

	public String getKfmj()
	{
		return kfmj;
	}

	public void setKfmj(String kfmj)
	{
		this.kfmj = kfmj;
	}

	public String getYlcsmj()
	{
		return ylcsmj;
	}

	public void setYlcsmj(String ylcsmj)
	{
		this.ylcsmj = ylcsmj;
	}

	public String getLglxmc() {
		if(ValidateHelper.isNotEmptyString(this.lglx)){
			lglxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_YGLX",this.lglx);
		}
		return lglxmc;
	}

	public void setLglxmc(String lglxmc) {
		this.lglxmc = lglxmc;
	}

	public String getLgxjmc() {
		if(ValidateHelper.isNotEmptyString(this.lgxj)){
			lgxjmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_YGXJ", this.lgxj);
		}
		return lgxjmc;
	}

	public void setLgxjmc(String lgxjmc) {
		this.lgxjmc = lgxjmc;
	}

	public String getLgdjmc() {
		if(ValidateHelper.isNotEmptyString(this.lgdj)){
			lgdjmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_YGDJ", this.lgdj);
		}
		return lgdjmc;
	}

	public void setLgdjmc(String lgdjmc) {
		this.lgdjmc = lgdjmc;
	}

	public String getLgztmc() {
		if(ValidateHelper.isNotEmptyString(this.lgzt)){
			lgztmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_YGZT", this.lgzt);
		}
		return lgztmc;
	}

	public void setLgztmc(String lgztmc) {
		this.lgztmc = lgztmc;
	}
}
