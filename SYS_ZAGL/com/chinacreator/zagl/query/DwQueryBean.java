package com.chinacreator.zagl.query;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class DwQueryBean extends QueryBean{
	private static final long serialVersionUID = 6875924993178976592L;
	
	// 选择单位级别  1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
	private String xzjb;
	
	private String jgbh;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 单位代码
	 */
	private String dwdm;
	
	/**
	 * 法人代表
	 */
	private String frdb;
	
	/**
	 * 法人身份证
	 */
	private String frsfzhm;
	
	/**
	 * 行业类别
	 */
	private String hylb;
	
	/**
	 * 特行类别
	 */
	private String thlb;
	
	/**
	 * 行业类别名称
	 */
	private String hylbmc;
	
	/**
	 * 单位性质
	 */
	private String dwxz;
	
	/**
	 * 登记时间（开始时间）
	 */
	private String djsjstart;
	
	/**
	 * 登记时间（结束时间）
	 */
	private String djsjend;
	
	/**
	 * 操作类型
	 */
	private String opertype;
	
	/**
	 * 注销标识
	 */
	private String zxbs;
	
	/**
	 * 营业执照号
	 */
	private String yyzzh;
	
	/**
	 * 单位类别
	 */
	private String dwlb;
	
	/**
	 * 要害部位编号
	 */
	private String yhbwbh;
	
	/**
	 * 是否年审
	 */
	private String sfns;
	
	/**
	 * 年审开始时间
	 */
	private String nssj_strat;
	
	/**
	 * 年审结束时间
	 */
	private String nssj_end;
	
	/**
	 * 备案等级
	 */
	private String badj;
	
	/**
	 * 管理部门
	 */
	private String glbm;
	
	
	private String [] hylbs;
	
	private String stmc;  //单位名称
	
	/**
	 * 重点级别
	 */
	private String zdjb;
	
	/**
	 * 是否治安管理
	 */
	private String sfzagl;
	
	/**
	 * 是否内保管理
	 */
	private String sfnbgl;
	
	/**
	 * 是否网监管理
	 */
	private String sfwjgl;
	
	/**
	 * 是否消防管理
	 */
	private String sfxfgl; 
	
	private String starttime;
	
	private String endtime;

	
	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getDwdm() {
		return dwdm;
	}

	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}

	public String getFrdb() {
		return frdb;
	}

	public void setFrdb(String frdb) {
		this.frdb = frdb;
	}

	public String getFrsfzhm() {
		return frsfzhm;
	}

	public void setFrsfzhm(String frsfzhm) {
		this.frsfzhm = frsfzhm;
	}

	public String getHylb() {
		if(this.hylbs != null){
			hylb = "";
			for(int i=0; i<hylbs.length; i++){
				if(i < hylbs.length-1){
					hylb += hylbs[i] + ",";
				}else{
					hylb += hylbs[i];
				}
			}
		}
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}

	public String getHylbmc() {
		hylbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_HYLB", this.hylb);
		return hylbmc;
	}

	public void setHylbmc(String hylbmc) {
		this.hylbmc = hylbmc;
	}

	public String getDwxz() {
		return dwxz;
	}

	public void setDwxz(String dwxz) {
		this.dwxz = dwxz;
	}

	public String getOpertype() {
		return opertype;
	}

	public void setOpertype(String opertype) {
		this.opertype = opertype;
	}

	public String getDjsjstart() {
		return djsjstart;
	}

	public void setDjsjstart(String djsjstart) {
		this.djsjstart = djsjstart;
	}

	public String getDjsjend() {
		return djsjend;
	}

	public void setDjsjend(String djsjend) {
		this.djsjend = djsjend;
	}

	public String getThlb()
	{
		return thlb;
	}

	public void setThlb(String thlb)
	{
		this.thlb = thlb;
	}

	public String getJgbh()
	{
		return jgbh;
	}

	public void setJgbh(String jgbh)
	{
		this.jgbh = jgbh;
	}

	public String getZxbs() {
		return zxbs;
	}

	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}

	public String getYyzzh() {
		return yyzzh;
	}

	public void setYyzzh(String yyzzh) {
		this.yyzzh = yyzzh;
	}

	public String getDwlb() {
		return dwlb;
	}

	public void setDwlb(String dwlb) {
		this.dwlb = dwlb;
	}

	public String getYhbwbh()
	{
		return yhbwbh;
	}

	public void setYhbwbh(String yhbwbh)
	{
		this.yhbwbh = yhbwbh;
	}

	public String[] getHylbs() {
		if(this.hylb != null){
			hylbs = hylb.split(",");
		}
		return hylbs;
	}

	public void setHylbs(String[] hylbs) {
		this.hylbs = hylbs;
	}

	public String getStmc() {
		return stmc;
	}

	public void setStmc(String stmc) {
		this.stmc = stmc;
	}

	public String getSfns() {
		return sfns;
	}

	public void setSfns(String sfns) {
		this.sfns = sfns;
	}

	public String getNssj_strat() {
		return nssj_strat;
	}

	public void setNssj_strat(String nssjStrat) {
		nssj_strat = nssjStrat;
	}

	public String getNssj_end() {
		return nssj_end;
	}

	public void setNssj_end(String nssjEnd) {
		nssj_end = nssjEnd;
	}

	public String getBadj() {
		return badj;
	}

	public void setBadj(String badj) {
		this.badj = badj;
	}

	public String getZdjb() {
		return zdjb;
	}

	public void setZdjb(String zdjb) {
		this.zdjb = zdjb;
	}

	public String getGlbm() {
		return glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public String getSfzagl() {
		return sfzagl;
	}

	public void setSfzagl(String sfzagl) {
		this.sfzagl = sfzagl;
	}

	public String getSfnbgl() {
		return sfnbgl;
	}

	public void setSfnbgl(String sfnbgl) {
		this.sfnbgl = sfnbgl;
	}

	public String getSfwjgl() {
		return sfwjgl;
	}

	public void setSfwjgl(String sfwjgl) {
		this.sfwjgl = sfwjgl;
	}

	public String getSfxfgl() {
		return sfxfgl;
	}

	public void setSfxfgl(String sfxfgl) {
		this.sfxfgl = sfxfgl;
	}

	public String getXzjb() {
		return xzjb;
	}

	public void setXzjb(String xzjb) {
		this.xzjb = xzjb;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
}
