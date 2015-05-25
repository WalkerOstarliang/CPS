package com.chinacreator.afgl.dao;

import java.util.List;

import com.chinacreator.afgl.bean.SqJbqktjBean;
import com.chinacreator.afgl.bean.SqJbxxBean;
import com.chinacreator.afgl.bean.Xqjbxx;
import com.chinacreator.afgl.bean.XzsqbgjlBean;
import com.chinacreator.afgl.query.SqJbxxQueryBean;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.orm.transaction.TransactionManager;
import com.frameworkset.util.ListInfo;

public class SqJbxxDao
{
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/afgl/dao/sqjbxx-sql.xml");
	
	/**
	 * 查询分页社区基本西悉尼
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<SqJbxxBean> querySqJbxxPageResultByQueryBean(SqJbxxQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(SqJbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqJbxxPageResultByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 派出所代码查询社区
	 * @param pcsdm
	 * @return
	 * @throws Exception
	 */
	public static List<SqJbxxBean> querySqJbxxBeanListByPcsdm(String pcsdm) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		SQLParams params = new SQLParams();
		params.addSQLParam("leve", loginInfo.getLeve(), SQLParams.INT);
		params.addSQLParam("orgcode", loginInfo.getOrgcode(), SQLParams.STRING);
		params.addSQLParam("pcsdm", pcsdm, SQLParams.STRING);
		return executor.queryListBeanWithDBName(SqJbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqJbxxBeanListByPcsdm", params);
	}
	
	/**
	 * 通过警务室代码加载社区信息
	 * @param jwsdm
	 * @return
	 * @throws Exception
	 */
	public static List<SqJbxxBean> querySqJbxxBeanListByJwsdm(String jwsdm) throws Exception
	{
		return executor.queryListWithDBName(SqJbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqJbxxBeanListByJwsdm", jwsdm);
	}
	
	public static List<SqJbxxBean> querySqJbxxBeanListByJdxzdm(String jdxzdm) throws Exception
	{
		return executor.queryListWithDBName(SqJbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqJbxxBeanListByJdxzdm", jdxzdm);
	}
	
	public static List<SqJbxxBean> querySqJbxxBeanListByJdxzdmAndJwqdm(String jwqdm) throws Exception
	{
		return executor.queryListWithDBName(SqJbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqJbxxBeanListByJdxzdmAndJwqdm",jwqdm);
	}
	
	/**
	 * 查询社区基本西悉尼
	 * @param sqbh
	 * @return
	 * @throws Exception
	 */
	public static SqJbxxBean querySqJbxxBeanBySqbh(String sqbh) throws Exception
	{
		return executor.queryObjectWithDBName(SqJbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqJbxxBeanBySqbh", sqbh);
	}
	
	/**
	 * 插入社区基本信息
	 * @param bean
	 * @throws Exception
	 */
	public static void insertSqJbxxBean(SqJbxxBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSqJbxxBean", bean);
	}
	
	/**
	 * 更新社区基本信息
	 * @param bean
	 * @throws Exception
	 */
	public static void updateSqJbxxBean(SqJbxxBean bean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSqJbxxBean", bean);
			executor.updateBean(CommonConstant.DBNAME_SQJW, "updateHnxzqhBySqbh", bean);
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tm.rollback();
		}
	}
	
	/**
	 * 更新湖南行政区划
	 * @param bean
	 * @date Mar 27, 2014 12:02:39 PM
	 */
	public static void updateHnxzqhBySqbh(SqJbxxBean bean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateHnxzqhBySqbh", bean);
	}
	
	/**
	 * 注销社区基本信息，不做物理删除
	 * @param sqbh
	 * @throws Exception
	 */
	public static void deleteSqJbxxBeanBySqbh(String sqbh) throws Exception
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteSqJbxxBeanBySqbh", sqbh);
	}
	
	/**
	 * 通过社区编号获取社区的基本情况
	 * @param sqbh
	 * @throws Exception
	 */
	public static SqJbqktjBean querySqjbqkBySqbh(String sqbh) throws Exception
	{
		return executor.queryObjectWithDBName(SqJbqktjBean.class, CommonConstant.DBNAME_SQJW, "querySqjbqkBySqbh", sqbh);
	}
	
	/**
	 * 通过社区警务
	 * @param jwsdm
	 * @return
	 * @throws Exception
	 */
	public static List<SqJbqktjBean> querySqjbqkByJwsdm(String jwsdm) throws Exception
	{
		return executor.queryListWithDBName(SqJbqktjBean.class, CommonConstant.DBNAME_SQJW, "querySqJbqkxxByJwsdm", jwsdm);
	}
	
	public static SqJbxxBean querySqJbxxBeanByDm(String sqdm)throws Exception
	{
		return executor.queryObjectWithDBName(SqJbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqJbxxBeanByDm", sqdm);
	}
	
	/**
	 * 查询辖区基本情况
	 * @param orgcode
	 * @return
	 * @throws Exception
	 */
	public static Xqjbxx queryXqqk(QueryBean bean) throws Exception{
		return executor.queryObjectBeanWithDBName(Xqjbxx.class, CommonConstant.DBNAME_SQJW, "queryXqqk",bean);
	}
	
	/**
	 * 插入新增区划变更记录
	 * @throws Exception
	 * @date Mar 27, 2014 12:07:12 PM
	 */
	public static void insertXzqhbgjl(XzsqbgjlBean bgjlBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXzqhbgjl", bgjlBean);
	}
	
}
