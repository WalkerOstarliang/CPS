package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;
/**
 * 提供证明查询
 * @author Administrator
 *
 */
public class TgzmQueryBean extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String lrdwdm ;  // 录入单位代码
	private String lrdwmc;  // 录入单位名称
	private String sqrxm;  // 申请人姓名
	private String sqsj;   // 申请时间
	private String tgzmlx; // 提供证件类型
	private String cbrxm;  // 承办人姓名
	private String cbdwdm; // 承办单位代码
	private String cbdwmc; // 承办单位名称
	private String startDate; // 查询开始时间
	private String endDate;  // 查询截至时间
	private String startTime; // 承办开始时间
	private String endTime;// 承办截至时间
	public String getLrdwdm() {
		return lrdwdm;
	}
	public void setLrdwdm(String lrdwdm) {
		this.lrdwdm = lrdwdm;
	}
	public String getLrdwmc() {
		return lrdwmc;
	}
	public void setLrdwmc(String lrdwmc) {
		this.lrdwmc = lrdwmc;
	}
	public String getSqrxm() {
		return sqrxm;
	}
	public void setSqrxm(String sqrxm) {
		this.sqrxm = sqrxm;
	}
	public String getSqsj() {
		return sqsj;
	}
	public void setSqsj(String sqsj) {
		this.sqsj = sqsj;
	}
	public String getTgzmlx() {
		return tgzmlx;
	}
	public void setTgzmlx(String tgzmlx) {
		this.tgzmlx = tgzmlx;
	}
	public String getCbrxm() {
		return cbrxm;
	}
	public void setCbrxm(String cbrxm) {
		this.cbrxm = cbrxm;
	}
	public String getCbdwdm() {
		return cbdwdm;
	}
	public void setCbdwdm(String cbdwdm) {
		this.cbdwdm = cbdwdm;
	}
	public String getCbdwmc() {
		return cbdwmc;
	}
	public void setCbdwmc(String cbdwmc) {
		this.cbdwmc = cbdwmc;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
}
