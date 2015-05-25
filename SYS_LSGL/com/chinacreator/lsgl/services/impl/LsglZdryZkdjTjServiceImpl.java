package com.chinacreator.lsgl.services.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryZkDjTjBean;
import com.chinacreator.lsgl.bean.ZdryZkDjTjQueryBean;
import com.chinacreator.lsgl.services.LsglZdryZkdjTjService;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class LsglZdryZkdjTjServiceImpl implements LsglZdryZkdjTjService {
	private static ConfigSQLExecutor executor=new ConfigSQLExecutor("com/chinacreator/lsgl/dao/zdrygzdx-sql.xml");

	@Override
	/**
	 * 统计重点人员在控登记情况
	 */
	public PageResultInfo<ZdryZkDjTjBean> queryZdryGzdxPageResult(
			ZdryZkDjTjQueryBean queryBean ,PageInfo pageInfo) throws Exception {
		ListInfo list = executor.queryListInfoBeanWithDBName(ZdryZkDjTjBean.class, CommonConstant.DBNAME_SQJW, "queryZdryGzdxPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	/**
	 * 返回重点人员数 ----- 详细重点人员信息结果
	 */
	public PageResultInfo<ZdryGzdxBean> queryZdryPageResult(
			ZdryZkDjTjQueryBean queryBean, PageInfo pageinfo) throws SQLException {
			ListInfo list = executor.queryListInfoBeanWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryPageResult",pageinfo.getOffset(),pageinfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);		
	}

	@Override
	/**
	 * 导出信息
	 */
	public List<ZdryZkDjTjBean> queryZdryZkDjTjListDown(   
			ZdryZkDjTjQueryBean queryBean) throws SQLException {
		return	executor.queryListBeanWithDBName(ZdryZkDjTjBean.class, CommonConstant.DBNAME_SQJW, "queryZdryGzdxPageResult", queryBean);
	}

	@Override
	public PageResultInfo<ZdryGzdxBean> queryZdryZKDJSPageResult(
			ZdryZkDjTjQueryBean queryBean, PageInfo pageinfo) throws Exception {
			ListInfo list = executor.queryListInfoBeanWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryZKDJSPageResult",pageinfo.getOffset(),pageinfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}

	@Override
	public PageResultInfo<ZdryGzdxBean> queryZdryZKZKSPageResult(
			ZdryZkDjTjQueryBean queryBean, PageInfo pageinfo) throws Exception {
		ListInfo list = executor.queryListInfoBeanWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryZKZKSPageResult",pageinfo.getOffset(),pageinfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}

	@Override
	public PageResultInfo<ZdryGzdxBean> queryZdryZKSKSPageResult(
			ZdryZkDjTjQueryBean queryBean, PageInfo pageinfo) throws Exception {
		ListInfo list = executor.queryListInfoBeanWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryZKSKSPageResult",pageinfo.getOffset(),pageinfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}

}
