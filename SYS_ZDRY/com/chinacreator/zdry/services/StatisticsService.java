package com.chinacreator.zdry.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.cps.chart.Charts;
import com.chinacreator.common.cps.chart.FusionChartsUtils;
import com.chinacreator.zdry.constant.ZdryConstant;
import com.chinacreator.zdry.dao.StatisticsDao;
import com.chinacreator.zdry.query.StatisticsQueryBean;


/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(报表逻辑层类)
 * @date Mar 7, 2013 9:20:25 AM
 */
public class StatisticsService implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6547850653296099077L;
	
	public String indexZdryLx(StatisticsQueryBean statisticsQueryBean) throws Exception{
		List<Charts> list = StatisticsDao.indexZdryLb(statisticsQueryBean); 
		String xmlStr = FusionChartsUtils.creatSingleCharts(list);
		return xmlStr;
	}
	
	public String indexZdryGk(StatisticsQueryBean statisticsQueryBean) throws Exception{
		List<StatisticsQueryBean> list = StatisticsDao.indexZdryGk(statisticsQueryBean);
		List<Charts> chartList = convertList(list);
		String xmlStr = FusionChartsUtils.creatMutilCharts(chartList);
		return xmlStr;
	}
	
	
	private List<Charts> convertList(List<StatisticsQueryBean> list ){
		List<Charts> chartList = new ArrayList<Charts>();
		if(null != list){
			Map<String,Object> ZdryData = new HashMap<String, Object>();
			Map<String,Object> ZdryGkData = new HashMap<String, Object>();
			Charts ZdryCharts = new Charts();
			Charts ZdryGkCharts = new Charts();
			for(int i=0; i<list.size(); i++){
				StatisticsQueryBean sb = list.get(i);
				ZdryData.put(sb.getTitle(), sb.getZdryCount());
				ZdryGkData.put(sb.getTitle(), sb.getZdryGkCount());
			}
			ZdryCharts.setTitle(ZdryConstant.ZDRY_RSTJ);
			ZdryCharts.setMutilData(ZdryData);
			chartList.add(ZdryCharts);
			
			ZdryGkCharts.setTitle(ZdryConstant.ZDRY_RSGKTJ);
			ZdryGkCharts.setMutilData(ZdryGkData);
			chartList.add(ZdryGkCharts);
		}
		return chartList;
	}
}
