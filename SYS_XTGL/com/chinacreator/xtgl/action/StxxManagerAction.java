package com.chinacreator.xtgl.action;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dzgl.query.DzxxQueryBean;
import com.chinacreator.xtgl.service.XzqhglService;

/**
 * 实体信息迁移管理
 * 
 * @filename StxxManagerAction.java
 * @author mingchun.xiong
 * @date Mar 10, 2014
 *
 */
public class StxxManagerAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 5192949527819039576L;
	private XzqhglService xzqhService;
	private DzxxQueryBean queryBean;
	private String stids;
	private String toSqdm;
	private String tojwqdm;
	
	public StxxManagerAction()
	{
		queryBean = new DzxxQueryBean();
		xzqhService = new XzqhglService();
	}
	
	public String toStxxManagerPage()
	{
		super.initQueryBean(queryBean);
		return "toStxxManagerPage";
	}
	
	public String toDzxxManagerPage()
	{
		super.initQueryBean(queryBean);
		return "toDzxxManagerPage";
	}
	
	public String toXzqhQyPage()
	{
		super.initQueryBean(queryBean);
		return "toXzqhQyPage";
	}
	
	public void executeStxxChange()
	{
		if (ValidateHelper.isNotEmptyString(stids))
		{
			String[] stidarr = stids.split(",");
			for (String stid : stidarr)
			{
				xzqhService.executeStxxBeanChange(stid, toSqdm, tojwqdm);
			}
		}
		responseWrite(true);
	}

	public DzxxQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(DzxxQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public String getStids()
	{
		return stids;
	}

	public void setStids(String stids)
	{
		this.stids = stids;
	}

	public String getToSqdm()
	{
		return toSqdm;
	}

	public void setToSqdm(String toSqdm)
	{
		this.toSqdm = toSqdm;
	}

	public String getTojwqdm()
	{
		return tojwqdm;
	}

	public void setTojwqdm(String tojwqdm)
	{
		this.tojwqdm = tojwqdm;
	}
	
	
}
