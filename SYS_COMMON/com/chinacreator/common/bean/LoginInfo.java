package com.chinacreator.common.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.business.Logininfobusiness;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 用户登录信息
 * @author mingchun.xiong
 *
 */
public class LoginInfo extends BaseValue
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 1499620982760444438L;
	
	private String userid;
	
	private String username;
	
	private String password;
	
	private String realname;
	
	private String realnamepy;
	
	private String moblie;
	
	private String telephone;
	
	private String sfzh;
	
	private String isvalid;
	
	private String createdate;

	private String orgid;
	
	private String orgcode;
	
	private String orgname;
	
	private String parent_code;
	
	private String orgjc;
	
	private String pgis_sqdm;
	
	// 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
	private int leve;
	
	private String rootOrgCode = "430000000000";
	
	private String rootOrgName;
	
	private int rootOrgLeve;

	// 市级代码
	private String citydm;
	
	// 县代码
	private String countrydm;
	
	private String citygajgdm;
	
	private String countrygajgdm;
	
	private String ssgajgjgdm;
	private String ssgajgjgmc;
	private String ssgajgjgjc; //简称
	
	//默认街道乡镇代码
	private String jdxzdm;
	
	//派出所代码
	private String pcsdm;
	private String pcsmc;
	private String pcsjc;  //派出所简称
	//警务社区代码
	private String jwsqdm;
	private String jwsqmc;
	private String jwsqjc; //简称
	
	//行政社区代码
	private String sqdm;
	
	private String jzdm;
	
	//true 高新区，开发区机构 对应多个区县的时候
	private boolean isGxdz;
	
	//高新地区对应的原始行政区划
	private List<String> gxYxzqhList = new ArrayList<String>();
	
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getMoblie() {
		return moblie;
	}

	public void setMoblie(String moblie) {
		this.moblie = moblie;
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

	public String getIsvalid() {
		return isvalid;
	}

	public void setIsvalid(String isvalid) {
		this.isvalid = isvalid;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
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

	public String getParent_code() {
		return parent_code;
	}

	public void setParent_code(String parentCode) {
		parent_code = parentCode;
	}

	public String getOrgjc() {
		return orgjc;
	}

	public void setOrgjc(String orgjc) {
		this.orgjc = orgjc;
	}

	public int getLeve() {
		if (leve == 0)
		{
			Logininfobusiness business = new Logininfobusiness();
			leve = business.getOrgLeve(orgcode);
		}
		return leve;
	}

	public void setLeve(int leve) {
		this.leve = leve;
	}

	public String getCitydm() {
		int le = getLeve();
		//是市级
		if (le >= 2)
		{
			citydm = orgcode.substring(0, 4) + "00";
		}
		else
		{
			citydm = null;
		}
		return citydm;
	}

	public void setCitydm(String citydm) {
		this.citydm = citydm;
	}

	public String getCountrydm() {
		int le = getLeve();
		if (le >= 3)
		{
			countrydm = orgcode.substring(0, 6);
		}
		else
		{
			countrydm = null;
		}
		return countrydm;
	}

	public void setCountrydm(String countrydm) {
		this.countrydm = countrydm;
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

	public String getJwsqdm() {
		int le = getLeve();
		if (le >= 5)
		{
			jwsqdm = orgcode;
		}
		else
		{
			jwsqdm = null;
		}
		return jwsqdm;
	}

	public void setJwsqdm(String jwsqdm) {
		this.jwsqdm = jwsqdm;
	}

	public String getRootOrgCode() {
		int le = getLeve();
		//省
		if (le == 1)
		{
			rootOrgCode = orgcode.substring(0,2) + "0000000000";
		}
		//市
		else if (le == 2)
		{
			rootOrgCode = orgcode.substring(0,4) + "00000000";
		}
		// 县
		else if (le == 3)
		{
			rootOrgCode = orgcode.substring(0,6) + "000000";
		}
		// 派出所
		else if (le == 4)
		{
			rootOrgCode = orgcode.substring(0,8) + "0000";
		}
		else
		{
			rootOrgCode = orgcode.substring(0,8) + "0000";
		}
		return rootOrgCode;
	}

	public void setRootOrgCode(String rootOrgCode) {
		this.rootOrgCode = rootOrgCode;
	}

	public String getSsgajgjgdm()
	{
		if (ValidateHelper.isNotEmptyString(countrydm))
		{
			ssgajgjgdm = countrydm + "000000";
		}
		return ssgajgjgdm;
	}

	public void setSsgajgjgdm(String ssgajgjgdm)
	{
		this.ssgajgjgdm = ssgajgjgdm;
	}

	public String getSsgajgjgmc()
	{
		ssgajgjgmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(getSsgajgjgdm());
		return ssgajgjgmc;
	}

	public void setSsgajgjgmc(String ssgajgjgmc)
	{
		this.ssgajgjgmc = ssgajgjgmc;
	}

	public String getPcsmc()
	{
		pcsmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(getPcsdm());
		return pcsmc;
	}

	public void setPcsmc(String pcsmc)
	{
		this.pcsmc = pcsmc;
	}

	public String getJwsqmc()
	{
		jwsqmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(jwsqdm);
		return jwsqmc;
	}

	public void setJwsqmc(String jwsqmc)
	{
		this.jwsqmc = jwsqmc;
	}

	public String getCitygajgdm()
	{
		if (getCitydm() != null)
		{
			citygajgdm = getCitydm() + "000000";
		}
		return citygajgdm;
	}

	public void setCitygajgdm(String citygajgdm)
	{
		this.citygajgdm = citygajgdm;
	}

	public String getCountrygajgdm()
	{
		if (getCountrydm() != null)
		{
			countrygajgdm = getCountrydm() + "000000";
		}
		return countrygajgdm;
	}

	public void setCountrygajgdm(String countrygajgdm)
	{
		this.countrygajgdm = countrygajgdm;
	}

	public String getJdxzdm()
	{
		return jdxzdm;
	}

	public void setJdxzdm(String jdxzdm)
	{
		this.jdxzdm = jdxzdm;
	}

	public String getPgis_sqdm() {
		return pgis_sqdm;
	}

	public void setPgis_sqdm(String pgis_sqdm) {
		this.pgis_sqdm = pgis_sqdm;
	}

	public String getSqdm() {
		return sqdm;
	}

	public void setSqdm(String sqdm) {
		this.sqdm = sqdm;
	}

	public String getSsgajgjgjc() {
		ssgajgjgjc = DictionaryCacheHellper.getOrganizationOrgSimpleNameByCode(getSsgajgjgdm());
		if(ssgajgjgjc.endsWith("分局")){
			return ssgajgjgjc.replace("分局","");
		}else if(ssgajgjgjc.endsWith("县")){
			return ssgajgjgjc.replace("县", "");
		}
		return "";
	}

	public void setSsgajgjgjc(String ssgajgjgjc) {
		this.ssgajgjgjc = ssgajgjgjc;
	}

	public String getPcsjc() {
		pcsjc = DictionaryCacheHellper.getOrganizationOrgSimpleNameByCode(pcsdm);
		return pcsjc.replace("派出所","");
	}

	public void setPcsjc(String pcsjc) {
		this.pcsjc = pcsjc;
	}

	public String getJwsqjc() {
		jwsqjc = DictionaryCacheHellper.getOrganizationOrgSimpleNameByCode(jwsqdm);
		return jwsqjc.replace("警务区","");
	}

	public void setJwsqjc(String jwsqjc) {
		this.jwsqjc = jwsqjc;
	}

	public String getRootOrgName()
	{
		rootOrgName = DictionaryCacheHellper.getOrganizationOrgNameByCode(rootOrgCode);
		return rootOrgName;
	}

	public void setRootOrgName(String rootOrgName)
	{
		this.rootOrgName = rootOrgName;
	}

	public int getRootOrgLeve()
	{
		if (rootOrgLeve == 0)
		{
			Logininfobusiness business = new Logininfobusiness();
			rootOrgLeve = business.getOrgLeve(rootOrgCode);
		}
		return rootOrgLeve;
	}

	public void setRootOrgLeve(int rootOrgLeve)
	{
		this.rootOrgLeve = rootOrgLeve;
	}

	public String getJzdm()
	{
		return jzdm;
	}

	public void setJzdm(String jzdm)
	{
		this.jzdm = jzdm;
	}

	public boolean getIsGxdz()
	{
		return isGxdz;
	}

	public void setIsGxdz(boolean isGxdz)
	{
		this.isGxdz = isGxdz;
	}

	public List<String> getGxYxzqhList()
	{
		return gxYxzqhList;
	}

	public void setGxYxzqhList(List<String> gxYxzqhList)
	{
		this.gxYxzqhList = gxYxzqhList;
	}

	
	
}
