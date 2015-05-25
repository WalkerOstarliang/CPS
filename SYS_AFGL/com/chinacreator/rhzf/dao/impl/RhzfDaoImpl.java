package com.chinacreator.rhzf.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.rhzf.bean.ExpRhzfBean;
import com.chinacreator.rhzf.bean.RhzfBean;
import com.chinacreator.rhzf.bean.ZfryBean;
import com.chinacreator.rhzf.dao.RhzfDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class RhzfDaoImpl implements RhzfDao {

	private static final long serialVersionUID = -8758158802721987846L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
							"com/chinacreator/rhzf/dao/impl/rhzf-sql.xml");
	
	@Override
	public void cancelRhzf(RhzfBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "cancelRhzf", bean);
	}

	@Override
	public void deleteZfry(String zfid) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteZfry", zfid);
	}

	@Override
	public void insertRhzf(RhzfBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertRhzf", bean);
	}

	@Override
	public void insertZfry(String zfid, String rkid) throws SQLException {
		executor.insertWithDBName(CommonConstant.DBNAME_SQJW, "insertZfry", zfid,rkid);
	}

	@Override
	public List<ZfryBean> queryZfryByDzid(String dzid) throws SQLException {
		return executor.queryListWithDBName(ZfryBean.class, CommonConstant.DBNAME_SQJW, "queryZfryByDzid", dzid,dzid,dzid);
	}

	@Override
	public List<ZfryBean> queryZfryByZfid(String zfid) throws SQLException {
		return executor.queryListWithDBName(ZfryBean.class, CommonConstant.DBNAME_SQJW, "queryZfryByZfid", zfid,zfid,zfid);
	}

	@Override
	public void updateRhzf(RhzfBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateRhzf", bean);
	}

	@Override
	public RhzfBean queryRhzfByZfid(String zfid) throws SQLException {
		return executor.queryObjectWithDBName(RhzfBean.class, CommonConstant.DBNAME_SQJW, "queryRhzfByZfid", zfid);
	}

	@Override
	public PageResultInfo<RhzfBean> queryRhzfList(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(RhzfBean.class, CommonConstant.DBNAME_SQJW, "queryRhzfList",
				pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}

	@Override
	public List<ExpRhzfBean> expRhzf(QueryBean query) throws SQLException {
		return executor.queryListBeanWithDBName(ExpRhzfBean.class, CommonConstant.DBNAME_SQJW, "expRhzf", query);
	}
	
	
}
