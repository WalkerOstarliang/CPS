package com.chinacreator.afgl.dao;

import java.sql.SQLException;

import com.chinacreator.afgl.bean.SqLdzxxBean;
import com.chinacreator.afgl.bean.StxxBean;
import com.chinacreator.afgl.bean.WyxqxxBean;
import com.chinacreator.afgl.bean.YwhCyxxBean;
import com.chinacreator.afgl.bean.YwhxxBean;
import com.chinacreator.afgl.query.SqldzxxQueryBean;
import com.chinacreator.afgl.query.SqwyhQueryBean;
import com.chinacreator.afgl.query.StxxQueryBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class SqLdzxxDao {
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/afgl/dao/sqldzxx-sql.xml");
	
	public static PageResultInfo<SqLdzxxBean> querySqldzxxPageResultInfoByQueryBean(SqldzxxQueryBean queryBeanldz, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(SqLdzxxBean.class, CommonConstant.DBNAME_SQJW, "querySqldzxxPageResultInfoByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBeanldz);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public static SqLdzxxBean  querySqldzxxBeanById(String id) throws SQLException{
		return executor.queryObjectWithDBName(SqLdzxxBean.class, CommonConstant.DBNAME_SQJW, "querySqldzxxBeanById", id);
	}
	
	public static PageResultInfo<StxxBean> queryStxxPageResultInfoByQueryBean(StxxQueryBean queryBeanSt, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(StxxBean.class, CommonConstant.DBNAME_SQJW, "queryStxxPageResultInfoByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBeanSt);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public static int querySqLdzCountByStidAndSfzh(String stid, String sfzh) throws SQLException{
		String count = executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "querySqLdzCountByStidAndSfzh", stid,sfzh);
		return Integer.parseInt(count);
	}
	
	public static void insertSqLdzxxBean(SqLdzxxBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSqLdzxxBean", bean);
	}
	public static void updateSqLdzxxBean(SqLdzxxBean bean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSqLdzxxBean", bean);	
	}
	public static void deleteSqLdzxxBeanById(String id) throws Exception{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteSqLdzxxBeanById", id);
	}
	
	public static PageResultInfo<YwhxxBean> querySqYwhPageResultInfoByQueryBean(SqwyhQueryBean queryBeanwyh, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(YwhxxBean.class, CommonConstant.DBNAME_SQJW, "querySqYwhPageResultInfoByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBeanwyh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public static YwhxxBean  querySqywhxxBeanById(String id) throws SQLException{
		return executor.queryObjectWithDBName(YwhxxBean.class, CommonConstant.DBNAME_SQJW, "querySqywhxxBeanById", id);
	}
	
	public static int querySqYzwyhCountByStidAndYzwyhmc(String stid, String yzwyhmc) throws SQLException{
		String count = executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "querySqYzwyhCountByStidAndYzwyhmc", stid,yzwyhmc);
		return Integer.parseInt(count);
	}
	
	public static void insertSqYzwyhxxBean(YwhxxBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSqYzwyhxxBean", bean);
	}
	public static void updateSqYzwyhxxBean(YwhxxBean bean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSqYzwyhxxBean", bean);	
	}
	
	public static PageResultInfo<YwhCyxxBean> querySqYwhcyPageResultInfoByQueryBean(YwhxxBean ywhxxbean, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(YwhCyxxBean.class, CommonConstant.DBNAME_SQJW, "querySqYwhcyPageResultInfoByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), ywhxxbean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public static YwhCyxxBean  querySqYwhcyxxBeanById(String id) throws SQLException{
		return executor.queryObjectWithDBName(YwhCyxxBean.class, CommonConstant.DBNAME_SQJW, "querySqYwhcyxxBeanById", id);
	}
	
	public static PageResultInfo<WyxqxxBean> queryWyxqxxPageResultInfoByQueryBean(StxxQueryBean queryBeanSt, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(WyxqxxBean.class, CommonConstant.DBNAME_SQJW, "queryWyxqxxPageResultInfoByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBeanSt);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public static int querySqYzwyhcyCountByYwhidAndSfzh(String yzwyhid, String sfzh) throws SQLException{
		String count = executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "querySqYzwyhcyCountByYwhidAndSfzh", yzwyhid,sfzh);
		return Integer.parseInt(count);
	}
	
	
	public static void insertSqYzwyhcyxxBean(YwhCyxxBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSqYzwyhcyxxBean", bean);
	}
	
	public static void updateSqYzwyhcyxxBean(YwhCyxxBean bean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSqYzwyhcyxxBean", bean);	
	}
	
	public static void deleteSqYwhBeanById(String id) throws Exception{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteSqYwhBeanById", id);
	}
	
	
	public static void deleteSqYzwyhcyBeanById(String id) throws Exception{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteSqYzwyhcyBeanById", id);
	}
	
	
}
