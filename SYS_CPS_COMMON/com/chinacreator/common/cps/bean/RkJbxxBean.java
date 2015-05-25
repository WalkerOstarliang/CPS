package com.chinacreator.common.cps.bean;

import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.cps.helper.ChineseSpellingHelper;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.RkzpxxBean;

/**
 * 人口基本信息对象，供系统所有模块使用 
 * 对应数据库表t_lsgl_rk_jbxx
 * @author mingchun.xiong
 * @date 2013-8-6
 */
public class RkJbxxBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= -6347085206019411356L;
	private String rybh;
	private String xm;
	private String xmpy;
	private String sfzh;
	private String xb;
	private String xbms;
	private String gj;
	private String gjms;
	private String mz;
	private String mzms;
	private String csrq;
	private String bmch;
	private String byzk;
	private String byzkms;
	private String ywm;
	private String whcd;
	private String whcdms;
	private String zjzl;
	private String zjzlms;
	private String zjhm;
	private String zzmm;
	private String zzmmms;
	private String hyzk;
	private String hyzkms;
	private String sg;
	private String xx;
	private String xxms;
	private String zzxy;
	private String zzxyms;
	private String zc;
	private String lxdh;
	private String lxdhbz;   //联系电话备注
	private String fwcs;
	private String zydm;
	private String zyms;
	private String zw;
	private String sf;
	private String sfms;
	private String jg;
	private String csd;
	private String csdms;
	
	private String hjdqh;
	private String hjdqhmc;
	private String sspcsdm;
	private String sspcsmc;
	private String ssgajgjgdm;
	private String ssgajgjgmc;
	
	private String swrq;
	private String swzmbh;
	private String zwbh;
	private String dnabh;
	private String xxjb;
	private String czsj;
	private String czdwdm;
	private String czdwmc;
	private String czrjh;
	private String czrxm;
	private String czrsfzh;
	private String czbs;
	private String xzzqh;
	private String xzzqhmc;
	private String xzzqhms;
	private String xzzxz;
	private String xzzzrq;
	private String xzzzrqmc;
	private String xzzzrqms;
	
	private String hjdxz;
	private String rysx;
	private String rysxms;
	private String rylb;
	private String rylbms;
	//人员特殊属性
	private String rytssx;
	private String[] rytssxs;
	
	private String rkid;
	
	private String zrdwdm;
	private String zddwmc;
	
	private String djdwdm;
	
	private List<RkzpxxBean> rkzpxxList;
	private List<SystemDictionaryBean> rytssxList;

	private String cz;
	private String syrkdjcz;
	private String zxbs;
	private String zxbsms;
	//private String zpid ;
	//private byte[] ryzp;
	/*
	public byte[] getRyzp() {
		try{
			String sql = " select zp from t_lsgl_rk_zpxx where id='" + zpid + "'";
			DBUtil util = new DBUtil();
			util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
			Blob blob = util.getBlob(0, "zp");
			if(blob!=null){
				long in = 0;
				ryzp = blob.getBytes(in, (int)blob.length());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return ryzp;
	}

	public void setRyzp(byte[] ryzp) {
		this.ryzp = ryzp;
	}
*/
	public String getRybh()
	{
		if(ValidateHelper.isNotEmptyString(rybh)){
			rybh = rybh.trim();
		}
		return rybh;
	}

	public void setRybh(String rybh)
	{
		this.rybh = rybh;
	}

	public String getXm()
	{
		if(ValidateHelper.isNotEmptyString(xm)){
			xm = xm.trim();
		}
		return xm;
	}

	public void setXm(String xm)
	{
		this.xm = xm;
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

	public void setXmpy(String xmpy)
	{
		this.xmpy = xmpy;
	}

	public String getSfzh()
	{
		if(ValidateHelper.isNotEmptyString(sfzh)){
			sfzh = sfzh.trim();
		}
		return sfzh;
	}

	public void setSfzh(String sfzh)
	{
		this.sfzh = sfzh;
	}

	public String getXb()
	{
		if(ValidateHelper.isNotEmptyString(xb)){
			xb = xb.trim();
		}
		return xb;
	}

	public void setXb(String xb)
	{
		this.xb = xb;
	}

	public String getGj()
	{
		if (ValidateHelper.isEmptyString(gj))
		{
			gj = "CHN";
		}
		return gj;
	}

	public void setGj(String gj)
	{
		this.gj = gj;
	}

	public String getMz()
	{
		if(ValidateHelper.isNotEmptyString(mz)){
			mz = mz.trim();
		}
		return mz;
	}

	public void setMz(String mz)
	{
		this.mz = mz;
	}

	public String getCsrq()
	{
		if(ValidateHelper.isNotEmptyString(csrq)){
			csrq = csrq.trim();
		}
		return csrq;
	}

	public void setCsrq(String csrq)
	{
		this.csrq = csrq;
	}

	public String getBmch()
	{
		if(ValidateHelper.isNotEmptyString(bmch)){
			bmch = bmch.trim();
		}
		return bmch;
	}

	public void setBmch(String bmch)
	{
		this.bmch = bmch;
	}

	public String getByzk()
	{
		if(ValidateHelper.isNotEmptyString(byzk)){
			byzk = byzk.trim();
		}
		return byzk;
	}

	public void setByzk(String byzk)
	{
		this.byzk = byzk;
	}

	public String getYwm()
	{
		if(ValidateHelper.isNotEmptyString(ywm)){
			ywm = ywm.trim();
		}
		return ywm;
	}

	public void setYwm(String ywm)
	{
		this.ywm = ywm;
	}

	public String getWhcd()
	{
		if(ValidateHelper.isNotEmptyString(whcd)){
			whcd = whcd.trim();
		}
		return whcd;
	}

	public void setWhcd(String whcd)
	{
		this.whcd = whcd;
	}

	public String getZjzl()
	{
		if(ValidateHelper.isNotEmptyString(zjzl)){
			zjzl = zjzl.trim();
		}
		return zjzl;
	}

	public void setZjzl(String zjzl)
	{
		this.zjzl = zjzl;
	}

	public String getZjhm()
	{
		if(ValidateHelper.isNotEmptyString(zjhm)){
			zjhm = zjhm.trim();
		}
		return zjhm;
	}

	public void setZjhm(String zjhm)
	{
		this.zjhm = zjhm;
	}

	public String getZzmm()
	{
		if(ValidateHelper.isNotEmptyString(zzmm)){
			zzmm = zzmm.trim();
		}
		return zzmm;
	}

	public void setZzmm(String zzmm)
	{
		this.zzmm = zzmm;
	}

	public String getHyzk()
	{
		if(ValidateHelper.isNotEmptyString(hyzk)){
			hyzk = hyzk.trim();
		}
		return hyzk;
	}

	public void setHyzk(String hyzk)
	{
		this.hyzk = hyzk;
	}

	public String getSg()
	{
		if(ValidateHelper.isNotEmptyString(sg)){
			sg = sg.trim();
		}
		return sg;
	}

	public void setSg(String sg)
	{
		this.sg = sg;
	}

	public String getXx()
	{
		if(ValidateHelper.isNotEmptyString(xx)){
			xx = xx.trim();
		}
		return xx;
	}

	public void setXx(String xx)
	{
		this.xx = xx;
	}

	public String getZzxy()
	{
		if(ValidateHelper.isNotEmptyString(zzxy)){
			zzxy = zzxy.trim();
		}
		return zzxy;
	}

	public void setZzxy(String zzxy)
	{
		this.zzxy = zzxy;
	}

	public String getZc()
	{
		if(ValidateHelper.isNotEmptyString(zc)){
			zc = zc.trim();
		}
		return zc;
	}

	public void setZc(String zc)
	{
		this.zc = zc;
	}

	public String getLxdh()
	{
		if(ValidateHelper.isNotEmptyString(lxdh)){
			lxdh = lxdh.trim();
		}
		return lxdh;
	}

	public void setLxdh(String lxdh)
	{
		this.lxdh = lxdh;
	}

	public String getFwcs()
	{
		if(ValidateHelper.isNotEmptyString(fwcs)){
			fwcs = fwcs.trim();
		}
		return fwcs;
	}

	public void setFwcs(String fwcs)
	{
		this.fwcs = fwcs;
	}

	public String getZydm()
	{
		if(ValidateHelper.isNotEmptyString(zydm)){
			zydm = zydm.trim();
		}
		return zydm;
	}

	public void setZydm(String zydm)
	{
		this.zydm = zydm;
	}

	public String getZw()
	{
		if(ValidateHelper.isNotEmptyString(zw)){
			zw = zw.trim();
		}
		return zw;
	}

	public void setZw(String zw)
	{
		this.zw = zw;
	}

	public String getSf()
	{
		if(ValidateHelper.isNotEmptyString(sf)){
			sf = sf.trim();
		}
		return sf;
	}

	public void setSf(String sf)
	{
		this.sf = sf;
	}

	public String getJg()
	{
		if(ValidateHelper.isNotEmptyString(jg)){
			jg = jg.trim();
		}
		return jg;
	}

	public void setJg(String jg)
	{
		this.jg = jg;
	}

	public String getHjdqh()
	{
		if(ValidateHelper.isNotEmptyString(hjdqh)){
			hjdqh = hjdqh.trim();
		}
		return hjdqh;
	}

	public void setHjdqh(String hjdqh)
	{
		this.hjdqh = hjdqh;
	}

	public String getHjdxz()
	{
		if(ValidateHelper.isNotEmptyString(hjdxz)){
			hjdxz = hjdxz.trim();
		}
		return hjdxz;
	}

	public void setHjdxz(String hjdxz)
	{
		this.hjdxz = hjdxz;
	}

	public String getRylb()
	{
		if(ValidateHelper.isNotEmptyString(rylb)){
			rylb = rylb.trim();
		}
		return rylb;
	}

	public void setRylb(String rylb)
	{
		this.rylb = rylb;
	}

	public List<RkzpxxBean> getRkzpxxList()
	{
		return rkzpxxList;
	}

	public void setRkzpxxList(List<RkzpxxBean> rkzpxxList)
	{
		this.rkzpxxList = rkzpxxList;
	}

	public String getZjzlms()
	{
		zjzlms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", zjzl);
		return zjzlms;
	}

	public void setZjzlms(String zjzlms)
	{
		this.zjzlms = zjzlms;
	}

	public String getXbms()
	{
		xbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		return xbms;
	}

	public void setXbms(String xbms)
	{
		this.xbms = xbms;
	}

	public String getHjdqhmc()
	{
		hjdqhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", hjdqh);
		return hjdqhmc;
	}

	public void setHjdqhmc(String hjdqhmc)
	{
		this.hjdqhmc = hjdqhmc;
	}

	public String getRysx()
	{
		if(ValidateHelper.isNotEmptyString(rysx)){
			rysx = rysx.trim();
		}
		return rysx;
	}

	public void setRysx(String rysx)
	{
		this.rysx = rysx;
	}

	public String getRysxms()
	{
		rysxms = CommonSequenceHelper.getRysxms(rysx);
		return rysxms;
	}

	public void setRysxms(String rysxms)
	{
		this.rysxms = rysxms;
	}

	public String getRylbms()
	{
		rylbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_RYLB", rylb);
		return rylbms;
	}

	public void setRylbms(String rylbms)
	{
		this.rylbms = rylbms;
	}

	public String getMzms()
	{
		mzms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_MZ", mz);
		return mzms;
	}

	public void setMzms(String mzms)
	{
		this.mzms = mzms;
	}

	public String getHyzkms()
	{
		hyzkms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_HYZK", hyzk);
		return hyzkms;
	}

	public void setHyzkms(String hyzkms)
	{
		this.hyzkms = hyzkms;
	}

	public String getGjms()
	{
		gjms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_GJ", gj);
		return gjms;
	}

	public void setGjms(String gjms)
	{
		this.gjms = gjms;
	}
	
	public String getRkid()
	{
		if(ValidateHelper.isNotEmptyString(rkid)){
			rkid = rkid.trim();
		}
		return rkid;
	}

	public void setRkid(String rkid)
	{
		this.rkid = rkid;
	}

	public String getZrdwdm()
	{
		if(ValidateHelper.isNotEmptyString(zrdwdm)){
			zrdwdm = zrdwdm.trim();
		}
		return zrdwdm;
	}

	public void setZrdwdm(String zrdwdm)
	{
		this.zrdwdm = zrdwdm;
	}

	public String getCzdwdm()
	{
		if(ValidateHelper.isNotEmptyString(czdwdm)){
			czdwdm = czdwdm.trim();
		}
		return czdwdm;
	}

	public void setCzdwdm(String czdwdm)
	{
		this.czdwdm = czdwdm;
	}

	public String getDjdwdm()
	{
		if(ValidateHelper.isNotEmptyString(djdwdm)){
			djdwdm = djdwdm.trim();
		}
		return djdwdm;
	}

	public void setDjdwdm(String djdwdm)
	{
		this.djdwdm = djdwdm;
	}
	
	public String getSspcsdm()
	{
		if(ValidateHelper.isNotEmptyString(sspcsdm)){
			sspcsdm = sspcsdm.trim();
		}
		return sspcsdm;
	}

	public void setSspcsdm(String sspcsdm)
	{
		this.sspcsdm = sspcsdm;
	}

	public String getSspcsmc()
	{
		if(ValidateHelper.isNotEmptyString(sspcsmc)){
			sspcsmc = sspcsmc.trim();
		}
		return sspcsmc;
	}

	public void setSspcsmc(String sspcsmc)
	{
		this.sspcsmc = sspcsmc;
	}

	public String getZddwmc()
	{
		if(ValidateHelper.isNotEmptyString(zddwmc)){
			zddwmc = zddwmc.trim();
		}
		return zddwmc;
	}

	public void setZddwmc(String zddwmc)
	{
		this.zddwmc = zddwmc;
	}

	public String getSsgajgjgdm()
	{
		if(ValidateHelper.isNotEmptyString(ssgajgjgdm)){
			ssgajgjgdm = ssgajgjgdm.trim();
		}
		return ssgajgjgdm;
	}

	public void setSsgajgjgdm(String ssgajgjgdm)
	{
		this.ssgajgjgdm = ssgajgjgdm;
	}

	public String getSsgajgjgmc()
	{
		if(ValidateHelper.isNotEmptyString(ssgajgjgmc)){
			ssgajgjgmc = ssgajgjgmc.trim();
		}
		return ssgajgjgmc;
	}

	public void setSsgajgjgmc(String ssgajgjgmc)
	{
		this.ssgajgjgmc = ssgajgjgmc;
	}

	
	public String getSwrq()
	{
		if(ValidateHelper.isNotEmptyString(swrq)){
			swrq = swrq.trim();
		}
		return swrq;
	}

	public void setSwrq(String swrq)
	{
		this.swrq = swrq;
	}

	public String getSwzmbh()
	{
		if(ValidateHelper.isNotEmptyString(swzmbh)){
			swzmbh = swzmbh.trim();
		}
		return swzmbh;
	}

	public void setSwzmbh(String swzmbh)
	{
		this.swzmbh = swzmbh;
	}

	public String getZwbh()
	{
		if(ValidateHelper.isNotEmptyString(zwbh)){
			zwbh = zwbh.trim();
		}
		return zwbh;
	}

	public void setZwbh(String zwbh)
	{
		this.zwbh = zwbh;
	}

	public String getDnabh()
	{
		if(ValidateHelper.isNotEmptyString(dnabh)){
			dnabh = dnabh.trim();
		}
		return dnabh;
	}

	public void setDnabh(String dnabh)
	{
		this.dnabh = dnabh;
	}

	public String getXxjb()
	{
		if(ValidateHelper.isNotEmptyString(dnabh)){
			dnabh = dnabh.trim();
		}
		return xxjb;
	}

	public void setXxjb(String xxjb)
	{
		this.xxjb = xxjb;
	}

	public String getCzsj()
	{
		if(ValidateHelper.isNotEmptyString(czsj)){
			czsj = czsj.trim();
		}
		return czsj;
	}

	public void setCzsj(String czsj)
	{
		this.czsj = czsj;
	}

	public String getCzdwmc()
	{
		if(ValidateHelper.isNotEmptyString(czdwmc)){
			czdwmc = czdwmc.trim();
		}
		return czdwmc;
	}

	public void setCzdwmc(String czdwmc)
	{
		this.czdwmc = czdwmc;
	}

	public String getCzrjh()
	{
		if(ValidateHelper.isNotEmptyString(czrjh)){
			czrjh = czrjh.trim();
		}
		return czrjh;
	}

	public void setCzrjh(String czrjh)
	{
		this.czrjh = czrjh;
	}

	public String getCzrxm()
	{
		if(ValidateHelper.isNotEmptyString(czrxm)){
			czrxm = czrxm.trim();
		}
		return czrxm;
	}

	public void setCzrxm(String czrxm)
	{
		this.czrxm = czrxm;
	}

	public String getCzbs()
	{
		if(ValidateHelper.isNotEmptyString(czbs)){
			czbs = czbs.trim();
		}
		return czbs;
	}

	public void setCzbs(String czbs)
	{
		this.czbs = czbs;
	}

	public String getXzzqh()
	{
		if(ValidateHelper.isNotEmptyString(xzzqh)){
			xzzqh = xzzqh.trim();
		}
		return xzzqh;
	}

	public void setXzzqh(String xzzqh)
	{
		this.xzzqh = xzzqh;
	}

	public String getXzzqhmc()
	{
		if(ValidateHelper.isNotEmptyString(xzzqhmc)){
			xzzqhmc = xzzqhmc.trim();
		}
		return xzzqhmc;
	}

	public void setXzzqhmc(String xzzqhmc)
	{
		this.xzzqhmc = xzzqhmc;
	}

	public String getXzzxz()
	{
		if(ValidateHelper.isNotEmptyString(xzzxz)){
			xzzxz = xzzxz.trim();
		}
		return xzzxz;
	}

	public void setXzzxz(String xzzxz)
	{
		this.xzzxz = xzzxz;
	}

	public String getXzzzrq()
	{
		if(ValidateHelper.isNotEmptyString(xzzzrq)){
			xzzzrq = xzzzrq.trim();
		}
		return xzzzrq;
	}

	public void setXzzzrq(String xzzzrq)
	{
		this.xzzzrq = xzzzrq;
	}

	public String getXzzzrqmc()
	{
		if(ValidateHelper.isNotEmptyString(xzzzrqmc)){
			xzzzrqmc = xzzzrqmc.trim();
		}
		return xzzzrqmc;
	}

	public void setXzzzrqmc(String xzzzrqmc)
	{
		this.xzzzrqmc = xzzzrqmc;
	}

	public String getCz()
	{		
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"openSyrkInfoPage('rydaxx','" + rybh + "','" + rylb + "')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		if (ValidateHelper.isNotEmptyString(sfzh))
		{
			sb.append("<span onclick=\"openNewRkFwSelectWin(true,'" + sfzh +"','')\" style=\"color:green\" class=\"cps_span_href\">登记</span>&nbsp;");
		}
		//sb.append("<span onclick=\"openSyrkInfoPage('detail','" + rybh + "','" + rylb + "')\" style=\"color:green\" class=\"cps_span_href\">原详情</span>&nbsp;");
		cz = sb.toString();
		return cz;
	}

	
	
	public void setCz(String cz)
	{
		this.cz = cz;
	}
	
	public String getWhcdms() {
		whcdms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_WHCD", whcd);
		return whcdms;
	}

	public void setWhcdms(String whcdms) {
		this.whcdms = whcdms;
	}

	public String getZzmmms() {
		zzmmms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZZMM", zzmm);
		return zzmmms;
	}

	public void setZzmmms(String zzmmms) {
		this.zzmmms = zzmmms;
	}


	public String getByzkms() {
		byzkms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_BYZK", byzk);
		return byzkms;
	}

	public void setByzkms(String byzkms) {
		this.byzkms = byzkms;
	}

	public String getXxms() {
		xxms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XX", xx);
		return xxms;
	}

	public void setXxms(String xxms) {
		this.xxms = xxms;
	}

	public String getZzxyms() {
		zzxyms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZJXY", zzxy);
		return zzxyms;
	}

	public void setZzxyms(String zzxyms) {
		this.zzxyms = zzxyms;
	}

	public String getSfms() {
		sfms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GA_SF", sf);
		return sfms;
	}

	public void setSfms(String sfms) {
		this.sfms = sfms;
	}

	public String getRytssx() {
		return rytssx; 
	}

	public void setRytssx(String rytssx) {
		this.rytssx = rytssx;
	}

	public String[] getRytssxs() {
		if(rytssx!=null){
			rytssxs=rytssx.split(",");
		}
		return rytssxs;
	}

	public void setRytssxs(String[] rytssxs) {
		
		StringBuffer sb = new StringBuffer();
		if (ValidateHelper.isNotEmptyArray(rytssxs))
		{
			for (String zw : rytssxs)
			{
				sb.append(zw + ",");
			}
		}
		if (sb.toString().endsWith(","))
		{
			rytssx = sb.toString().substring(0, sb.toString().length() - 1);
		}
		this.rytssxs = rytssxs;
	}

	public String getLxdhbz() {
		return lxdhbz;
	}

	public void setLxdhbz(String lxdhbz) {
		this.lxdhbz = lxdhbz;
	}

	public List<SystemDictionaryBean> getRytssxList() {
		rytssxList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_RYTSSX");
		return rytssxList;
	}

	public void setRytssxList(List<SystemDictionaryBean> rytssxList) {
		this.rytssxList = rytssxList;
	}

	public String getXzzqhms()
	{
		xzzqhms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", xzzqh);
		return xzzqhms;
	}

	public void setXzzqhms(String xzzqhms)
	{
		this.xzzqhms = xzzqhms;
	}

	public String getXzzzrqms()
	{
		xzzzrqms = DictionaryCacheHellper.getOrganizationOrgNameByCode(xzzzrq);
		return xzzzrqms;
	}

	public void setXzzzrqms(String xzzzrqms)
	{
		this.xzzzrqms = xzzzrqms;
	}

	public String getZyms()
	{
		zyms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_RY_ZY", zydm);
		return zyms;
	}

	public void setZyms(String zyms)
	{
		this.zyms = zyms;
	}

	public String getZxbs() {
		return zxbs;
	}

	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}

	public String getZxbsms() {
		zxbsms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZXBS", zxbs);
		if(zxbs == null){
			zxbsms="正常";
		}
		return zxbsms;
	}

	public void setZxbsms(String zxbsms) {
		this.zxbsms = zxbsms;
	}

	public String getCsd()
	{
		return csd;
	}

	public void setCsd(String csd)
	{
		this.csd = csd;
	}

	public String getCsdms()
	{
		csdms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", csd);
		return csdms;
	}

	public void setCsdms(String csdms)
	{
		this.csdms = csdms;
	}

	public String getSyrkdjcz()
	{
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"openSyrkInfoPage('rydaxx','" + rybh + "','" + rylb + "')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		syrkdjcz = sb.toString();
		return syrkdjcz;
	}

	public void setSyrkdjcz(String syrkdjcz)
	{
		this.syrkdjcz = syrkdjcz;
	}

	public String getCzrsfzh()
	{
		return czrsfzh;
	}

	public void setCzrsfzh(String czrsfzh)
	{
		this.czrsfzh = czrsfzh;
	}

//	public String getZpid() {
//		return zpid;
//	}
//
//	public void setZpid(String zpid) {
//		this.zpid = zpid;
//	}
	
	
}
