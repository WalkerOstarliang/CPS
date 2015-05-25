package com.chinacreator.zagl.services;

import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.cps.chart.Charts;
import com.chinacreator.common.cps.chart.FusionChartsUtils;
import com.chinacreator.zagl.dao.WorkbenchManageDao;

public class WorkbenchManageService extends BaseValue {

	private static final long serialVersionUID = 3158491255621509941L;
	
	/**
	 * 单位类别分布情况
	 * @return
	 */
	public String getOrgTypeStatistics(){
		List<Charts> list =  WorkbenchManageDao.getOrgTypeStatistics();
		String xmlStr = FusionChartsUtils.creatSingleCharts(list);
		return xmlStr;
	}
	
	public String getOrgStatistics(String orgcode){
		int leve = -1;
		if(orgcode != null && !"".equals(orgcode)){
			leve = getLeve(orgcode);
		}
		List<Charts> list = WorkbenchManageDao.getOrgStatistics(orgcode, leve);
		Map<String,String> map = FusionChartsUtils.getChartCfgMap();
		String xmlStr = FusionChartsUtils.creatSingleCharts(list,map);
		return xmlStr;
	}
	
	private int getLeve(String orgcode) {
		int leve;
		// 省级 
		if (orgcode.substring(2, 4).equals("00"))
		{
			leve = 1;
		}
		// 市级
		else if (orgcode.substring(4, 6).equals("00"))
		{
			leve = 2;
		}
		// 县级
		else if (orgcode.substring(6, 8).equals("00"))
		{
			leve = 3;
		}
		//派出所
		else if (orgcode.substring(8, 10).equals("00"))
		{
			leve = 4;
		}
		//其他警务室/区
		else
		{
			leve = 5;
		}
		return leve;
	}

}
