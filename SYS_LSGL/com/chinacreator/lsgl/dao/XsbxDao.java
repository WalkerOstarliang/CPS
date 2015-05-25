package com.chinacreator.lsgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.lsgl.bean.RkgxrxxBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryXsbxBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;

public class XsbxDao {
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/lsgl/dao/xsbx-sql.xml");

	public static ZdryGzdxBean getGzdxBeanBysfzh(String sfzh) throws SQLException {
		// TODO Auto-generated method stub
		return executor.queryObjectWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW, "queryGzdxbysfzh", sfzh);
	}

	public static void saveXsbxBean(ZdryXsbxBean xsbsBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXsbxBean", xsbsBean);
		
	}

	public static ZdryXsbxBean queryXsbxBeansBySfzh(String sfzh) throws SQLException {
		return executor.queryObjectWithDBName(ZdryXsbxBean.class, CommonConstant.DBNAME_SQJW, "queryXsbxBeansBySfzh", sfzh);
	}

	public static List<RkgxrxxBean> queryGxrBeansByRybh(String rybh) throws SQLException {
		return executor.queryListWithDBName(RkgxrxxBean.class, CommonConstant.DBNAME_SQJW, "queryRkgxrBeansByRybh", rybh);
	}

	public static void updateXsbxBean(ZdryXsbxBean xsbsBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXsbxBean", xsbsBean);
		
	}

	public static ZdryGzdxBean queryGzdxBeanBySfzh(String sfzh) throws SQLException {
		return executor.queryObjectBeanWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW, "queryGzdxBeanBySfzh", sfzh);
	}
	
	public static List<ZdryXsbxBean> queryXsbxListBySfzh(String sfzh) throws SQLException{
		return executor.queryListWithDBName(ZdryXsbxBean.class, CommonConstant.DBNAME_SQJW, "queryXsbxListBySfzh", sfzh);
	}

}
