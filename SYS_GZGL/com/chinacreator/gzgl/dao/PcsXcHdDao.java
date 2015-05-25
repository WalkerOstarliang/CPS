package com.chinacreator.gzgl.dao;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.gzgl.bean.PcsXcHdBean;
import com.chinacreator.gzgl.bean.PcsXcHdTjBean;
import com.chinacreator.gzgl.bean.PcsXcHdZpBean;

/**
 * 派出所宣传活动dao
 */
public interface PcsXcHdDao extends Serializable {
	
	/**
	 * 新增派出所宣传活动
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public void insertPcsXcHd(PcsXcHdBean bean) throws SQLException;
	
	/**
	 * 修改派出所宣传活动
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public void updatePcsXcHd(PcsXcHdBean bean) throws SQLException;
	
	/**
	 * 注销派出所宣传活动
	 * @param bean
	 * @throws SQLException
	 */
	public void DeletePcsXcHd(PcsXcHdBean bean) throws SQLException;
	
	/**
	 * 根据ID查询Id查询派出所宣传活动
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public PcsXcHdBean queryPcsXcHdById(String id) throws SQLException;
	
	/**
	 * 查询派出所宣传活动列表
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<PcsXcHdBean> queryPcsXcHdList(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	
	/**
	 * 新增派出所宣传活动照片
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public void insertXcHdZp(PcsXcHdZpBean bean) throws SQLException; 
	
	
	/**
	 * 根据ID删除照片
	 * @param zpid
	 * @throws SQLException
	 */
	public void deleteXcHdZpById(String zpid) throws SQLException; 
	
	/**
	 * 根据活动ID查询宣传活动照片
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<PcsXcHdZpBean> queryZpByHdid(String id) throws SQLException;
	
	/**
	 * 根据照片ID查询活动照片
	 * @param zpid
	 * @return
	 * @throws SQLException
	 */
	public Blob queryHdZpById(String zpid) throws SQLException;
	
	/**
	 * 查询派出所宣传活动统计
	 * @param query
	 * @return
	 * @throws SQLException
	 */
	public List<PcsXcHdTjBean> queryPcsXcHdTj(QueryBean query) throws SQLException;
}
