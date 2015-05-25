package com.chinacreator.zdry.bean;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO()
 * @date Mar 20, 2013 1:40:17 PM
 */
public class Xsbx extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5184848970133127001L;
	private String id;
	private String sfzh;
	private String iszyry;
	private String gydd;
	private String badwdm;
	private String badwmc;
	private String gysj;
	private String gyyy;
	private String gydwlxdh;
	private String iscqhjyfzcs;
	private String csmc;
	private String csxz;
	private String iscqyjbg;
	private Date jzqssj;
	private String zzxz;
	private String isygdzy;
	private String dwmc;
	private String dwxz;
	private Integer ysr;
	private String isrcxfmxdysr;
	private String rcxfdysrpdyj;
	private String isgzsjc;
	private String sjcjz;
	private String gcsj;
	private String cph;
	private String isgzfc;
	private Integer fcjz;
	private String gfrq;
	private String fcxz;
	private String isjjjj;
	private String jjjjpdyj;
	private String isdjcsywgdsy;
	private String djtcywgdsypdyj;
	private String jqsfywffzkn;
	private String jqsfywffzknpdyj;
	private String iszyhjsn;
	private Date lkbssj;
	private String qwss;
	private String zkzt;
	private String xsqkms;
	private String hszrmjxm;
	private String hszrmjsfzh;
	private String hszrmjgajgdm;
	private String hszrmjgajgmc;
	private String hssj;
	private String djsj;
	private String djmjxm;
	private String djmjssgajgdm;
	private String djmjssgajgmc;
	private String czrxm;
	private String czdwdm;
	private String czdwmc;
	private String czsj;
	private String czbs;
	private Date jlsj;
	
	private String toChar_jlsj;
	private String toChar_jzqssj;
	private String toChar_lkbssj;
	private String zkztmc;
	
	public String getZkztmc() {
		if(StringUtils.isNotBlank(zkzt)){
			zkztmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.ZDRY_RYKC_ZKZT, zkzt);
		}
		return zkztmc;
	}

	public void setZkztmc(String zkztmc) {
		this.zkztmc = zkztmc;
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

	public String getIszyry() {
		return iszyry;
	}

	public void setIszyry(String iszyry) {
		this.iszyry = iszyry;
	}

	public String getGydd() {
		return gydd;
	}

	public void setGydd(String gydd) {
		this.gydd = gydd;
	}

	public String getBadwdm() {
		return badwdm;
	}

	public void setBadwdm(String badwdm) {
		this.badwdm = badwdm;
	}

	public String getBadwmc() {
		return badwmc;
	}

	public void setBadwmc(String badwmc) {
		this.badwmc = badwmc;
	}

	public String getGysj() {
		return gysj;
	}

	public void setGysj(String gysj) {
		this.gysj = gysj;
	}

	public String getGyyy() {
		return gyyy;
	}

	public void setGyyy(String gyyy) {
		this.gyyy = gyyy;
	}

	public String getGydwlxdh() {
		return gydwlxdh;
	}

	public void setGydwlxdh(String gydwlxdh) {
		this.gydwlxdh = gydwlxdh;
	}

	public String getIscqhjyfzcs() {
		return iscqhjyfzcs;
	}

	public void setIscqhjyfzcs(String iscqhjyfzcs) {
		this.iscqhjyfzcs = iscqhjyfzcs;
	}

	public String getCsmc() {
		return csmc;
	}

	public void setCsmc(String csmc) {
		this.csmc = csmc;
	}

	public String getCsxz() {
		return csxz;
	}

	public void setCsxz(String csxz) {
		this.csxz = csxz;
	}

	public String getIscqyjbg() {
		return iscqyjbg;
	}

	public void setIscqyjbg(String iscqyjbg) {
		this.iscqyjbg = iscqyjbg;
	}

	public Date getJzqssj() {
		if(StringUtils.isNotBlank(toChar_jzqssj)){
			jzqssj = DateTimeHelper.convertToDate(toChar_jzqssj, "yyyy-MM-dd");
		}
		return jzqssj;
	}

	public void setJzqssj(Date jzqssj) {
		this.jzqssj = jzqssj;
	}

	public String getZzxz() {
		return zzxz;
	}

	public void setZzxz(String zzxz) {
		this.zzxz = zzxz;
	}

	public String getIsygdzy() {
		return isygdzy;
	}

	public void setIsygdzy(String isygdzy) {
		this.isygdzy = isygdzy;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getDwxz() {
		return dwxz;
	}

	public void setDwxz(String dwxz) {
		this.dwxz = dwxz;
	}

	public Integer getYsr() {
		return ysr;
	}

	public void setYsr(Integer ysr) {
		this.ysr = ysr;
	}

	public String getIsrcxfmxdysr() {
		return isrcxfmxdysr;
	}

	public void setIsrcxfmxdysr(String isrcxfmxdysr) {
		this.isrcxfmxdysr = isrcxfmxdysr;
	}

	public String getRcxfdysrpdyj() {
		return rcxfdysrpdyj;
	}

	public void setRcxfdysrpdyj(String rcxfdysrpdyj) {
		this.rcxfdysrpdyj = rcxfdysrpdyj;
	}

	public String getIsgzsjc() {
		return isgzsjc;
	}

	public void setIsgzsjc(String isgzsjc) {
		this.isgzsjc = isgzsjc;
	}

	public String getSjcjz() {
		return sjcjz;
	}

	public void setSjcjz(String sjcjz) {
		this.sjcjz = sjcjz;
	}

	public String getGcsj() {
		return gcsj;
	}

	public void setGcsj(String gcsj) {
		this.gcsj = gcsj;
	}

	public String getCph() {
		return cph;
	}

	public void setCph(String cph) {
		this.cph = cph;
	}

	public String getIsgzfc() {
		return isgzfc;
	}

	public void setIsgzfc(String isgzfc) {
		this.isgzfc = isgzfc;
	}

	public Integer getFcjz() {
		return fcjz;
	}

	public void setFcjz(Integer fcjz) {
		this.fcjz = fcjz;
	}

	public String getGfrq() {
		return gfrq;
	}

	public void setGfrq(String gfrq) {
		this.gfrq = gfrq;
	}

	public String getFcxz() {
		return fcxz;
	}

	public void setFcxz(String fcxz) {
		this.fcxz = fcxz;
	}

	public String getIsjjjj() {
		return isjjjj;
	}

	public void setIsjjjj(String isjjjj) {
		this.isjjjj = isjjjj;
	}

	public String getJjjjpdyj() {
		return jjjjpdyj;
	}

	public void setJjjjpdyj(String jjjjpdyj) {
		this.jjjjpdyj = jjjjpdyj;
	}

	public String getIsdjcsywgdsy() {
		return isdjcsywgdsy;
	}

	public void setIsdjcsywgdsy(String isdjcsywgdsy) {
		this.isdjcsywgdsy = isdjcsywgdsy;
	}

	public String getDjtcywgdsypdyj() {
		return djtcywgdsypdyj;
	}

	public void setDjtcywgdsypdyj(String djtcywgdsypdyj) {
		this.djtcywgdsypdyj = djtcywgdsypdyj;
	}

	public String getJqsfywffzkn() {
		return jqsfywffzkn;
	}

	public void setJqsfywffzkn(String jqsfywffzkn) {
		this.jqsfywffzkn = jqsfywffzkn;
	}

	public String getJqsfywffzknpdyj() {
		return jqsfywffzknpdyj;
	}

	public void setJqsfywffzknpdyj(String jqsfywffzknpdyj) {
		this.jqsfywffzknpdyj = jqsfywffzknpdyj;
	}

	public String getIszyhjsn() {
		return iszyhjsn;
	}

	public void setIszyhjsn(String iszyhjsn) {
		this.iszyhjsn = iszyhjsn;
	}

	public Date getLkbssj() {
		if(StringUtils.isNotBlank(toChar_lkbssj)){
			lkbssj = DateTimeHelper.convertToDate(toChar_lkbssj, "yyyy-MM-dd");
		}
		return lkbssj;
	}

	public void setLkbssj(Date lkbssj) {
		this.lkbssj = lkbssj;
	}

	public String getQwss() {
		return qwss;
	}

	public void setQwss(String qwss) {
		this.qwss = qwss;
	}

	public String getZkzt() {
		return zkzt;
	}

	public void setZkzt(String zkzt) {
		this.zkzt = zkzt;
	}

	public String getXsqkms() {
		return xsqkms;
	}

	public void setXsqkms(String xsqkms) {
		this.xsqkms = xsqkms;
	}

	public String getHszrmjxm() {
		return hszrmjxm;
	}

	public void setHszrmjxm(String hszrmjxm) {
		this.hszrmjxm = hszrmjxm;
	}

	public String getHszrmjsfzh() {
		return hszrmjsfzh;
	}

	public void setHszrmjsfzh(String hszrmjsfzh) {
		this.hszrmjsfzh = hszrmjsfzh;
	}

	public String getHszrmjgajgdm() {
		return hszrmjgajgdm;
	}

	public void setHszrmjgajgdm(String hszrmjgajgdm) {
		this.hszrmjgajgdm = hszrmjgajgdm;
	}

	public String getHszrmjgajgmc() {
		return hszrmjgajgmc;
	}

	public void setHszrmjgajgmc(String hszrmjgajgmc) {
		this.hszrmjgajgmc = hszrmjgajgmc;
	}

	public String getHssj() {
		return hssj;
	}

	public void setHssj(String hssj) {
		this.hssj = hssj;
	}

	public String getDjsj() {
		return djsj;
	}

	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}

	public String getDjmjxm() {
		return djmjxm;
	}

	public void setDjmjxm(String djmjxm) {
		this.djmjxm = djmjxm;
	}

	public String getDjmjssgajgdm() {
		return djmjssgajgdm;
	}

	public void setDjmjssgajgdm(String djmjssgajgdm) {
		this.djmjssgajgdm = djmjssgajgdm;
	}

	public String getDjmjssgajgmc() {
		return djmjssgajgmc;
	}

	public void setDjmjssgajgmc(String djmjssgajgmc) {
		this.djmjssgajgmc = djmjssgajgmc;
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

	public String getCzsj() {
		return czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public String getCzbs() {
		return czbs;
	}

	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

	public Date getJlsj() {
		if(StringUtils.isNotBlank(toChar_jlsj)){
			jlsj = DateTimeHelper.convertToDate(toChar_jlsj, "yyyy-MM-dd");
		}
		return jlsj;
	}

	public void setJlsj(Date jlsj) {
		this.jlsj = jlsj;
	}

	public String getToChar_jlsj() {
		if(null != jlsj){
			toChar_jlsj = DateTimeHelper.conver(jlsj, "yyyy-MM-dd");
		}
		return toChar_jlsj;
	}

	public void setToChar_jlsj(String toChar_jlsj) {
		this.toChar_jlsj = toChar_jlsj;
	}

	public String getToChar_jzqssj() {
		if(null != jzqssj){
			toChar_jzqssj = DateTimeHelper.conver(jzqssj, "yyyy-MM-dd");
		}
		return toChar_jzqssj;
	}

	public void setToChar_jzqssj(String toChar_jzqssj) {
		this.toChar_jzqssj = toChar_jzqssj;
	}

	public String getToChar_lkbssj() {
		if(null != lkbssj){
			toChar_lkbssj = DateTimeHelper.conver(lkbssj, "yyyy-MM-dd");
		}
		return toChar_lkbssj;
	}

	public void setToChar_lkbssj(String toChar_lkbssj) {
		this.toChar_lkbssj = toChar_lkbssj;
	}
}
