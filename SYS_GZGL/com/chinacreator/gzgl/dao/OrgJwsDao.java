package com.chinacreator.gzgl.dao;

import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.OrgJwsBean;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.query.OrgJwsQuery;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;


public class OrgJwsDao {
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/gzgl/dao/jws-sql.xml");

	public static PageResultInfo<OrgJwsBean> queryOrgJwsBean(PageInfo pageInfo,
			OrgJwsQuery jwsQuery) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(OrgJwsBean.class, CommonConstant.DBNAME_SQJW, "queryOrgJwsBean", pageInfo.getOffset(), pageInfo.getPageSize(), jwsQuery);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public static OrgJwsBean queryOrgJwsBeanById(String id) throws SQLException {
		return executor.queryObjectWithDBName(OrgJwsBean.class, CommonConstant.DBNAME_SQJW, "queryOrgJwsBeanById", id);
	}

	public static void updateJwsBean(OrgJwsBean jwsBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJwsBeanById",jwsBean );
		
	}

}
