package com.chinacreator.xtgl.dao.impl;

import java.sql.SQLException;

import com.chinacreator.afgl.bean.AflmpcBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.dzgl.bean.StxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.xtgl.dao.SjhcDao;
import com.chinacreator.xtgl.query.SjhcQueryBean;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class SjhcDaoImpl implements SjhcDao {

	private static final long serialVersionUID = 1968086634173762905L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/xtgl/dao/sjhc-sql.xml");

	@Override
	public PageResultInfo<DwcyryBean> queryCyry(SjhcQueryBean bean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwcyryBean.class, CommonConstant.DBNAME_SQJW,
						"queryCyry", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public PageResultInfo<FwJbxxBean> queryCzfwxcdj(SjhcQueryBean bean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW,
				"queryCzfwxcdj", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public PageResultInfo<LdrkxxBean> queryLdrk(SjhcQueryBean bean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW,
				"queryLdrk", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public PageResultInfo<StxxBean> querySt(SjhcQueryBean bean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(StxxBean.class, CommonConstant.DBNAME_SQJW,
				"querySt", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public PageResultInfo<ZdryGzdxBean> queryXfsjwh(SjhcQueryBean bean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW,
				"queryXfsjwh", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public PageResultInfo<ZdryGzdxBean> queryZdryGxrqs(SjhcQueryBean bean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW,
				"queryZdryGxrqs", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public PageResultInfo<ZdryGzdxBean> queryZdryTgxx(SjhcQueryBean bean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW,
				"queryZdryTgxx", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public PageResultInfo<FwJbxxBean> queryFw(SjhcQueryBean bean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW,
				"queryFw", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public PageResultInfo<AflmpcBean> queryLmpc(SjhcQueryBean bean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(AflmpcBean.class, CommonConstant.DBNAME_SQJW,
				"queryLmpc", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

}
