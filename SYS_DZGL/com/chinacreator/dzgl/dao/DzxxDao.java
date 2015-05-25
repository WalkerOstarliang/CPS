package com.chinacreator.dzgl.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.dzgl.bean.DzxxBean;
import com.chinacreator.dzgl.bean.StxxBean;
import com.chinacreator.dzgl.query.DzxxQueryBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

public class DzxxDao
{
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/dzgl/dao/dzgl-sql.xml");
	
	public static PageResultInfo<StxxBean> queryStxxBeansPageResult(PageInfo pageInfo, DzxxQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(StxxBean.class, CommonConstant.DBNAME_SQJW,"queryStxxBeansPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public static List<StxxBean> queryStxxBeans(DzxxQueryBean queryBean) throws Exception
	{
		return executor.queryListBeanWithDBName(StxxBean.class, CommonConstant.DBNAME_SQJW, "queryStxxBeansPageResult", queryBean);
	}
	
	public static PageResultInfo<DzxxBean> queryDzxxBeansPageResultInfo(PageInfo pageInfo, DzxxQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DzxxBean.class, CommonConstant.DBNAME_SQJW, "queryDzxxBeansPageResultInfo", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public static StxxBean queryStxxBeanByStId(String stid) throws Exception
	{
		return executor.queryObjectWithDBName(StxxBean.class, CommonConstant.DBNAME_SQJW, "queryStxxBeanByStId", stid);
	}
	
	public static DzxxBean queryDzxxBeanByDzid(String dzid) throws Exception
	{
		return executor.queryObjectWithDBName(DzxxBean.class, CommonConstant.DBNAME_SQJW, "queryDzxxBeanByDzid", dzid);
	}
	
	public static void insertStxxBean(StxxBean stxxBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertStxxBean", stxxBean);
	}
	
	public static void updateStxxBean(StxxBean stxxBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateStxxBean", stxxBean);
	}
	
	public static void insertDzxxBean(DzxxBean dzxxBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDzxxBean", dzxxBean);
	}
	
	public static void updateDzxxBean(DzxxBean dzxxBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDzxxBean", dzxxBean);
	}
	public static void deleteStxx(StxxBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteStxx", bean);
	}
	
	public static void deleteStxxBeanByStid(String stid) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteStxxBeanByStid", stid);
	}
	
	public static int  queryStxxIsIncludeFwxx(String id) throws Exception{
		List<FwJbxxBean> list = executor.queryListWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryStxxIsIncludeFwxx", id);
		return list.size();
	}
	public static void recoveryStxx(StxxBean stxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "recoveryStxx", stxxBean);
	}
	
	
	/**
	 * 获取实体信息下的所有单位信息
	 * @param stid
	 * @return
	 * @date Apr 20, 2015 2:57:07 PM
	 */
	public static List<SystemDictionaryBean> queryStxxDyhxxList(String stid)
	{
		List<SystemDictionaryBean> list = null;
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("stid", stid, SQLParams.STRING);
			list = executor.queryListBeanWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, "queryStxxDyhxxList", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			list = new ArrayList<SystemDictionaryBean>();
		}
		return list;
	}
	
	/**
	 * 查询房屋机构集合
	 * @param stid
	 * @return
	 * @date Apr 21, 2015 4:20:29 PM
	 */
	public static List<FwJbxxBean> queryFwjgList(String stid, String dyh)
	{
		List<FwJbxxBean> list = null;
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("stid", stid, SQLParams.STRING);
			params.addSQLParam("dyh", dyh, SQLParams.STRING);
			list = executor.queryListBeanWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwjgList", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 房屋人口信息查询
	 * @param fwid
	 * @return
	 * @date Apr 25, 2015 12:07:15 PM
	 */
	public static List<RkJbxxBean> queryFwRkxxBeansByFwid(String fwid)
	{
		List<RkJbxxBean> list = null;
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("fwid", fwid, SQLParams.STRING);
			list = executor.queryListBeanWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwRkxxBeansByFwid", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
}
