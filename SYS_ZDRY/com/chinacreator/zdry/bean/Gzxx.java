package com.chinacreator.zdry.bean;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DateTimeHelper;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO()
 * @date Mar 20, 2013 7:35:10 PM
 */
public class Gzxx extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4422360119397528548L;

	private String id;
	private String sfzh;
	private String dah;
	private String gllb;
	private String glff;
	private String gzdxfl;
	private String bmch;
	private String jzdz;
	private String glpcs;
	private String jwh;
	private String xfsp;
	private String tbsh;
	private String ztbs;
	private String xxcjyj;
	private String zwcjqk;
	private String bjcjqk;
	private String jdbabm;
	private String xszk;
	private String gqmj;
	private String gljb;
	private String flwsbh;
	private String flwsmc;
	private String qfjg;
	private Date qfsj;
	private String cjry;
	private Date cjsj;
	private String xxcjjs;
	
	private String toChar_qfsj;
	private String toChar_cjsj;
	
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

	public String getDah() {
		return dah;
	}

	public void setDah(String dah) {
		this.dah = dah;
	}

	public String getGllb() {
		return gllb;
	}

	public void setGllb(String gllb) {
		this.gllb = gllb;
	}

	public String getGlff() {
		return glff;
	}

	public void setGlff(String glff) {
		this.glff = glff;
	}

	public String getGzdxfl() {
		return gzdxfl;
	}

	public void setGzdxfl(String gzdxfl) {
		this.gzdxfl = gzdxfl;
	}

	public String getBmch() {
		return bmch;
	}

	public void setBmch(String bmch) {
		this.bmch = bmch;
	}

	public String getJzdz() {
		return jzdz;
	}

	public void setJzdz(String jzdz) {
		this.jzdz = jzdz;
	}

	public String getGlpcs() {
		return glpcs;
	}

	public void setGlpcs(String glpcs) {
		this.glpcs = glpcs;
	}

	public String getJwh() {
		return jwh;
	}

	public void setJwh(String jwh) {
		this.jwh = jwh;
	}

	public String getXfsp() {
		return xfsp;
	}

	public void setXfsp(String xfsp) {
		this.xfsp = xfsp;
	}

	public String getTbsh() {
		return tbsh;
	}

	public void setTbsh(String tbsh) {
		this.tbsh = tbsh;
	}

	public String getZtbs() {
		return ztbs;
	}

	public void setZtbs(String ztbs) {
		this.ztbs = ztbs;
	}

	public String getXxcjyj() {
		return xxcjyj;
	}

	public void setXxcjyj(String xxcjyj) {
		this.xxcjyj = xxcjyj;
	}

	public String getZwcjqk() {
		return zwcjqk;
	}

	public void setZwcjqk(String zwcjqk) {
		this.zwcjqk = zwcjqk;
	}

	public String getBjcjqk() {
		return bjcjqk;
	}

	public void setBjcjqk(String bjcjqk) {
		this.bjcjqk = bjcjqk;
	}

	public String getJdbabm() {
		return jdbabm;
	}

	public void setJdbabm(String jdbabm) {
		this.jdbabm = jdbabm;
	}

	public String getXszk() {
		return xszk;
	}

	public void setXszk(String xszk) {
		this.xszk = xszk;
	}

	public String getGqmj() {
		return gqmj;
	}

	public void setGqmj(String gqmj) {
		this.gqmj = gqmj;
	}

	public String getGljb() {
		return gljb;
	}

	public void setGljb(String gljb) {
		this.gljb = gljb;
	}

	public String getFlwsbh() {
		return flwsbh;
	}

	public void setFlwsbh(String flwsbh) {
		this.flwsbh = flwsbh;
	}

	public String getFlwsmc() {
		return flwsmc;
	}

	public void setFlwsmc(String flwsmc) {
		this.flwsmc = flwsmc;
	}

	public String getQfjg() {
		return qfjg;
	}

	public void setQfjg(String qfjg) {
		this.qfjg = qfjg;
	}

	public String getCjry() {
		return cjry;
	}

	public void setCjry(String cjry) {
		this.cjry = cjry;
	}

	public String getXxcjjs() {
		return xxcjjs;
	}

	public void setXxcjjs(String xxcjjs) {
		this.xxcjjs = xxcjjs;
	}

	public String getToChar_qfsj() {
		if(null != qfsj){
			toChar_qfsj = DateTimeHelper.conver(qfsj, "yyyy-MM-dd");
		}
		
		return toChar_qfsj;
	}

	public void setToChar_qfsj(String toChar_qfsj) {
		this.toChar_qfsj = toChar_qfsj;
	}
	
	public Date getQfsj() {
		if(StringUtils.isNotBlank(toChar_qfsj)){
			qfsj = DateTimeHelper.convertToDate(toChar_qfsj, "yyyy-MM-dd");
		}
		return qfsj;
	}
	
	public String getToChar_cjsj() {
		if(null != cjsj){
			toChar_cjsj = DateTimeHelper.conver(cjsj, "yyyy-MM-dd");
		}
		return toChar_cjsj;
	}

	public void setToChar_cjsj(String toChar_cjsj) {
		this.toChar_cjsj = toChar_cjsj;
	}

	public void setQfsj(Date qfsj) {
		this.qfsj = qfsj;
	}

	public Date getCjsj() {
		if(StringUtils.isNotBlank(toChar_cjsj)){
			cjsj = DateTimeHelper.convertToDate(toChar_cjsj, "yyyy-MM-dd");
		}
		return cjsj;
	}

	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}
}
