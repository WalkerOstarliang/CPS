package com.chinacreator.zagl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
/**
 * 技防单位
 */
public class JfdwBean extends DwjbxxBean {
	private static final long serialVersionUID = 294315469730226101L;

	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 机构编号
	 */
	private String jgbh; 
	
	/**
	 * 备案类型
	 */
	private String balx;
	private String balxmc;
	
	/**
	 * 室外电视监控探头
	 */
	private String swdsjktt; 
	
	/**
	 * 室内探头
	 */
	private String sntt;
	
	/**
	 * 周界报警及门禁系统
	 */
	private String zjbjjmjxt;
	private String zjbjjmjxtmc; 
	
	/**
	 * 110联网报警
	 */
	private String lwbj;
	private String lwbjmc;
	
	/**
	 * 要害部位防盗门窗
	 */
	private String yhbwfdmc;
	private String yhbwfdmc_mc;
	
	/**
	 * 备注
	 */
	private String bz;
	
	/**
	 * 首次申领时间
	 */
	private String scslsj;
	
	/**
	 * 备案等级
	 */
	private String badj;
	private String badjmc;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getSwdsjktt() {
		return swdsjktt;
	}

	public void setSwdsjktt(String swdsjktt) {
		this.swdsjktt = swdsjktt;
	}

	public String getSntt() {
		return sntt;
	}

	public void setSntt(String sntt) {
		this.sntt = sntt;
	}

	public String getZjbjjmjxt() {
		return zjbjjmjxt;
	}

	public void setZjbjjmjxt(String zjbjjmjxt) {
		this.zjbjjmjxt = zjbjjmjxt;
	}

	public String getLwbj() {
		return lwbj;
	}

	public void setLwbj(String lwbj) {
		this.lwbj = lwbj;
	}

	public String getYhbwfdmc() {
		return yhbwfdmc;
	}

	public void setYhbwfdmc(String yhbwfdmc) {
		this.yhbwfdmc = yhbwfdmc;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getBalx() {
		return balx;
	}

	public void setBalx(String balx) {
		this.balx = balx;
	}

	public String getBalxmc() {
		if(ValidateHelper.isNotEmptyString(this.balx)){
			balxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_JFDW_BALX", this.balx);
		}
		return balxmc;
	}

	public void setBalxmc(String balxmc) {
		this.balxmc = balxmc;
	}

	public String getZjbjjmjxtmc() {
		if(ValidateHelper.isNotEmptyString(this.zjbjjmjxt)){
			zjbjjmjxtmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_JFDW_SSYW",this.zjbjjmjxt);
		}
		return zjbjjmjxtmc;
	}

	public void setZjbjjmjxtmc(String zjbjjmjxtmc) {
		this.zjbjjmjxtmc = zjbjjmjxtmc;
	}

	public String getLwbjmc() {
		if(ValidateHelper.isNotEmptyString(this.lwbj)){
			zjbjjmjxtmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_JFDW_SSYW",this.lwbj);
		}
		return lwbjmc;
	}

	public void setLwbjmc(String lwbjmc) {
		this.lwbjmc = lwbjmc;
	}

	public String getYhbwfdmc_mc() {
		if(ValidateHelper.isNotEmptyString(this.yhbwfdmc)){
			zjbjjmjxtmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_JFDW_SSYW",this.yhbwfdmc);
		}
		return yhbwfdmc_mc;
	}

	public void setYhbwfdmc_mc(String yhbwfdmc_mc) {
		this.yhbwfdmc_mc = yhbwfdmc_mc;
	}

	public String getScslsj() {
		return scslsj;
	}

	public void setScslsj(String scslsj) {
		this.scslsj = scslsj;
	}

	public String getBadj() {
		return badj;
	}

	public void setBadj(String badj) {
		this.badj = badj;
	}

	public String getBadjmc() {
		badjmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_BADJ",this.badj);
		return badjmc;
	}

	public void setBadjmc(String badjmc) {
		this.badjmc = badjmc;
	}
}
