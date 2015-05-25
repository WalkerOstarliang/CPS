package com.chinacreator.sso.bean;

/**
 * 单点SSO统一认证登录数据对象
 * 
 * @filename SSOContentBean.java
 * @author mingchun.xiong
 * @date Sep 3, 2014
 *
 */
public class SSOContentBean
{
	private String version;
	
	private String subjectdn;
	
	private String key;
	
	private String serialNumber;
	
	private String sfzh;

	public String getVersion()
	{
		return version;
	}

	public void setVersion(String version)
	{
		this.version = version;
	}

	

	public String getSubjectdn()
	{
		return subjectdn;
	}

	public void setSubjectdn(String subjectdn)
	{
		this.subjectdn = subjectdn;
	}

	public String getKey()
	{
		return key;
	}

	public void setKey(String key)
	{
		this.key = key;
	}

	public String getSerialNumber()
	{
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber)
	{
		this.serialNumber = serialNumber;
	}

	public String getSfzh()
	{
		if (subjectdn != null && !subjectdn.equals(""))
		{
			String[] subArr = subjectdn.split(",");
			for (String sub : subArr)
			{
				String[] subsubArr = sub.split("=");
				if ("CN".equals(subsubArr[0].trim()))
				{
					String[] userinfos = subsubArr[1].trim().split(" ");
					sfzh = userinfos[1].trim().toUpperCase();
					break;
				}
			}
		}
		return sfzh;
	}

	public void setSfzh(String sfzh)
	{
		this.sfzh = sfzh;
	}
	
}
