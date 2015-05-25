package com.chinacreator.afgl.dao;

import com.chinacreator.afgl.bean.XgdxxBean;
import com.chinacreator.afgl.bean.XgdyxxBean;
import com.chinacreator.afgl.query.XgdyxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 协管队信息DAO
 *
 */
public class XgdyxxDao {
	private static ConfigSQLExecutor executor =  
		new ConfigSQLExecutor("com/chinacreator/afgl/dao/xgdxx-sql.xml");
	
	/**
	 * 查询协管队员信息列表
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<XgdyxxBean> xgdyxxList(PageInfo pageInfo,  XgdyxxQuery xgdyxxQuery) throws Exception
	{
		PageResultInfo<XgdyxxBean> resultInfo = new PageResultInfo<XgdyxxBean>();
		ListInfo listInfo = new ListInfo();
		listInfo = executor.queryListInfoBeanWithDBName(XgdyxxBean.class, CommonConstant.DBNAME_SQJW, "xgdyxxList",
				pageInfo.getOffset(), pageInfo.getPageSize(), xgdyxxQuery);
		resultInfo.setDatas(listInfo.getDatas());
		resultInfo.setTotalCount(listInfo.getTotalSize());
		resultInfo.setCurrentPage(pageInfo.getCurrentPage());
		resultInfo.setPageSize(pageInfo.getPageSize());
		return resultInfo;
	}
	
	/**
	 * 查询协管队信息列表
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<XgdxxBean> xgdxxList(PageInfo pageInfo,  XgdyxxQuery xgdyxxQuery) throws Exception
	{
		PageResultInfo<XgdxxBean> resultInfo = new PageResultInfo<XgdxxBean>();
		ListInfo listInfo = new ListInfo();
		listInfo = executor.queryListInfoBeanWithDBName(XgdxxBean.class, CommonConstant.DBNAME_SQJW, "xgdxxList",
				pageInfo.getOffset(), pageInfo.getPageSize(), xgdyxxQuery);
		resultInfo.setDatas(listInfo.getDatas());
		resultInfo.setTotalCount(listInfo.getTotalSize());
		resultInfo.setCurrentPage(pageInfo.getCurrentPage());
		resultInfo.setPageSize(pageInfo.getPageSize());
		return resultInfo;
	}
	
	/**
	 * 新增协管队员信息
	 */
	public static void addXgdyxx(XgdyxxBean xgdyxxBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addXgdyxx", xgdyxxBean);
	}
	
	/**
	 * 新增协管队信息
	 */
	public static void addXgdxx(XgdyxxBean xgdyxxBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addXgdxx", xgdyxxBean);
	}
	
	/**
	 * 修改协管队员信息
	 */
	public static void updateXgdyxxByDybh(XgdyxxBean xgdyxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXgdyxxByDybh", xgdyxxBean);
	}
	
	/**
	 * 修改协管队信息
	 */
	public static void updateXgdxxByXgdbh(XgdyxxBean xgdyxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXgdxxByXgdbh", xgdyxxBean);
	}
	
	/**
	 * 得到协管队员信息
	 */
	public static XgdyxxBean getXgdyxxByDybh(XgdyxxQuery xgdyxxQuery) throws Exception{
		return executor.queryObjectBeanWithDBName(XgdyxxBean.class, CommonConstant.DBNAME_SQJW, "xgdyxxList", 
				xgdyxxQuery);
	}
	
	/**
	 * 删除协管队信息
	 */
	public static void deleteXgdyxxByDybh(XgdyxxBean xgdyxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteXgdyxxByDybh", xgdyxxBean);
	}
	
	/**
	 * 根据身份证号查找协管队员信息
	 */
	public static XgdyxxBean queryXgdyxxBySfzh(String sfzh) throws Exception{
		return executor.queryObjectWithDBName(XgdyxxBean.class, CommonConstant.DBNAME_SQJW, "queryXgdyxxBySfzh", sfzh);
	}
	
	/**
	 * 根据sfzh 和djdwdm 查找协管队员信息
	 */
	public static XgdyxxBean queryXgdyxxBySfzhAndOrgcode(String sfzh,String orgcode) throws Exception{
		return executor.queryObjectWithDBName(XgdyxxBean.class, CommonConstant.DBNAME_SQJW, "queryXgdyxxBySfzhAndOrgcode", sfzh,orgcode);
	}
}
