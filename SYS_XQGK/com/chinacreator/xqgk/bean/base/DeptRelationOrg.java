package com.chinacreator.xqgk.bean.base;

public class DeptRelationOrg {

	private String deptCode;//机构代码
	private String deptName;//机构名称
	private String dataDeptCode;//数据机构代码（此部门查看哪个机构的数据）
	private String dataDeptName;//数据机构名称（此部门查看哪个机构的数据）
	private String dutyDeptCode;//值班机构代码（此部门属于哪个值班部门）
	private String dutyDeptName;//值班机构代码（此部门属于哪个值班部门）
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
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
