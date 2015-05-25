package com.chinacreator.zdry.bean;

import java.util.Date;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(重点人员实体类)
 * @date Mar 4, 2013 9:19:33 AM
 */
public class Keypersonnel extends  QueryBean{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String rybh;
	private String rylx;
	private String sfzh;
	private String xm;
	private String bm;
	private String xb;
	private String mz;
	private String zdrylbbj;
	private String zdryxl;
	private String whcd;
	private Date csrq;
	private String zylb;
	private String fwcs;
	private String zw;
	private String qtzjlx;
	private String qtzjhm;
	private String jg;
	private String gj;
	private String hjdxzqh;
	private String hjdxz;
	private String xzdqh;
	private String xzdxz;
	private String zjxy;
	private String zzmh;
	private String hyzk;
	private String jkzk;
	private String byzk;
	private String xx;
	private String lxfs;
	private String sg;
	private String tbtz;
	private String lx;
	private String tx;
	private String ywsb;
	private String sbwz;
	private String ky;
	private String xh;
	private String zc;
	private String gllb;
	private String glfs;
	private String lgly;
	private String xxcjxy;
	private String ajlx;
	private String tc;
	private String zrdwdm;
	private String zrdwmc;
	private String zrrxm;
	private String zrrlxdh;
	private String djsj;
	private String djrxm;
	private String djdwdm;
	private String djdwmc;
	private String sspcsdm;
	private String sspcsmc;
	private String sqjwsdm;
	private String sqjwsmc;
	private String gxsj;
	private String rksj;
	private String isgk;
	private String kcdqsj;
	private String sckcsj;
	private String ms;
	
	private String startDjsj;
	private String endDjsj;
	private String xbmc;
	private String rylxmc;

