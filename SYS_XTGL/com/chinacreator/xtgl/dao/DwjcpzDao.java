package com.chinacreator.xtgl.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.xtgl.bean.DwjcpzBean;
import com.chinacreator.xtgl.bean.JjrzdBean;

public interface DwjcpzDao extends Serializable {
	
	/**
	 * 新增单位检查配置
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public DwjcpzBean insertDwjcpz(DwjcpzBean bean) throws SQLException;
	
	/**
	 * 修改单位检查周期配置
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public DwjcpzBean updateDwjcpz(DwjcpzBean bean) throws SQLException;
	
	/**
	 * 批量删除单位检查配置
	 * @param ids
	 * @throws SQLException
	 */
	public void batchDeleteDwjcpz(List<DwjcpzBean> beans) throws SQLException;
	
	/**
	 * 分页查询单位检查配置
	 * @param pageinfo
	 * @param queryBean
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DwjcpzBean> queryDwjcpzPageResultInfo(PageInfo pageinfo,QueryBean queryBean) throws SQLException;
	
	/**
	 * 根据id查询单位检查配置
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public DwjcpzBean queryDwjcpzById(String id) throws SQLException;
	
	/**
	 * 获取节假日
	 * @return
	 * @throws SQLException
	 */
	public List<JjrzdBean> getJjrZd() throws SQLException;
	
	/**
	 * 新增节假日检查
	 * @param jjrList
	 * @throws SQLException
	 */
	public void insertJjrjc(List<JjrzdBean> jjrList) throws SQLException;
	
	/**
	 * 删除节假日检查
	 * @param id
	 * @throws SQLException
	 */
	public void deleteJjrjc(String id) throws SQLException;
	
	/**
	 * 根据单位检查配置id查询节假日检查
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<JjrzdBean> queryJjrjcById(String id) throws SQLException;

}
