package com.chinacreator.zagl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 安全隐患
 */
public class AqyhBean extends OperateBean {

	private static final long serialVersionUID = 8901239196499795726L;

	/**
	 * 编号
	 */
	private String bh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
    
	/**
	 * 隐患名称
	 */
	private String yhmc;
   
	/**
	 *隐患类型 
	 */	
	private String yhlx;
	private String yhlxmc;
	
	/**
	 * 发现人
	 */
    private String fxry;
    
    /**
     * 隐患等级
     */
    private String yhdj;
    private String yhdjmc;
   
    /**
     * 发现时间
     */
    private String fxsj;
    
    /**
     * 具体位置
     */
    private String jtwz;
    
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

	public String getYhmc() {
		return yhmc;
	}

	public void setYhmc(String yhmc) {
		this.yhmc = yhmc;
	}

	public String getYhlx() {
		return yhlx;
	}

	public void setYhlx(String yhlx) {
		this.yhlx = yhlx;
	}

	public String getFxry() {
		return fxry;
	}

	public void setFxry(String fxry) {
		this.fxry = fxry;
	}

	public String getYhdj() {
		return yhdj;
	}

	public void setYhdj(String yhdj) {
		this.yhdj = yhdj;
	}

	public String getFxsj() {
		return fxsj;
	}

	public void setFxsj(String fxsj) {
		this.fxsj = fxsj;
	}

	public String getJtwz() {
		return jtwz;
	}

	public void setJtwz(String jtwz) {
		this.jtwz = jtwz;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"delAqyh('"+this.bh +"')\">删除</span>";
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getYhlxmc() {
		if(ValidateHelper.isNotEmptyString(this.yhlx)){
			yhlxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_YHLX", this.yhlx);
		}
		return yhlxmc;
	}

	public void setYhlxmc(String yhlxmc) {
		this.yhlxmc = yhlxmc;
	}

	public String getYhdjmc() {
		if(ValidateHelper.isNotEmptyString(this.yhdj)){
			yhdjmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_YHJB", this.yhdj);
		}
		return yhdjmc;
	}

	public void setYhdjmc(String yhdjmc) {
		this.yhdjmc = yhdjmc;
	}

	public String getCzcs() {
		return czcs;
	}

	public void setCzcs(String czcs) {
		this.czcs = czcs;
	}
	
}
