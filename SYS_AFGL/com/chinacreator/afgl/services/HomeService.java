package com.chinacreator.afgl.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.chinacreator.afgl.bean.AfjgtjBean;
import com.chinacreator.afgl.bean.KkfbqkBean;
import com.chinacreator.afgl.bean.KkpcqktjBean;
import com.chinacreator.afgl.dao.HomeDao;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.chart.Charts;
import com.chinacreator.common.cps.chart.FusionChartsUtils;

/**
 * home页面信息
 *
 */
public class HomeService {
	
	/**
	 * 卡口盘查情况统计
	 */
	public  PageResultInfo<KkpcqktjBean> kkpcqktjList(PageInfo pageInfo, String dwdm, String dwlevel) throws Exception{
		return HomeDao.kkpcqktjList(pageInfo, dwdm, dwlevel);
	}

	/**
	 * 卡口分布情况
	 */
	public String homeKkfbqk(String dwdm, String dwlevel) throws Exception{
		List<KkfbqkBean> list = HomeDao.homeKkfbqk(dwdm, dwlevel);
		List<Charts> chartslist = new ArrayList<Charts>();
		for (KkfbqkBean kkfbqkBean : list) {
			if(null != kkfbqkBean){
				Charts charts = new Charts();
				charts.setData(kkfbqkBean.getData());
				charts.setTitle(kkfbqkBean.getTitle());
				charts.setLink("javascript:kkfbqklist('"+kkfbqkBean.getDwdm()+"','"+getLeve(kkfbqkBean.getDwdm())+"')");
				chartslist.add(charts);
			}
		}
		Map<String,String> map = FusionChartsUtils.getChartCfgMap();
		map.put("bgColor", "FFFFFF");
		String xmlStr = FusionChartsUtils.creatSingleCharts(chartslist,map);
		return xmlStr;
	}
	public int getLeve(String orgcode) {
		int leve = 0;
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
	/**
	 * 安防机构统计
	 */
	public   PageResultInfo<AfjgtjBean> afjgtjList(PageInfo pageInfo, String dwdm, String dwlevel) throws Exception{
		return HomeDao.afjgtjList(pageInfo, dwdm, dwlevel);
	}
}
