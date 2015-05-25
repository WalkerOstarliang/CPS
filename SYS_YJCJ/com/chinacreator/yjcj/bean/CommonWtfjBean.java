package com.chinacreator.yjcj.bean;

import java.io.File;

import com.chinacreator.common.bean.BaseValue;

public class CommonWtfjBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 3341690463651763418L;
	
	private String fjid; 
	private String wtid;
	private File upload; 
	private String type;
	private String wthdid;
	
	public String getFjid()
	{
		return fjid;
	}
	public void setFjid(String fjid)
	{
		this.fjid = fjid;
	}
	public String getWtid()
	{
		return wtid;
	}
	public void setWtid(String wtid)
	{
		this.wtid = wtid;
	}
	public File getUpload()
	{
		return upload;
	}
	public void setUpload(File upload)
	{
		this.upload = upload;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String getWthdid()
	{
		return wthdid;
	}
	public void setWthdid(String wthdid)
	{
		this.wthdid = wthdid;
	}
	
}
