package com.chinacreator.zdry.dao;

import java.util.List;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.chart.Charts;
import com.chinacreator.zdry.query.StatisticsQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(报表数据访问层类)
 * @date Mar 7, 2013 9:23:45 AM
 */
public class StatisticsDao implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1981421225102501744L;
	
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/zdry/dao/statistics-sql.xml");
	
	/**
	 * 首页重点人员类型统计
	 * @throws Exception
	 */
	public static List<Charts> indexZdryLb(StatisticsQueryBean statisticsQueryBean) throws Exception{
		List<Charts> resultList = executor.queryListBeanWithDBName(Charts.class, CommonConstant.DBNAME_SQJW, "indexZdryLbSQL",statisticsQueryBean);
		return resultList;
	}
	
	/**
	 * 首页重点人员管控情况统计
	 * @throws Exception
	 */
	public static List<StatisticsQueryBean> indexZdryGk(StatisticsQueryBean statisticsQueryBean) throws Exception{
		
		List<StatisticsQueryBean> resultList = executor.queryListBeanWithDBName(StatisticsQueryBean.class, CommonConstant.DBNAME_SQJW, "indexZdryGkSQL",statisticsQueryBean);
		return resultList;
	}
	
}
