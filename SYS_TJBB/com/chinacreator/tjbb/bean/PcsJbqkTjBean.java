package com.chinacreator.tjbb.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class PcsJbqkTjBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -2812090357588769566L;
	
	private String orgcode;
	
	private String orgname;
	
	private String pcssl;
	
	private String jwqsl;
	
	private String sqmjsl;
	
	private List<PcsJbqkListBean> pcsJbqkList = new ArrayList<PcsJbqkListBean>();

	public String getOrgcode()
	{
		return orgcode;
	}

	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
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

	public List<PcsJbqkListBean> getPcsJbqkList()
	{
		return pcsJbqkList;
	}

	public void setPcsJbqkList(List<PcsJbqkListBean> pcsJbqkList)
	{
		this.pcsJbqkList = pcsJbqkList;
	}

	public String getPcssl()
	{
		return pcssl;
	}

	public void setPcssl(String pcssl)
	{
		this.pcssl = pcssl;
	}

	public String getJwqsl()
	{
		return jwqsl;
	}

	public void setJwqsl(String jwqsl)
	{
		this.jwqsl = jwqsl;
	}

	public String getSqmjsl()
	{
		return sqmjsl;
	}

	public void setSqmjsl(String sqmjsl)
	{
		this.sqmjsl = sqmjsl;
	}
	
	
}
