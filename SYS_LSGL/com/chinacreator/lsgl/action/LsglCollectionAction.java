package com.chinacreator.lsgl.action;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.lsgl.query.RkQueryBean;

/**
 * 两室采集专栏
 * 
 * @filename LsglCollectionAction.java
 * @author mingchun.xiong
 * @date 2013-10-12
 *
 */
public class LsglCollectionAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 5435162349839907717L;
	private RkQueryBean queryBean;
	
	public LsglCollectionAction()
	{
		super();
		queryBean = new RkQueryBean();
	}
	
	public String toLsglCollection()
	{
		super.initQueryBean(queryBean);
		return "toLsglCollection";
	}

	public RkQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(RkQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}
	
	
}
