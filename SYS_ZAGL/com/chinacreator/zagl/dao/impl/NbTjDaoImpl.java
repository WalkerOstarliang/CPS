package com.chinacreator.zagl.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zagl.bean.nbtj.AjxxBean;
import com.chinacreator.zagl.bean.nbtj.NbdwFaTj;
import com.chinacreator.zagl.bean.nbtj.WyxqFaTj;
import com.chinacreator.zagl.bean.nbtj.Wyxqtb;
import com.chinacreator.zagl.bean.nbtj.ZddwFa;
import com.chinacreator.zagl.dao.NbTjDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class NbTjDaoImpl implements NbTjDao {

	private static final long serialVersionUID = 6021925383228845594L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
				"com/chinacreator/zagl/dao/sql/nbtj-sql.xml");
	
	@Override
	public List<Wyxqtb> queryWyxqTb(QueryBean query) throws SQLException {
		return executor.queryListBeanWithDBName(Wyxqtb.class, CommonConstant.DBNAME_SQJW, "queryWyxqTb", query);
	}

	@Override
	public List<WyxqFaTj> queryWyxqFatj(QueryBean query) throws SQLException {
		return executor.queryListBeanWithDBName(WyxqFaTj.class, CommonConstant.DBNAME_SQJW, "queryWyxqFatj", query);
	}

	@Override
	public List<NbdwFaTj> queryNbdwFa(QueryBean query) throws SQLException {
		return executor.queryListBeanWithDBName(NbdwFaTj.class, CommonConstant.DBNAME_SQJW, "queryNbdwFa", query);
	}

	@Override
	public List<ZddwFa> queryZddwFa(QueryBean query) throws SQLException {
		return executor.queryListBeanWithDBName(ZddwFa.class, CommonConstant.DBNAME_SQJW, "queryZddwFa", query);
	}

	@Override
	public List<AjxxBean> queryAjxxListByFadddm(QueryBean query) throws SQLException {
		return executor.queryListBeanWithDBName(AjxxBean.class, CommonConstant.DBNAME_SQJW, "queryAjxxByFadddm", query);
	}

	@Override
	public List<AjxxBean> queryAjxxListWithNbdw(QueryBean query) throws SQLException {
		return executor.queryListBeanWithDBName(AjxxBean.class, CommonConstant.DBNAME_SQJW, "queryAjxxWithNbdw", query);
	}

	@Override
	public List<AjxxBean> queryAjxxListWithWyxq(QueryBean query) throws SQLException {
		return executor.queryListBeanWithDBName(AjxxBean.class, CommonConstant.DBNAME_SQJW, "queryAjxxWithWyxq", query);
	}
	
	@Override
	public PageResultInfo<AjxxBean> queryAjxxByFadddm(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(AjxxBean.class, CommonConstant.DBNAME_SQJW, "queryAjxxByFadddm", pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}


	@Override
	public PageResultInfo<AjxxBean> queryAjxxWithNbdw(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(AjxxBean.class, CommonConstant.DBNAME_SQJW, "queryAjxxWithNbdw", pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}

	@Override
	public PageResultInfo<AjxxBean> queryAjxxWithWyxq(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(AjxxBean.class, CommonConstant.DBNAME_SQJW, "queryAjxxWithWyxq", pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}
	
	
}
