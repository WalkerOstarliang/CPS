package com.chinacreator.xtgl.bean;

import java.io.Serializable;

/**
 * 本月未处理
 */
public class BywclBean implements Serializable {

    private static final long serialVersionUID = -7011818431164630112L;
    
    /**
     * 单位代码
     */
    private String orgcode;
    
    /**
     * 单位名称
     */
    private String orgname;
    
    /**
     * 流动人口延期
     */
    private String ldrkyq;
    
    /**
     * 从业人员登记反馈
     */
    private String cyryhs;
    
    /**
     * 从业人员派发
     */
    private String cyrypf;
    
    /**
     * 重点人员接管
     */
    private String zdrytg;
    
    /**
     * 重点人员在控登记
     */
    private String zdryzkdj;
    
    /**
     * 出租屋巡查
     */
    private String czwxc;
    
    /**
     * 出租房登记
     */
    private String czfdj;
    
    /**
     * 实体标注
     */
    private String stxxbz;

	public String getOrgcode() {
    	return orgcode;
    }

	public void setOrgcode(String orgcode) {
    	this.orgcode = orgcode;
    }

	public String getOrgname() {
    	return orgname;
    }

	public void setOrgname(String orgname) {
    	this.orgname = orgname;
    }

	public String getLdrkyq() {
    	return ldrkyq;
    }

	public void setLdrkyq(String ldrkyq) {
    	this.ldrkyq = ldrkyq;
    }

	public String getCyryhs() {
    	return cyryhs;
    }

	public void setCyryhs(String cyryhs) {
    	this.cyryhs = cyryhs;
    }

	public String getCyrypf() {
    	return cyrypf;
    }

	public void setCyrypf(String cyrypf) {
    	this.cyrypf = cyrypf;
    }

	public String getZdrytg() {
    	return zdrytg;
    }

	public void setZdrytg(String zdrytg) {
    	this.zdrytg = zdrytg;
    }

	public String getZdryzkdj() {
    	return zdryzkdj;
    }

	public void setZdryzkdj(String zdryzkdj) {
    	this.zdryzkdj = zdryzkdj;
    }

	public String getCzwxc() {
    	return czwxc;
    }

	public void setCzwxc(String czwxc) {
    	this.czwxc = czwxc;
    }

	public String getCzfdj() {
    	return czfdj;
    }

	public void setCzfdj(String czfdj) {
    	this.czfdj = czfdj;
    }

	public String getStxxbz() {
    	return stxxbz;
    }

	public void setStxxbz(String stxxbz) {
    	this.stxxbz = stxxbz;
    }
}
