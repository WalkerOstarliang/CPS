package com.chinacreator.afgl.dao;

import com.chinacreator.afgl.bean.XqxxBean;
import com.chinacreator.afgl.query.XqxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

/**
 * 小区信息DAO
 *
 */
public class XqxxDao {
	private static ConfigSQLExecutor executor =  
		new ConfigSQLExecutor("com/chinacreator/afgl/dao/xqxx-sql.xml");
	
	/**
	 * 查询小区信息列表
	 */
	public static PageResultInfo<XqxxBean> queryXqxxBeanPageList(PageInfo pageInfo,  XqxxQuery xqxxQuery) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(XqxxBean.class, CommonConstant.DBNAME_SQJW, "queryXqxxList", pageInfo.getOffset(), pageInfo.getPageSize(), xqxxQuery);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 新增小区信息
	 */
	public static void insertXqxxBean(XqxxBean xqxxBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXqxxBean", xqxxBean);
	}
	
	/**
	 * 修改小区信息
	 */
	public static void updateXqxxBean(XqxxBean xqxxBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXqxxBean", xqxxBean);
	}
	
	/**
	 * 得到小区信息
	 */
	public static XqxxBean queryXqxxBeanByXqbh(String xqbh) throws Exception
	{
		return executor.queryObjectWithDBName(XqxxBean.class, CommonConstant.DBNAME_SQJW,  "queryXqxxBeanByXqbh", xqbh);
	}
	
	/**
	 * 删除小区信息
	 */
	public static void changeXqxxBeanSatusByXqbh(String xqbh, String cxbs) throws Exception
	{
		SQLParams params = new SQLParams();
		params.addSQLParam("xqbh", xqbh, SQLParams.STRING);
		params.addSQLParam("cxbs", cxbs, SQLParams.STRING);
		executor.updateBean(CommonConstant.DBNAME_SQJW, "changeXqxxBeanSatusByXqbh", params);
	}
}
