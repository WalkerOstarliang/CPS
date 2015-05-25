package com.chinacreator.xtgl.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 问题数据配置
 * 
 * @filename WtsjtjfxpzBean.java
 * @author mingchun.xiong
 * @date Apr 18, 2014
 *
 */
public class WtsjtjfxpzBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -5053802215679022334L;
	private String id;
	
	private String sjtype;
	
	private String querysql;
	
	private String showfields;
	
	private String showfieldnames;
	
	private String orgcode;
	
	private String tjqssj;
	
	private String tjjzsj;

	private String djmjdetail;
	
	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getSjtype()
	{
		return sjtype;
	}

	public void setSjtype(String sjtype)
	{
		this.sjtype = sjtype;
	}

	public String getQuerysql()
	{
		return querysql;
	}

	public void setQuerysql(String querysql)
	{
		this.querysql = querysql;
	}

	public String getShowfields()
	{
		return showfields;
	}

	public void setShowfields(String showfields)
	{
		this.showfields = showfields;
	}

	public String getShowfieldnames()
	{
		return showfieldnames;
	}

	public void setShowfieldnames(String showfieldnames)
	{
		this.showfieldnames = showfieldnames;
	}

	public String getOrgcode()
	{
		return orgcode;
	}

	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
	}

	public String getTjqssj()
	{
		return tjqssj;
	}

	public void setTjqssj(String tjqssj)
	{
		this.tjqssj = tjqssj;
	}

	public String getTjjzsj()
	{
		return tjjzsj;
	}

	public void setTjjzsj(String tjjzsj)
	{
		this.tjjzsj = tjjzsj;
	}

	public String getDjmjdetail()
	{
		return djmjdetail;
	}

	public void setDjmjdetail(String djmjdetail)
	{
		this.djmjdetail = djmjdetail;
	}
	
}
