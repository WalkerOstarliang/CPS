package com.chinacreator.afgl.dao;

import java.sql.SQLException;

import com.chinacreator.afgl.bean.AfXldRyxxBean;
import com.chinacreator.afgl.bean.AfXldxxBean;
import com.chinacreator.afgl.query.AfxldQueryBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 序列对信息
 * @author mingchun.xiong
 *
 */
public class AFXldxxDao
{
	
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/afgl/dao/xldxx-sql.xml");
	
	/**
	 * 查询巡逻信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<AfXldxxBean> queryAfxldxxListByQueryBean(PageInfo pageInfo, AfxldQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(AfXldxxBean.class, CommonConstant.DBNAME_SQJW, "queryAfxldxxListByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 通过巡逻队编号查询巡逻队信息
	 * @param xldbh
	 * @return
	 * @throws Exception
	 */
	public static AfXldxxBean queryAfxldxxBeanByXldbh(String xldbh) throws Exception
	{
		return executor.queryObjectWithDBName(AfXldxxBean.class, CommonConstant.DBNAME_SQJW, "queryAfxldxxBeanByXldbh", xldbh);
	}
	
	/**
	 * 插入巡逻队信息
	 * @param bean
	 */
	public static void insertXldxxBean(AfXldxxBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXldxxBean", bean);
	}
	
	/**
	 * 更新巡逻队信息bean
	 * @param bean
	 * @throws Exception
	 */
	public static void updateXldxxBean(AfXldxxBean bean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXldxxBean", bean);
	}
	
	/**
	 * 注销巡逻队，不做物理删除
	 * @param xldbh
	 * @throws Exception
	 */
	public static void deleteXldxxBeanByXldbh(String xldbh) throws Exception
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteXldxxBeanByXldbh", xldbh);
	}
	
	/**
	 * 查询巡逻队人员信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<AfXldRyxxBean> queryAfxldRyxxBeanListByQueryBean(PageInfo pageInfo, AfxldQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(AfXldRyxxBean.class, CommonConstant.DBNAME_SQJW, "queryAfxldRyxxBeanListByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询巡逻队员通过编号
	 * @param xldybh
	 * @return
	 * @throws Exception
	 */
	public static AfXldRyxxBean queryAfxldyxxBeanByXldybh(String xldybh) throws Exception
	{
		return executor.queryObjectWithDBName(AfXldRyxxBean.class, CommonConstant.DBNAME_SQJW, "queryAfxldyxxBeanByXldybh", xldybh);
	}
	
	/**
	 * 插入巡逻队员信息
	 * @param bean
	 * @throws Exception
	 */
	public static void insertAfxldyxxBean(AfXldRyxxBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertAfxldyxxBean", bean);
	}
	
	/**
	 * 更新巡逻队员信息
	 * @param bean
	 * @throws Exception
	 */
	public static void updateAfxldyxxBean(AfXldRyxxBean bean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateAfxldyxxBean", bean);
	}
	
	/**
	 * 删除巡逻队员
	 * @param xldybh
	 * @throws Exception
	 */
	public static void deleteAfxldyxxBeanByXldybh(String xldybh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteAfxldyxxBeanByXldybh", xldybh);
	}
	
	/**
	 * 查询巡逻队员通过巡逻队编号
	 * @param pageInfo
	 * @param xldbh
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<AfXldRyxxBean> queryXldryBeanListByXldbh(PageInfo pageInfo, String xldbh) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoWithDBName(AfXldRyxxBean.class, CommonConstant.DBNAME_SQJW, "queryXldryBeanListByXldbh", pageInfo.getOffset(), pageInfo.getPageSize(), xldbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	
	/**
	 * 查询巡逻队员通过编号
	 * @param sfzh
	 * @return
	 * @throws Exception
	 */
	public static AfXldRyxxBean queryAfxldyxxBeanBySfzh(String sfzh) throws Exception
	{
		return executor.queryObjectWithDBName(AfXldRyxxBean.class, CommonConstant.DBNAME_SQJW, "queryAfxldyxxBeanBySfzh", sfzh);
	}
	/**
	 * 查询巡逻队员 通过bean
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws SQLException
	 */
	public static PageResultInfo<AfXldRyxxBean> queryAfxfdyxxBeanByqueryBean(PageInfo pageInfo,AfxldQueryBean queryBean) throws SQLException{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(AfXldRyxxBean.class, CommonConstant.DBNAME_SQJW, "queryAfxfdyxxBeanByqueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		
	}
}
