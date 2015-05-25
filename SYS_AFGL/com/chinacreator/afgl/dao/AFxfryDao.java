package com.chinacreator.afgl.dao;

import java.sql.SQLException;

import com.chinacreator.afgl.bean.AfXldRyxxBean;
import com.chinacreator.afgl.query.AfxldQueryBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class AFxfryDao {
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/afgl/dao/xldxx-sql.xml");
	/**
	 * 查询巡防人员信息
	 */
	public static PageResultInfo<AfXldRyxxBean> queryAfxldxxListByQueryBean(PageInfo pageInfo, AfxldQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(AfXldRyxxBean.class, CommonConstant.DBNAME_SQJW, "queryAfxfdyxxBeanByqueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	/**
	 * 通过巡防队员编号查询
	 */
	public static AfXldRyxxBean queryAfxldxxBeanByXfyrybh(String xfybh) throws Exception
	{
		return executor.queryObjectWithDBName(AfXldRyxxBean.class, CommonConstant.DBNAME_SQJW, "queryAfxfryxxBeanByxldybh", xfybh);
	}
	/*
	 * 新增巡防人员
	 * */
	public static  void insertXfryxxBean(AfXldRyxxBean afryxxBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXfryxxBean", afryxxBean);
	}
	public static AfXldRyxxBean selectXfryxxBysfzh(AfXldRyxxBean afryxxBean) throws SQLException{
		return executor.queryObjectBeanWithDBName(AfXldRyxxBean.class, CommonConstant.DBNAME_SQJW, "selectXfryxxBysfzh", afryxxBean);
	}
	/*
	 * 修改巡防人员
	 * */
	public static void updateXfryxxBean(AfXldRyxxBean afryxxBean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXfryxxBean", afryxxBean);
	}
	/*
	 * 删除巡防人员
	 * @throws SQLException 
	 */
	public static void deleteXfryxxBean(AfXldRyxxBean afryxxBean) throws SQLException{
		executor.deleteBean(CommonConstant.DBNAME_SQJW, "deleteXfryxxBean", afryxxBean);
	}
	/*删除巡防人员BYrybh
	 * */
	public static void deleteAfryxxByrybh(String xfybh) throws SQLException{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteAfryxxByrybh", xfybh);
	}
}
