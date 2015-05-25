package com.chinacreator.afgl.action;

import com.chinacreator.afgl.services.HomeService;
import com.chinacreator.common.cps.action.CPSBaseAction;

/**
 * home信息
 */
public class HomeAction extends CPSBaseAction{

	private static final long serialVersionUID = 7309901752134378580L;
	private HomeService homeService = new HomeService();
	private String dwdm;
	private String dwlevel;
	/**
	 * 卡口盘查情况统计
	 */
	public void kkpcqktjList() throws Exception{
		String chartXML = homeService.homeKkfbqk(dwdm, dwlevel);
		returnValue(chartXML);
	}
	
	/**
	 * 卡口分布情况
	 */
	public void homeKkfbqk() throws Exception{
		String chartXML = homeService.homeKkfbqk(dwdm, dwlevel);
		returnValue(chartXML);
	}
	
	/**
	 * 安防机构统计
	 */
	public void afjgtjList() throws Exception{
		String chartXML = homeService.homeKkfbqk(dwdm, dwlevel);
		returnValue(chartXML);
	}

	public String getDwdm() {
		return dwdm;
	}

	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}

	public String getDwlevel() {
		return dwlevel;
	}

	public void setDwlevel(String dwlevel) {
		this.dwlevel = dwlevel;
	}

}
