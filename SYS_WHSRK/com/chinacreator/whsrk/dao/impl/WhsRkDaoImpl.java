package com.chinacreator.whsrk.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.whsrk.bean.WhsRkBean;
import com.chinacreator.whsrk.bean.WhsRkFkBean;
import com.chinacreator.whsrk.bean.WhsRkPfBean;
import com.chinacreator.whsrk.bean.WhsRkThBean;
import com.chinacreator.whsrk.dao.WhsRkDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class WhsRkDaoImpl implements WhsRkDao {

	private static final long serialVersionUID = -2778646175709499479L;

	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
				"com/chinacreator/whsrk/dao/impl/whsrk-sql.xml");
	
	@Override
	public void insertWhsRkFk(WhsRkFkBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWhsRkFk", bean);
	}

	@Override
	public void insertWhsRkPf(WhsRkPfBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWhsRkPf", bean);
	}

	@Override
	public void insertWhsRkTh(WhsRkThBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWhsRkTh", bean);
	}

	@Override
	public PageResultInfo<WhsRkBean> queryWhsRkList(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo listinfo = executor.queryListInfoBeanWithDBName(WhsRkBean.class, CommonConstant.DBNAME_SQJW, 
				"queryWhsRkList", pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, listinfo);
	}
	
	@Override
	public List<WhsRkBean> queryWhsRkList(QueryBean query) throws SQLException{
		return executor.queryListBeanWithDBName(WhsRkBean.class, CommonConstant.DBNAME_SQJW, "queryWhsRkList", query);
	}

	@Override
	public void updateWhrkCzzt(WhsRkBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWhrkCzzt", bean);
	}

	@Override
	public void updateWhrkFkzt(WhsRkBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWhrkFkzt", bean);
	}

	@Override
	public void updateWhsRkPfxx(WhsRkBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWhsRkPfxx", bean);
	}
}
