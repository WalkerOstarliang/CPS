package com.chinacreator.zdry.bean;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DateTimeHelper;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO()
 * @date Mar 21, 2013 9:27:39 AM
 */
public class Wffzjl extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2264545091430935372L;

	private String zzfs;
	private String gjxs;
	private String zafw;
	private String stfs;
	private String xwtd;
	private String zagj;
	private String xzfs;
	private String fyfs;
	private String cdfs;
	private String hddq;
	private String tlfs;
	private String rqfs;
	private String gjly;
	private String sytxgjtd;
	private String zadj;
	private String hdfwfx;
	private String zarsxx;
	private String zarssx;
	private String sfwdrza;
	private String sflcza;
	private String afdyxpd;
	private String lcfwfx;
	private String zcyzagcfx;
	private Date zasj;
	private String zadd;
	private String wtxz;
	private String cldw;
	private Date clsj;
	private String whdw;
	private String whrxm;
	private String zatq;
	private String bz;
	private String xzzashj;
	private String djrxm;
	private String djdwdm;
	private String djdwmc;
	private String czrxm;
	private String czdwdm;
	private String czdwmc;
	private String czbs;
	private String id;
	private String sfzh;
	private String ajbh;
	private String ajlb;
	private String xzcs;
	private String xzdx;
	private String xzwp;
	private String zasd;
	private String ybsd;
	private String qrsd;
	private String blxpsd;
	private String qqsd;
	private String qzsd;
	private String fhsd;
	private String wzmjsd;
	private String lyjsjsd;
	private String qtsd;
	private String zatd;
	private String cljg;
	
	private String toChar_zasj;
	private String toChar_clsj;

	public String getToChar_zasj() {
		if(null != zasj){
			toChar_zasj = DateTimeHelper.conver(zasj, "yyyy-MM-dd");
		}
		return toChar_zasj;
	}

	public void setToChar_zasj(String toChar_zasj) {
		this.toChar_zasj = toChar_zasj;
	}

	public String getToChar_clsj() {
		if(null != clsj){
			toChar_clsj = DateTimeHelper.conver(clsj, "yyyy-MM-dd");
		}
		return toChar_clsj;
	}

	public void setToChar_clsj(String toChar_clsj) {
		this.toChar_clsj = toChar_clsj;
	}

	public String getCljg() {
		return cljg;
	}

	public void setCljg(String cljg) {
		this.cljg = cljg;
	}

	public String getZzfs() {
		return zzfs;
	}

	public void setZzfs(String zzfs) {
		this.zzfs = zzfs;
	}

	public String getGjxs() {
		return gjxs;
	}

	public void setGjxs(String gjxs) {
		this.gjxs = gjxs;
	}

	public String getZafw() {
		return zafw;
	}

	public void setZafw(String zafw) {
		this.zafw = zafw;
	}

	public String getStfs() {
		return stfs;
	}

	public void setStfs(String stfs) {
		this.stfs = stfs;
	}

	public String getXwtd() {
		return xwtd;
	}

	public void setXwtd(String xwtd) {
		this.xwtd = xwtd;
	}

	public String getZagj() {
		return zagj;
	}

	public void setZagj(String zagj) {
		this.zagj = zagj;
	}

	public String getXzfs() {
		return xzfs;
	}

	public void setXzfs(String xzfs) {
		this.xzfs = xzfs;
	}

	public String getFyfs() {
		return fyfs;
	}

	public void setFyfs(String fyfs) {
		this.fyfs = fyfs;
	}

	public String getCdfs() {
		return cdfs;
	}

	public void setCdfs(String cdfs) {
		this.cdfs = cdfs;
	}

	public String getHddq() {
		return hddq;
	}

	public void setHddq(String hddq) {
		this.hddq = hddq;
	}

	public String getTlfs() {
		return tlfs;
	}

	public void setTlfs(String tlfs) {
		this.tlfs = tlfs;
	}

	public String getRqfs() {
		return rqfs;
	}

	public void setRqfs(String rqfs) {
		this.rqfs = rqfs;
	}

	public String getGjly() {
		return gjly;
	}

	public void setGjly(String gjly) {
		this.gjly = gjly;
	}

	public String getSytxgjtd() {
		return sytxgjtd;
	}

	public void setSytxgjtd(String sytxgjtd) {
		this.sytxgjtd = sytxgjtd;
	}

	public String getZadj() {
		return zadj;
	}

	public void setZadj(String zadj) {
		this.zadj = zadj;
	}

	public String getHdfwfx() {
		return hdfwfx;
	}

	public void setHdfwfx(String hdfwfx) {
		this.hdfwfx = hdfwfx;
	}

	public String getZarsxx() {
		return zarsxx;
	}

	public void setZarsxx(String zarsxx) {
		this.zarsxx = zarsxx;
	}

	public String getZarssx() {
		return zarssx;
	}

	public void setZarssx(String zarssx) {
		this.zarssx = zarssx;
	}

	public String getSfwdrza() {
		return sfwdrza;
	}

	public void setSfwdrza(String sfwdrza) {
		this.sfwdrza = sfwdrza;
	}

	public String getSflcza() {
		return sflcza;
	}

	public void setSflcza(String sflcza) {
		this.sflcza = sflcza;
	}

	public String getAfdyxpd() {
		return afdyxpd;
	}

	public void setAfdyxpd(String afdyxpd) {
		this.afdyxpd = afdyxpd;
	}

	public String getLcfwfx() {
		return lcfwfx;
	}

	public void setLcfwfx(String lcfwfx) {
		this.lcfwfx = lcfwfx;
	}

	public String getZcyzagcfx() {
		return zcyzagcfx;
	}

	public void setZcyzagcfx(String zcyzagcfx) {
		this.zcyzagcfx = zcyzagcfx;
	}

	public Date getZasj() {
		if(StringUtils.isNotBlank(toChar_zasj)){
			zasj = DateTimeHelper.convertToDate(toChar_zasj, "yyyy-MM-dd");
		}
		return zasj;
	}

	public void setZasj(Date zasj) {
		this.zasj = zasj;
	}

	public String getZadd() {
		return zadd;
	}

	public void setZadd(String zadd) {
		this.zadd = zadd;
	}

	public String getWtxz() {
		return wtxz;
	}

	public void setWtxz(String wtxz) {
		this.wtxz = wtxz;
	}

	public String getCldw() {
		return cldw;
	}

	public void setCldw(String cldw) {
		this.cldw = cldw;
	}

	public Date getClsj() {
		if(StringUtils.isNotBlank(toChar_clsj)){
			clsj = DateTimeHelper.convertToDate(toChar_clsj, "yyyy-MM-dd");
		}
		return clsj;
	}

	public void setClsj(Date clsj) {
		this.clsj = clsj;
	}

	public String getWhdw() {
		return whdw;
	}

	public void setWhdw(String whdw) {
		this.whdw = whdw;
	}

	public String getWhrxm() {
		return whrxm;
	}

	public void setWhrxm(String whrxm) {
		this.whrxm = whrxm;
	}

	public String getZatq() {
		return zatq;
	}

	public void setZatq(String zatq) {
		this.zatq = zatq;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getXzzashj() {
		return xzzashj;
	}

	public void setXzzashj(String xzzashj) {
		this.xzzashj = xzzashj;
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

	public String getCzrxm() {
		return czrxm;
	}

	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}

	public String getCzdwdm() {
		return czdwdm;
	}

	public void setCzdwdm(String czdwdm) {
		this.czdwdm = czdwdm;
	}

	public String getCzdwmc() {
		return czdwmc;
	}

	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}

	public String getCzbs() {
		return czbs;
	}

	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getAjbh() {
		return ajbh;
	}

	public void setAjbh(String ajbh) {
		this.ajbh = ajbh;
	}

	public String getAjlb() {
		return ajlb;
	}

	public void setAjlb(String ajlb) {
		this.ajlb = ajlb;
	}

	public String getXzcs() {
		return xzcs;
	}

	public void setXzcs(String xzcs) {
		this.xzcs = xzcs;
	}

	public String getXzdx() {
		return xzdx;
	}

	public void setXzdx(String xzdx) {
		this.xzdx = xzdx;
	}

	public String getXzwp() {
		return xzwp;
	}

	public void setXzwp(String xzwp) {
		this.xzwp = xzwp;
	}

	public String getZasd() {
		return zasd;
	}

	public void setZasd(String zasd) {
		this.zasd = zasd;
	}

	public String getYbsd() {
		return ybsd;
	}

	public void setYbsd(String ybsd) {
		this.ybsd = ybsd;
	}

	public String getQrsd() {
		return qrsd;
	}

	public void setQrsd(String qrsd) {
		this.qrsd = qrsd;
	}

	public String getBlxpsd() {
		return blxpsd;
	}

	public void setBlxpsd(String blxpsd) {
		this.blxpsd = blxpsd;
	}

	public String getQqsd() {
		return qqsd;
	}

	public void setQqsd(String qqsd) {
		this.qqsd = qqsd;
	}

	public String getQzsd() {
		return qzsd;
	}

	public void setQzsd(String qzsd) {
		this.qzsd = qzsd;
	}

	public String getFhsd() {
		return fhsd;
	}

	public void setFhsd(String fhsd) {
		this.fhsd = fhsd;
	}

	public String getWzmjsd() {
		return wzmjsd;
	}

	public void setWzmjsd(String wzmjsd) {
		this.wzmjsd = wzmjsd;
	}

	public String getLyjsjsd() {
		return lyjsjsd;
	}

	public void setLyjsjsd(String lyjsjsd) {
		this.lyjsjsd = lyjsjsd;
	}

	public String getQtsd() {
		return qtsd;
	}

	public void setQtsd(String qtsd) {
		this.qtsd = qtsd;
	}

	public String getZatd() {
		return zatd;
	}

	public void setZatd(String zatd) {
		this.zatd = zatd;
	}

}
