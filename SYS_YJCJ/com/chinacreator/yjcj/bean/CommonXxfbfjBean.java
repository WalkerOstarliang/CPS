package com.chinacreator.yjcj.bean;

import java.io.File;

import com.chinacreator.common.bean.BaseValue;

public class CommonXxfbfjBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 3992699534123120228L;
	
	private String fjid;
	private String xxid;
	private String uploadfilename;
	private File upload;
	public String getFjid()
	{
		return fjid;
	}
	public void setFjid(String fjid)
	{
		this.fjid = fjid;
	}
	public String getXxid()
	{
		return xxid;
	}
	public void setXxid(String xxid)
	{
		this.xxid = xxid;
	}
	public String getUploadfilename()
	{
		return uploadfilename;
	}
	public void setUploadfilename(String uploadfilename)
	{
		this.uploadfilename = uploadfilename;
	}
	public File getUpload()
	{
		return upload;
	}
	public void setUpload(File upload)
	{
		this.upload = upload;
	}
	
	
}
