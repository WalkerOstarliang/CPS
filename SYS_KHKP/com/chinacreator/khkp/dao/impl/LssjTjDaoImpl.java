package com.chinacreator.khkp.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.khkp.bean.LssjTjBean;
import com.chinacreator.khkp.dao.LssjTjDao;
import com.chinacreator.khkp.query.LssjTjQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.Record;
import com.frameworkset.common.poolman.handle.NullRowHandler;
import com.frameworkset.util.ListInfo;

public class LssjTjDaoImpl implements LssjTjDao {

	private static final long serialVersionUID = 4717697342967149483L;

	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
			"com/chinacreator/khkp/dao/impl/lssjtj-sql.xml");

	@Override
	public PageResultInfo<LssjTjBean> queryCyry(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "queryCyry", pageInfo.getOffset(),
				pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> queryCzfw(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "queryCzfw", pageInfo.getOffset(),
				pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> queryCzfwxc(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "queryCzfwxc",
				pageInfo.getOffset(), pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> queryCzrk(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "queryCzrk", pageInfo.getOffset(),
				pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> queryDw(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "queryDw", pageInfo.getOffset(),
				pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> queryFw(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "queryFw", pageInfo.getOffset(),
				pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> queryJwrk(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "queryJwrk", pageInfo.getOffset(),
				pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> queryJzrk(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "queryJzrk", pageInfo.getOffset(),
				pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> queryLdrk(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "queryLdrk", pageInfo.getOffset(),
				pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> queryLdrkyq(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "queryLdrkyq",
				pageInfo.getOffset(), pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> querySt(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "querySt", pageInfo.getOffset(),
				pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> querySyrk(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "querySyrk", pageInfo.getOffset(),
				pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public PageResultInfo<LssjTjBean> queryWlhrk(LssjTjQueryBean query,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(LssjTjBean.class,
				CommonConstant.DBNAME_SQJW, "queryWlhrk", pageInfo.getOffset(),
				pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public List<Map<String, String>> queryRsdfxList(LssjTjQueryBean queryBean)
			throws SQLException
	{
		final String[] fields = {"dwdm","leve","dwmc","a_thrth","a_twel","a_elev","a_ten","a_nin","a_eig","a_sev","a_six","a_fiv","a_fou","a_thr","a_two","a_ong","a_tod"};
		
		final List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		executor.queryBeanWithDBNameByNullRowHandler(new NullRowHandler<Map<String, String>>(){

			@Override
			public void handleRow(Record record) throws Exception
			{
				Map<String, String> map = new LinkedHashMap<String, String>();
				for (String field : fields)
				{
					map.put(field.toLowerCase(), record.getString(field));
				}
				
				list.add(map);
			}
			
		},CommonConstant.DBNAME_SQJW, "queryRsdfxList", queryBean);
		return list;
	}
}
