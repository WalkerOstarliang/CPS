package com.chinacreator.gis.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.gis.bean.StxxBean;
import com.chinacreator.gis.query.StxxQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;

public class StxxDao extends BaseValue
{

	private static final long serialVersionUID = 7092028814457360095L;
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/gis/dao/stxx-sql.xml");

	public List<StxxBean> queryStxxPage(StxxQueryBean stxx)
	{
		try
		{
			return executor.queryListBean(StxxBean.class, "queryStxxPage", stxx);
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}

}
