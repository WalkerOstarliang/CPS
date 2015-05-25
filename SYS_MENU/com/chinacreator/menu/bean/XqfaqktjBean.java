package com.chinacreator.menu.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;

public class XqfaqktjBean extends BaseValue 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3841137829226610285L;
	private String dwdm;
	private String dwmc;
	private String tjjzrq;
	private String tjjzrqms;
	/**
	 * 累计发案数量
	 */
	private String ljfasl;          //天
	private String ljfasl_n;        //年
	private String ljfasl_y;        //月
	
	/**
	 * 抢劫案(年)
	 */
	private String ljqjasl;
	
	/**
	 * 抢夺案（年）
	 */
	private String ljqdasl;
	
	/**
	 * 盗窃案（年）
	 */
	private String ljdqasl;
	
	/**
	 * 诈骗案(年)
	 */
	private String ljzpasl;
	
	private String ljzsasl;
	
	/**
	 * 其他案（年）
	 */
	private String ljqtasl;
	private String rjfasl;
	
	
	private List<XqajtjBean> byfatjList = new ArrayList<XqajtjBean>();

	public String getTjjzrq() {
		return tjjzrq;
	}

	public void setTjjzrq(String tjjzrq) {
		this.tjjzrq = tjjzrq;
	}

	public String getTjjzrqms() {
		if (ValidateHelper.isNotEmptyString(tjjzrq))
		{
			tjjzrqms = DateTimeHelper.conver(DateTimeHelper.convertToDate(tjjzrq,"yyyy-MM-dd"),"yyyy年MM月dd日");
		}
		else
		{
			tjjzrqms = DateTimeHelper.getNowDateStr("yyyy年MM月dd日");
		}
		return tjjzrqms;
	}

	public void setTjjzrqms(String tjjzrqms) {
		this.tjjzrqms = tjjzrqms;
	}

	public String getLjfasl() {
		return ljfasl;
	}

	public void setLjfasl(String ljfasl) {
		this.ljfasl = ljfasl;
	}

	public String getRjfasl() {
		return rjfasl;
	}

	public void setRjfasl(String rjfasl) {
		this.rjfasl = rjfasl;
	}

	public List<XqajtjBean> getByfatjList() {
		return byfatjList;
	}

	public void setByfatjList(List<XqajtjBean> byfatjList) {
		this.byfatjList = byfatjList;
	}

	public String getLjqjasl() {
		return ljqjasl;
	}

	public void setLjqjasl(String ljqjasl) {
		this.ljqjasl = ljqjasl;
	}

	public String getLjqdasl() {
		return ljqdasl;
	}

	public void setLjqdasl(String ljqdasl) {
		this.ljqdasl = ljqdasl;
	}

	public String getLjdqasl() {
		return ljdqasl;
	}

	public void setLjdqasl(String ljdqasl) {
		this.ljdqasl = ljdqasl;
	}

	public String getLjzpasl() {
		return ljzpasl;
	}

	public void setLjzpasl(String ljzpasl) {
		this.ljzpasl = ljzpasl;
	}

	public String getLjzsasl() {
		return ljzsasl;
	}

	public void setLjzsasl(String ljzsasl) {
		this.ljzsasl = ljzsasl;
	}

	public String getLjqtasl() {
		return ljqtasl;
	}

	public void setLjqtasl(String ljqtasl) {
		this.ljqtasl = ljqtasl;
	}

	public String getDwdm() {
		return dwdm;
	}

	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getLjfasl_n() {
		return ljfasl_n;
	}

	public void setLjfasl_n(String ljfasl_n) {
		this.ljfasl_n = ljfasl_n;
	}

	public String getLjfasl_y() {
		return ljfasl_y;
	}

	public void setLjfasl_y(String ljfasl_y) {
		this.ljfasl_y = ljfasl_y;
	}
}
