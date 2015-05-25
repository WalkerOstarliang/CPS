package com.chinacreator.zagl.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.zagl.bean.DdcBean;

public interface DdcDao extends Serializable {
	
	/**
	 * 新增电动车
	 * @param bean
	 * @throws SQLException
	 */
	public void insertDdc(DdcBean bean) throws SQLException;
	
	/**
	 * 修改电动车信息
	 * @param bean
	 * @throws SQLException
	 */
	public void updateDdc(DdcBean bean) throws SQLException;
	
	/**
	 * 根据ID查询电动车信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public DdcBean queryDdcById(String id) throws SQLException;
	
	/**
	 * 分页查询电动车信息
	 * @param bean
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DdcBean> queryDdcList(QueryBean bean,PageInfo pageinfo) throws SQLException;
	
	/**
	 * 查询电动车列表
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public List<DdcBean> queryDdcList(QueryBean bean) throws SQLException;
	
	/**
	 * 选择其中某几条记录导出
	 * @param v_ddcid
	 * @return
	 * @throws SQLException
	 */
	public List<DdcBean> queryDdcListByINDdcid(String v_ddcid) throws SQLException;
	
}
