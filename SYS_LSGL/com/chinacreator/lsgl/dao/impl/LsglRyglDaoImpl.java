package com.chinacreator.lsgl.dao.impl;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.lsgl.bean.TzryBean;
import com.chinacreator.lsgl.dao.LsglRyglDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class LsglRyglDaoImpl implements  LsglRyglDao {

	private static ConfigSQLExecutor executor=new ConfigSQLExecutor("com/chinacreator/lsgl/dao/lsglrygl-sql.xml");
	
	/**
	 * 同户人员
	 */
	public PageResultInfo<CzrkxxBean> queryThryByRybh(String rybh,PageInfo pageInfo)
			throws Exception {
		ListInfo listInfo=executor.queryListInfoWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryThryByRybh", pageInfo.getOffset(), pageInfo.getPageSize(), rybh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 同址人员
	 */
	public PageResultInfo<TzryBean> queryTzryPageInfoByRybh(String rybh,
			PageInfo pageInfo) throws Exception {
		ListInfo listInfo=executor.queryListInfoWithDBName(TzryBean.class, CommonConstant.DBNAME_SQJW, "queryTzryPageInfoByRybh", pageInfo.getOffset(), pageInfo.getPageSize(), rybh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public PageResultInfo<TzryBean> queryTzryPageInfoByFwid(String fwid,
			String zxbs, PageInfo pageInfo) throws Exception {
		ListInfo listInfo = null;
		if ("0".equals(zxbs))
		{
			listInfo = executor.queryListInfoWithDBName(TzryBean.class, CommonConstant.DBNAME_SQJW, "queryTzryPageInfoByFwidWzx", pageInfo.getOffset(), pageInfo.getPageSize(), fwid);
		}
		else
		{
			listInfo = executor.queryListInfoWithDBName(TzryBean.class, CommonConstant.DBNAME_SQJW, "queryTzryPageInfoByFwidByYZx", pageInfo.getOffset(), pageInfo.getPageSize(), fwid);
		}
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public PageResultInfo<RkfwglBean> queryXtzryPageInfoByFwid(String fwid,
			String zxbs, PageInfo pageInfo) throws Exception {
		ListInfo listInfo = null;
		//同住人员查询未注销
		if ("0".equals(zxbs) )
		{
			listInfo = null;
			listInfo = executor.queryListInfoWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "queryXtzryPageInfoByFwidWzx", pageInfo.getOffset(), pageInfo.getPageSize(), fwid,fwid,fwid,fwid,fwid);
		}
		//租赁房屋未注销
		if ("0inputdqjzlkzlfw".equals(zxbs))
		{
			listInfo = null;
			listInfo = executor.queryListInfoWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "queryXtzryPageInfoByFwidWzxzlfw", pageInfo.getOffset(), pageInfo.getPageSize(), fwid);
				
		}
		//租赁房屋已注销
		if ("1inputdqjzlkzlfw".equals(zxbs)){
			listInfo = null;
			listInfo = executor.queryListInfoWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "queryXtzryPageInfoByFwidYzxzlfw", pageInfo.getOffset(), pageInfo.getPageSize(), fwid);
		}
		//同住人员已注销
		if("1".equals(zxbs)){
			listInfo = null;
			listInfo = executor.queryListInfoWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "queryXtzryPageInfoByFwidYzx", pageInfo.getOffset(), pageInfo.getPageSize(), fwid,fwid,fwid,fwid,fwid);
		}
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
}
