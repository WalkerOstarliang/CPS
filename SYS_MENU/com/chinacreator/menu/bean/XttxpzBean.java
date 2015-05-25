package com.chinacreator.menu.bean;

import com.chinacreator.common.bean.BaseValue;

public class XttxpzBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 7687681646018224246L;
	
	private String id;
	
	private String pzdm;
	
	private String title;
	
	private String description;
	
	private String sql;
	
	private String href;
	
	private String isvalid;
	
	private String executesn;
	
	private String resultfield;
	
	private String setfield;
	
	private String iconpath;
	
	/**
	 * 导出Excel的sql
	 */
	private String downloadSql;

	public String getDownloadSql() {
		return downloadSql;
	}

	public void setDownloadSql(String downloadSql) {
		this.downloadSql = downloadSql;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getPzdm()
	{
		return pzdm;
	}

	public void setPzdm(String pzdm)
	{
		this.pzdm = pzdm;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public String getSql()
	{
		return sql;
	}

	public void setSql(String sql)
	{
		this.sql = sql;
	}

	public String getHref()
	{
		return href;
	}

	public void setHref(String href)
	{
		this.href = href;
	}

	public String getIsvalid()
	{
		return isvalid;
	}

	public void setIsvalid(String isvalid)
	{
		this.isvalid = isvalid;
	}

	public String getExecutesn()
	{
		return executesn;
	}

	public void setExecutesn(String executesn)
	{
		this.executesn = executesn;
	}

	public String getResultfield()
	{
		return resultfield;
	}

	public void setResultfield(String resultfield)
	{
		this.resultfield = resultfield;
	}

	public String getSetfield()
	{
		return setfield;
	}

	public void setSetfield(String setfield)
	{
		this.setfield = setfield;
	}

	public String getIconpath()
	{
		return iconpath;
	}

	public void setIconpath(String iconpath)
	{
		this.iconpath = iconpath;
	}
}
