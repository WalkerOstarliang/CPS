package com.chinacreator.xtgl.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.xtgl.bean.DwjcpzBean;
import com.chinacreator.xtgl.bean.JjrzdBean;
import com.chinacreator.xtgl.dao.DwjcpzDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class DwjcpzDaoImpl implements DwjcpzDao{

	private static final long serialVersionUID = 4864823703682606115L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
			"com/chinacreator/xtgl/dao/dwjcpz-sql.xml");
	public List<JjrzdBean> getJjrZd() throws SQLException{
		return executor.queryListBeanWithDBName(JjrzdBean.class, CommonConstant.DBNAME_SQJW, "getJjrZd",new DwjcpzBean());
	}

	public void batchDeleteDwjcpz(List<DwjcpzBean> beans) throws SQLException {
		 executor.updateBeans(CommonConstant.DBNAME_SQJW, "batchDeleteDwjcpz", beans);
	}

	public DwjcpzBean insertDwjcpz(DwjcpzBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwjcpz", bean);
		return bean;
	}

	public DwjcpzBean queryDwjcpzById(String id) throws SQLException {
		return executor.queryObjectWithDBName(DwjcpzBean.class, CommonConstant.DBNAME_SQJW, "queryDwjcpzById", id);
	}

	public PageResultInfo<DwjcpzBean> queryDwjcpzPageResultInfo(
			PageInfo pageinfo, QueryBean queryBean) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwjcpzBean.class, CommonConstant.DBNAME_SQJW, "queryDwjcpzPageResultInfo", pageinfo.getOffset(), pageinfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageinfo, listInfo);
	}

	public DwjcpzBean updateDwjcpz(DwjcpzBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwjcpz", bean);
		return bean;
	}

	public void deleteJjrjc(String id) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteJjrjc", id);
		
	}

	public void insertJjrjc(List<JjrzdBean> jjrList) throws SQLException {
		executor.insertBeans(CommonConstant.DBNAME_SQJW, "insertJjrjc" , jjrList);
	}

	public List<JjrzdBean> queryJjrjcById(String id) throws SQLException {
		return executor.queryListWithDBName(JjrzdBean.class, CommonConstant.DBNAME_SQJW, "queryJjrjcById", id);
	}
}
