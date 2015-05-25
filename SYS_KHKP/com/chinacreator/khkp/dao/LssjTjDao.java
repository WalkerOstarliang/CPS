package com.chinacreator.khkp.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.khkp.bean.LssjTjBean;
import com.chinacreator.khkp.query.LssjTjQueryBean;

public interface LssjTjDao extends Serializable {
	
	/**
	 * 统计实有人口
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> querySyrk(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计常驻人口
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> queryCzrk(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计流动人口
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> queryLdrk(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计寄住人口
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> queryJzrk(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计未落户人口
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> queryWlhrk(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计境外人口
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> queryJwrk(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计实体
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> querySt(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计房屋
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> queryFw(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计出租房屋
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> queryCzfw(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计单位
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> queryDw(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计从业人员
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> queryCyry(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计出租房屋巡查
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> queryCzfwxc(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 统计流动人口延期
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LssjTjBean> queryLdrkyq(LssjTjQueryBean query,PageInfo pageInfo) throws SQLException;
	
	public List<Map<String, String>> queryRsdfxList(LssjTjQueryBean queryBean) throws SQLException;
}
