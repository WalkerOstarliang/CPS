package com.chinacreator.gzgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.bean.RizhiBean;
import com.chinacreator.gzgl.query.RizhiQuery;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 工作日志相关数据库操作dao类
 * @author zhujiaojie
 *
 */
public class RizhiDao
{
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/gzgl/dao/rizhi-sql.xml");
	
	/**
	 * 插入新日志
	 * @param rizhi		日志bean数据	
	 * @throws SQLException		抛sql异常
	 */
	public static void insertRizhiBean(RizhiBean rizhi) throws SQLException
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertRizhi", rizhi);
	}
	
	/**
	 * 查询工作日志
	 * @param condRizhi		查询条件bean
	 * @param page			查询分页page
	 * @return				返回分页结果
	 * @throws SQLException	抛出sql异常
	 */
	public static PageResultInfo<RizhiBean> getRizhiPageResultInfo(RizhiQuery condRizhi, PageInfo page) throws SQLException
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(RizhiBean.class, CommonConstant.DBNAME_SQJW, "queryRizhi", page.getOffset(), page.getPageSize(), condRizhi);
		return PaginationHelper.wrapPageResultInfo(page, listInfo);
	}
	
	/**
	 * 常规查询符合条件的集合
	 * @param condRizi	条件bean
	 * @return	返回结果集
	 * @throws SQLException	可能存在的sql异常
	 */
	public static List<RizhiBean> getRizhiList(RizhiQuery condRizi) throws SQLException
	{
		return executor.queryListBeanWithDBName(RizhiBean.class, CommonConstant.DBNAME_SQJW, "queryRizhi", condRizi);
	}
	
	public static RizhiBean queryGzRzBeanByMjjhAndGzrq(String username, String gzrq) throws Exception
	{
		return executor.queryObjectWithDBName(RizhiBean.class, CommonConstant.DBNAME_SQJW, "queryGzRzBeanByMjjhAndGzrq", username, gzrq);
	}
	
	/**
	 * 更新工作日志bean
	 * @param updateRizhiBean	需要更新的日志bean
	 * @throws SQLException	可能存在的sql异常
	 */
	public static void updateRizhiBean(RizhiBean updateRizhiBean) throws SQLException
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateRizhi", updateRizhiBean);
	}
	
	/**
	 * 删除工作日志bean
	 * @param delRizhiBean	需要删除的日志bean
	 * @throws SQLException	可能抛出的sql异常
	 */
	public static void delRizhiBean(RizhiBean delRizhiBean) throws SQLException
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateRizhi", delRizhiBean);
	}
	
	/**
	 * 批量删除工作日志beans
	 * @param rizhiBeans	需要删除的条件bean
	 * @throws SQLException	可能抛出的sql异常
	 */
	public static void batchDelRizhiBeans(List<RizhiBean> rizhiBeans) throws SQLException
	{
		executor.deleteBeans(CommonConstant.DBNAME_SQJW, "delRizhi", rizhiBeans);
	}

	public static RizhiBean queryRizhiBean(String rzbh) throws SQLException {
		return executor.queryObjectWithDBName(RizhiBean.class, CommonConstant.DBNAME_SQJW, "queryRizhiBean", rzbh);
	}

	public static RizhiBean getRizhiBeanByRzbh(String rzbh) throws SQLException {
		return executor.queryObjectWithDBName(RizhiBean.class, CommonConstant.DBNAME_SQJW, "getRizhiBeanByRzbh", rzbh);
	}
	
	/**
	 * 根据日志编号查询list
	 * @param rzbh  1，2，3，4
	 * @return
	 * @throws Exception
	 */
	public static List<RizhiBean> queryRiZhiListByRzbh(String rzbhs) throws Exception{
		rzbhs = "'" + rzbhs.replace(",", "','") + "'";
		String sql =executor.getSql("queryRiZhiListByRzbh").replace("#[rzbhs]", rzbhs);
		return SQLExecutor.queryListWithDBName(RizhiBean.class, CommonConstant.DBNAME_SQJW, sql);
	}
}
