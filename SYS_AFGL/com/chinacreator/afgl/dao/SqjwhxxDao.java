package com.chinacreator.afgl.dao;

import com.chinacreator.afgl.bean.SqjwhxxBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class SqjwhxxDao
{
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/afgl/dao/sqjwhxx-sql.xml");
	
	/**
	 * 查询社区警务会分页信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<SqjwhxxBean> querySqJwhPageResultInfoByQueryBean(
			QueryBean queryBean, PageInfo pageInfo) throws Exception 
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(SqjwhxxBean.class, CommonConstant.DBNAME_SQJW, "querySqJwhPageResultInfoByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询社区居委会对象通过居委会编号
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public static SqjwhxxBean querySqjwhBeanByJwhbh(String jwhbh) throws Exception 
	{
		return executor.queryObjectWithDBName(SqjwhxxBean.class, CommonConstant.DBNAME_SQJW, "querySqjwhBeanByJwhbh", jwhbh);
	}
	
	/**
	 * 插入居委会对象
	 * @param bean
	 * @throws Exception
	 */
	public static void insertJwhBean(SqjwhxxBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertJwhBean", bean);
	}
	
	/**
	 * 更新居委会对象
	 * @param bean
	 * @throws Exception
	 */
	public static void updateJwhBean(SqjwhxxBean bean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJwhBean", bean);
	}
	
	/**
	 * 删除居委会对象通过居委会编号
	 * @param jwhbh
	 * @throws Exception
	 */
	public static void deleteJwhBeanByJwhbh(String jwhbh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteJwhBeanByJwhbh", jwhbh);
	}

}
