package com.chinacreator.test.bean;

import com.chinacreator.common.bean.BaseValue;

public class User extends BaseValue
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= -8450571879566031081L;
	
	private String username;
	
	private String realname;
	
	private int age;
	
	private String sex;
	
	private String jg;
	
	private String cz;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getJg() {
		return jg;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	public String getCz() {
		cz = "<a href=\"javascript:void(0)\">详细</a>";
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
	
	
}
