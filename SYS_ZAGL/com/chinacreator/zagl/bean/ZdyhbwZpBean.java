package com.chinacreator.zagl.bean;

import java.io.File;

import com.chinacreator.common.bean.BaseValue;

public class ZdyhbwZpBean extends BaseValue{

	private static final long serialVersionUID = 8147577857564013759L;
	
	/**
	 * 照片编号
	 */
	private String bh;
	
	/**
	 * 要害部位编号
	 */
	private String yhbwbh;
	
	private String zpmc;
	
	private String zpms;
	
	/**
	 * 照片
	 */
	private File zp;
	
	/**
	 * 登记人姓名
	 */
	private String djrxm;
	
	/**
	 * 登记时间
	 */
	private String djrq;
	
	/**
	 * 登记单位代码
	 */
	private String djdwdm;
	
	/**
	 * 登记单位名称
	 */
	private String djdwmc;

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getYhbwbh() {
		return yhbwbh;
	}

	public void setYhbwbh(String yhbwbh) {
		this.yhbwbh = yhbwbh;
	}

	public File getZp() {
		return zp;
	}

	public void setZp(File zp) {
		this.zp = zp;
	}

	public String getDjrxm() {
		return djrxm;
	}

	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	
	public String getDjdwdm() {
		return djdwdm;
	}

	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}

	public String getDjdwmc() {
		return djdwmc;
	}

	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}

	public String getZpmc()
	{
		return zpmc;
	}

	public void setZpmc(String zpmc)
	{
		this.zpmc = zpmc;
	}

	public String getZpms()
	{
		return zpms;
	}

	public void setZpms(String zpms)
	{
		this.zpms = zpms;
	}

	public String getDjrq()
	{
		return djrq;
	}

	public void setDjrq(String djrq)
	{
		this.djrq = djrq;
	}
	
}
