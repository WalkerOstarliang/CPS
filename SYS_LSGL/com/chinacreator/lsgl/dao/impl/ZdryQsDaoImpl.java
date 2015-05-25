package com.chinacreator.lsgl.dao.impl;

import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryJbxxBean;
import com.chinacreator.lsgl.bean.ZdryJsjzBean;
import com.chinacreator.lsgl.bean.ZdryQbhsBean;
import com.chinacreator.lsgl.bean.ZdryQsBean;
import com.chinacreator.lsgl.bean.ZdrySqjdBean;
import com.chinacreator.lsgl.bean.ZdrySqkfBean;
import com.chinacreator.lsgl.dao.ZdryQsDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class ZdryQsDaoImpl implements ZdryQsDao {

	private static final long serialVersionUID = 2189631983623374564L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/lsgl/dao/zdryqs-sql.xml");

	@Override
	public void insertZdry(ZdryGzdxBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdry", bean);
	}

	@Override
	public void insertZfbaFk(ZdryQsBean zdryqs) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZfbaFk", zdryqs);
	}

	@Override
	public void updateZdry(ZdryGzdxBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdry", bean);
	}

	@Override
	public ZdryJbxxBean queryZdryJbxx(String rybh) throws SQLException {
		return executor.queryObjectWithDBName(ZdryJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryJbxx", rybh);
	}

	@Override
	public ZdryJsjzBean queryZdryJsjz(String rybh) throws SQLException {
		return executor.queryObjectWithDBName(ZdryJsjzBean.class, CommonConstant.DBNAME_SQJW, "queryZdryJsjz", rybh);
	}

	@Override
	public ZdryQbhsBean queryZdryQbhs(String rybh) throws SQLException {
		return executor.queryObjectWithDBName(ZdryQbhsBean.class, CommonConstant.DBNAME_SQJW, "queryZdryQbhs", rybh);
	}

	@Override
	public PageResultInfo<ZdryJbxxBean> queryZdryQsList(QueryBean query,PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(ZdryJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryQsList", pageinfo.getOffset(), pageinfo.getPageSize(),query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}

	@Override
	public ZdrySqjdBean queryZdrySqjd(String rybh) throws SQLException {
		return executor.queryObjectWithDBName(ZdrySqjdBean.class, CommonConstant.DBNAME_SQJW, "queryZdrySqjd", rybh);
	}

	@Override
	public ZdrySqkfBean queryZdrySqkf(String rybh) throws SQLException {
		return executor.queryObjectWithDBName(ZdrySqkfBean.class, CommonConstant.DBNAME_SQJW, "queryZdrySqkf", rybh);
	}

}
