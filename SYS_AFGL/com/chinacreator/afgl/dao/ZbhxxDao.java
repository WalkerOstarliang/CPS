package com.chinacreator.afgl.dao;

import java.sql.SQLException;

import com.chinacreator.afgl.bean.ZbhcyxxBean;
import com.chinacreator.afgl.bean.ZbhxxBean;
import com.chinacreator.afgl.query.ZbhxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 治保会信息DAO
 *
 */
public class ZbhxxDao {
	private static ConfigSQLExecutor executor =  
		new ConfigSQLExecutor("com/chinacreator/afgl/dao/zbhxx-sql.xml");
	
	/**
	 * 查询治保会信息列表
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<ZbhxxBean> zbhxxList(PageInfo pageInfo,  ZbhxxQuery zbhxxQuery) throws Exception
	{
		PageResultInfo<ZbhxxBean> resultInfo = new PageResultInfo<ZbhxxBean>();
		ListInfo listInfo = new ListInfo();
		listInfo = executor.queryListInfoBeanWithDBName(ZbhxxBean.class, CommonConstant.DBNAME_SQJW, "zbhxxList", pageInfo.getOffset(), pageInfo.getPageSize(), zbhxxQuery);
		resultInfo.setDatas(listInfo.getDatas());
		resultInfo.setTotalCount(listInfo.getTotalSize());
		resultInfo.setCurrentPage(pageInfo.getCurrentPage());
		resultInfo.setPageSize(pageInfo.getPageSize());
		return resultInfo;
	}
	
	/**
	 * 新增治保会信息
	 */
	public static void addZbhxx(ZbhxxBean zbhxxBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addZbhxx", zbhxxBean);
	}
	
	/**
	 * 修改治保会信息
	 */
	public static void updateZbhxxByZbhbh(ZbhxxBean zbhxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZbhxxByZbhbh", zbhxxBean);
	}
	
	/**
	 * 得到治保会信息
	 */
	public static ZbhxxBean getZbhxxByZbhbh(ZbhxxQuery zbhxxQuery) throws Exception{
		return executor.queryObjectBeanWithDBName(ZbhxxBean.class, CommonConstant.DBNAME_SQJW, "zbhxxList", zbhxxQuery);
	}
	
	/**
	 * 删除治保会信息
	 */
	public static void deleteZbhxxByZbhbh(ZbhxxBean zbhxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteZbhxxByZbhbh", zbhxxBean);
	}

	public static ZbhcyxxBean queryZbhxxBeanByZbhbh(String zbhbh) throws SQLException 
	{
		return executor.queryObjectWithDBName(ZbhcyxxBean.class, CommonConstant.DBNAME_SQJW, "queryZbhxxBeanByZbhbh", zbhbh);
	}

	public static PageResultInfo<ZbhcyxxBean> zbhcyxxList(PageInfo pageInfo,QueryBean query) throws SQLException 
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(ZbhcyxxBean.class, CommonConstant.DBNAME_SQJW, "zbhcyxxListByzbhbh",  pageInfo.getOffset(), pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public static  ZbhxxBean queryZhbByNameAndOrg(String zbhmc,String orgcode) throws SQLException
	{
		return executor.queryObjectWithDBName(ZbhxxBean.class, CommonConstant.DBNAME_SQJW, "queryZhbByNameAndOrg", zbhmc,orgcode);
	}
}
