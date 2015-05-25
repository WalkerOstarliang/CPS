package com.chinacreator.common.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class UserBean extends BaseValue
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 158823269768582007L;
	
	private String userid;
	
	private String username;
	
	private String realname;
	
	private String realnamepy;
	
	private String mobile;
	
	private String telephone;
	
	private String sfzh;
	
	private String orgcode;
	
	private String orgname;

	// 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
	private int leve;
	
	private String pcsdm;
	
	private String pcsmc;
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

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

	public String getRealnamepy() {
		return realnamepy;
	}

	public void setRealnamepy(String realnamepy) {
		this.realnamepy = realnamepy;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

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

	public String getPcsdm() {
		int le = getLeve();
		if (le >= 4)
		{
			pcsdm = orgcode.substring(0, 8) + "0000";
		}
		else
		{
			pcsdm = null;
		}
		return pcsdm;
	}

	public void setPcsdm(String pcsdm) {
		this.pcsdm = pcsdm;
	}

	public String getPcsmc() {
		pcsmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(pcsdm);
		return pcsmc;
	}

	public void setPcsmc(String pcsmc) {
		this.pcsmc = pcsmc;
	}

	public int getLeve() {
		// 省级 
		if (orgcode.substring(2, 4).equals("00"))
		{
			leve = 1;
		}
		// 市级
		else if (orgcode.substring(4, 6).equals("00"))
		{
			leve = 2;
		}
		// 县级
		else if (orgcode.substring(6, 8).equals("00"))
		{
			leve = 3;
		}
		//派出所
		else if (orgcode.substring(8, 10).equals("00"))
		{
			leve = 4;
		}
		//其他警务室/区
		else
		{
			leve = 5;
		}
		return leve;
	}

	public void setLeve(int leve) {
		this.leve = leve;
	}
	
	
}
