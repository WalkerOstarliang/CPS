package com.chinacreator.xtgl.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.xtgl.bean.BywclBean;
import com.chinacreator.xtgl.bean.JwtBean;
import com.chinacreator.xtgl.bean.KhpmBean;
import com.chinacreator.xtgl.bean.SjcjslBean;
import com.chinacreator.xtgl.bean.SqkhtjBean;
import com.chinacreator.xtgl.bean.WtsjtjfxBean;
import com.chinacreator.xtgl.bean.WtsjtjfxpzBean;
import com.chinacreator.xtgl.dao.KhkpDao;
import com.chinacreator.xtgl.query.JwtQueryBean;
import com.chinacreator.xtgl.query.KhkpQueryBean;
import com.chinacreator.xtgl.query.WtsjtjfxQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.Record;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.common.poolman.handle.NullRowHandler;
import com.frameworkset.util.ListInfo;

public class KhkpDaoImpl implements KhkpDao {

	private static final long serialVersionUID = 2928798483006642075L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/xtgl/dao/khkp-sql.xml");

	public List<KhpmBean> queryKhkp(QueryBean bean)
			throws SQLException {
		return executor.queryListBeanWithDBName(KhpmBean.class, CommonConstant.DBNAME_SQJW, "queryKhkp", bean);
		 
	}

	public List<KhpmBean> queryKhkpDl(QueryBean bean)
			throws SQLException {
		return executor.queryListBeanWithDBName(KhpmBean.class, CommonConstant.DBNAME_SQJW, "queryKhkpDl",bean);
	}

	public List<KhpmBean> queryKhkpXl(QueryBean bean)
			throws SQLException {
		return executor.queryListBeanWithDBName(KhpmBean.class, CommonConstant.DBNAME_SQJW, "queryKhkpXl",bean);
	}

	public List<SqkhtjBean> querySqkhtj(QueryBean bean) throws SQLException {
		return executor.queryListBeanWithDBName(SqkhtjBean.class, CommonConstant.DBNAME_SQJW, "querySqkhtj",bean);
	}

