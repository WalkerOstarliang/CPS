package com.chinacreator.lsgl.query;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.cps.helper.ChineseSpellingHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * @author Administrator
 *
 */
public class RkQueryBean extends QueryBean
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 1301775759507794915L;
	
	private String jwbh;
	private String rkid;
	private String rybh;
	private String rylb;
	private String rylbms;
	private String sfzh;
	private String xm;
	private String xmpy;
	private String xmty; //姓名同音
	private String ywm;
	private String ywx;
	private String gj;
	private String zjzl;
	private String zjhm;
	private String zpid;
	private String ssgajgjgdm;
	private String zrdwdm;
	private String fwid;
	private boolean hideSfzh;
	private String sfczw;
	private String dxlb;
	private String xzzqh;
	private String sspcsdm;
	private String gxdwdm;
	private String zdrybh;
	private String xb;
	private String csrq_start;
	private String csrq_end;
	private String hjdqh;
	
	private String age_start;
	private String age_end;
	private String zxbs;
	
	private String djsj_start;
	private String djsj_end;
	
	private String fzrq_start;
	private String fzrq_end;
	private String jszhm;
	private String ywzp;
	
	private String czsj_start;
	private String czsj_end;
	private String mz;
	
	private String zxyy;
	
	private String gzgw;
	
	
	/**
	 * 在控登记
	 */
	private String zkdj;
	
	/**
	 * 托管状态
	 */
	private String tgzt;
	
	/**
	 * 是否退回
	 */
	private String sfth;
	
	/**
	 * 是否派发
	 */
	private String sfpf;
	
	/**
	 * 在控状态
	 */
	private String zkzt;

	/**
	 * 在控登记时间（开始）
	 */
	private String zkdjsjStart;
	
	/**
	 * 在控登记时间（结束）
	 */
	private String zkdjsjEnd;
	
	private String rkfwglid;
	private String dzmc;
	private String xj;   //新疆
	private String xz;   //西藏
	private String fjjh;
	
	private String fjlb;
	/**
	 * 工作对象编号
	 */
	private String gzdxbh;
	
	private String zxsj_start;
	private String zxsj_end;
	
	private String ssdwdm;
	private String ssdwmc;
	
	/**
	 * 0：表示具体单位代码 
	 * 1 ：省级430000000000 
	 * 2：市级 如：430100000000
	 * 3：区县 如 430102000000
	 * 4：派出所 如 430102340000
	 */
	private String ssdwtype;

	private String sfbljzz;
	
	private String stid;
	
	private String stmc;
	
	private String jlxdm;
	
	private String mph;
	
	private String xqz;
	
	private String ldxz;
	
	private String dyh;
	
	private String lch;
	
	private String fjh;
	
	private String fsdz;
	
	private String cyrybh;
	
	private String xldbh;
	
	public String getZxsj_start() {
		return zxsj_start;
	}
	public void setZxsj_start(String zxsj_start) {
		this.zxsj_start = zxsj_start;
	}
	public String getZxsj_end() {
		return zxsj_end;
	}
	public void setZxsj_end(String zxsj_end) {
		this.zxsj_end = zxsj_end;
	}
	public String getXj() {
		return xj;
	}
	public void setXj(String xj) {
		this.xj = xj;
	}
	public String getXz() {
		return xz;
	}
	public void setXz(String xz) {
		this.xz = xz;
	}
	public String getDzmc() {
		return dzmc;
	}
	public void setDzmc(String dzmc) {
		this.dzmc = dzmc;
	}
	public String getRybh()
	{
		return rybh;
	}
	public void setRybh(String rybh)
	{
		this.rybh = rybh;
	}
	public String getRylb()
	{
		return rylb;
	}
	public void setRylb(String rylb)
	{
		this.rylb = rylb;
	}
	public String getSfzh()
	{
		return sfzh;
	}
	public void setSfzh(String sfzh)
	{
		this.sfzh = sfzh;
	}
	public String getXm()
	{
		return xm;
	}
	public void setXm(String xm)
	{
		this.xm = xm;
	}
	public String getRkid()
	{
		return rkid;
	}
	public void setRkid(String rkid)
	{
		this.rkid = rkid;
	}
	public String getZpid()
	{
		return zpid;
	}
	public void setZpid(String zpid)
	{
		this.zpid = zpid;
	}
	public String getGj()
	{
		return gj;
	}
	public void setGj(String gj)
	{
		this.gj = gj;
	}
	public String getZjzl()
	{
		return zjzl;
	}
	public void setZjzl(String zjzl)
	{
		this.zjzl = zjzl;
	}
	public String getZjhm()
	{
		if(ValidateHelper.isNotEmptyString(zjhm)){
			zjhm = zjhm.replace("x", "X");
		}
		return zjhm;
	}
	public void setZjhm(String zjhm)
	{
		this.zjhm = zjhm;
	}
	public String getSsgajgjgdm()
	{
		return ssgajgjgdm;
	}
	public void setSsgajgjgdm(String ssgajgjgdm)
	{
		this.ssgajgjgdm = ssgajgjgdm;
	}
	public String getSspcsdm()
	{
		return sspcsdm;
	}
	public void setSspcsdm(String sspcsdm)
	{
		this.sspcsdm = sspcsdm;
	}
	public String getZrdwdm()
	{
		return zrdwdm;
	}
	public void setZrdwdm(String zrdwdm)
	{
		this.zrdwdm = zrdwdm;
	}
	public String getFwid()
	{
		return fwid;
	}
	public void setFwid(String fwid)
	{
		this.fwid = fwid;
	}
	public boolean isHideSfzh()
	{
		return hideSfzh;
	}
	public void setHideSfzh(boolean hideSfzh)
	{
		this.hideSfzh = hideSfzh;
	}
	public String getYwm()
	{
		return ywm;
	}
	public void setYwm(String ywm)
	{
		this.ywm = ywm;
	}
	public String getDxlb() {
		return dxlb;
	}
	public void setDxlb(String dxlb) {
		this.dxlb = dxlb;
	}
	public String getSfczw()
	{
		return sfczw;
	}
	public void setSfczw(String sfczw)
	{
		this.sfczw = sfczw;
	}
	public String getRylbms() {
		rylbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_RYLB", rylb);
		return rylbms;
	}
	public void setRylbms(String rylbms) {
		this.rylbms = rylbms;
	}
	public String getXzzqh() {
		return xzzqh;
	}
	public void setXzzqh(String xzzqh) {
		this.xzzqh = xzzqh;
	}
	public String getGxdwdm() {
		return gxdwdm;
	}
	public void setGxdwdm(String gxdwdm) {
		this.gxdwdm = gxdwdm;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getCsrq_start() {
		return csrq_start;
	}
	public void setCsrq_start(String csrq_start) {
		this.csrq_start = csrq_start;
	}
	public String getCsrq_end() {
		return csrq_end;
	}
	public void setCsrq_end(String csrq_end) {
		this.csrq_end = csrq_end;
	}
	public String getHjdqh() {
		return hjdqh;
	}
	public void setHjdqh(String hjdqh) {
		this.hjdqh = hjdqh;
	}
	public String getAge_start() {
		return age_start;
	}
	public void setAge_start(String age_start) {
		this.age_start = age_start;
	}
	public String getAge_end() {
		return age_end;
	}
	public void setAge_end(String age_end) {
		this.age_end = age_end;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getDjsj_start() {
		return djsj_start;
	}
	public void setDjsj_start(String djsj_start) {
		this.djsj_start = djsj_start;
	}
	public String getDjsj_end() {
		return djsj_end;
	}
	public void setDjsj_end(String djsj_end) {
		this.djsj_end = djsj_end;
	}
	public String getJszhm() {
		return jszhm;
	}
	public void setJszhm(String jszhm) {
		this.jszhm = jszhm;
	}
	public String getFzrq_start() {
		return fzrq_start;
	}
	public void setFzrq_start(String fzrq_start) {
		this.fzrq_start = fzrq_start;
	}
	public String getFzrq_end() {
		return fzrq_end;
	}
	public void setFzrq_end(String fzrq_end) {
		this.fzrq_end = fzrq_end;
	}
	public String getYwzp()
	{
		return ywzp;
	}
	public void setYwzp(String ywzp)
	{
		this.ywzp = ywzp;
	}
	public String getCzsj_start() {
		return czsj_start;
	}
	public void setCzsj_start(String czsj_start) {
		this.czsj_start = czsj_start;
	}
	public String getCzsj_end() {
		return czsj_end;
	}
	public void setCzsj_end(String czsj_end) {
		this.czsj_end = czsj_end;
	}
	public String getXmty() {
		return xmty;
	}
	public void setXmty(String xmty) {
		this.xmty = xmty;
	}
	
	public String getXmpy() 
	{
		ChineseSpellingHelper  finder = ChineseSpellingHelper.getInstance();
		if (ValidateHelper.isNotEmptyString(xm))
		{
			finder.setResource(xm);
			xmpy = finder.getSelling(finder.getSpelling());
		}
		return xmpy;
	}
	
	public void setXmpy(String xmpy) {
		this.xmpy = xmpy;
	}
	public String getZkdj() {
		return zkdj;
	}
	public void setZkdj(String zkdj) {
		this.zkdj = zkdj;
	}
	public String getTgzt() {
		return tgzt;
	}
	public void setTgzt(String tgzt) {
		this.tgzt = tgzt;
	}
	public String getSfth() {
		return sfth;
	}
	public void setSfth(String sfth) {
		this.sfth = sfth;
	}
	public String getSfpf() {
		return sfpf;
	}
	public void setSfpf(String sfpf) {
		this.sfpf = sfpf;
	}
	public String getZdrybh() {
		return zdrybh;
	}
	public void setZdrybh(String zdrybh) {
		this.zdrybh = zdrybh;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getRkfwglid()
	{
		return rkfwglid;
	}
	public void setRkfwglid(String rkfwglid)
	{
		this.rkfwglid = rkfwglid;
	}
	public String getFjjh() {
		return fjjh;
	}
	public void setFjjh(String fjjh) {
		this.fjjh = fjjh;
	}
	public String getGzdxbh() {
		return gzdxbh;
	}
	public void setGzdxbh(String gzdxbh) {
		this.gzdxbh = gzdxbh;
	}
	public String getZkzt()
	{
		return zkzt;
	}
	public void setZkzt(String zkzt)
	{
		this.zkzt = zkzt;
	}
	public String getZkdjsjStart()
	{
		return zkdjsjStart;
	}
	public void setZkdjsjStart(String zkdjsjStart)
	{
		this.zkdjsjStart = zkdjsjStart;
	}
	public String getZkdjsjEnd()
	{
		return zkdjsjEnd;
	}
	public void setZkdjsjEnd(String zkdjsjEnd)
	{
		this.zkdjsjEnd = zkdjsjEnd;
	}
	public String getSsdwdm() {
		return ssdwdm;
	}
	public void setSsdwdm(String ssdwdm) {
		this.ssdwdm = ssdwdm;
	}
	public String getSsdwmc() {
		return ssdwmc;
	}
	public void setSsdwmc(String ssdwmc) {
		this.ssdwmc = ssdwmc;
	}
	public String getSsdwtype() {
		if (ValidateHelper.isNotEmptyString(ssdwdm) && ssdwdm.length()==12)
		{
			//省
			if (ssdwdm.substring(2, 12).equals("0000000000"))
			{
				ssdwtype = "1";
			}
			else if (ssdwdm.substring(4, 12).equals("00000000"))
			{
				ssdwtype = "2";
			}
			else if (ssdwdm.substring(6, 12).equals("000000"))
			{
				ssdwtype = "3";
			}
			else if (ssdwdm.substring(8, 12).equals("0000"))
			{
				ssdwtype = "4";
			}
			else
			{
				ssdwtype = "0";
			}
		}
		return ssdwtype;
	}
	public void setSsdwtype(String ssdwtype) {
		this.ssdwtype = ssdwtype;
	}
	public String getSfbljzz()
	{
		return sfbljzz;
	}

	public void setSfbljzz(String sfbljzz)
	{
		this.sfbljzz = sfbljzz;
	}
	public String getStid()
	{
		return stid;
	}
	public void setStid(String stid)
	{
		this.stid = stid;
	}
	public String getStmc()
	{
		return stmc;
	}
	public void setStmc(String stmc)
	{
		this.stmc = stmc;
	}
	public String getJlxdm()
	{
		return jlxdm;
	}
	public void setJlxdm(String jlxdm)
	{
		this.jlxdm = jlxdm;
	}
	public String getMph()
	{
		return mph;
	}
	public void setMph(String mph)
	{
		this.mph = mph;
	}
	public String getXqz()
	{
		return xqz;
	}
	public void setXqz(String xqz)
	{
		this.xqz = xqz;
	}
	public String getLdxz()
	{
		return ldxz;
	}
	public void setLdxz(String ldxz)
	{
		this.ldxz = ldxz;
	}
	public String getDyh()
	{
		return dyh;
	}
	public void setDyh(String dyh)
	{
		this.dyh = dyh;
	}
	public String getLch()
	{
		return lch;
	}
	public void setLch(String lch)
	{
		this.lch = lch;
	}
	public String getFjh()
	{
		return fjh;
	}
	public void setFjh(String fjh)
	{
		this.fjh = fjh;
	}
	public String getFsdz()
	{
		return fsdz;
	}
	public void setFsdz(String fsdz)
	{
		this.fsdz = fsdz;
	}
	public String getYwx()
	{
		return ywx;
	}
	public void setYwx(String ywx)
	{
		this.ywx = ywx;
	}
	public String getJwbh()
	{
		return jwbh;
	}
	public void setJwbh(String jwbh)
	{
		this.jwbh = jwbh;
	}
	public String getZxyy()
	{
		return zxyy;
	}
	public void setZxyy(String zxyy)
	{
		this.zxyy = zxyy;
	}
	public String getCyrybh()
	{
		return cyrybh;
	}
	public void setCyrybh(String cyrybh)
	{
		this.cyrybh = cyrybh;
	}
	public String getFjlb()
	{
		return fjlb;
	}
	public void setFjlb(String fjlb)
	{
		this.fjlb = fjlb;
	}
	public String getXldbh()
	{
		return xldbh;
	}
	public void setXldbh(String xldbh)
	{
		this.xldbh = xldbh;
	}
	public String getGzgw() {
		return gzgw;
	}
	public void setGzgw(String gzgw) {
		this.gzgw = gzgw;
	}
}
