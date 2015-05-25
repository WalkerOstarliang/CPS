package com.chinacreator.gzgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.bean.ZjieBean;
import com.chinacreator.gzgl.query.ZjieQuery;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 工作总结dao
 * @author royee
 *
 */
public class ZjieDao
{
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/gzgl/dao/zjie-sql.xml");
	
	/**
	 * 插入新总结bean
	 * @param zjieBean	待插入的bean
	 * @throws SQLException	可能抛出的sql异常
	 */
	public static void insertZjieBean(ZjieBean zjieBean) throws SQLException
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZjie", zjieBean);
	}
	
	/**
	 * 分页查询符合条件结果集
	 * @param condQuery	查询条件bean
	 * @param page	分页bean
	 * @return	分页结果
	 * @throws SQLException	可能抛出的sql异常
	 */
	public static PageResultInfo<ZjieBean> getZjiePageResultInfo(ZjieQuery condQuery, PageInfo page) throws SQLException
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(ZjieBean.class, CommonConstant.DBNAME_SQJW, "queryZjie", page.getOffset(), page.getPageSize(), condQuery);
		return PaginationHelper.wrapPageResultInfo(page, listInfo);
	}
	
	/**
	 * 查询所有常规条件结果集
	 * @param condQuery	查询条件
	 * @return	结果集合
	 * @throws SQLException	可能存在的异常
	 */
	public static List<ZjieBean> getZjieList(ZjieQuery condQuery) throws SQLException
	{
		return executor.queryListBeanWithDBName(ZjieBean.class, CommonConstant.DBNAME_SQJW, "queryZjie", condQuery);
	}
	
	/**
	 * 更新属性数据
	 * @param zjieBean	待更新数据
	 * @throws SQLException	可能抛出的异常
	 */
	public static void updateZjieBean(ZjieBean zjieBean) throws SQLException
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZjie", zjieBean);
	}
	
	/**
	 * 删除总结日志数据
	 * @param zjieBean	待删除的数据
	 * @throws SQLException	可能抛出的异常
	 */
	public static void delZjieBean(ZjieBean zjieBean) throws SQLException
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "delZjie", zjieBean);
	}
	
	/**
	 * 批量删除总结数据
	 * @param condBeans	需要删除的总结bean
	 * @throws SQLException	可能抛出的业务异常
	 */
	public static void batchDelZjieBeans(List<ZjieBean> condBeans) throws SQLException
	{
		executor.updateBeans(CommonConstant.DBNAME_SQJW, "delZjie", condBeans);
	}

	public static ZjieBean queryZjieBeanByZjbh(String zjbh) throws SQLException {
		return executor.queryObjectWithDBName(ZjieBean.class, CommonConstant.DBNAME_SQJW, "queryZjieBeanByZjbh", zjbh);
	}

	
}
