package com.chinacreator.lsgl.dao.impl;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.lsgl.bean.CzfwJbxxBean;
import com.chinacreator.lsgl.dao.LsglCzfwJbxxDao;
import com.chinacreator.lsgl.query.FwQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class LsglCzfwJbxxDaoImpl implements LsglCzfwJbxxDao{

	private static ConfigSQLExecutor executor=new ConfigSQLExecutor("com/chinacreator/lsgl/dao/lsglczfwjbxx-sql.xml");
	
	public void insertCzfwJbxxBean(CzfwJbxxBean czfwBean) throws Exception 
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertCzfwJbxxBean", czfwBean);
	}

	public CzfwJbxxBean queryCzfwBeanByCzfwbh(String czfwbh) throws Exception 
	{
		return executor.queryObjectWithDBName(CzfwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzfwBeanByCzfwbh", czfwbh);
	}

	public CzfwJbxxBean queryCzfwBeanByfwid(String fwid) throws Exception 
	{
		return executor.queryObjectWithDBName(CzfwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzfwBeanByfwid", fwid);
	}
	
	public PageResultInfo<CzfwJbxxBean> queryCzfwBeanPageInfo(FwQueryBean queryBean, PageInfo pageInfo)
			throws Exception {
		ListInfo listInfo=executor.queryListInfoBeanWithDBName(CzfwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzfwBeanPageInfo", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public void updateCzfwJbxxBean(CzfwJbxxBean czfwBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCzfwJbxxBean", czfwBean);
	}

	public PageResultInfo<CzfwJbxxBean> queryCzfwListPageByFwid(String fwid,PageInfo pageInfo)
			throws Exception 
	{
		ListInfo listInfo = executor.queryListInfoWithDBName(CzfwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzfwListPageByFwid", pageInfo.getOffset(),pageInfo.getPageSize(),fwid);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
}
