package com.chinacreator.zagl.action;

import com.chinacreator.common.action.BaseAction;
import com.chinacreator.zagl.services.WorkbenchManageService;

/**
 * 工作台管理Action 
 */
public class WorkbenchManageAction extends BaseAction{

	private static final long serialVersionUID = -1581024575960916429L;
	
	private WorkbenchManageService workbenchService;
	
	public WorkbenchManageAction(){
		super();
		workbenchService = new WorkbenchManageService();
	}
	
	/**
	 * 单位类别分布情况
	 */
	public void getOrgTypeStatistics(){
		String chartDate = workbenchService.getOrgTypeStatistics();
		returnValue(chartDate);
	}
	
	/**
	 * 单位分布情况
	 */
	public void getOrgStatistics(){
		String orgCode = request.getParameter("orgCode");
		String chartDate = workbenchService.getOrgStatistics(orgCode);
		returnValue(chartDate);
	}

}
