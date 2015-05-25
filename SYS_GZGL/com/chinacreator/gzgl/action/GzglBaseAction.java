package com.chinacreator.gzgl.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.chinacreator.common.cps.action.CPSBaseAction;

/**
 * 工作管理公共action
 * @author royee
 *
 */
public class GzglBaseAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3874033548800836810L;
	
	protected static final String MODE_VIEW = "view";
	
	protected static final String MODE_EDIT = "edit";
	
	/**
	 * 操作模式
	 */
	private String viewMode = MODE_EDIT;
	
	private String now = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

	public String getViewMode()
	{
		return viewMode;
	}

	public void setViewMode(String viewMode)
	{
		this.viewMode = viewMode;
	}

	public String getNow()
	{
		return now;
	}

	public void setNow(String now)
	{
		this.now = now;
	}
	
	
}
