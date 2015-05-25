package com.chinacreator.xfdw.dao;

import java.sql.SQLException;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.xfdw.bean.XFxxExportBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;

public class ImportDao {
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/xfdw/dao/hzgl-import-sql.xml");
	/**
	 * 导入火灾落地信息
	 * @param 
	 * @param
	 * @return 
	 * @throws SQLException
	 */
	public void insert(XFxxExportBean bean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "importHzxx", bean);
	}
	
	
}
