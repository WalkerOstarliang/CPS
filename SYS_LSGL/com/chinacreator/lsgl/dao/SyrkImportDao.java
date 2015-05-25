package com.chinacreator.lsgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.lsgl.bean.SyrkImportBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class SyrkImportDao
{
	private static ConfigSQLExecutor executor=new ConfigSQLExecutor("com/chinacreator/lsgl/dao/syrkimport-sql.xml");
	
	/**
	 * 插入导入的实有人口信息
	 * @param syrkBeans
	 * @throws Exception
	 * @date Jan 5, 2015 10:13:40 AM
	 */
	public void insertImportSyrkxx(SyrkImportBean syrkBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertImportSyrkxx", syrkBean);
	}
	
	/**
	 * 更新实有人口导入
	 * @param syrkBean
	 * @throws Exception
	 * @date Jan 6, 2015 3:44:22 PM
	 */
	public void updateImportSyrkxx(SyrkImportBean syrkBean) throws SQLException
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateImportSyrkxx", syrkBean);
	}
	
	/**
	 * 通过
	 * @param sfzh
	 * @param fwid
	 * @return
	 * @date Jan 6, 2015 3:46:09 PM
	 */
	public SyrkImportBean getImportSyrkBean(String sfzh, String fwid)
	{
		try
		{
			return executor.queryObjectWithDBName(SyrkImportBean.class, CommonConstant.DBNAME_SQJW, "getImportSyrkBean", sfzh,fwid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询导入实有人口中的重点人员
	 * @param syrkBean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 * @date Jan 6, 2015 2:40:04 PM
	 */
	public PageResultInfo<SyrkImportBean> queryImportSyrkZdryPageResult(SyrkImportBean syrkBean, PageInfo pageInfo) throws SQLException
	{
		if (pageInfo != null)
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(SyrkImportBean.class, CommonConstant.DBNAME_SQJW, "queryImportSyrkZdryPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), syrkBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		else
		{
			List<SyrkImportBean> list = executor.queryListBeanWithDBName(SyrkImportBean.class, CommonConstant.DBNAME_SQJW, "queryImportSyrkZdryPageResult", syrkBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
		}
	}
	
	/**
	 * 查询导入实有人口中
	 * @param syrkBean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 * @date Jan 6, 2015 2:40:04 PM
	 */
	public PageResultInfo<SyrkImportBean> queryImportSyrkPageResult(SyrkImportBean syrkBean, PageInfo pageInfo) throws SQLException
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(SyrkImportBean.class, CommonConstant.DBNAME_SQJW, "queryImportSyrkPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), syrkBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 实有人口核查导入查询
	 * @param syrkBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 * @date Jan 8, 2015 10:44:53 AM
	 */
	public PageResultInfo<SyrkImportBean> querySyrkImportHcPageResult(SyrkImportBean syrkBean, PageInfo pageInfo) throws Exception
	{
		if (pageInfo != null)
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(SyrkImportBean.class, CommonConstant.DBNAME_SQJW, "querySyrkImportHcPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), syrkBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		else
		{
			List<SyrkImportBean> list = executor.queryListBeanWithDBName(SyrkImportBean.class, CommonConstant.DBNAME_SQJW, "querySyrkImportHcPageResult", syrkBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
		}
	}
}
