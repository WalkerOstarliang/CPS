package com.chinacreator.menu.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;

public class XqajtjBean extends BaseValue 
{

	private static final long serialVersionUID = -8374476090529349190L;
	
	
	/**
	 * 单位代码
	 */
	private String dwdm;
	
	/**
	 * 单位名称
	 */
	private String dwmc;

	/**
	 * 单位级别
	 */
	private int orgLeve;
	
	/**
	 * 抢劫案
	 */
	private String qjasl;
	private String qjasl_y;
	private String qjasl_n;
	
	/**
	 * 抢夺案
	 */
	private String qdasl;
	private String qdasl_y;
	private String qdasl_n;
	
	/**
	 * 盗窃案
	 */
	private String dqasl;
	private String dqasl_y;
	private String dqasl_n;
	
	/**
	 * 诈骗案
	 */
	private String zpasl;
	private String zpasl_y;
	private String zpasl_n;
	
	/**
	 * 走私案
	 */
	private String zsasl;
	
	/**
	 * 其他案件
	 */
	private String qtasl;
	private String qtasl_y;
	private String qtasl_n;
	
	/**
	 * 案件总数
	 */
	private String ajzsl;
	private String ajzsl_y;
	private String ajzsl_n;
	
	/**
	 * 统计月份
	 */
	private String tjyf;
	
	
	private String parentcode;
	
	public String getQjasl() {
		return qjasl;
	}
	public void setQjasl(String qjasl) {
		this.qjasl = qjasl;
	}
	public String getQdasl() {
		return qdasl;
	}
	public void setQdasl(String qdasl) {
		this.qdasl = qdasl;
	}
	public String getDqasl() {
		return dqasl;
	}
	public void setDqasl(String dqasl) {
		this.dqasl = dqasl;
	}
	public String getZpasl() {
		return zpasl;
	}
	public void setZpasl(String zpasl) {
		this.zpasl = zpasl;
	}
	public String getZsasl() {
		return zsasl;
	}
	public void setZsasl(String zsasl) {
		this.zsasl = zsasl;
	}
	public String getQtasl() {
		return qtasl;
	}
	public void setQtasl(String qtasl) {
		this.qtasl = qtasl;
	}
	public String getAjzsl() {
		return ajzsl;
	}
	public void setAjzsl(String ajzsl) {
		this.ajzsl = ajzsl;
	}
	public String getTjyf() {
		return tjyf;
	}
	public void setTjyf(String tjyf) {
		this.tjyf = tjyf;
	}
	
	public String getParentcode() {
		return parentcode;
	}
	
	public void setParentcode(String parentcode) {
		this.parentcode = parentcode;
	}
	public String getDwdm() {
		return dwdm;
	}
	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}
	public String getDwmc() {
		LoginInfo login = ActionContextHelper.getLoginInfo();
		if(login.getLeve() <= orgLeve && orgLeve < 6){
			dwmc = "<span class=\"cps_span_href\" onclick=\"xqfatjDown('"+dwdm+"'," + parentcode + ")\" style=\"color:green\">"+dwmc+"</span>";
		}
		return dwmc;
	}
	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}
	public String getQjasl_y() {
		return qjasl_y;
	}
	public void setQjasl_y(String qjasl_y) {
		this.qjasl_y = qjasl_y;
	}
	public String getQjasl_n() {
		return qjasl_n;
	}
	public void setQjasl_n(String qjasl_n) {
		this.qjasl_n = qjasl_n;
	}
	public String getQdasl_y() {
		return qdasl_y;
	}
	public void setQdasl_y(String qdasl_y) {
		this.qdasl_y = qdasl_y;
	}
	public String getQdasl_n() {
		return qdasl_n;
	}
	public void setQdasl_n(String qdasl_n) {
		this.qdasl_n = qdasl_n;
	}
	public String getDqasl_y() {
		return dqasl_y;
	}
	public void setDqasl_y(String dqasl_y) {
		this.dqasl_y = dqasl_y;
	}
	public String getDqasl_n() {
		return dqasl_n;
	}
	public void setDqasl_n(String dqasl_n) {
		this.dqasl_n = dqasl_n;
	}
	public String getZpasl_y() {
		return zpasl_y;
	}
	public void setZpasl_y(String zpasl_y) {
		this.zpasl_y = zpasl_y;
	}
	public String getZpasl_n() {
		return zpasl_n;
	}
	public void setZpasl_n(String zpasl_n) {
		this.zpasl_n = zpasl_n;
	}
	public String getQtasl_y() {
		return qtasl_y;
	}
	public void setQtasl_y(String qtasl_y) {
		this.qtasl_y = qtasl_y;
	}
	public String getQtasl_n() {
		return qtasl_n;
	}
	public void setQtasl_n(String qtasl_n) {
		this.qtasl_n = qtasl_n;
	}
	public String getAjzsl_y() {
		return ajzsl_y;
	}
	public void setAjzsl_y(String ajzsl_y) {
		this.ajzsl_y = ajzsl_y;
	}
	public String getAjzsl_n() {
		return ajzsl_n;
	}
	public void setAjzsl_n(String ajzsl_n) {
		this.ajzsl_n = ajzsl_n;
	}
	public int getOrgLeve() {
		return orgLeve;
	}
	public void setOrgLeve(int orgLeve) {
		this.orgLeve = orgLeve;
	}
}