	public String getRylxmc() {
		rylxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.ZDRY_ZDLB_RYLX, rylx);
		return rylxmc;
	}

	public String getXbmc() {
		xbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.ZDRY_ZDLB_XB, xb);
		return xbmc;
	}

	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}

	public String getRybh() {
		return rybh;
	}

	public void setRybh(String rybh) {
		this.rybh = rybh;
	}

	public String getRylx() {
		return rylx;
	}

	public void setRylx(String rylx) {
		this.rylx = rylx;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getBm() {
		return bm;
	}

	public void setBm(String bm) {
		this.bm = bm;
	}

	public String getXb() {
		return xb;
	}

	public void setXb(String xb) {
		this.xb = xb;
	}

	public String getMz() {
		return mz;
	}

	public void setMz(String mz) {
		this.mz = mz;
	}

	public String getZdrylbbj() {
		return zdrylbbj;
	}

	public void setZdrylbbj(String zdrylbbj) {
		this.zdrylbbj = zdrylbbj;
	}

	public String getZdryxl() {
		return zdryxl;
	}

	public void setZdryxl(String zdryxl) {
		this.zdryxl = zdryxl;
	}

	public String getWhcd() {
		return whcd;
	}

	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}

	public Date getCsrq() {
		return csrq;
	}

	public void setCsrq(Date csrq) {
		this.csrq = csrq;
	}

	public String getZylb() {
		return zylb;
	}

	public void setZylb(String zylb) {
		this.zylb = zylb;
	}

	public String getFwcs() {
		return fwcs;
	}

	public void setFwcs(String fwcs) {
		this.fwcs = fwcs;
	}

	public String getZw() {
		return zw;
	}

	public void setZw(String zw) {
		this.zw = zw;
	}

	public String getQtzjlx() {
		return qtzjlx;
	}

	public void setQtzjlx(String qtzjlx) {
		this.qtzjlx = qtzjlx;
	}

	public String getQtzjhm() {
		return qtzjhm;
	}

	public void setQtzjhm(String qtzjhm) {
		this.qtzjhm = qtzjhm;
	}

	public String getJg() {
		return jg;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	public String getGj() {
		return gj;
	}

	public void setGj(String gj) {
		this.gj = gj;
	}

	public String getHjdxzqh() {
		return hjdxzqh;
	}

	public void setHjdxzqh(String hjdxzqh) {
		this.hjdxzqh = hjdxzqh;
	}

	public String getHjdxz() {
		return hjdxz;
	}

	public void setHjdxz(String hjdxz) {
		this.hjdxz = hjdxz;
	}

	public String getXzdqh() {
		return xzdqh;
	}

	public void setXzdqh(String xzdqh) {
		this.xzdqh = xzdqh;
	}

	public String getXzdxz() {
		return this.toString(xzdxz);
	}

	public void setXzdxz(String xzdxz) {
		this.xzdxz = xzdxz;
	}

	public String getZjxy() {
		return zjxy;
	}

	public void setZjxy(String zjxy) {
		this.zjxy = zjxy;
	}

	public String getZzmh() {
		return zzmh;
	}

	public void setZzmh(String zzmh) {
		this.zzmh = zzmh;
	}

	public String getHyzk() {
		return hyzk;
	}

	public void setHyzk(String hyzk) {
		this.hyzk = hyzk;
	}

	public String getJkzk() {
		return jkzk;
	}

	public void setJkzk(String jkzk) {
		this.jkzk = jkzk;
	}

	public String getByzk() {
		return byzk;
	}

	public void setByzk(String byzk) {
		this.byzk = byzk;
	}

	public String getXx() {
		return xx;
	}

	public void setXx(String xx) {
		this.xx = xx;
	}

	public String getLxfs() {
		return lxfs;
	}

	public void setLxfs(String lxfs) {
		this.lxfs = lxfs;
	}

	public String getSg() {
		return sg;
	}

	public void setSg(String sg) {
		this.sg = sg;
	}

	public String getTbtz() {
		return tbtz;
	}

	public void setTbtz(String tbtz) {
		this.tbtz = tbtz;
	}

	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}

	public String getTx() {
		return tx;
	}

	public void setTx(String tx) {
		this.tx = tx;
	}

	public String getYwsb() {
		return ywsb;
	}

	public void setYwsb(String ywsb) {
		this.ywsb = ywsb;
	}

	public String getSbwz() {
		return sbwz;
	}

	public void setSbwz(String sbwz) {
		this.sbwz = sbwz;
	}

	public String getKy() {
		return ky;
	}

	public void setKy(String ky) {
		this.ky = ky;
	}

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public String getZc() {
		return zc;
	}

	public void setZc(String zc) {
		this.zc = zc;
	}

	public String getGllb() {
		return gllb;
	}

	public void setGllb(String gllb) {
		this.gllb = gllb;
	}

	public String getGlfs() {
		return glfs;
	}

	public void setGlfs(String glfs) {
		this.glfs = glfs;
	}

	public String getLgly() {
		return lgly;
	}

	public void setLgly(String lgly) {
		this.lgly = lgly;
	}

	public String getXxcjxy() {
		return xxcjxy;
	}

	public void setXxcjxy(String xxcjxy) {
		this.xxcjxy = xxcjxy;
	}

	public String getAjlx() {
		return ajlx;
	}

	public void setAjlx(String ajlx) {
		this.ajlx = ajlx;
	}

	public String getTc() {
		return tc;
	}

	public void setTc(String tc) {
		this.tc = tc;
	}

	public String getZrdwdm() {
		return zrdwdm;
	}

	public void setZrdwdm(String zrdwdm) {
		this.zrdwdm = zrdwdm;
	}

	public String getZrdwmc() {
		return zrdwmc;
	}

	public void setZrdwmc(String zrdwmc) {
		this.zrdwmc = zrdwmc;
	}

	public String getZrrxm() {
		return zrrxm;
	}

	public void setZrrxm(String zrrxm) {
		this.zrrxm = zrrxm;
	}

	public String getZrrlxdh() {
		return zrrlxdh;
	}

	public void setZrrlxdh(String zrrlxdh) {
		this.zrrlxdh = zrrlxdh;
	}

	public String getDjsj() {
		return djsj;
	}

	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}

	public String getDjrxm() {
		return djrxm;
	}

	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}

	public String getDjdwdm() {
		return djdwdm;
	}

	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}

	public String getDjdwmc() {
		return djdwmc;
	}

	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}

	public String getSspcsdm() {
		return sspcsdm;
	}

	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}

	public String getSspcsmc() {
		return this.toString(sspcsmc);
	}

	public void setSspcsmc(String sspcsmc) {
		this.sspcsmc = sspcsmc;
	}

	public String getSqjwsdm() {
		return sqjwsdm;
	}

	public void setSqjwsdm(String sqjwsdm) {
		this.sqjwsdm = sqjwsdm;
	}

	public String getSqjwsmc() {
		return sqjwsmc;
	}

	public void setSqjwsmc(String sqjwsmc) {
		this.sqjwsmc = sqjwsmc;
	}

	public String getGxsj() {
		return this.toString(gxsj);
	}

	public void setGxsj(String gxsj) {
		this.gxsj = gxsj;
	}

	public String getRksj() {
		return rksj;
	}

	public void setRksj(String rksj) {
		this.rksj = rksj;
	}

	public String getIsgk() {
		return isgk;
	}

	public void setIsgk(String isgk) {
		this.isgk = isgk;
	}

	public String getStartDjsj() {
		return startDjsj;
	}

	public void setStartDjsj(String startDjsj) {
		this.startDjsj = startDjsj;
	}

	public String getEndDjsj() {
		return endDjsj;
	}

	public void setEndDjsj(String endDjsj) {
		this.endDjsj = endDjsj;
	}
	
	private String toString(String str){
		//str = StringUtils.isBlank(str)?"&nbsp;":str;
		return str;
	}

	public String getKcdqsj() {
		return this.toString(kcdqsj);
	}

	public void setKcdqsj(String kcdqsj) {
		this.kcdqsj = kcdqsj;
	}

	public String getSckcsj() {
		return sckcsj;
	}

	public void setSckcsj(String sckcsj) {
		this.sckcsj = sckcsj;
	}

	public String getMs() {
		return ms;
	}

	public void setMs(String ms) {
		this.ms = ms;
	}
}
