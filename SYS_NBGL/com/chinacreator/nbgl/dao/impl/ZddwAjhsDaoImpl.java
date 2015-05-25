package com.chinacreator.nbgl.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.nbgl.bean.AjxxBean;
import com.chinacreator.nbgl.dao.ZddwAjHsDao;
import com.chinacreator.zagl.bean.OperateBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class ZddwAjhsDaoImpl implements ZddwAjHsDao {

	private static final long serialVersionUID = 5404767156653916883L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
							"com/chinacreator/nbgl/dao/impl/ajhs-sql.xml");

	@Override
	public AjxxBean queryAjxxInfoByAjbh(String ajbh) throws SQLException {
		return executor.queryObjectWithDBName(AjxxBean.class, CommonConstant.DBNAME_SQJW, "queryAjxxInfoByAjbh", ajbh);
	}

	@Override
	public PageResultInfo<AjxxBean> queryAjxxList(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(AjxxBean.class, CommonConstant.DBNAME_SQJW,
				"queryAjxxList", pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}
	
	@Override
	public List<AjxxBean> queryAjxxList(QueryBean query) throws SQLException {
		return executor.queryListBeanWithDBName(AjxxBean.class, CommonConstant.DBNAME_SQJW, "queryAjxxList", query);
	}

	@Override
	public void updateAJxxSfhs(String ajbh, String sfhs) throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW,"updateAJxxSfhs",sfhs,ajbh);
	}

	@Override
	public void updateAjxxSfZddwFa(String ajbh, String sfzddwfa)
			throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW,"updateAjxxSfZddwFa",sfzddwfa,ajbh);
	}

	@Override
	public void updateAjxxZddwdm(String ajbh, String zddwdm)
			throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW,"updateAjxxZddwdm",zddwdm,ajbh);
	}

	@Override
	public void updateCzxx(OperateBean oper) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCzxx", oper);
	}

	@Override
	public List<SystemDictionaryBean> loadAjlbDic() throws SQLException {
		return executor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, "getAjlbDic");
	}
}
