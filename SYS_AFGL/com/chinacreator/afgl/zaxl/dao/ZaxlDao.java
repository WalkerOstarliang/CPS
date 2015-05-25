package com.chinacreator.afgl.zaxl.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.afgl.zaxl.bean.XldyxxBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlPcdxBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlQueryBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlRyBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlSqgbBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;

public interface ZaxlDao extends Serializable {
	/**
	 * 保存治安巡逻民警list
	 * @param zaxlrymjlist
	 * @throws SQLException
	 */
	public  void saveZaxlryMjlist(List<ZaxlRyBean> zaxlrymjlist) throws SQLException;

	/**
	 * 新增治安巡逻
	 * @param bean
	 * @throws SQLException
	 */
	public void insertZaxl(ZaxlBean bean) throws SQLException;
	
	/**
	 * 修改治安巡逻
	 * @param bean
	 * @throws SQLException
	 */
	public void updateZaxl(ZaxlBean bean) throws SQLException;
	
	/**
	 * 注销治安巡逻
	 * @param bean
	 * @throws SQLException
	 */
	public void cancelZaxl(ZaxlBean bean) throws SQLException;
	
	/**
	 * 根据ID注销治安巡逻-盘查人员
	 * @param query
	 * @throws SQLException
	 */
	public void cancelZaxlrpcryById(ZaxlQueryBean query) throws SQLException ;
	
	/**
	 * 根据ID查询治安巡逻
	 * @param id
	 * @throws SQLException
	 */
	public ZaxlBean queryZaxlById(String id) throws SQLException;
	
	/**
	 * 分页查询治安巡逻
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<ZaxlBean> queryZaxlList(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	/**
	 * 分页查询治安巡逻人员
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public  PageResultInfo<ZaxlRyBean> queryZaxlryList(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	/**
	 * 分页查询治安巡逻-- 盘查人员
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public  PageResultInfo<ZaxlPcdxBean> queryZaxlpcryList(QueryBean query,PageInfo pageinfo) throws SQLException;

	
	
	
	/**
	 * 根据ID注销治安巡逻-巡逻人员
	 * @param query
	 */
	public void cancelZaxlryById(ZaxlQueryBean query);
	
	/**
	 * 分页查询巡逻队友信息
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<XldyxxBean> queryXlmjlList(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	/**
	 * 分页查询社区干部
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<ZaxlSqgbBean> querySqgblList(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	/**
	 * 保存治安巡逻 -- 盘查人员
	 * @param bean
	 */
	public void saveXlpcryxxInfoBean(ZaxlPcdxBean bean);
	
}
