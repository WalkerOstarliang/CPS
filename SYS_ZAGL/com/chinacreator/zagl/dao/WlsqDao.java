package com.chinacreator.zagl.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.zagl.bean.SqQQqBean;
import com.chinacreator.zagl.bean.SqltBean;
import com.chinacreator.zagl.bean.SqwzBean;
import com.chinacreator.zagl.bean.WlsqBean;

public interface WlsqDao extends Serializable {
	
	/**
	 * 新增网络社区
	 * @param bean
	 * @return
	 */
	public WlsqBean insertWlsq(WlsqBean bean) throws SQLException;
	
	/**
	 * 新增社区论坛
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public SqltBean insertSqlt(SqltBean bean) throws SQLException;
	
	/**
	 * 新增社区网站
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public SqwzBean insertSqwz(SqwzBean bean) throws SQLException;
	
	/**
	 * 新增社区QQ群
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public SqQQqBean insertSqQQq(SqQQqBean bean) throws SQLException;
	
	/**
	 * 修改网络社区
	 * @param bean
	 * @return
	 */
	public WlsqBean updateWlsq(WlsqBean bean)throws SQLException;
	
	/**
	 * 根据网络社区编号删除社区网站
	 * @param wlsqbh 网络社区编号
	 * @throws SQLException
	 */
	public void deleteSqwzByWlsqbh(String wlsqbh) throws SQLException;
	
	/**
	 * 根据网络社区编号删除社区论坛
	 * @param wlsqbh
	 * @throws SQLException
	 */
	public void deleteSqltByWlsqbh(String wlsqbh) throws SQLException;
	
	/**
	 * 根据网络社区编号删除社区QQ群
	 * @param wlsqbh
	 * @throws SQLException
	 */
	public void deleteSqQQqByWlsqbh(String wlsqbh) throws SQLException;
	
	/**
	 * 根据网络社区编号删除网络社区
	 * @param bean
	 * @throws SQLException
	 */
	public void deleteWlsqByWlsqbh(WlsqBean bean)throws SQLException;
	
	/**
	 * 根据网络社区编号查询社区网站
	 * @param wlsqbh
	 * @return
	 * @throws SQLException
	 */
	public List<SqwzBean> querySqwzByWlsqbh(String wlsqbh) throws SQLException;
	
	/**
	 * 根据网络社区编号查询社区论坛
	 * @param wlsqbh
	 * @return
	 * @throws SQLException
	 */
	public List<SqltBean> querySqltByWlsqbh(String wlsqbh) throws SQLException; 
	
	/**
	 * 根据网络社区编号查询社区QQ群
	 * @param wlsqbh
	 * @return
	 * @throws SQLException
	 */
	public List<SqQQqBean> querySqQQqByWlsqbh(String wlsqbh) throws SQLException;
	
	/**
	 * 根据网络社区编号查询网络社区
	 * @param wlsqbh
	 * @return
	 */
	public WlsqBean queryWlsqByWlsqbh(String wlsqbh)throws SQLException;
	
	/**
	 * 分页查询网络社区
	 * @param pageInfo 分页信息
	 * @param queryBean 查询条件
	 * @return
	 */
	public PageResultInfo<WlsqBean> queryWlsqByPageResultInfo(PageInfo pageInfo,QueryBean queryBean)throws Exception;
}
