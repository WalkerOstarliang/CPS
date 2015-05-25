package com.chinacreator.gzgl.dao;

/**
 * 辅警dao
 */
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.bean.OrgFjBean;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.util.ListInfo;

public class FjDao {
	public static ConfigSQLExecutor executor=new ConfigSQLExecutor("com/chinacreator/gzgl/dao/fj-sql.xml");
	
	public static PageResultInfo<OrgFjBean> queryFjBeanPageInfo(String orgcode,PageInfo pageInfo) throws Exception{
		ListInfo listInfo=executor.queryListInfoWithDBName(OrgFjBean.class, CommonConstant.DBNAME_SQJW, "queryFjBeanPageInfo", pageInfo.getOffset(), pageInfo.getPageSize(), orgcode);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public static PageResultInfo<OrgFjBean> queryFjBeanPageInfoByQueryBean(RkQueryBean queryBean,PageInfo pageInfo) throws Exception{
		ListInfo listInfo=executor.queryListInfoBeanWithDBName(OrgFjBean.class, CommonConstant.DBNAME_SQJW, "queryFjBeanPageInfoByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public static  void insertFjBean(OrgFjBean bean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertFjBean", bean);
	}
	
	public static void updateFjBean(OrgFjBean bean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateFjBean", bean);
	}
	
	public static OrgFjBean queryFjBeanByJh(String fjjh) throws Exception{
		return executor.queryObjectWithDBName(OrgFjBean.class, CommonConstant.DBNAME_SQJW, "queryFjBeanByJh", fjjh);
	}
	
	public static OrgFjBean queryFjBeanByFjid(String fjid) throws Exception{
		return executor.queryObjectWithDBName(OrgFjBean.class, CommonConstant.DBNAME_SQJW, "queryFjBeanByFjid", fjid);
	}
	
	public static OrgFjBean queryFjBeanBySfzh(String sfzh) throws Exception{
		return executor.queryObjectWithDBName(OrgFjBean.class, CommonConstant.DBNAME_SQJW, "queryFjBeanBySfzh", sfzh);
	}
	
	/**
	 * 注销
	 */
	public static void deleteFjBean(String id) throws Exception{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteFjBean", id);
	}
	
	/**
	 * 判断某sfzh 是否存在某orgcode
	 */
	public static OrgFjBean queryFjBeanBySfzhInDw(OrgFjBean bean) throws Exception{
		return executor.queryObjectBeanWithDBName(OrgFjBean.class, CommonConstant.DBNAME_SQJW, "queryFjBeanBySfzhInDw", bean);
	}
	
	public static List<OrgFjBean> queryFjBeanByIds(String ids) throws Exception{
		ids = "'" + ids.replace(",", "','") + "'";
		String sql = executor.getSql("queryFjBeanByIds").replace("#[ids]", ids);
		return SQLExecutor.queryListWithDBName(OrgFjBean.class, CommonConstant.DBNAME_SQJW, sql);
	}
	
	public static List<OrgFjBean> queryFjBeansByQueryBean(RkQueryBean queryBean) throws Exception {
		return executor.queryListBeanWithDBName(OrgFjBean.class, CommonConstant.DBNAME_SQJW, "queryFjBeanPageInfoByQueryBean", queryBean);
	}
}
