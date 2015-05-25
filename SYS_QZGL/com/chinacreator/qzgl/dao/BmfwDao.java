package com.chinacreator.qzgl.dao;

import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.qzgl.bean.BmfwxxBean;
import com.chinacreator.qzgl.query.BmfwQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class BmfwDao {

	public static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/qzgl/dao/bmfw-sql.xml");
	public static PageResultInfo<BmfwxxBean> getBmfwxx(BmfwQueryBean queryBean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(BmfwxxBean.class, CommonConstant.DBNAME_SQJW, "queryBmfwxx", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	public static void insertBmfw(BmfwxxBean bmfwxxBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertBmfw", bmfwxxBean);
		
	}
	public static void updateGyhd(BmfwxxBean bmfwxxBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateBmfw", bmfwxxBean);
	}
	public static BmfwxxBean getBmfwByBh(String bh) throws SQLException {
		return executor.queryObjectWithDBName(BmfwxxBean.class,CommonConstant.DBNAME_SQJW,"queryBmfw", bh);
	}
	public static Object deleteBmfw(String bh) throws SQLException {
		return executor.deleteWithDBName(CommonConstant.DBNAME_SQJW,"deleteBmfws",bh );
	}
	public static Object deleteBmfwxxByBh(String bh) throws SQLException {
		return executor.deleteWithDBName(CommonConstant.DBNAME_SQJW,"deleteBmfws",bh );
	}


}
