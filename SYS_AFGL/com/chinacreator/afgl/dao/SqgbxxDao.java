package com.chinacreator.afgl.dao;

import java.util.List;
import com.chinacreator.afgl.bean.SqddbxxBean;
import com.chinacreator.afgl.bean.SqgbxxBean;
import com.chinacreator.afgl.query.SqddbxxQueryBean;
import com.chinacreator.afgl.query.SqgbxxQueryBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;
/**
 * 社区干部dao
 * @author mingchun.xiong
 *
 */
public class SqgbxxDao
{
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/afgl/dao/sqgbxx-sql.xml");
	
	/**
	 * 社区干部类别查询对象
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<SqgbxxBean> querySqgbxxPageResultInfoByQueryBean(SqgbxxQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		if (pageInfo != null)
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(SqgbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqgbxxPageResultInfoByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		else
		{
			List<SqgbxxBean> list = executor.queryListBeanWithDBName(SqgbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqgbxxPageResultInfoByQueryBean", queryBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
		}
	}
	
	public static PageResultInfo<SqddbxxBean> querySqddbxxPageResultInfoByQueryBean(SqddbxxQueryBean queryBeanddb, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(SqddbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqddbxxPageResultInfoByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBeanddb);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询社区干部信息通过干部编号
	 * @param gbbh
	 * @return
	 * @throws Exception
	 */
	public static SqgbxxBean querySqgbxxBeanByGbbh(String gbbh) throws Exception
	{
		return executor.queryObjectWithDBName(SqgbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqgbxxBeanByGbbh", gbbh);
	}
	
	public static SqddbxxBean  querySqddbxxBeanById(String id) throws Exception{
		return executor.queryObjectWithDBName(SqddbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqddbxxBeanById", id);

	}
	
	/**
	 * 插入社区干部
	 * @param bean
	 * @throws Exception
	 */
	public static void insertSqgbxxBean(SqgbxxBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSqgbxxBean", bean);
	}
	
	public static void insertSqddbxxBean(SqddbxxBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSqddbxxBean", bean);
	}
	/**
	 * 更新社区干部信息
	 * @param bean
	 * @throws Exception
	 */
	public static void updateSqgbxxBean(SqgbxxBean bean) throws Exception
	{
		if ("1".equals(bean.getSfdl()))
		{
			bean.setZxbs("0");
			bean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSqgbxxBean", bean);
	}
	
	public static void updateSqddbxxBean(SqddbxxBean bean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSqddbxxBean", bean);
	}
	
	/**
	 * 通过干部编号删除干部信息，做物理删除
	 * @param gbbh
	 * @throws Exception
	 */
	public static void deleteSqgbxxBeanByGbbh(String gbbh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteSqgbxxBeanByGbbh", gbbh);
	}
	
	public static void deleteSqddbxxBeanById(String id) throws Exception
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteSqddbxxBeanById", id);
	}
	
	/**
	 * 根据身份证查询干部信息
	 * @param sfzh
	 * @return
	 * @throws Exception
	 */
	public static SqgbxxBean querySqgbxxBeanBySfzh(String sfzh) throws Exception
	{
		return executor.queryObjectWithDBName(SqgbxxBean.class, CommonConstant.DBNAME_SQJW, "querySqgbxxBeanBySfzh", sfzh);
	}
	
	public static int querySqgbCountBySssqbhAndSfzh(String sssqbh, String sfzh) throws Exception
	{
		String count = executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "querySqgbCountBySssqbhAndSfzh", sssqbh,sfzh);
		return Integer.parseInt(count);
	}
	
	public static int querySqddbCountBySssqbhAndSfzh(String sqdm, String sfzh) throws Exception{
		String count = executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "querySqddbCountBySssqbhAndSfzh", sqdm,sfzh);
		return Integer.parseInt(count);
	}
}
