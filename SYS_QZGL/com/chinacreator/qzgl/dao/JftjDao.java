package com.chinacreator.qzgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.qzgl.bean.JfcyrxxBean;
import com.chinacreator.qzgl.bean.JftjdjxxBean;
import com.chinacreator.qzgl.query.JftjQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;


public class JftjDao {
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/qzgl/dao/jftj-sql.xml");

	public static PageResultInfo<JftjdjxxBean> queryJftjxx(
			JftjQueryBean queryBean, PageInfo pageInfo) throws SQLException {
		ListInfo listInfo =  executor.queryListInfoBeanWithDBName(JftjdjxxBean.class, CommonConstant.DBNAME_SQJW, "queryJftjxx",pageInfo.getOffset(),pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public static void deleteJftjxx(String bh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteJftjxx", bh);
	}

	public static JftjdjxxBean getJftjByBh(String bh) throws SQLException {
		return executor.queryObjectWithDBName(JftjdjxxBean.class, CommonConstant.DBNAME_SQJW, "getJftjByBh", bh);
	}

	public static void deleteJftjxxByBh(String bh) throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteJftjxxByBh", bh);
	}

	public static void insertJftj(JftjdjxxBean jftjBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertJftjxx", jftjBean);	
		
	}

	public static void updateJftj(JftjdjxxBean jftjBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJftjxx", jftjBean);
		
	}

	public static void updateJftjcyr(JfcyrxxBean cyr) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJfcyrxx", cyr);	
	}

	public static void insertJfcyrxx(JfcyrxxBean cyr) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertJfcyrxx", cyr);	
	}

	public static List<JfcyrxxBean> getJfcyrxxByjfbh(String bh) throws SQLException {
		return executor.queryListWithDBName(JfcyrxxBean.class, CommonConstant.DBNAME_SQJW, "queryJfcyrByjfbh", bh);
	}

	public static void deleteJfdsrxx(String bh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteJfcyrxx", bh);
	}

	public static void deleteJfcyrxx(String bh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteJfcyrbyjfbh", bh);
		
	}

	public static PageResultInfo<JfcyrxxBean> getJftjcyrxxbyjfbh(String bh,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfo(JfcyrxxBean.class, "queryJfcyrByjfbh", pageInfo.getOffset(), pageInfo.getPageSize(), bh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public static JfcyrxxBean getJftjcyrxxbybh(String dsrbh) throws SQLException {
		return executor.queryObjectWithDBName(JfcyrxxBean.class,CommonConstant.DBNAME_SQJW, "querydsrxxbybh", dsrbh);
	}

	public static JfcyrxxBean queryJfcyrxxBeanBySfzhAndBh(String sfzh,String bh) throws Exception{
		return executor.queryObjectWithDBName(JfcyrxxBean.class, CommonConstant.DBNAME_SQJW, "queryJfcyrxxBeanBySfzhAndBh", sfzh,bh);
	}
}
