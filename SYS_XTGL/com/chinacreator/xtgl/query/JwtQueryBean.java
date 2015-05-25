package com.chinacreator.xtgl.query;

import com.chinacreator.common.bean.QueryBean;

public class JwtQueryBean extends QueryBean
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 4994761757106331597L;
	private String id;
	private String jh;
	private String xm;
	private String kc_jwqdm;
	
	private String yxx;
	
	public String getJh()
	{
		return jh;
	}
	public void setJh(String jh)
	{
		this.jh = jh;
	}
	public String getXm()
	{
		return xm;
	}
	public void setXm(String xm)
	{
		this.xm = xm;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getKc_jwqdm()
	{
		return kc_jwqdm;
	}
	public void setKc_jwqdm(String kc_jwqdm)
	{
		this.kc_jwqdm = kc_jwqdm;
	}
	public String getYxx()
	{
		return yxx;
	}
	public void setYxx(String yxx)
	{
		this.yxx = yxx;
	}
	
	
}
