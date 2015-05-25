package com.chinacreator.afgl.bean;

import java.io.File;

import com.chinacreator.common.bean.BaseValue;

public class AfSqwfsszpxxBean extends BaseValue
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 5419284136946876986L;
	
	private String id;
	
	private String sbbh;
	
	private String zpms;
	
	private File zp;
	
	private String zpmc;

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getSbbh()
	{
		return sbbh;
	}

	public void setSbbh(String sbbh)
	{
		this.sbbh = sbbh;
	}

	public String getZpms()
	{
		return zpms;
	}

	public void setZpms(String zpms)
	{
		this.zpms = zpms;
	}

	public File getZp()
	{
		return zp;
	}

	public void setZp(File zp)
	{
		this.zp = zp;
	}

	public String getZpmc()
	{
		return zpmc;
	}

	public void setZpmc(String zpmc)
	{
		this.zpmc = zpmc;
	}
	
	
}
