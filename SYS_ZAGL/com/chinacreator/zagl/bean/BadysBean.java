package com.chinacreator.zagl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 不安定因素
 */
public class BadysBean extends OperateBean {

	private static final long serialVersionUID = 8090563207603983572L;
	
	/**
	 * 编号
	 */
	private String bh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 类型
	 */
	private String lx;
	private String lxmc;
	
	/**
	 * 引发原因
	 */
	private String yfyy;
	private String yfyymc;
	
	/**
	 * 发生时间
	 */
	private String fssj;
	
	/**
	 * 承办人
	 */
	private String cbr;
	
	/**
	 * 发生地点
	 */
	private String fsdd;
	
	/**
	 * 表现形式
	 */
	private String bxxsdl;
	private String bxxs;
	private String bxxsmc;
	
	/**
	 * 事端规模
	 */
	private String sdgm;
	
	/**
	 * 情况描述
	 */
	private String qkms;
	
	/**
	 * 处置措施
	 */
	private String czcs;
	
	private String cz;

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}

	public String getYfyy() {
		return yfyy;
	}

	public void setYfyy(String yfyy) {
		this.yfyy = yfyy;
	}

	public String getFssj() {
		return fssj;
	}

	public void setFssj(String fssj) {
		this.fssj = fssj;
	}

	public String getCbr() {
		return cbr;
	}

	public void setCbr(String cbr) {
		this.cbr = cbr;
	}

	public String getFsdd() {
		return fsdd;
	}

	public void setFsdd(String fsdd) {
		this.fsdd = fsdd;
	}

	public String getBxxs() {
		if(ValidateHelper.isNotEmptyString(this.bxxsdl) && ValidateHelper.isEmptyString(this.bxxs)){
			bxxs = bxxsdl;
		}
		return bxxs;
	}

	public void setBxxs(String bxxs) {
		this.bxxs = bxxs;
	}

	public String getBxxsdl() {
		if(ValidateHelper.isNotEmptyString(this.bxxs)){
			bxxsdl = bxxs.substring(0,2) + "0";
		}
		return bxxsdl;
	}

	public void setBxxsdl(String bxxsdl) {
		this.bxxsdl = bxxsdl;
	}

	public String getSdgm() {
		return sdgm;
	}

	public void setSdgm(String sdgm) {
		this.sdgm = sdgm;
	}

	public String getQkms() {
		return qkms;
	}

	public void setQkms(String qkms) {
		this.qkms = qkms;
	}

	public String getCzcs() {
		return czcs;
	}

	public void setCzcs(String czcs) {
		this.czcs = czcs;
	}

	public String getLxmc() {
		if(ValidateHelper.isNotEmptyString(this.lx)){
			lxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_BADYSLX", this.lx);
		}
		return lxmc;
	}

	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}

	public String getBxxsmc() {
		if(ValidateHelper.isNotEmptyString(this.bxxs)){
			bxxsmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_BXXS", this.bxxs);
		}
		return bxxsmc;
	}

	public void setBxxsmc(String bxxsmc) {
		this.bxxsmc = bxxsmc;
	}

	public String getYfyymc() {
		if(ValidateHelper.isNotEmptyString(this.yfyy)){
			yfyymc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_YFYY", this.yfyy);
		}
		return yfyymc;
	}

	public void setYfyymc(String yfyymc) {
		this.yfyymc = yfyymc;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"delBadys('"+this.bh +"')\">删除</span>";
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
}
