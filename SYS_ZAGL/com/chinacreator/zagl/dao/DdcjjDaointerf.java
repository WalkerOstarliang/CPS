package com.chinacreator.zagl.dao;

import java.io.Serializable;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.zagl.bean.DdcjjBean;
import com.chinacreator.zagl.bean.DdcjjQueryBean;

public interface DdcjjDaointerf extends Serializable {
	/*
	 * 根据QueryBean 查询交警采集的电动车list
	 * 分页查
	 * */
	public PageResultInfo<DdcjjBean> queryDdcjjList(DdcjjQueryBean ddcjjquerybean,PageInfo pageInfo);
	
	/*
	 * 根据ID查询交警采集的电动车Bean
	 * */
	public DdcjjBean queryDdcjjBeanById(String id);
	
	/*
	 * 导出列表信息EXECL文件
	 * */
	public List<DdcjjBean> dowloadExcel(DdcjjQueryBean ddcjjquerybean);
	
	public List<DdcjjBean> queryDdcjjListByCar_id(String v_car_id);
}
