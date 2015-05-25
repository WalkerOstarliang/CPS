package com.chinacreator.nbgl.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.nbgl.bean.GjcBean;
import com.chinacreator.nbgl.dao.GjcDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class GjcDaoImpl implements GjcDao {

	
	private static final long serialVersionUID = -6744051287937225505L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
									"com/chinacreator/nbgl/dao/impl/nbgjc-sql.xml");
	
	@Override
	public void deleteGjc(GjcBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteGjc", bean);
	}

	@Override
	public void insertGjc(GjcBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertGjc", bean);

	}

	@Override
	public void updateGjc(GjcBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateGjc", bean);
	}

	@Override
	public PageResultInfo<GjcBean> queryGjcList(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(GjcBean.class,
						CommonConstant.DBNAME_SQJW, "queryGjcList", pageinfo.getOffset(), 
						pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}

	@Override
	public List<GjcBean> queryGjcListByGjc(String gjc) throws SQLException {
		return executor.queryListWithDBName(GjcBean.class, CommonConstant.DBNAME_SQJW, "queryGjcListByGjc", gjc);
	}

	@Override
	public void insertGjcLog(GjcBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertGjcLog", bean);
	}

	@Override
	public GjcBean queryGjcById(String gjcId) throws SQLException {
		return executor.queryObjectWithDBName(GjcBean.class, CommonConstant.DBNAME_SQJW, "queryGjcById", gjcId);
	}

	@Override
	public List<SystemDictionaryBean> getAjlbDic() throws SQLException {
		return executor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, "getAjlbDic", "");
	}
	
	
}
