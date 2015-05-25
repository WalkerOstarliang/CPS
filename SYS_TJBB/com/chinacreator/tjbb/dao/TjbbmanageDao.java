package com.chinacreator.tjbb.dao;

import java.lang.reflect.Field;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.OrgJwsBean;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.bean.JqtbBean;
import com.chinacreator.menu.bean.MhtjQueryBean;
import com.chinacreator.tjbb.bean.CzfwTjbbBean;
import com.chinacreator.tjbb.bean.DatalrtjBean;
import com.chinacreator.tjbb.bean.DwaqjctjbbBean;
import com.chinacreator.tjbb.bean.DwtjBean;
import com.chinacreator.tjbb.bean.GabzzrkTjbbBean;
import com.chinacreator.tjbb.bean.JdTbBean;
import com.chinacreator.tjbb.bean.JzztjbbBean;
import com.chinacreator.tjbb.bean.LdrkTjbbBean;
import com.chinacreator.tjbb.bean.PcsJbqkListBean;
import com.chinacreator.tjbb.bean.PcsJbqkTjBean;
import com.chinacreator.tjbb.bean.PcsJwqJbqkListBean;
import com.chinacreator.tjbb.bean.PcsjbqkhzBean;
import com.chinacreator.tjbb.bean.WeekTableTjbbBean;
import com.chinacreator.tjbb.bean.WeekTjbbBean;
import com.chinacreator.tjbb.query.DataLrthQueryBean;
import com.chinacreator.tjbb.query.PcsTjqkQueryBean;
import com.chinacreator.xqgk.bean.base.OrgBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.Record;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.common.poolman.handle.NullRowHandler;
import com.frameworkset.util.ListInfo;

