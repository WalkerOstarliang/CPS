package com.chinacreator.qzgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.qzgl.bean.ZyzdjxxBean;
import com.chinacreator.qzgl.bean.ZyzzcxxBean;
import com.chinacreator.qzgl.query.ZyzQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class ZyzDao {
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/qzgl/dao/zyzgl-sql.xml");

	public static PageResultInfo<ZyzdjxxBean> getZyzxx(ZyzQueryBean queryBean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(ZyzdjxxBean.class, CommonConstant.DBNAME_SQJW, "queryzyzxx", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public static ZyzdjxxBean getZyzByBh(String bh) throws SQLException {
		return executor.queryObjectWithDBName(ZyzdjxxBean.class, CommonConstant.DBNAME_SQJW, "queryZyzByBh", bh);
	}

	public static void insertZyz(ZyzdjxxBean zyzdjxxBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZyz",zyzdjxxBean);
		
	}

	public static void updateZyz(ZyzdjxxBean zyzdjxxBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZyz", zyzdjxxBean);
		
	}

	public static void deleteZyz(String bh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteZyz",bh);
		
	}
	public static void insertZcxx(ZyzzcxxBean zyzzcxxBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZcxx",zyzzcxxBean);
		
	}

	public static List<ZyzzcxxBean> queryZcxx(String bh) throws SQLException {
		return (List<ZyzzcxxBean>) executor.queryListWithDBName(ZyzzcxxBean.class,CommonConstant.DBNAME_SQJW,"queryZcxx",bh);
	}

	public static void deleteZyzzc(String bh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteZc",bh);
		
	}

	public static void updateZyzzc(ZyzzcxxBean zc) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZc",zc);
		
	}

	public static PageResultInfo<ZyzzcxxBean> getZyzzcxx(
			String bh, PageInfo pageInfo) throws SQLException {
	//ListInfo listInfo = executor.queryListInfoBeanWithDBName(ZyzdjxxBean.class, CommonConstant.DBNAME_SQJW, "queryzyzzcxx", pageInfo.getOffset(), pageInfo.getPageSize(), bh);
		ListInfo listInfo = executor.queryListInfoWithDBName(ZyzzcxxBean.class,CommonConstant.DBNAME_SQJW,"queryZcxx", pageInfo.getOffset(), pageInfo.getPageSize(), bh );
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public static void deleteZyzzcxx(String bh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteZcxx",bh);
		
	}

	public static ZyzzcxxBean getzyzzcBybh(String bh) throws SQLException {
		return executor.queryObjectWithDBName(ZyzzcxxBean.class, CommonConstant.DBNAME_SQJW, "getzcxxbybh", bh);
	}

	public static ZyzdjxxBean  getZyzxxBysfzh(String  sfzh) throws Exception{
		return executor.queryObjectWithDBName(ZyzdjxxBean.class, CommonConstant.DBNAME_SQJW, "getZyzxxBysfzh", sfzh);
	}
	
	public static ZyzdjxxBean queryZyzdjxxBeanBySfzhAndOrgcode(String sfzh,String orgcode) throws SQLException {
		return executor.queryObjectWithDBName(ZyzdjxxBean.class,CommonConstant.DBNAME_SQJW, "queryZyzdjxxBeanBySfzhAndOrgcode",sfzh,orgcode);
	}
}
