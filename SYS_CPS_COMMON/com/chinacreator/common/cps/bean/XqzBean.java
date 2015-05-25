package com.chinacreator.common.cps.bean;

import com.chinacreator.common.bean.QueryBean;

public class XqzBean extends QueryBean
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= -8293537340645798396L;
	
	private String id;    //主键ID
	private String xqmc;
	private String sssqmc;    //所属社区名称
	private String sssqdm;    //所属社区代码
	private String ssjwqdm;    //所属警务区代码
	private String ssjwqmc;    //所属警务区名称
	private String zxbs;
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getXqmc()
	{
		return xqmc;
	}
	public void setXqmc(String xqmc)
	{
		this.xqmc = xqmc;
	}
	public String getSssqmc()
	{
		return sssqmc;
	}
	public void setSssqmc(String sssqmc)
	{
		this.sssqmc = sssqmc;
	}
	public String getSssqdm()
	{
		return sssqdm;
	}
	public void setSssqdm(String sssqdm)
	{
		this.sssqdm = sssqdm;
	}
	public String getSsjwqdm()
	{
		return ssjwqdm;
	}
	public void setSsjwqdm(String ssjwqdm)
	{
		this.ssjwqdm = ssjwqdm;
	}
	public String getSsjwqmc()
	{
		return ssjwqmc;
	}
	public void setSsjwqmc(String ssjwqmc)
	{
		this.ssjwqmc = ssjwqmc;
	}
	public String getZxbs()
	{
		return zxbs;
	}
	public void setZxbs(String zxbs)
	{
		this.zxbs = zxbs;
	}
	 
}
