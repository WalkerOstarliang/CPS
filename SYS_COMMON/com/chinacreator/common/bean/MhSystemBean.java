package com.chinacreator.common.bean;

import com.chinacreator.common.helper.ValidateHelper;

public class MhSystemBean
{
	private String systemdm;
	private String systemname;
	private String projectname;
	private String ip;
	private String port;
	private String href;
	
	public String getSystemdm()
	{
		return systemdm;
	}
	public void setSystemdm(String systemdm)
	{
		this.systemdm = systemdm;
	}
	public String getSystemname()
	{
		return systemname;
	}
	public void setSystemname(String systemname)
	{
		this.systemname = systemname;
	}
	public String getProjectname()
	{
		return projectname;
	}
	public void setProjectname(String projectname)
	{
		this.projectname = projectname;
	}
	public String getIp()
	{
		return ip;
	}
	public void setIp(String ip)
	{
		this.ip = ip;
	}
	public String getPort()
	{
		return port;
	}
	public void setPort(String port)
	{
		this.port = port;
	}
	public String getHref()
	{
		href = "";
		if (ValidateHelper.isNotEmptyString(ip))
		{
			href += ip;
		}
		if (ValidateHelper.isNotEmptyString(port))
		{
			href += ":" + port;
		}
		if (ValidateHelper.isNotEmptyString(projectname))
		{
			href += "/" + projectname;
		}
		return href;
	}
	public void setHref(String href)
	{
		this.href = href;
	}
	
}
