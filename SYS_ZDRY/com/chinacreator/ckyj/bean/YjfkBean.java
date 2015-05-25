package com.chinacreator.ckyj.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;


/**
 * 预警反馈信息
 */
public class YjfkBean extends CkyjxxBean {

	private static final long serialVersionUID = 4765308022576878473L;

	private String id;
	private String ldxxbh;
	private String czfkxxbh;
	private String yjxxbh;
	private String sjyjjb;
	private String fksj;
	private String fkrsfzh;
	private String fkrxm;
	private String fkdw;
	private String fkdwjgdm;
	private String mbfxzt;
	private String dtxxlb;
	private String hdfssj;
	private String hdfsddqh;
	private String hdfsddxz;
	private String hdfsddssshcs;
	private String hdfsddssshcsdm;
	private String fxhdxgxx;
	private String fxmbzrmjsfzh;
	private String fxmbzrmjxm;
	private String fxmbzrdw;
	private String fxmbzrdwjgdm;
	private String cqczcs;
	private String czcsxl;
	private String czsj;
	private String czddqh;
	private String czzrmjsfzh;
	private String czzrmjxm;
	private String czzrdwjgdm;
	private String czjgms;
	private String xdchnjxx;
	private String xcchwpxx;
	private String lxzcgzpg;
	private String lxzcgzpgyj;
	private String mbcszylx;
	private String czjg;
	private String czfkbcxx;
	private String rksj;
	private String sfwzdfk;
	private String czddxz;
	private String czzrdw;
	private String fszt;
	private String sjczjg;
	private String sfbryj;
	private String fbryjcsyy;
	private String czddzx;
	
