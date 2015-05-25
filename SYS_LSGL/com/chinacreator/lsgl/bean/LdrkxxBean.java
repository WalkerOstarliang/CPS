package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 流动人口信息对象
 * 
 * @filename LdrkxxBean.java
 * @author mingchun.xiong
 * @date 2013-8-19
 *
 */
public class LdrkxxBean extends RkJbxxBean
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -8317175469144706546L;
	
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
	private String ywm;
	private String whcd;
	private String zjzl;
	private String zjzlms;
	private String zjhm;
	private String zzmm;
	private String hyzk;
	private String hyzkms;
	private String sg;
	private String xx;
	private String zzxy;
	private String zc;
	private String lxdh;
	private String fwcs;
	private String zydm;
	private String zw;
	private String sf;
	private String jg;
	private String hjdqh;
	private String hjdqhmc;
	private String hjdxz;
	private String rysx;
	private String rysxms;
	private String rylb;
	private String rylbms;
	
	private String dzmc;
	
	private String zzbh;
	private String zzzbh;
	private String hh;
	private String fzsfzh;
	private String fzxm;
	private String yhzgx;
	private String lbdrq;
	private String zzzqfrq;
	private String zzzyxqjzrq;
	private String xfwcs;
	private String zzsy;
	private String zzsyms;
	private String zzdqh;
	private String zzdqhms;
	private String zzdxz;
	private String czbs;
	private String czdwdm;
	private String czdwmc;
	private String czsj;
	private String czrxm;
	private String djdwdm;
	private String djdwmc;
	private String djrxm;
	private String djsj;
	private String zrdwdm;
	private String zrdwmc;
	private String zrmjxm;
	private String zrmjjh;
	private String zrmjlxdh;
	private String xcszy;
	private String ssgajgjgdm;
	private String ssgajgjgmc;
	private String sspcsdm;
	private String sspcsmc;
	private String zzcs;
	private String zzcsms;
	private String zxbs;
	private String zxbsms;
	private String zxsj;
	private String zxyy;
	private String fwid;
	private String dzid;
	private String fwmc;
	private String sfczw;
	private String zaglzrrxm;
	private String zaglzrrsfzh;
	private String gzgx;
	private String fhbh;
	private String hdqk;
	private String bz;
	private String njzqx;
	private String njzqxms;
	private String njzrq;
	private String hjdlx;
	private String rkfwglid;
	
	private String swrq;
	private String swzmbh;
	private String zwbh;
	private String dnabh;
	private String xxjb;
	private String czrjh;
	private String xzzqh;
	private String xzzqhmc;
	private String xzzxz;
	private String xzzzrq;
	private String xzzzrqmc;
	private String hjdsssqbh;
	private String hjdsssqmc;
	
	private String sssqbh;
	private String sssqmc;
	
	private String sfzhbx; //是否综合保险
	private String sfjkzm; //是否有健康证明
	private String bmzw;   //部门职务
	private String sfjhsy; //是否计划生育
	private String ldrklb; //流动人口类型
	private String cz;
	
	private String djrsfzh;
	private String czrsfzh;
	
	private String jzzdyzt;
	private String jzzdyztms;
	
	/**
	 * 流动人口注销页面去向
	 */
	private String qx;
	/**
	 * 数据核查  办理期限
	 */
	private String blqx;
	public String getZzbh()
	{
		return zzbh;
	}
	public void setZzbh(String zzbh)
	{
		this.zzbh = zzbh;
	}
	public String getRybh()
	{
		return rybh;
	}
	public void setRybh(String rybh)
	{
		this.rybh = rybh;
	}
	public String getSfzh()
	{
		return sfzh;
	}
	public void setSfzh(String sfzh)
	{
		this.sfzh = sfzh;
	}
	public String getZzzbh()
	{
		return zzzbh;
	}
	public void setZzzbh(String zzzbh)
	{
		this.zzzbh = zzzbh;
	}
	public String getHh()
	{
		return hh;
	}
	public void setHh(String hh)
	{
		this.hh = hh;
	}
	public String getFzsfzh()
	{
		return fzsfzh;
	}
	public void setFzsfzh(String fzsfzh)
	{
		this.fzsfzh = fzsfzh;
	}
	public String getFzxm()
	{
		return fzxm;
	}
	public void setFzxm(String fzxm)
	{
		this.fzxm = fzxm;
	}
	public String getYhzgx()
	{
		return yhzgx;
	}
	public void setYhzgx(String yhzgx)
	{
		this.yhzgx = yhzgx;
	}
	public String getLbdrq()
	{
		return lbdrq;
	}
	public void setLbdrq(String lbdrq)
	{
		this.lbdrq = lbdrq;
	}
	public String getZzzqfrq()
	{
		return zzzqfrq;
	}
	public void setZzzqfrq(String zzzqfrq)
	{
		this.zzzqfrq = zzzqfrq;
	}
	public String getZzzyxqjzrq()
	{
		return zzzyxqjzrq;
	}
	public void setZzzyxqjzrq(String zzzyxqjzrq)
	{
		this.zzzyxqjzrq = zzzyxqjzrq;
	}
	public String getXfwcs()
	{
		return xfwcs;
	}
	public void setXfwcs(String xfwcs)
	{
		this.xfwcs = xfwcs;
	}
	public String getZzsy()
	{
		return zzsy;
	}
	public void setZzsy(String zzsy)
	{
		this.zzsy = zzsy;
	}
	public String getZzdqh()
	{
		return zzdqh;
	}
	public void setZzdqh(String zzdqh)
	{
		this.zzdqh = zzdqh;
	}
	public String getZzdxz()
	{
		return zzdxz;
	}
	public void setZzdxz(String zzdxz)
	{
		this.zzdxz = zzdxz;
	}
	 
	public String getCzbs()
	{
		return czbs;
	}
	public void setCzbs(String czbs)
	{
		this.czbs = czbs;
	}
	public String getCzdwdm()
	{
		return czdwdm;
	}
	public void setCzdwdm(String czdwdm)
	{
		this.czdwdm = czdwdm;
	}
	public String getCzdwmc()
	{
		return czdwmc;
	}
	public void setCzdwmc(String czdwmc)
	{
		this.czdwmc = czdwmc;
	}
	public String getCzsj()
	{
		return czsj;
	}
	public void setCzsj(String czsj)
	{
		this.czsj = czsj;
	}
	public String getCzrxm()
	{
		return czrxm;
	}
	public void setCzrxm(String czrxm)
	{
		this.czrxm = czrxm;
	}
	public String getDjdwdm()
	{
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm)
	{
		this.djdwdm = djdwdm;
	}
	public String getDjdwmc()
	{
		return djdwmc;
	}
	public void setDjdwmc(String djdwmc)
	{
		this.djdwmc = djdwmc;
	}
	public String getDjrxm()
	{
		return djrxm;
	}
	public void setDjrxm(String djrxm)
	{
		this.djrxm = djrxm;
	}
	public String getDjsj()
	{
		return djsj;
	}
	public void setDjsj(String djsj)
	{
		this.djsj = djsj;
	}
	public String getZrdwdm()
	{
		return zrdwdm;
	}
	public void setZrdwdm(String zrdwdm)
	{
		this.zrdwdm = zrdwdm;
	}
	public String getZrdwmc()
	{
		return zrdwmc;
	}
	public void setZrdwmc(String zrdwmc)
	{
		this.zrdwmc = zrdwmc;
	}
	public String getZrmjxm()
	{
		return zrmjxm;
	}
	public void setZrmjxm(String zrmjxm)
	{
		this.zrmjxm = zrmjxm;
	}
	public String getZrmjjh()
	{
		return zrmjjh;
	}
	public void setZrmjjh(String zrmjjh)
	{
		this.zrmjjh = zrmjjh;
	}
	public String getZrmjlxdh()
	{
		return zrmjlxdh;
	}
	public void setZrmjlxdh(String zrmjlxdh)
	{
		this.zrmjlxdh = zrmjlxdh;
	}
	public String getXcszy()
	{
		return xcszy;
	}
	public void setXcszy(String xcszy)
	{
		this.xcszy = xcszy;
	}
	public String getSsgajgjgdm()
	{
		return ssgajgjgdm;
	}
	public void setSsgajgjgdm(String ssgajgjgdm)
	{
		this.ssgajgjgdm = ssgajgjgdm;
	}
	public String getSsgajgjgmc()
	{
		return ssgajgjgmc;
	}
	public void setSsgajgjgmc(String ssgajgjgmc)
	{
		this.ssgajgjgmc = ssgajgjgmc;
	}
	public String getSspcsdm()
	{
		return sspcsdm;
	}
	public void setSspcsdm(String sspcsdm)
	{
		this.sspcsdm = sspcsdm;
	}
	public String getSspcsmc()
	{
		return sspcsmc;
	}
	public void setSspcsmc(String sspcsmc)
	{
		this.sspcsmc = sspcsmc;
	}
	public String getZzdqhms()
	{
		zzdqhms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", zzdqh);
		return zzdqhms;
	}
	public void setZzdqhms(String zzdqhms)
	{
		this.zzdqhms = zzdqhms;
	}
	public String getZxsj()
	{
		return zxsj;
	}
	public void setZxsj(String zxsj)
	{
		this.zxsj = zxsj;
	}
	public String getZxbs()
	{
		return zxbs;
	}
	public void setZxbs(String zxbs)
	{
		this.zxbs = zxbs;
	}
	public String getZxyy()
	{
		return zxyy;
	}
	public void setZxyy(String zxyy)
	{
		this.zxyy = zxyy;
	}
	public String getFwid()
	{
		return fwid;
	}
	public void setFwid(String fwid)
	{
		this.fwid = fwid;
	}
	public String getDzid()
	{
		return dzid;
	}
	public void setDzid(String dzid)
	{
		this.dzid = dzid;
	}
	public String getFwmc()
	{
		return fwmc;
	}
	public void setFwmc(String fwmc)
	{
		this.fwmc = fwmc;
	}
	public String getZzcs()
	{
		return zzcs;
	}
	public void setZzcs(String zzcs)
	{
		this.zzcs = zzcs;
	}
	
	public String getZzcsms()
	{
		zzcsms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GA_ZZCS", zzcs);
		return zzcsms;
	}
	public void setZzcsms(String zzcsms)
	{
		this.zzcsms = zzcsms;
	}
	
	public String getZaglzrrxm()
	{
		return zaglzrrxm;
	}
	public void setZaglzrrxm(String zaglzrrxm)
	{
		this.zaglzrrxm = zaglzrrxm;
	}
	public String getZaglzrrsfzh()
	{
		return zaglzrrsfzh;
	}
	public void setZaglzrrsfzh(String zaglzrrsfzh)
	{
		this.zaglzrrsfzh = zaglzrrsfzh;
	}
	public String getGzgx()
	{
		return gzgx;
	}
	public void setGzgx(String gzgx)
	{
		this.gzgx = gzgx;
	}
	public String getFhbh()
	{
		return fhbh;
	}
	public void setFhbh(String fhbh)
	{
		this.fhbh = fhbh;
	}
	
	public String getHdqk()
	{
		return hdqk;
	}
	public void setHdqk(String hdqk)
	{
		this.hdqk = hdqk;
	}
	public String getBz()
	{
		return bz;
	}
	public void setBz(String bz)
	{
		this.bz = bz;
	}
	public String getNjzqx()
	{
		return njzqx;
	}
	public void setNjzqx(String njzqx)
	{
		this.njzqx = njzqx;
	}
	public String getHjdlx()
	{
		return hjdlx;
	}
	public void setHjdlx(String hjdlx)
	{
		this.hjdlx = hjdlx;
	}
	
	public String getRkfwglid()
	{
		return rkfwglid;
	}
	public void setRkfwglid(String rkfwglid)
	{
		this.rkfwglid = rkfwglid;
	}
	
	public String getXm()
	{
		return xm;
	}
	public void setXm(String xm)
	{
		this.xm = xm;
	}
	public String getXmpy()
	{
		return xmpy;
	}
	public void setXmpy(String xmpy)
	{
		this.xmpy = xmpy;
	}
	public String getXb()
	{
		return xb;
	}
	public void setXb(String xb)
	{
		this.xb = xb;
	}
	 
	public String getGj()
	{
		return gj;
	}
	public void setGj(String gj)
	{
		this.gj = gj;
	}
	 
	public String getMz()
	{
		return mz;
	}
	public void setMz(String mz)
	{
		this.mz = mz;
	}
	 
	public String getCsrq()
	{
		return csrq;
	}
	public void setCsrq(String csrq)
	{
		this.csrq = csrq;
	}
	public String getBmch()
	{
		return bmch;
	}
	public void setBmch(String bmch)
	{
		this.bmch = bmch;
	}
	public String getByzk()
	{
		return byzk;
	}
	public void setByzk(String byzk)
	{
		this.byzk = byzk;
	}
	public String getYwm()
	{
		return ywm;
	}
	public void setYwm(String ywm)
	{
		this.ywm = ywm;
	}
	public String getWhcd()
	{
		return whcd;
	}
	public void setWhcd(String whcd)
	{
		this.whcd = whcd;
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
		return zjhm;
	}
	public void setZjhm(String zjhm)
	{
		this.zjhm = zjhm;
	}
	public String getZzmm()
	{
		return zzmm;
	}
	public void setZzmm(String zzmm)
	{
		this.zzmm = zzmm;
	}
	public String getHyzk()
	{
		return hyzk;
	}
	public void setHyzk(String hyzk)
	{
		this.hyzk = hyzk;
	}
	 
	public String getSg()
	{
		return sg;
	}
	public void setSg(String sg)
	{
		this.sg = sg;
	}
	public String getXx()
	{
		return xx;
	}
	public void setXx(String xx)
	{
		this.xx = xx;
	}
	public String getZzxy()
	{
		return zzxy;
	}
	public void setZzxy(String zzxy)
	{
		this.zzxy = zzxy;
	}
	public String getZc()
	{
		return zc;
	}
	public void setZc(String zc)
	{
		this.zc = zc;
	}
	public String getLxdh()
	{
		return lxdh;
	}
	public void setLxdh(String lxdh)
	{
		this.lxdh = lxdh;
	}
	public String getFwcs()
	{
		return fwcs;
	}
	public void setFwcs(String fwcs)
	{
		this.fwcs = fwcs;
	}
	public String getZydm()
	{
		return zydm;
	}
	public void setZydm(String zydm)
	{
		this.zydm = zydm;
	}
	public String getZw()
	{
		return zw;
	}
	public void setZw(String zw)
	{
		this.zw = zw;
	}
	public String getSf()
	{
		return sf;
	}
	public void setSf(String sf)
	{
		this.sf = sf;
	}
	public String getJg()
	{
		return jg;
	}
	public void setJg(String jg)
	{
		this.jg = jg;
	}
	public String getHjdqh()
	{
		return hjdqh;
	}
	public void setHjdqh(String hjdqh)
	{
		this.hjdqh = hjdqh;
	}
	 
	public String getHjdxz()
	{
		return hjdxz;
	}
	public void setHjdxz(String hjdxz)
	{
		this.hjdxz = hjdxz;
	}
	 
	 
	public String getRylb()
	{
		return rylb;
	}
	public void setRylb(String rylb)
	{
		this.rylb = rylb;
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

	public String getSwrq()
	{
		return swrq;
	}
	public void setSwrq(String swrq)
	{
		this.swrq = swrq;
	}
	public String getSwzmbh()
	{
		return swzmbh;
	}
	public void setSwzmbh(String swzmbh)
	{
		this.swzmbh = swzmbh;
	}
	public String getZwbh()
	{
		return zwbh;
	}
	public void setZwbh(String zwbh)
	{
		this.zwbh = zwbh;
	}
	public String getDnabh()
	{
		return dnabh;
	}
	public void setDnabh(String dnabh)
	{
		this.dnabh = dnabh;
	}
	public String getXxjb()
	{
		return xxjb;
	}
	public void setXxjb(String xxjb)
	{
		this.xxjb = xxjb;
	}
	public String getCzrjh()
	{
		return czrjh;
	}
	public void setCzrjh(String czrjh)
	{
		this.czrjh = czrjh;
	}
	public String getXzzqh()
	{
		return xzzqh;
	}
	public void setXzzqh(String xzzqh)
	{
		this.xzzqh = xzzqh;
	}
	public String getXzzqhmc()
	{
		xzzqhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", xzzqh);
		return xzzqhmc;
	}
	public void setXzzqhmc(String xzzqhmc)
	{
		this.xzzqhmc = xzzqhmc;
	}
	public String getXzzxz()
	{
		if("1".equals(zxbs)){
			xzzxz = "";
		}
		return xzzxz;
	}
	public void setXzzxz(String xzzxz)
	{
		this.xzzxz = xzzxz;
	}
	public String getXzzzrq()
	{
		return xzzzrq;
	}
	public void setXzzzrq(String xzzzrq)
	{
		this.xzzzrq = xzzzrq;
	}
	public String getXzzzrqmc()
	{
		return xzzzrqmc;
	}
	public void setXzzzrqmc(String xzzzrqmc)
	{
		this.xzzzrqmc = xzzzrqmc;
	}
	public String getHjdsssqbh()
	{
		return hjdsssqbh;
	}
	public void setHjdsssqbh(String hjdsssqbh)
	{
		this.hjdsssqbh = hjdsssqbh;
	}
	public String getHjdsssqmc()
	{
		return hjdsssqmc;
	}
	public void setHjdsssqmc(String hjdsssqmc)
	{
		this.hjdsssqmc = hjdsssqmc;
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
		hyzkms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_HYZK", hyzk);
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
	
	public String getDzmc()
	{
		return dzmc;
	}
	public void setDzmc(String dzmc)
	{
		this.dzmc = dzmc;
	}
	
	public String getNjzqxms()
	{
		njzqxms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_NJZQX", njzqx);
		return njzqxms;
	}
	public void setNjzqxms(String njzqxms)
	{
		this.njzqxms = njzqxms;
	}
	public String getZzsyms()
	{
		zzsyms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZZSY", zzsy);
		return zzsyms;
	}
	public void setZzsyms(String zzsyms)
	{
		this.zzsyms = zzsyms;
	}
	
	
	public String getCz()
	{
		StringBuffer sb = new StringBuffer();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		sb.append("<span onclick=\"openRkInfoDetail('rydaxx','" + zzbh +"','" + getRybh() + "','2')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		if (loginInfo != null && ((loginInfo.getOrgcode().equals(djdwdm) 
				|| loginInfo.getOrgcode().equals(czdwdm)
				|| loginInfo.getOrgcode().equals(zrdwdm)
				)))
		{
			if("0".equals(zxbs) || zxbs ==null){
				sb.append("<span onclick=\"openRkInfo('update','" + zzbh +"','" + getRybh() + "','2','" + rkfwglid +"')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
				sb.append("<span onclick=\"batchLogoutRkInfo('logout','" + sfzh + "','" + rylb + "','"+zzbh+"')\" style=\"color:green\" class=\"cps_span_href\">注销</span>&nbsp;");
			}else{	
				sb.append("<span onclick=\"recovery('" + zzbh + "','"+rylb+"')\" style=\"color:green\" class=\"cps_span_href\">恢复</span>&nbsp;");
			}
//			sb.append("<span onclick=\"batchDeleteRkInfo('delete','" + zzbh + "','"+ rylb +"')\" style=\"color:green\" class=\"cps_span_href\">删除</span>");
		}
//		else if (zrdwdm != null && loginInfo.getLeve() == 2 && loginInfo.getOrgcode().startsWith(zrdwdm.substring(0, 4)))
//		{
//			sb.append("<span onclick=\"openRkInfo('update','" + zzbh +"','" + getRybh() + "','2')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
//		}
//		else if (zrdwdm != null && loginInfo.getLeve() == 3 && loginInfo.getOrgcode().startsWith(zrdwdm.substring(0, 6)))
//		{
//			sb.append("<span onclick=\"openRkInfo('update','" + zzbh +"','" + getRybh() + "','2')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
//		}
		cz = sb.toString();
		return cz;
	}
	public void setCz(String cz)
	{
		this.cz = cz;
	}
	public String getSfczw() {
		return sfczw;
	}
	public void setSfczw(String sfczw) {
		this.sfczw = sfczw;
	}
	public String getSssqbh()
	{
		return sssqbh;
	}
	public void setSssqbh(String sssqbh)
	{
		this.sssqbh = sssqbh;
	}
	public String getSssqmc()
	{
		return sssqmc;
	}
	public void setSssqmc(String sssqmc)
	{
		this.sssqmc = sssqmc;
	}
	public String getNjzrq()
	{
		return njzrq;
	}
	public void setNjzrq(String njzrq)
	{
		this.njzrq = njzrq;
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
	public String getSfzhbx() {
		return sfzhbx;
	}
	public void setSfzhbx(String sfzhbx) {
		this.sfzhbx = sfzhbx;
	}
	public String getSfjkzm() {
		return sfjkzm;
	}
	public void setSfjkzm(String sfjkzm) {
		this.sfjkzm = sfjkzm;
	}
	public String getBmzw() {
		return bmzw;
	}
	public void setBmzw(String bmzw) {
		this.bmzw = bmzw;
	}
	public String getSfjhsy() {
		return sfjhsy;
	}
	public void setSfjhsy(String sfjhsy) {
		this.sfjhsy = sfjhsy;
	}
	public String getLdrklb() {
		return ldrklb;
	}
	public void setLdrklb(String ldrklb) {
		this.ldrklb = ldrklb;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getCzrsfzh() {
		return czrsfzh;
	}
	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
	}
	public String getBlqx() {
		return blqx;
	}
	public void setBlqx(String blqx) {
		this.blqx = blqx;
	}
	public String getJzzdyzt()
	{
		return jzzdyzt;
	}
	public void setJzzdyzt(String jzzdyzt)
	{
		this.jzzdyzt = jzzdyzt;
	}
	public String getJzzdyztms()
	{
		if ("10".equals(jzzdyzt))
		{
			jzzdyztms = "<font color=\"red\">未制作</font>";
		}
		else if ("20".equals(jzzdyzt))
		{
			jzzdyztms = "<font color=\"green\">已制证</span>";
		}
		else if ("30".equals(jzzdyzt))
		{
			jzzdyztms = "<font color=\"blue\">注销</font>";
		}
		else
		{
			jzzdyztms = "<font color=\"#00A8EC\">未办理</font>";
		}
		return jzzdyztms;
	}
	public void setJzzdyztms(String jzzdyztms)
	{
		this.jzzdyztms = jzzdyztms;
	}
	public String getQx() {
		return qx;
	}
	public void setQx(String qx) {
		this.qx = qx;
	}
}
