package com.chinacreator.zagl.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zagl.bean.DdcjjBean;
import com.chinacreator.zagl.bean.DdcjjQueryBean;
import com.chinacreator.zagl.dao.DdcjjDaointerf;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.util.ListInfo;

public class DdcjjDaointerfimpl implements DdcjjDaointerf {

	/**
	 * 交警采集电动车查询
	 */
	private static final long serialVersionUID = 9115083316555744626L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
	"com/chinacreator/zagl/dao/sql/ddccxjj-sql.xml");
	
	@Override
	public List<DdcjjBean> dowloadExcel(DdcjjQueryBean query) {
		try {
			return	executor.queryListBeanWithDBName(DdcjjBean.class, CommonConstant.DBNAME_SQJW, "dowloadExcel", query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public DdcjjBean queryDdcjjBeanById(String id) {
		try {
			return executor.queryObjectWithDBName(DdcjjBean.class, CommonConstant.DBNAME_SQJW, "queryDdcjjById", id);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public PageResultInfo<DdcjjBean> queryDdcjjList(DdcjjQueryBean ddcjjquerybean,
			PageInfo pageInfo)  {
		
			ListInfo list;
			try {
				list = executor.queryListInfoBeanWithDBName(DdcjjBean.class, CommonConstant.DBNAME_SQJW, "queryDdcxjjList", pageInfo.getOffset(), pageInfo.getPageSize(), ddcjjquerybean);
				return PaginationHelper.wrapPageResultInfo(pageInfo,list);
			} catch (SQLException e) {
				e.printStackTrace();
				
				return null;
			}
			
		
		
	}

	@Override
	public List<DdcjjBean> queryDdcjjListByCar_id(String v_car_id) {
		
		v_car_id = "'" + v_car_id.replace(",", "','") + "'";
		String sql=null;
		try {
			sql = executor.getSql("queryDdcjjListByCar_id").replace("#[v_car_id]", v_car_id);
			return SQLExecutor.queryListWithDBName(DdcjjBean.class, CommonConstant.DBNAME_SQJW, sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		
	}

}
