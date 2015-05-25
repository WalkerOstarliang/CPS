package com.chinacreator.gzgl.dao;

import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.UserLxfsBean;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.query.UserLxfsQuery;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;



public class UserLxfsDao {
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/gzgl/dao/lxfs-sql.xml");

	public static PageResultInfo<UserLxfsBean> queryLxfsList(PageInfo pageInfo,
			UserLxfsQuery queryBean) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(UserLxfsBean.class, CommonConstant.DBNAME_SQJW, "queryLxfsList", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public static UserLxfsBean queryuserLxfsBeanById(String id) throws SQLException {
		return executor.queryObjectWithDBName(UserLxfsBean.class, CommonConstant.DBNAME_SQJW, "queryuserLxfsBeanById", id);
	}

	public static void updateUserLxfs(UserLxfsBean userLxfsBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateUserLxfs", userLxfsBean);
	}
	
	public static void insertUserLxfs(UserLxfsBean userLxfsBean) throws SQLException
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertUserLxfs", userLxfsBean);
	}
	
	public static String getSfncjws(String orgcode)
	{
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("orgcode", orgcode, SQLParams.STRING);
			return executor.queryFieldBeanWithDBName(CommonConstant.DBNAME_SQJW, "getSfncjws", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "0";
	}
}
