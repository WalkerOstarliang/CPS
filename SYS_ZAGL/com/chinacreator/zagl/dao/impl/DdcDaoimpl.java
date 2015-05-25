package com.chinacreator.zagl.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zagl.bean.DdcBean;
import com.chinacreator.zagl.dao.DdcDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.util.ListInfo;

public class DdcDaoimpl implements DdcDao{

	private static final long serialVersionUID = 8178268342883690285L;
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
				"com/chinacreator/zagl/dao/sql/ddc-sql.xml");

	@Override
	public void insertDdc(DdcBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDdc", bean);
	}

	@Override
	public DdcBean queryDdcById(String id) throws SQLException {
		return executor.queryObjectWithDBName(DdcBean.class, CommonConstant.DBNAME_SQJW, "queryDdcById", id);
	}

	@Override
	public PageResultInfo<DdcBean> queryDdcList(QueryBean bean,
			PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(DdcBean.class, CommonConstant.DBNAME_SQJW, "queryDdcList", pageinfo.getOffset(), pageinfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageinfo,list);
	}

	@Override
	public void updateDdc(DdcBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDdc", bean);
	}

	@Override
	public List<DdcBean> queryDdcList(QueryBean bean) throws SQLException {
		return executor.queryListBeanWithDBName(DdcBean.class, CommonConstant.DBNAME_SQJW, "queryDdcList", bean);
	}

	@Override
	public List<DdcBean> queryDdcListByINDdcid(String v_ddcid)
			throws SQLException {
		
		v_ddcid = "'" + v_ddcid.replace(",", "','") + "'";
		String sql=null;
		try {
			sql = executor.getSql("queryDdccjListByinddcid").replace("#[v_ddcid]", v_ddcid);
			return SQLExecutor.queryListWithDBName(DdcBean.class, CommonConstant.DBNAME_SQJW, sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

}
