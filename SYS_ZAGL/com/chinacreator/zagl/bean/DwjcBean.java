package com.chinacreator.zagl.bean;


/**单位奖惩信息**/

public class DwjcBean extends OperateBean {

	private static final long serialVersionUID = -8434418472540354148L;
	
	/**
	 * 编号主键
	 */
	private String bh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 奖惩类别
	 */
	private String jclb;
	
	/**
	 * 奖惩类别名称
	 */
	private String jclbmc;
	
	/**
	 * 奖惩实施单位
	 */
	private String jcssdw;
	
	/**
	 * 奖惩日期
	 */
	private String cfrq;
	
	/**
	 * 奖惩原因
	 */
	private String cfyy;
	
	/**
	 * 奖惩内容
	 */
	private String cfnr;
	
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

	public String getJclb() {
		return jclb;
	}

	public void setJclb(String jclb) {
		this.jclb = jclb;
	}

	public String getJcssdw() {
		return jcssdw;
	}

	public void setJcssdw(String jcssdw) {
		this.jcssdw = jcssdw;
	}

	public String getCfrq() {
		return cfrq;
	}

	public void setCfrq(String cfrq) {
		this.cfrq = cfrq;
	}

	public String getCfyy() {
		return cfyy;
	}

	public void setCfyy(String cfyy) {
		this.cfyy = cfyy;
	}

	public String getCfnr() {
		return cfnr;
	}

	public void setCfnr(String cfnr) {
		this.cfnr = cfnr;
	}

	public String getJclbmc() {
		if("0".equals(this.jclb)){
			jclbmc = "奖励";
		}else{
			jclbmc = "处罚";
		}
		return jclbmc;
	}

	public void setJclbmc(String jclbmc) {
		this.jclbmc = jclbmc;
	}
	
}
