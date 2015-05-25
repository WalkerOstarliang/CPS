package com.chinacreator.xtgl.service;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.xtgl.bean.DwjcpzBean;
import com.chinacreator.xtgl.bean.JjrzdBean;

public interface DwjcpzService extends Serializable{

	/**
	 * 保存单位检查配置
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public DwjcpzBean saveDwjcpz(DwjcpzBean bean) throws Exception;
	
	
	/**
	 * 删除单位检查配置
	 * @param id
	 * @throws SQLException
	 */
	public void deleteDwjcpz(String ids) throws SQLException;
	
	/**
	 * 根据id查询单位检查配置
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public DwjcpzBean queryDwjcpzById(String id) throws SQLException; 
	
	/**
	 * 分页查询单位检查配置
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DwjcpzBean> queryDwjcpzPageResultInfo(PageInfo pageInfo,QueryBean bean) throws SQLException;
	
	/**
	 * 获取节假日
	 * @return
	 * @throws SQLException
	 */
	public List<JjrzdBean> getJjrZd() throws SQLException;
}
