package com.chinacreator.ckyj.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 常控预警信息
 */
public class CkyjxxBean extends BaseValue {

	private static final long serialVersionUID = -5740888978639094190L;
	
	private String id;
	private String ldxxbh;
	private String yjxxbh;
	private String fwzh;
	private String yjjsdw;
	private String yjjsdwmc;
	private String yjjsdlx;
	private String yjjb;
	private String qssx;
	private String scczfksx;
	private String yjfbsj;
	private String fbrxm;
	private String fbdwjgdm;
	private String fbdw;
	private String zdrybh;
	private String zdrylbbj;
	private String zdryxl;
	private String zdryxm;
	private String zdrywwxm;
	private String sfzh;
	private String qtzjhm;
	private String dtxxlb;
	private String hdfssj;
	private String hdfsddqh;
	private String hdfsddxz;
	private String hdfsddssshcsdm;
	private String hdfsddssshcs;
	private String hdfsddssgajgjgdm;
	private String hdfsddssgajg;
	private String djzjhm;
	private String djxm;
	private String djxb;
	private String djcsrq;
	private String hdxgxx;
	private String dtxxtgdwjgdm;
	private String dtxxtgdw;
	private String xxbdsj;
	private String xxbddwjgdm;
	private String xxbddw;
	private String dtgjxxbh;
	private String bz;
	private String jfxx;
	private String sjlybs;
	private String rksj;
	private String sftsjz;
	private String sfxfds;
	private String sfscxyj;
	private String sfqs;
	private String sffk;
	private String sfyzdff;
	private String sfcfyj;
	private String sfyzdtsxq;
	private String czyq;
	private String sftl;
	
	private String zdryxlmc;
	private String hdfsddqhmc;
	private String dtxxlbmc;
	private String zdrylbbjmc;
	private String yjjbmc;
	
