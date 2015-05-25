package com.chinacreator.zagl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 灾害事故
 */
public class ZhsgBean extends OperateBean{

	private static final long serialVersionUID = 706538285025464469L;

	/**
	 * 编号
	 */
	private String bh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 事故类型
	 */
	private String sglx;
	private String sglxmc;
	
	/**
	 * 发生时间
	 */
	private String fssj;
	
	/**
	 * 损失财产
	 */
	private String sscc;
	
	/**
	 * 发生地点
	 */
	private String fsdd;
	
	/**
	 * 事故责任人
	 */
	private String sgzrr;
	
	/**
	 * 承办人
	 */
	private String cbr;
	
	/**
	 * 事故原因
	 */
	private String sgyy;
	private String sgyymc;
	
	/**
	 * 事故案件状态
	 */
	private String sgajzt;
	
	/**
	 * 发生经过
	 */
	private String fsjg;
	
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

	public String getSglx() {
		return sglx;
	}

	public void setSglx(String sglx) {
		this.sglx = sglx;
	}

	public String getFssj() {
		return fssj;
	}

	public void setFssj(String fssj) {
		this.fssj = fssj;
	}

	public String getSscc() {
		return sscc;
	}

	public void setSscc(String sscc) {
		this.sscc = sscc;
	}

	public String getFsdd() {
		return fsdd;
	}

	public void setFsdd(String fsdd) {
		this.fsdd = fsdd;
	}

	public String getSgzrr() {
		return sgzrr;
	}

	public void setSgzrr(String sgzrr) {
		this.sgzrr = sgzrr;
	}

	public String getCbr() {
		return cbr;
	}

	public void setCbr(String cbr) {
		this.cbr = cbr;
	}

	public String getSgyy() {
		return sgyy;
	}

	public void setSgyy(String sgyy) {
		this.sgyy = sgyy;
	}

	public String getFsjg() {
		return fsjg;
	}

	public void setFsjg(String fsjg) {
		this.fsjg = fsjg;
	}

	public String getCzcs() {
		return czcs;
	}

	public void setCzcs(String czcs) {
		cz = "<span class=\"cps_span_href\" onclick=\"delZhsg('"+this.bh +"')\">删除</span>";
		this.czcs = czcs;
	}

	public String getCz() {
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getSglxmc() {
		if(ValidateHelper.isNotEmptyString(this.sglx)){
			sglxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_SGLX", this.sglx);
		}
		return sglxmc;
	}

	public void setSglxmc(String sglxmc) {
		this.sglxmc = sglxmc;
	}

	public String getSgyymc() {
		if(ValidateHelper.isNotEmptyString(this.sgyy)){
			sglxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_SGYY", this.sgyy);
		}
		return sgyymc;
	}

	public void setSgyymc(String sgyymc) {
		this.sgyymc = sgyymc;
	}

	public String getSgajzt() {
		return sgajzt;
	}

	public void setSgajzt(String sgajzt) {
		this.sgajzt = sgajzt;
	}
	
}