	private String mbfxztmc;
	private String cqczcsmc;
	private String czcsxlmc;
	private String czjgmc;
	private String czcsmc;
	private String lxzcgzpgmc;
	private String mbcszylxmc;
	
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
	public String getCzfkxxbh() {
		return czfkxxbh;
	}
	public void setCzfkxxbh(String czfkxxbh) {
		this.czfkxxbh = czfkxxbh;
	}
	public String getYjxxbh() {
		return yjxxbh;
	}
	public void setYjxxbh(String yjxxbh) {
		this.yjxxbh = yjxxbh;
	}
	public String getSjyjjb() {
		return sjyjjb;
	}
	public void setSjyjjb(String sjyjjb) {
		this.sjyjjb = sjyjjb;
	}
	public String getFksj() {
		return fksj;
	}
	public void setFksj(String fksj) {
		this.fksj = fksj;
	}
	public String getFkrsfzh() {
		return fkrsfzh;
	}
	public void setFkrsfzh(String fkrsfzh) {
		this.fkrsfzh = fkrsfzh;
	}
	public String getFkrxm() {
		return fkrxm;
	}
	public void setFkrxm(String fkrxm) {
		this.fkrxm = fkrxm;
	}
	public String getFkdw() {
		return fkdw;
	}
	public void setFkdw(String fkdw) {
		this.fkdw = fkdw;
	}
	public String getFkdwjgdm() {
		return fkdwjgdm;
	}
	public void setFkdwjgdm(String fkdwjgdm) {
		this.fkdwjgdm = fkdwjgdm;
	}
	public String getMbfxzt() {
		return mbfxzt;
	}
	public void setMbfxzt(String mbfxzt) {
		this.mbfxzt = mbfxzt;
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
	public String getHdfsddssshcs() {
		return hdfsddssshcs;
	}
	public void setHdfsddssshcs(String hdfsddssshcs) {
		this.hdfsddssshcs = hdfsddssshcs;
	}
	public String getHdfsddssshcsdm() {
		return hdfsddssshcsdm;
	}
	public void setHdfsddssshcsdm(String hdfsddssshcsdm) {
		this.hdfsddssshcsdm = hdfsddssshcsdm;
	}
	public String getFxhdxgxx() {
		return fxhdxgxx;
	}
	public void setFxhdxgxx(String fxhdxgxx) {
		this.fxhdxgxx = fxhdxgxx;
	}
	public String getFxmbzrmjsfzh() {
		return fxmbzrmjsfzh;
	}
	public void setFxmbzrmjsfzh(String fxmbzrmjsfzh) {
		this.fxmbzrmjsfzh = fxmbzrmjsfzh;
	}
	public String getFxmbzrmjxm() {
		return fxmbzrmjxm;
	}
	public void setFxmbzrmjxm(String fxmbzrmjxm) {
		this.fxmbzrmjxm = fxmbzrmjxm;
	}
	public String getFxmbzrdw() {
		return fxmbzrdw;
	}
	public void setFxmbzrdw(String fxmbzrdw) {
		this.fxmbzrdw = fxmbzrdw;
	}
	public String getFxmbzrdwjgdm() {
		return fxmbzrdwjgdm;
	}
	public void setFxmbzrdwjgdm(String fxmbzrdwjgdm) {
		this.fxmbzrdwjgdm = fxmbzrdwjgdm;
	}
	public String getCqczcs() {
		return cqczcs;
	}
	public void setCqczcs(String cqczcs) {
		this.cqczcs = cqczcs;
	}
	public String getCzcsxl() {
		return czcsxl;
	}
	public void setCzcsxl(String czcsxl) {
		this.czcsxl = czcsxl;
	}
	public String getCzsj() {
		return czsj;
	}
	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}
	public String getCzddqh() {
		return czddqh;
	}
	public void setCzddqh(String czddqh) {
		this.czddqh = czddqh;
	}
	public String getCzzrmjsfzh() {
		return czzrmjsfzh;
	}
	public void setCzzrmjsfzh(String czzrmjsfzh) {
		this.czzrmjsfzh = czzrmjsfzh;
	}
	public String getCzzrmjxm() {
		return czzrmjxm;
	}
	public void setCzzrmjxm(String czzrmjxm) {
		this.czzrmjxm = czzrmjxm;
	}
	public String getCzzrdwjgdm() {
		return czzrdwjgdm;
	}
	public void setCzzrdwjgdm(String czzrdwjgdm) {
		this.czzrdwjgdm = czzrdwjgdm;
	}
	public String getCzjgms() {
		return czjgms;
	}
	public void setCzjgms(String czjgms) {
		this.czjgms = czjgms;
	}
	public String getXdchnjxx() {
		return xdchnjxx;
	}
	public void setXdchnjxx(String xdchnjxx) {
		this.xdchnjxx = xdchnjxx;
	}
	public String getXcchwpxx() {
		return xcchwpxx;
	}
	public void setXcchwpxx(String xcchwpxx) {
		this.xcchwpxx = xcchwpxx;
	}
	public String getLxzcgzpg() {
		return lxzcgzpg;
	}
	public void setLxzcgzpg(String lxzcgzpg) {
		this.lxzcgzpg = lxzcgzpg;
	}
	public String getLxzcgzpgyj() {
		return lxzcgzpgyj;
	}
	public void setLxzcgzpgyj(String lxzcgzpgyj) {
		this.lxzcgzpgyj = lxzcgzpgyj;
	}
	public String getMbcszylx() {
		return mbcszylx;
	}
	public void setMbcszylx(String mbcszylx) {
		this.mbcszylx = mbcszylx;
	}
	public String getCzjg() {
		return czjg;
	}
	public void setCzjg(String czjg) {
		this.czjg = czjg;
	}
	public String getCzfkbcxx() {
		return czfkbcxx;
	}
	public void setCzfkbcxx(String czfkbcxx) {
		this.czfkbcxx = czfkbcxx;
	}
	public String getRksj() {
		return rksj;
	}
	public void setRksj(String rksj) {
		this.rksj = rksj;
	}
	public String getSfwzdfk() {
		return sfwzdfk;
	}
	public void setSfwzdfk(String sfwzdfk) {
		this.sfwzdfk = sfwzdfk;
	}
	public String getCzddxz() {
		return czddxz;
	}
	public void setCzddxz(String czddxz) {
		this.czddxz = czddxz;
	}
	public String getCzzrdw() {
		return czzrdw;
	}
	public void setCzzrdw(String czzrdw) {
		this.czzrdw = czzrdw;
	}
	public String getFszt() {
		return fszt;
	}
	public void setFszt(String fszt) {
		this.fszt = fszt;
	}
	public String getSjczjg() {
		return sjczjg;
	}
	public void setSjczjg(String sjczjg) {
		this.sjczjg = sjczjg;
	}
	public String getSfbryj() {
		return sfbryj;
	}
	public void setSfbryj(String sfbryj) {
		this.sfbryj = sfbryj;
	}
	public String getFbryjcsyy() {
		return fbryjcsyy;
	}
	public void setFbryjcsyy(String fbryjcsyy) {
		this.fbryjcsyy = fbryjcsyy;
	}
	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openFkxx('"+this.id+"','"+this.yjxxbh+"','detail')\" style=\"color:green\">详情</span>&nbsp;";
//		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
//		if(loginInfo.getSfzh().equals(this.fkrsfzh) || loginInfo.getSfzh().equals(this.czzrmjsfzh)){
//			cz += "<span class=\"cps_span_href\" onclick=\"openFkxx('"+this.id+"','"+this.yjxxbh+"','update')\" style=\"color:green\">修改</span>&nbsp;";
//		}
		
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getCzddzx() {
		return czddzx;
	}
	public void setCzddzx(String czddzx) {
		this.czddzx = czddzx;
	}
	
	
	public String getMbfxztmc() {
		if(ValidateHelper.isNotEmptyString(this.mbfxzt)){
			mbfxztmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDRY_MBFXZT",this.mbfxzt);
		}
		return mbfxztmc;
	}
	public void setMbfxztmc(String mbfxztmc) {
		this.mbfxztmc = mbfxztmc;
	}
	public String getCqczcsmc() {
		if(ValidateHelper.isNotEmptyString(this.cqczcs)){
			cqczcsmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDRY_CZCSLX",this.cqczcs);
		}
		return cqczcsmc;
	}
	public void setCqczcsmc(String cqczcsmc) {
		this.cqczcsmc = cqczcsmc;
	}
	public String getCzcsxlmc() {
		if(ValidateHelper.isNotEmptyString(this.czcsxl)){
			czcsxlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDRY_CZCSXL",czcsxl);
		}
		return czcsxlmc;
	}
	public void setCzcsxlmc(String czcsxlmc) {
		this.czcsxlmc = czcsxlmc;
	}
	public String getCzjgmc() {
		if(ValidateHelper.isNotEmptyString(this.czjg)){
			czjgmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDRY_CZJG",this.czjg);
		}
		return czjgmc;
	}
	public void setCzjgmc(String czjgmc) {
		this.czjgmc = czjgmc;
	}
	public String getCzcsmc() {
		return czcsmc;
	}
	public void setCzcsmc(String czcsmc) {
		this.czcsmc = czcsmc;
	}
	public String getLxzcgzpgmc() {
		return lxzcgzpgmc;
	}
	public void setLxzcgzpgmc(String lxzcgzpgmc) {
		this.lxzcgzpgmc = lxzcgzpgmc;
	}
	public String getMbcszylxmc() {
		return mbcszylxmc;
	}
	public void setMbcszylxmc(String mbcszylxmc) {
		this.mbcszylxmc = mbcszylxmc;
	}
}
