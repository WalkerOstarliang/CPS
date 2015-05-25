package com.chinacreator.gzgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.bean.TzmbBean;
import com.chinacreator.gzgl.query.TzmbQuery;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.util.ListInfo;

public class TzmbDao {
	
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/gzgl/dao/tzmb-sql.xml");
	public static PageResultInfo<TzmbBean> getTzmbxx(PageInfo pageInfo,
			TzmbQuery queryBean) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(TzmbBean.class, CommonConstant.DBNAME_SQJW, "queryTzmbxx", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	public static List<TzmbBean> queryTzmbxx() {
		return	null;
	}
	
	public static void saveTzmbxxBean(TzmbBean tzmbBean) throws SQLException {
		String sql = executor.getSql("saveTzmbxx");
		PreparedDBUtil util = new PreparedDBUtil();
		util.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
		util.setString(1, tzmbBean.getId());
		util.setString(2, tzmbBean.getTzmc());
		util.setBlob(3, tzmbBean.getTzmb());
		util.executePrepared();
	}
	public static TzmbBean getTzmbxxBeanbyId(String id) throws SQLException {
		return executor.queryObjectWithDBName(TzmbBean.class, CommonConstant.DBNAME_SQJW, "getTzmbxxBeanbyId", id);
	}
	public static void deleteTzmbxxbyId(String id) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteTzmbxxbyId", id);
	}

}
