package com.chinacreator.dwdj.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.dwdj.bean.WbdwJdhxBean;
import com.chinacreator.dwdj.bean.WbdwQzjcBean;
import com.chinacreator.dwdj.bean.WbdwShBean;
import com.chinacreator.dwdj.bean.WbdwWxhxBean;

public interface WbdwDao extends Serializable {

	/**
	 * 查询危爆单位枪支检查
	 * 
	 * @param qzjcBean
	 * @throws SQLException
	 */
	public PageResultInfo<WbdwQzjcBean> queryWbdwQzjcPageResultInfo(
			PageInfo pageInfo, WbdwQzjcBean queryBean);

	/**
	 * 插入危爆单位枪支检查
	 * 
	 * @param qzjcBean
	 * @throws SQLException
	 */
	public void insertQzjcBean(WbdwQzjcBean qzjcBean) throws SQLException;

	/**
	 * 修改危爆单位枪支检查
	 * 
	 * @param qzjcBean
	 * @throws SQLException
	 */
	public void updateQzjcBean(WbdwQzjcBean qzjcBean) throws SQLException;

	/**
	 * 查询危爆单位枪支检查历史数据
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwQzjcBean> queryWbdwQzjcPageResultInfoByJgbh(
			PageInfo pageInfo, WbdwQzjcBean queryBean);

	/**
	 * 查询危爆单位枪支检查通过id
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwJdhxBean> queryWbdwQzjcPageResultInfoById(
			PageInfo pageInfo, WbdwJdhxBean queryBean);

	/**
	 * 插入危爆单位剧毒化学
	 * 
	 * @param jdhxBean
	 * @throws SQLException
	 */
	public void insertJdhxBean(WbdwJdhxBean jdhxBean) throws SQLException;

	/**
	 * 修改危爆单位剧毒化学
	 * 
	 * @param jdhxBean
	 * @throws SQLException
	 */
	public void updateJdhxBean(WbdwJdhxBean jdhxBean) throws SQLException;

	/**
	 * 查询危爆单位剧毒化学历史数据通过机构编号
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwJdhxBean> queryWbdwJdhxPageResultInfoByJgbh(
			PageInfo pageInfo, WbdwJdhxBean queryBean);

	/**
	 * 查询危爆单位剧毒化学历史数据通过id
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwJdhxBean> queryWbdwJdhxPageResultInfoById(
			PageInfo pageInfo, WbdwJdhxBean queryBean);

	/**
	 * 插入危爆单位危险化学
	 * 
	 * @param wxhxBean
	 * @throws SQLException
	 */
	public void insertWxhxBean(WbdwWxhxBean wxhxBean) throws SQLException;

	/**
	 * 修改危爆单位危险化学
	 * 
	 * @param wxhxBean
	 * @throws SQLException
	 */
	public void updateWxhxBean(WbdwWxhxBean wxhxBean) throws SQLException;

	/**
	 * 查询危爆单位危险化学历史数据通过机构编号
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwWxhxBean> queryWbdwWxhxPageResultInfoByJgbh(
			PageInfo pageInfo, WbdwWxhxBean queryBean);

	/**
	 * 查询危爆单位危险化学历史数据通过id
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	 public PageResultInfo<WbdwWxhxBean> queryWbdwWxhxPageResultInfoById(
			PageInfo pageInfo, WbdwWxhxBean queryBean);
	 
	 /**
	  * 新增危爆单位审核
	  * @param bean
	  * @throws SQLException
	  */
	 public void insertWbdwsh(WbdwShBean bean) throws SQLException;
	 
	 /**
	  * 根据机构编号查询危爆单位审核信息
	  * @param jgbh
	  * @return
	  * @throws SQLException
	  */
	 public List<WbdwShBean> queryWbdwShByJgbh(String jgbh) throws SQLException;
	 
	 /**
	  * 查询危爆单位审核列表
	  * @param pageInfo
	  * @param query
	  * @return
	  * @throws SQLException
	  */
	 public PageResultInfo<WbdwShBean> queryWbDwShList(PageInfo pageInfo,QueryBean query) throws SQLException;
	 
	 /**
	  * 根据ID查询危爆单位审核
	  * @param shid
	  * @return
	  * @throws SQLException
	  */
	 public WbdwShBean queryWbdwShById(String shid) throws SQLException;
	 
	 /**
	  * 根据机构编号更新单位管理状态
	  * @param sfzagl
	  * @param jgbh
	  * @throws SQLException
	  */
	 public void updateDwGlztByJgbh(String sfzagl,String jgbh) throws SQLException;
	 
	 /**
	  * 更具ID更新审核状态
	  * @param shzt
	  * @param shid
	  * @throws SQLException
	  */
	 public void updateWbdwShztById(WbdwShBean wbdwsh) throws SQLException;
}
