package com.chinacreator.lsgl.dao.impl;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.lsgl.bean.CzfwCzxxBean;
import com.chinacreator.lsgl.bean.CzrxxBean;
import com.chinacreator.lsgl.dao.LsglCzfwCzxxDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class LsglCzfwCzxxDaoImpl implements LsglCzfwCzxxDao {

	private static ConfigSQLExecutor executor=new ConfigSQLExecutor("com/chinacreator/lsgl/dao/lsglczxxjbxx-sql.xml");
	public void insertCzxxBean(CzfwCzxxBean czxxBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertCzxxBean", czxxBean);
	}

	public PageResultInfo<CzfwCzxxBean> queryCzxxPageInfo(
			String  czfwbh, PageInfo pageInfo) throws Exception {
		ListInfo listInfo= executor.queryListInfoWithDBName(CzfwCzxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzxxPageInfo", pageInfo.getOffset(), pageInfo.getPageSize(), czfwbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public CzfwCzxxBean queryCzxxPageInfobyCzxxbh(String czxxbh)
			throws Exception {
		return executor.queryObjectWithDBName(CzfwCzxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzxxPageInfobyCzxxbh", czxxbh);
	}

	public void updateCzxxBean(CzfwCzxxBean czxxBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCzxxBean", czxxBean);
	}

	public CzfwCzxxBean queryCzfwCzxxBeanBySfzh(String sfzh,String czfwbh) throws Exception {
		return executor.queryObjectWithDBName(CzfwCzxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzfwCzxxBeanBySfzh", sfzh,czfwbh);
	}

	
	
	/**                      new*/
	@Override
	public void insertCzrBean(CzrxxBean czrBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertCzrBean", czrBean);
	}

	@Override
	public void logoutCzrxxBean(CzrxxBean czrBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "logoutCzrxxBean", czrBean);
	}

	@Override
	public PageResultInfo<CzrxxBean> queryCzrPageInfoByCzfwbh(String czfwbh,PageInfo pageInfo)
			throws Exception {
		ListInfo listInfo = executor.queryListInfoWithDBName(CzrxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrPageInfoByCzfwbh", pageInfo.getOffset(),pageInfo.getPageSize(), czfwbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public CzrxxBean queryCzrxxBeanBySfzh(String sfzh, String fwid)
			throws Exception {
		return executor.queryObjectWithDBName(CzrxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrxxBeanBySfzh", sfzh,fwid);
	}

	@Override
	public void updateCzrxxBean(CzrxxBean czrBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCzrxxBean", czrBean);
	}

	@Override
	public CzrxxBean queryCzrxxBeanById(String id) throws Exception {
		return executor.queryObjectWithDBName(CzrxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrxxBeanById", id);
	}
	
}
