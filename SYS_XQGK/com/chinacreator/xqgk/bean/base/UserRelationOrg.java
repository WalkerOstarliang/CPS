package com.chinacreator.xqgk.bean.base;

public class UserRelationOrg {

	private int userId;//用户id
	private String userCode;//警号
	private String userName;//用户名
	private String dataDeptCode;//数据机构代码（此人查看哪个机构的数据）
	private String dataDeptName;//数据机构名称（此人查看哪个机构的数据）
	private String dutyDeptCode;//值班机构代码（此人属于哪个值班部门）
	private String dutyDeptName;//值班机构代码（此人属于哪个值班部门）
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDataDeptCode() {
		return dataDeptCode;
	}
	public void setDataDeptCode(String dataDeptCode) {
		this.dataDeptCode = dataDeptCode;
	}
	public String getDataDeptName() {
		return dataDeptName;
	}
	public void setDataDeptName(String dataDeptName) {
		this.dataDeptName = dataDeptName;
	}
	public String getDutyDeptCode() {
		return dutyDeptCode;
	}
	public void setDutyDeptCode(String dutyDeptCode) {
		this.dutyDeptCode = dutyDeptCode;
	}
	public String getDutyDeptName() {
		return dutyDeptName;
	}
	public void setDutyDeptName(String dutyDeptName) {
		this.dutyDeptName = dutyDeptName;
	}
	
	
}
