package com.chinacreator.common.bean;

import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 查询对象的公共信息
 * @author Administrator
 *
 */
public class QueryBean extends BaseValue
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 3230726759441056365L;
	//警号
	private String username;
	
	//机构代码
	private String orgcode;
	
	// 市级代码
	private String citydm;
	
	private boolean citydisabled = false;

	// 县代码
	private String countrydm;
	
	private boolean countrydisabled = false;
	
	//街道乡镇
	private String jdxzdm;
	
	//社区
	private String sqdm;
	
	//市级公安机构代码
	private String citygajgjgdm;
	
	//县区公安机构代码
	private String countrygajgjgdm;
	
	//派出所代码
	private String pcsdm;
	
	//警务社区代码
	private String jwsqdm;
	
	//单位级别 1：省级用户 2：市级用户 3：县级用户 4：派出所用户 5：社区民警
	private int leve;
	
	private int pagesize = 10;
	
	private int currentpage = 1;
	
	private long start;
	
	private long end;
	

	public String getCitydm() {
		return citydm;
	}

	public void setCitydm(String citydm) {
		this.citydm = citydm;
	}

	public String getCountrydm() {
		return countrydm;
	}

	public void setCountrydm(String countrydm) {
		this.countrydm = countrydm;
	}

	public String getPcsdm() {
		return pcsdm;
	}
	
	public void setPcsdm(String pcsdm) {
		this.pcsdm = pcsdm;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	
	public String getJwsqdm() {
		return jwsqdm;
	}

	public void setJwsqdm(String jwsqdm) {
		this.jwsqdm = jwsqdm;
	}

	public int getLeve() 
	{
		if (leve <= 0)
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			if (loginInfo != null)
			{
				leve = loginInfo.getLeve();
			}
		}
		return leve;
	}

	public void setLeve(int leve) {
		this.leve = leve;
	}

	public String getCitygajgjgdm()
	{
		return citygajgjgdm;
	}

	public void setCitygajgjgdm(String citygajgjgdm)
	{
		this.citygajgjgdm = citygajgjgdm;
	}

	public String getCountrygajgjgdm()
	{
		return countrygajgjgdm;
	}

	public void setCountrygajgjgdm(String countrygajgjgdm)
	{
		this.countrygajgjgdm = countrygajgjgdm;
	}

	public String getJdxzdm()
	{
		return jdxzdm;
	}

	public void setJdxzdm(String jdxzdm)
	{
		this.jdxzdm = jdxzdm;
	}

	public String getSqdm()
	{
		return sqdm;
	}

	public void setSqdm(String sqdm)
	{
		this.sqdm = sqdm;
	}

	public boolean getCitydisabled()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo != null && ValidateHelper.isNotEmptyString(loginInfo.getCitydm()))
		{
			citydisabled = true;
		}
		return citydisabled;
	}

	public void setCitydisabled(boolean citydisabled)
	{
		this.citydisabled = citydisabled;
	}

	public boolean getCountrydisabled()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo != null && ValidateHelper.isNotEmptyString(loginInfo.getCountrydm()))
		{
			countrydisabled = true;
		}
		return countrydisabled;
	}

	public void setCountrydisabled(boolean countrydisabled)
	{
		this.countrydisabled = countrydisabled;
	}

	public int getPagesize()
	{
		return pagesize;
	}

	public void setPagesize(int pagesize)
	{
		this.pagesize = pagesize;
	}

	public int getCurrentpage()
	{
		return currentpage;
	}

	public void setCurrentpage(int currentpage)
	{
		this.currentpage = currentpage;
	}

	public long getStart()
	{
		start = (currentpage-1) * 10;
		return start;
	}

	public void setStart(long start)
	{
		this.start = start;
	}

	public long getEnd()
	{
		end = getStart() + pagesize;
		return end;
	}

	public void setEnd(long end)
	{
		this.end = end;
	}
}