	@Override
	public PageResultInfo<SjcjslBean> querySjcjList(QueryBean bean,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(SjcjslBean.class, CommonConstant.DBNAME_SQJW, "querySjcjList", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public List<SjcjslBean> querySjcsslList(QueryBean bean) throws SQLException {
		return executor.queryListBeanWithDBName(SjcjslBean.class, CommonConstant.DBNAME_SQJW,"querySjcjList", bean);
	}

	@Override
	public PageResultInfo<JwtBean> queryJwtBeansPageResult(
			JwtQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(JwtBean.class, CommonConstant.DBNAME_SQJW, "queryJwtBeansPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}


	public void inserJwtBean(JwtBean jwtBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "inserJwtBean", jwtBean);
	}
	
	public void updateJwtBean(JwtBean jwtBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJwtBean", jwtBean);
	}
	
	public JwtBean queryJwtBeanById(JwtQueryBean queryBean) throws Exception
	{
		return executor.queryObjectBeanWithDBName(JwtBean.class, CommonConstant.DBNAME_SQJW, "queryJwtBean", queryBean);
	}
	
	public void zxhfJwtBean(JwtQueryBean queryBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		SQLParams params = new SQLParams();
		params.addSQLParam("id", queryBean.getId(), SQLParams.STRING);
		params.addSQLParam("yxx", queryBean.getYxx(), SQLParams.STRING);
		params.addSQLParam("czdwdm", loginInfo.getOrgcode(), SQLParams.STRING);
		params.addSQLParam("czdwmc", loginInfo.getOrgname(), SQLParams.STRING);
		params.addSQLParam("czrxm", loginInfo.getRealname(), SQLParams.STRING);
		params.addSQLParam("czrjh", loginInfo.getUsername(), SQLParams.STRING);
		params.addSQLParam("czrsfzh", loginInfo.getSfzh(), SQLParams.STRING);
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zxhfJwtBean", params);
	}
	
	public String getExistJwtPz(JwtQueryBean queryBean)
	{
		try
		{
			return executor.queryFieldBeanWithDBName(CommonConstant.DBNAME_SQJW, "getExistJwtPz", queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "";
	}

	@Override
	public PageResultInfo<WtsjtjfxBean> queryWtsjtjfxBeanList(WtsjtjfxQueryBean queryBean, PageInfo pageInfo)
	{
		PageResultInfo<WtsjtjfxBean> pageResultInfo = null;
		try
		{
			if (queryBean.isUsePage())
			{
				ListInfo listInfo = executor.queryListInfoBeanWithDBName(WtsjtjfxBean.class, CommonConstant.DBNAME_SQJW, "queryWtsjtjfxBeanList", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
				pageResultInfo = PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
			}
			else
			{
				List<WtsjtjfxBean> list = executor.queryListBeanWithDBName(WtsjtjfxBean.class, CommonConstant.DBNAME_SQJW, "queryWtsjtjfxBeanList", queryBean);
				pageResultInfo = PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResultInfo = new PageResultInfo<WtsjtjfxBean>();
		}
		return pageResultInfo;
	}
	
	@Override
	public PageResultInfo<WtsjtjfxBean> queryWtsjtjfxBakBeanList(
			WtsjtjfxQueryBean queryBean, PageInfo pageInfo)
	{
		PageResultInfo<WtsjtjfxBean> pageResultInfo = null;
		try
		{
			if (queryBean.isUsePage())
			{
				ListInfo listInfo = executor.queryListInfoBeanWithDBName(WtsjtjfxBean.class, CommonConstant.DBNAME_SQJW, "queryWtsjtjfxBakBeanList", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
				pageResultInfo = PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
			}
			else
			{
				List<WtsjtjfxBean> list = executor.queryListBeanWithDBName(WtsjtjfxBean.class, CommonConstant.DBNAME_SQJW, "queryWtsjtjfxBakBeanList", queryBean);
				pageResultInfo = PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResultInfo = new PageResultInfo<WtsjtjfxBean>();
		}
		return pageResultInfo;
	}
	
	public WtsjtjfxpzBean queryWtsjtjfxpzBean(String sjtype)
	{
		try
		{
			return executor.queryObjectWithDBName(WtsjtjfxpzBean.class, CommonConstant.DBNAME_SQJW, "queryWtsjtjfxpzBean", sjtype);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Map<String, Object> executeQueryWtDataByPzBean(WtsjtjfxpzBean pzBean)
	{
		Map<String, Object> map = new HashMap<String,Object>();
		try
		{
			final String[] fields = pzBean.getShowfields().split(",");
			List<String> fieldslist = new ArrayList<String>();
			for (String field : fields)
			{
				fieldslist.add(field);
			}
			map.put("fields", fieldslist);
			
			String[] fieldnames = pzBean.getShowfieldnames().split(",");
			List<String> fieldnameslist = new ArrayList<String>();
			for (String field : fieldnames)
			{
				fieldnameslist.add(field);
			}
			map.put("fieldnames", fieldnameslist);
			final List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
			SQLExecutor.queryBeanWithDBNameByNullRowHandler(new NullRowHandler<Map<String, String>>(){
				@Override
				public void handleRow(Record record) throws Exception
				{
					Map<String, String> row = new HashMap<String, String>();
					for (String field : fields)
					{
						row.put(field, record.getString(field));
					}
					resultList.add(row);
				}
			}, CommonConstant.DBNAME_SQJW, pzBean.getQuerysql(), pzBean);
			map.put("rows", resultList);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return map;
	}
	
	public List<WtsjtjfxBean> queryMjDetailInfoList(WtsjtjfxQueryBean queryBean)
	{
		try
		{
			return executor.queryListBeanWithDBName(WtsjtjfxBean.class, CommonConstant.DBNAME_SQJW, "queryMjDetailInfoList", queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public WtsjtjfxBean queryWtsjtjfxBeanByOrgcodeAndTjrq(String orgcode, String tjrq)
	{
		try
		{
			return executor.queryObjectWithDBName(WtsjtjfxBean.class, CommonConstant.DBNAME_SQJW, "queryWtsjtjfxBeanByOrgcodeAndTjrq", orgcode,tjrq);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
    public PageResultInfo<BywclBean> queryBywcltj(KhkpQueryBean bean,
            PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(BywclBean.class, CommonConstant.DBNAME_SQJW, "queryBywcltj", pageinfo.getOffset(), pageinfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
    }

	@Override
    public List<BywclBean> downlaodBywcltj(KhkpQueryBean bean)
            throws SQLException {
	    return executor.queryListBeanWithDBName(BywclBean.class, CommonConstant.DBNAME_SQJW, "queryBywcltj", bean);
    }
	
	
}
