package com.chinacreator.menu.bean;

import com.chinacreator.common.bean.QueryConditionBean;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class MhtjQueryBean extends QueryConditionBean
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 8009687803963155481L;
	
	private String orgcode;
	
	private String orgname;
	
	private String dwdm;
	
	private String dwmc;
	
	private String parent_dm;
	
	//统计级别
	private int leve;

	private String start;
	
	private String length;
	
	private String startdate;
	
	private String enddate;
	
	//单位级别
	private int orgLeve;
	
	private String tjyf;
	
	public String getParent_dm()
	{
		return parent_dm;
	}

	public void setParent_dm(String parentDm)
	{
		parent_dm = parentDm;
	}

	public int getLeve()
	{
		return leve;
	}

	public void setLeve(int leve)
	{
		this.leve = leve;
	}

	public String getStart()
	{
		start = String.valueOf(2 * leve + 1);
		return start;
	}

	public void setStart(String start)
	{
		this.start = start;
	}

	public String getLength()
	{
		length = String.valueOf(12 - Integer.parseInt(getStart()) + 1);
		return length;
	}

	public void setLength(String length)
	{
		this.length = length;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
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

	public String getOrgcode()
	{
		return orgcode;
	}

	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
	}

	public int getOrgLeve() {
		return orgLeve;
	}

	public void setOrgLeve(int orgLeve) {
		this.orgLeve = orgLeve;
	}

	public String getTjyf()
	{
		return tjyf;
	}

	public void setTjyf(String tjyf)
	{
		this.tjyf = tjyf;
	}

	public String getOrgname()
	{
		orgname = DictionaryCacheHellper.getOrganizationOrgNameByCode(orgcode);
		return orgname;
	}

	public void setOrgname(String orgname)
	{
		this.orgname = orgname;
	}
	
	
}
