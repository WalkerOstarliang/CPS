package com.chinacreator.qzgl.dao;


import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.qzgl.bean.LxdjBean;
import com.chinacreator.qzgl.query.LxclQueryBean;
import com.chinacreator.qzgl.query.LxdjQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class LxdjDao {
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/qzgl/dao/lxdj-sql.xml");
	/**
	 * 获得来信来访登记页面的列表
	 * queryBean保存查询条件
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<LxdjBean> lxcxList(LxdjQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(LxdjBean.class, CommonConstant.DBNAME_SQJW, "lxcxList", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	/**
	 * 获得来信来访处理页面的列表
	 * queryBean保存查询条件
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<LxdjBean> lxclList(LxclQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(LxdjBean.class, CommonConstant.DBNAME_SQJW, "lxcxList", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 新增来信来访登记
	 * @param bean
	 * @throws Exception
	 */
	public static void insertLxdjBean(LxdjBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertLxdjBean", bean);
	}
	/**
	 * 新增来信来访登记
	 * @param bean
	 * @throws Exception
	 */
	public static void LxdjBean(LxdjBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertLxdjBean", bean);
	}
	
	/**
	 * 根据编号获得来信来访的详细信息
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public static LxdjBean getBeanByBh(String bh) throws Exception{
		return executor.queryObjectWithDBName(LxdjBean.class, CommonConstant.DBNAME_SQJW, "queryBeanByBh", bh);
	}
	
	/**
	 * 根据编号删除来信来访信息
	 * @param bh
	 * @throws Exception
	 */
	public static void deleteLxdjByBh(String bh) throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteLxdjByBh", bh);
	}
	
	/**
	 * 更新来信来访信息（不包括转发、处理信息）
	 * @param bean
	 * @throws Exception
	 */
	public static void updateLxdj(LxdjBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateLxdj", bean);
	}
	
	/**
	 * 保存转发信息（包括更新来信来访的转发相关列以及转发流转表）
	 * @param bean
	 * @throws Exception
	 */
	public static void zhuanfaLxdj(LxdjBean bean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "zhuanfa", bean);
	}
	/**
	 * 保存转发信息（只保存转发流转表，不更新来信来访表）
	 * @param bean
	 * @throws Exception
	 */
	public static void zhuanfaOnlyLxdj(LxdjBean bean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "zhuanfa", bean);
	}
	
	/**
	 * 保存处理相关信息（更新来信来访表）
	 * @param bean
	 * @throws Exception
	 */
	public static void chuliLxdj(LxdjBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "clLxdj", bean);
	}
	public static void deleteZfByBh(String bh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteZf", bh);
		
	}
}