	private String cz;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLdxxbh() {
		return ldxxbh;
	}
	public void setLdxxbh(String ldxxbh) {
		this.ldxxbh = ldxxbh;
	}
	public String getYjxxbh() {
		return yjxxbh;
	}
	public void setYjxxbh(String yjxxbh) {
		this.yjxxbh = yjxxbh;
	}
	public String getFwzh() {
		return fwzh;
	}
	public void setFwzh(String fwzh) {
		this.fwzh = fwzh;
	}
	public String getYjjsdw() {
		return yjjsdw;
	}
	public void setYjjsdw(String yjjsdw) {
		this.yjjsdw = yjjsdw;
	}
	public String getYjjsdlx() {
		return yjjsdlx;
	}
	public void setYjjsdlx(String yjjsdlx) {
		this.yjjsdlx = yjjsdlx;
	}
	public String getYjjb() {
		return yjjb;
	}
	public void setYjjb(String yjjb) {
		this.yjjb = yjjb;
	}
	public String getQssx() {
		return qssx;
	}
	public void setQssx(String qssx) {
		this.qssx = qssx;
	}
	public String getScczfksx() {
		return scczfksx;
	}
	public void setScczfksx(String scczfksx) {
		this.scczfksx = scczfksx;
	}
	public String getYjfbsj() {
		return yjfbsj;
	}
	public void setYjfbsj(String yjfbsj) {
		this.yjfbsj = yjfbsj;
	}
	public String getFbrxm() {
		return fbrxm;
	}
	public void setFbrxm(String fbrxm) {
		this.fbrxm = fbrxm;
	}
	public String getFbdwjgdm() {
		return fbdwjgdm;
	}
	public void setFbdwjgdm(String fbdwjgdm) {
		this.fbdwjgdm = fbdwjgdm;
	}
	public String getFbdw() {
		return fbdw;
	}
	public void setFbdw(String fbdw) {
		this.fbdw = fbdw;
	}
	public String getZdrybh() {
		return zdrybh;
	}
	public void setZdrybh(String zdrybh) {
		this.zdrybh = zdrybh;
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
	public String getZdryxm() {
		return zdryxm;
	}
	public void setZdryxm(String zdryxm) {
		this.zdryxm = zdryxm;
	}
	public String getZdrywwxm() {
		return zdrywwxm;
	}
	public void setZdrywwxm(String zdrywwxm) {
		this.zdrywwxm = zdrywwxm;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getQtzjhm() {
		return qtzjhm;
	}
	public void setQtzjhm(String qtzjhm) {
		this.qtzjhm = qtzjhm;
	}
	public String getDtxxlb() {
		return dtxxlb;
	}
	public void setDtxxlb(String dtxxlb) {
		this.dtxxlb = dtxxlb;
	}
	public String getHdfssj() {
		return hdfssj;
	}
	public void setHdfssj(String hdfssj) {
		this.hdfssj = hdfssj;
	}
	public String getHdfsddqh() {
		return hdfsddqh;
	}
	public void setHdfsddqh(String hdfsddqh) {
		this.hdfsddqh = hdfsddqh;
	}
	public String getHdfsddxz() {
		return hdfsddxz;
	}
	public void setHdfsddxz(String hdfsddxz) {
		this.hdfsddxz = hdfsddxz;
	}
	public String getHdfsddssshcsdm() {
		return hdfsddssshcsdm;
	}
	public void setHdfsddssshcsdm(String hdfsddssshcsdm) {
		this.hdfsddssshcsdm = hdfsddssshcsdm;
	}
	public String getHdfsddssshcs() {
		return hdfsddssshcs;
	}
	public void setHdfsddssshcs(String hdfsddssshcs) {
		this.hdfsddssshcs = hdfsddssshcs;
	}
	public String getHdfsddssgajgjgdm() {
		return hdfsddssgajgjgdm;
	}
	public void setHdfsddssgajgjgdm(String hdfsddssgajgjgdm) {
		this.hdfsddssgajgjgdm = hdfsddssgajgjgdm;
	}
	public String getHdfsddssgajg() {
		return hdfsddssgajg;
	}
	public void setHdfsddssgajg(String hdfsddssgajg) {
		this.hdfsddssgajg = hdfsddssgajg;
	}
	public String getDjzjhm() {
		return djzjhm;
	}
	public void setDjzjhm(String djzjhm) {
		this.djzjhm = djzjhm;
	}
	public String getDjxm() {
		return djxm;
	}
	public void setDjxm(String djxm) {
		this.djxm = djxm;
	}
	public String getDjxb() {
		return djxb;
	}
	public void setDjxb(String djxb) {
		this.djxb = djxb;
	}
	public String getDjcsrq() {
		return djcsrq;
	}
	public void setDjcsrq(String djcsrq) {
		this.djcsrq = djcsrq;
	}
	public String getHdxgxx() {
		return hdxgxx;
	}
	public void setHdxgxx(String hdxgxx) {
		this.hdxgxx = hdxgxx;
	}
	public String getDtxxtgdwjgdm() {
		return dtxxtgdwjgdm;
	}
	public void setDtxxtgdwjgdm(String dtxxtgdwjgdm) {
		this.dtxxtgdwjgdm = dtxxtgdwjgdm;
	}
	public String getDtxxtgdw() {
		return dtxxtgdw;
	}
	public void setDtxxtgdw(String dtxxtgdw) {
		this.dtxxtgdw = dtxxtgdw;
	}
	public String getXxbdsj() {
		return xxbdsj;
	}
	public void setXxbdsj(String xxbdsj) {
		this.xxbdsj = xxbdsj;
	}
	public String getXxbddwjgdm() {
		return xxbddwjgdm;
	}
	public void setXxbddwjgdm(String xxbddwjgdm) {
		this.xxbddwjgdm = xxbddwjgdm;
	}
	public String getXxbddw() {
		return xxbddw;
	}
	public void setXxbddw(String xxbddw) {
		this.xxbddw = xxbddw;
	}
	public String getDtgjxxbh() {
		return dtgjxxbh;
	}
	public void setDtgjxxbh(String dtgjxxbh) {
		this.dtgjxxbh = dtgjxxbh;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getJfxx() {
		return jfxx;
	}
	public void setJfxx(String jfxx) {
		this.jfxx = jfxx;
	}
	public String getSjlybs() {
		return sjlybs;
	}
	public void setSjlybs(String sjlybs) {
		this.sjlybs = sjlybs;
	}
	public String getRksj() {
		return rksj;
	}
	public void setRksj(String rksj) {
		this.rksj = rksj;
	}
	public String getSftsjz() {
		return sftsjz;
	}
	public void setSftsjz(String sftsjz) {
		this.sftsjz = sftsjz;
	}
	public String getSfxfds() {
		return sfxfds;
	}
	public void setSfxfds(String sfxfds) {
		this.sfxfds = sfxfds;
	}
	public String getSfscxyj() {
		return sfscxyj;
	}
	public void setSfscxyj(String sfscxyj) {
		this.sfscxyj = sfscxyj;
	}
	public String getSfqs() {
		return sfqs;
	}
	public void setSfqs(String sfqs) {
		this.sfqs = sfqs;
	}
	public String getSffk() {
		return sffk;
	}
	public void setSffk(String sffk) {
		this.sffk = sffk;
	}
	public String getSfyzdff() {
		return sfyzdff;
	}
	public void setSfyzdff(String sfyzdff) {
		this.sfyzdff = sfyzdff;
	}
	public String getSfcfyj() {
		return sfcfyj;
	}
	public void setSfcfyj(String sfcfyj) {
		this.sfcfyj = sfcfyj;
	}
	public String getSfyzdtsxq() {
		return sfyzdtsxq;
	}
	public void setSfyzdtsxq(String sfyzdtsxq) {
		this.sfyzdtsxq = sfyzdtsxq;
	}
	public String getCzyq() {
		return czyq;
	}
	public void setCzyq(String czyq) {
		this.czyq = czyq;
	}
	public String getSftl() {
		return sftl;
	}
	public void setSftl(String sftl) {
		this.sftl = sftl;
	}
	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openCjyjDetail('"+this.yjxxbh+"')\" style=\"color:green\">详情</span>&nbsp;";
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(loginInfo.getOrgcode().equals(this.yjjsdw)){
			cz += "<span class=\"cps_span_href\" onclick=\"openYjqsPage('" + this.yjxxbh + "','add')\" style=\"color:green\">签收</span>&nbsp;";
		}
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getYjjbmc() {
		if(ValidateHelper.isNotEmptyString(this.yjjb)){
			yjjbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDRY_YJJB", this.yjjb);
		}
		return yjjbmc;
	}
	public void setYjjbmc(String yjjbmc) {
		this.yjjbmc = yjjbmc;
	}
	public String getZdryxlmc() {
		zdryxlmc = CommonSequenceHelper.getZdryxlmcs(this.zdryxl);
		return zdryxlmc;
	}
	public void setZdryxlmc(String zdryxlmc) {
		this.zdryxlmc = zdryxlmc;
	}
	public String getZdrylbbjmc() {
		zdrylbbjmc = CommonSequenceHelper.getZdrylbmc(this.zdrylbbj);
		return zdrylbbjmc;
	}
	public void setZdrylbbjmc(String zdrylbbjmc) {
		this.zdrylbbjmc = zdrylbbjmc;
	}
	public String getDtxxlbmc() {
		if(ValidateHelper.isNotEmptyString(this.dtxxlb)){
			dtxxlbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDRY_DTXXLB", this.dtxxlb);
		}
		return dtxxlbmc;
	}
	public void setDtxxlbmc(String dtxxlbmc) {
		this.dtxxlbmc = dtxxlbmc;
	}
	public String getHdfsddqhmc() {
		hdfsddqhmc = DictionaryCacheHellper.getXzqhmcByQhdm(this.hdfsddqh);
		return hdfsddqhmc;
	}
	public void setHdfsddqhmc(String hdfsddqhmc) {
		this.hdfsddqhmc = hdfsddqhmc;
	}
	public String getYjjsdwmc() {
		if(ValidateHelper.isNotEmptyString(this.yjjsdw)){
			yjjsdwmc = DictionaryCacheHellper.getOrganizationBeanByOrgCode(this.yjjsdw).getOrgname();
		}
		return yjjsdwmc;
	}
	public void setYjjsdwmc(String yjjsdwmc) {
		this.yjjsdwmc = yjjsdwmc;
	}
}
