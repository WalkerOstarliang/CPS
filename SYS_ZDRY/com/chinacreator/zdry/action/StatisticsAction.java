package com.chinacreator.zdry.action;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.zdry.query.StatisticsQueryBean;
import com.chinacreator.zdry.services.StatisticsService;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(统计Action类)
 * @date Mar 7, 2013 9:17:34 AM
 */
public class StatisticsAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4187203195849518595L;
	
	private StatisticsService service = new StatisticsService();
	private StatisticsQueryBean statisticsQueryBean;
	
	public void indexZdryLx(){
		try {
			String chartXML = service.indexZdryLx(statisticsQueryBean);
			//chartXML = "<graph decimalPrecision=\"0\" formatNumberScale=\"0\"><set name=\"上访人员\" value=\"0\" color=\"C4BD91\"/><set name=\"在逃人员\" value=\"0\" color=\"9F11FD\"/><set name=\"肇事精神病人员\" value=\"0\" color=\"868567\"/><set name=\"重点人口\" value=\"0\" color=\"EB389C\"/><set name=\"涉稳人员\" value=\"0\" color=\"B7C0BE\"/><set name=\"刑事犯罪前科\" value=\"0\" color=\"1D8530\"/><set name=\"涉毒人员\" value=\"0\" color=\"0A6288\"/><set name=\"工作对象\" value=\"0\" color=\"C5DA5F\"/><set name=\"涉恐人员\" value=\"0\" color=\"F5C301\"/></graph>";
			returnValue(chartXML);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void indexZdryGk(){
		try {
			String chartXML = service.indexZdryGk(statisticsQueryBean);
			returnValue(chartXML);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String toIndexForwardPage(){
		if(null == statisticsQueryBean){
			statisticsQueryBean = new StatisticsQueryBean();
		}
		return "toIndexHomePage";
	}
	
	public StatisticsQueryBean getStatisticsQueryBean() {
		return statisticsQueryBean;
	}

	public void setStatisticsQueryBean(StatisticsQueryBean statisticsQueryBean) {
		this.statisticsQueryBean = statisticsQueryBean;
	}
	
}
