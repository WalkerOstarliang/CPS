package com.chinacreator.rhzf.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.rhzf.bean.RhzfTjBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;

public class RhzfTjDao implements Serializable {

	private static final long serialVersionUID = -8505155292989283553L;
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
						"com/chinacreator/rhzf/dao/impl/rhzftj-sql.xml");
	
	public List<RhzfTjBean> queryRhzfTj(QueryBean query) throws SQLException{
		List<RhzfTjBean> list = executor.queryListBeanWithDBName(RhzfTjBean.class, CommonConstant.DBNAME_SQJW, "queryRhzfTj", query);
		return list;
		
	}
	
	public List<RhzfTjBean> queryRhzfTjsq(QueryBean query) throws SQLException{
		List<RhzfTjBean> list = executor.queryListBeanWithDBName(RhzfTjBean.class, CommonConstant.DBNAME_SQJW, "queryRhzfTjsq", query);
		return list;
		
	}
	
}