public class TjbbmanageDao
{
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/tjbb/dao/pcsjbqk-sql.xml");
	public List<PcsJbqkListBean> queryPcsJbqkListByParentCode(String orgcode)
	{
		List<PcsJbqkListBean> list = null;
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("parentcode", orgcode, SQLParams.STRING);
			list = executor.queryListBeanWithDBName(PcsJbqkListBean.class, CommonConstant.DBNAME_SQJW, "queryPcsJbqkListByParentCode", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询派出所基本情况
	 * @param queryBean
	 * @return
	 * @date Sep 15, 2014 10:19:53 AM
	 */
	public List<PcsJwqJbqkListBean> queryPcsJwqJbqkListByQueryBean(PcsTjqkQueryBean queryBean)
	{
		List<PcsJwqJbqkListBean> list = null;
		try
		{
			list = executor.queryListBeanWithDBName(PcsJwqJbqkListBean.class, CommonConstant.DBNAME_SQJW, "queryPcsJwqJbqkListByQueryBean", queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 派出所信息数量
	 * @param queryBean
	 * @return
	 * @date Sep 15, 2014 2:10:50 PM
	 */
	public PcsJbqkTjBean queryPcsxxsl(PcsTjqkQueryBean queryBean)
	{
		PcsJbqkTjBean bean = null;
		try
		{
			bean = executor.queryObjectBeanWithDBName(PcsJbqkTjBean.class, CommonConstant.DBNAME_SQJW, "queryPcsxxsl", queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return bean;
	}
	
	public PcsjbqkhzBean queryPcsjbqkhz(PcsTjqkQueryBean bean) throws SQLException
	{
		if(bean.getOrgLeve() >3){
			bean.setOrgLeve(3);
			bean.setOrgcode(bean.getOrgcode().substring(0,6)+"000000");
		}
		return executor.queryObjectBeanWithDBName(PcsjbqkhzBean.class, CommonConstant.DBNAME_SQJW, "queryPcsjbqkhz", bean);
	}
	
	public PageResultInfo<OrgJwsBean> queryPcsJwqJbqkListPageResult(PcsTjqkQueryBean pcstjQueryBean, PageInfo pageInfo)
	{
		try
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(OrgJwsBean.class, CommonConstant.DBNAME_SQJW, "queryPcsJwqJbqkListPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), pcstjQueryBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return new PageResultInfo<OrgJwsBean>();
		}
	}
	
	
	public List<OrgJwsBean> queryPcsjwqList(PcsTjqkQueryBean pcstjQueryBean)
	{
		try
		{
			List<OrgJwsBean> list = executor.queryListBeanWithDBName(OrgJwsBean.class, CommonConstant.DBNAME_SQJW, "queryPcsJwqJbqkListPageResult", pcstjQueryBean);
			return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	public PageResultInfo<JqtbBean> queryFaqktjPageResult(MhtjQueryBean queryBean, PageInfo pageInfo)
	{
		try
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(JqtbBean.class, CommonConstant.DBNAME_SQJW, "queryFaqktjPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new PageResultInfo<JqtbBean>();
	}
	
	public PageResultInfo<JqtbBean> queryFaqktjYearHzPageResult(MhtjQueryBean queryBean, PageInfo pageInfo)
	{
		try
		{
			if (pageInfo != null)
			{
				ListInfo listInfo = executor.queryListInfoBeanWithDBName(JqtbBean.class, CommonConstant.DBNAME_SQJW, "queryFaqktjYearHzPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
				return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
			}
			else
			{
				List<JqtbBean> list = executor.queryListBeanWithDBName(JqtbBean.class, CommonConstant.DBNAME_SQJW, "queryFaqktjYearHzPageResult", queryBean);
				return PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new PageResultInfo<JqtbBean>();
	}
	
	public List<JqtbBean> queryFaqktjPageList(MhtjQueryBean queryBean)
	{
		try
		{
			List<JqtbBean> listInfo = executor.queryListBeanWithDBName(JqtbBean.class, CommonConstant.DBNAME_SQJW, "queryFaqktjPageResult", queryBean);
			return listInfo;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<OrgBean> queryOrgBeansListByParentCode(PcsTjqkQueryBean bean)
	{
		try
		{
			List<OrgBean> list = executor.queryListBeanWithDBName(OrgBean.class, CommonConstant.DBNAME_SQJW, "queryOrgBeansListByParentCode", bean);
			return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<CzfwTjbbBean> queryCzfwTjbbBeans(CzfwTjbbBean czfwtjbean)
	{
		try
		{
			return executor.queryListBeanWithDBName(CzfwTjbbBean.class, CommonConstant.DBNAME_SQJW, "queryCzfwTjbbBeans", czfwtjbean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<LdrkTjbbBean> queryLdrkTjbbBeans(LdrkTjbbBean ldrktjbbBean)
	{
		try
		{
			return executor.queryListBeanWithDBName(LdrkTjbbBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkTjbbBeans", ldrktjbbBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<GabzzrkTjbbBean> queryGabzzrkTjbbBeans(GabzzrkTjbbBean gabzzrkBean)
	{
		try
		{
			return executor.queryListBeanWithDBName(GabzzrkTjbbBean.class, CommonConstant.DBNAME_SQJW, "queryGabzzrkTjbbBeans", gabzzrkBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<JzztjbbBean> queryJzztjbbBeans(JzztjbbBean jzztjbean)
	{
		try
		{
			return executor.queryListBeanWithDBName(JzztjbbBean.class, CommonConstant.DBNAME_SQJW, "queryJzztjbbBeans", jzztjbean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public PageResultInfo<DatalrtjBean> queryDataLrtjBeans(DataLrthQueryBean queryBean, PageInfo pageInfo)
	{
		
		try
		{
			if (pageInfo == null)
			{
				List<DatalrtjBean> list = executor.queryListBeanWithDBName(DatalrtjBean.class, CommonConstant.DBNAME_SQJW, "queryDataLrtjBeans", queryBean);
				return PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
			}
			else
			{
				ListInfo listInfo = executor.queryListInfoBeanWithDBName(DatalrtjBean.class, CommonConstant.DBNAME_SQJW, "queryDataLrtjBeans", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
				return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new PageResultInfo<DatalrtjBean>();
	}

/**
	 * 查询单位安全检查数据统计
	 * @param pageInfo
	 * @param aqjctjBean
	 * @return
	 * @date Jan 29, 2015 10:52:53 AM
	 */
	public PageResultInfo<DwaqjctjbbBean> queryDwaqjctjbbBeanPageResult(PageInfo pageInfo, DwaqjctjbbBean aqjctjBean)
	{
		try
		{
			if (pageInfo == null)
			{
				List<DwaqjctjbbBean> list = executor.queryListBeanWithDBName(DwaqjctjbbBean.class, CommonConstant.DBNAME_SQJW, "queryDwaqjctjbbBeanPageResult", aqjctjBean);
				return PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
			}
			else
			{
				ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwaqjctjbbBean.class, CommonConstant.DBNAME_SQJW, "queryDwaqjctjbbBeanPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), aqjctjBean);
				return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new PageResultInfo<DwaqjctjbbBean>();
	}
		
	/**
	 * 查询单位统计
	 * @param query
	 * @return
	 * @throws SQLException
	 */
	public List<DwtjBean> queryDwtjList(QueryBean query) throws SQLException{
		return executor.queryListBeanWithDBName(DwtjBean.class, CommonConstant.DBNAME_SQJW, "queryDwtjList", query);
	}
	
	/**
	 * 查询发案情况统计
	 * @param queryBean
	 * @return
	 * @throws SQLException
	 * @date Jan 30, 2015 10:28:49 AM
	 */
	public Map<String, JqtbBean> queryFaqktjBeans(MhtjQueryBean queryBean) throws SQLException
	{
		final Map<String, JqtbBean> map = new HashMap<String, JqtbBean>();
		executor.queryBeanWithDBNameByNullRowHandler(new NullRowHandler<Map<String,JqtbBean>>(){

			@Override
			public void handleRow(Record record) throws Exception
			{
				JqtbBean bean = new JqtbBean();
				Field f = record.getClass().getDeclaredField("fields");
				// 设置私有属性可访问
				f.setAccessible(true);
				// 获取所有属性的值
				String[] fields = (String[]) f.get(record);
				for (String field : fields)
				{
					PropertyUtils.setProperty(bean, field.toLowerCase(),  record.getString(field));
				}
				map.put(bean.getTjyf(), bean);
			}
			
		}, CommonConstant.DBNAME_SQJW, "queryFaqktjBeans", queryBean);
		return map;
	}
	
	/**
	 * 
	 * @param tjbbBean
	 * @param pageInfo
	 * @return
	 * @date Feb 11, 2015 2:48:26 PM
	 */
	public PageResultInfo<WeekTjbbBean> queryWeekTjbbBeanPageResultInfo(WeekTjbbBean tjbbBean, PageInfo pageInfo) throws SQLException
	{
		if (pageInfo != null)
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(WeekTjbbBean.class, CommonConstant.DBNAME_SQJW, "queryWeekTjbbBeanPageResultInfo", pageInfo.getOffset(), pageInfo.getPageSize(), tjbbBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		else
		{
			List<WeekTjbbBean> list = executor.queryListBeanWithDBName(WeekTjbbBean.class, CommonConstant.DBNAME_SQJW, "queryWeekTjbbBeanList", tjbbBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
		}
	}
	
	public List<JdTbBean> queryJdTbList(QueryBean query) throws SQLException{
		return executor.queryListBeanWithDBName(JdTbBean.class, CommonConstant.DBNAME_SQJW, "queryJdTbList", query);
	}
	
	/**
	 * 查询周采集情况
	 * @param tjbbBean
	 * @return
	 * @date May 12, 2015 3:42:00 PM
	 */
	public List<WeekTableTjbbBean> queryWeekTableTjbbBeans(WeekTjbbBean tjbbBean)
	{
		List<WeekTableTjbbBean> list = null;
		try
		{
			list = executor.queryListBeanWithDBName(WeekTableTjbbBean.class, CommonConstant.DBNAME_SQJW, "queryWeekTableTjbbBeans", tjbbBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
}
