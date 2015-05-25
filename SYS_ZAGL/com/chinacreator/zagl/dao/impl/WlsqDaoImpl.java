package com.chinacreator.zagl.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zagl.bean.SqQQqBean;
import com.chinacreator.zagl.bean.SqltBean;
import com.chinacreator.zagl.bean.SqwzBean;
import com.chinacreator.zagl.bean.WlsqBean;
import com.chinacreator.zagl.dao.WlsqDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class WlsqDaoImpl implements WlsqDao {

	private static final long serialVersionUID = 1443869362911729353L;

	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
			"com/chinacreator/zagl/dao/sql/wlsq-sql.xml");

	public void deleteWlsqByWlsqbh(WlsqBean bean) throws SQLException {
			executor.updateBean(CommonConstant.DBNAME_SQJW,
					"deleteWlsqByWlsqbh", bean);
	}

	public WlsqBean insertWlsq(WlsqBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWlsq", bean);
		return bean;
	}

	public PageResultInfo<WlsqBean> queryWlsqByPageResultInfo(
			PageInfo pageInfo, QueryBean queryBean) throws Exception {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(
				WlsqBean.class, CommonConstant.DBNAME_SQJW,
				"queryWlsqByPageResultInfo", pageInfo.getOffset(), pageInfo
						.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public WlsqBean queryWlsqByWlsqbh(String wlsqbh) throws SQLException {
		return executor.queryObjectWithDBName(WlsqBean.class,
				CommonConstant.DBNAME_SQJW, "queryWlsqByWlsqbh", wlsqbh);
	}

	public WlsqBean updateWlsq(WlsqBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWlsq", bean);
		return bean;
	}

	public SqQQqBean insertSqQQq(SqQQqBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSqQQq", bean);
		return bean;
	}

	public SqltBean insertSqlt(SqltBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSqlt", bean);
		return bean;
	}

	public SqwzBean insertSqwz(SqwzBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSqwz", bean);
		return bean;
	}

	public List<SqQQqBean> querySqQQqByWlsqbh(String wlsqbh)
			throws SQLException {
		return executor.queryListWithDBName(SqQQqBean.class,
				CommonConstant.DBNAME_SQJW, "querySqQQqByWlsqbh", wlsqbh);
	}

	public List<SqltBean> querySqltByWlsqbh(String wlsqbh) throws SQLException {
		return executor.queryListWithDBName(SqltBean.class,
				CommonConstant.DBNAME_SQJW, "querySqltByWlsqbh", wlsqbh);
	}

	public List<SqwzBean> querySqwzByWlsqbh(String wlsqbh) throws SQLException {
		return executor.queryListWithDBName(SqwzBean.class,
				CommonConstant.DBNAME_SQJW, "querySqwzByWlsqbh", wlsqbh);
	}

	public void deleteSqQQqByWlsqbh(String wlsqbh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteSqQQqByWlsqbh", wlsqbh);
	}

	public void deleteSqltByWlsqbh(String wlsqbh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteSqltByWlsqbh", wlsqbh);
	}

	public void deleteSqwzByWlsqbh(String wlsqbh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteSqwzByWlsqbh", wlsqbh);
	}

}
