package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 社区干部查询对象
 * @author mingchun.xiong
 *
 */
public class SqgbxxQueryBean extends QueryBean
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2046596522625716732L;
	
	private String gbxm;
	
	private String gbsfzh;
	
	private String sssqbh;
	
	private String lx;

	public String getGbxm() {
		return gbxm;
	}

	public void setGbxm(String gbxm) {
		this.gbxm = gbxm;
	}

	public String getSssqbh() {
		return sssqbh;
	}

	public void setSssqbh(String sssqbh) {
		this.sssqbh = sssqbh;
	}

	public String getGbsfzh()
	{
		return gbsfzh;
	}

	public void setGbsfzh(String gbsfzh)
	{
		this.gbsfzh = gbsfzh;
	}

	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}
	
}
