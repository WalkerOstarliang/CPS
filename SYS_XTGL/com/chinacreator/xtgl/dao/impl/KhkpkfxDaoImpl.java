package com.chinacreator.xtgl.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.xtgl.bean.KfpzBean;
import com.chinacreator.xtgl.bean.PageTableBean;
import com.chinacreator.xtgl.bean.PageTableHeadBean;
import com.chinacreator.xtgl.dao.KhkpkfxDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;

public class KhkpkfxDaoImpl implements KhkpkfxDao {
	private static final long serialVersionUID = 1L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
			"com/chinacreator/xtgl/dao/khkpkfx-sql.xml");

	@Override
	public KfpzBean queryKfpzByKhlx(String khlx,int leve) throws SQLException {
		return executor.queryObjectWithDBName(KfpzBean.class, CommonConstant.DBNAME_SQJW, "queryKfpzByKhlx", khlx,leve);
	}

	@Override
	public List<PageTableBean> queryTableByKhlx(String khlx,int leve) throws SQLException {
		return executor.queryListWithDBName(PageTableBean.class, CommonConstant.DBNAME_SQJW, "queryTableByKhlx", khlx,leve);
	}

	@Override
	public List<PageTableHeadBean> queryPageTableHeadByTablename(
			String tablename) throws SQLException {
		return executor.queryListWithDBName(PageTableHeadBean.class, CommonConstant.DBNAME_SQJW, "queryPageTableHeadByTablename", tablename);
	}

}
