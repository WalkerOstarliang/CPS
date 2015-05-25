package com.chinacreator.zagl.services;

import java.io.Serializable;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.zagl.bean.DdcBean;

public interface DdcService extends Serializable{
	
	/**
	 * 保存电动车
	 * @return
	 */
	public DdcBean saveDdc(DdcBean bean);
	
	/**
	 * 根据ID查询电动车信息
	 * @param id 电动车ID
	 * @return
	 */
	public DdcBean queryDdcInfoById(String id);
	
	/**
	 * 查询电动车列表
	 * @param query 查询条件
	 * @param pageInfo 分页信息
	 * @return
	 */
	public PageResultInfo<DdcBean> queryDdcList(QueryBean query,PageInfo pageInfo);
	
	/**
	 * 导出Excel
	 * @param query
	 * @return
	 */
	public List<DdcBean> dowloadExcel(QueryBean query);

	/**
	 * 选择某几条记录导出
	 * @param v_ddcid
	 * @return
	 */
	public List<DdcBean> downloadDdccjxzExcel(String v_ddcid);
}
