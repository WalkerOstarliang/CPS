package com.chinacreator.zagl.dao;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zagl.bean.DxhdBean;
import com.chinacreator.zagl.query.DxhdQuery;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class DxhdDao extends BaseValue{
	private static final long serialVersionUID = -4012052140118303931L;
	
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor(
							"com/chinacreator/zagl/dao/dxhd-sql.xml");
	/**
	 * 分页查询大型活动信息
	 */
	public static PageResultInfo<DxhdBean> dxhdList(DxhdQuery dxhdQuery, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DxhdBean.class, CommonConstant.DBNAME_SQJW, 
					"dxhdList", pageInfo.getOffset(), pageInfo.getPageSize(), dxhdQuery);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 新增大型活动
	 */
	public static void addDxhd(DxhdBean dxhdBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addDxhd", dxhdBean);
	}
	
	/**
	 * 修改大型活动
	 */
	public static void updateDxhdByHdbh(DxhdBean dxhdBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDxhdByHdbh", dxhdBean);
	}
	
	/**
	 * 删除大型活动
	 */
	public static void deleteDxhdByHdbh(DxhdBean dxhdBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteDxhdByHdbh", dxhdBean);
	}
	
	/**
	 * 得到大型活动
	 */
	public static DxhdBean getDxhdByHdbh(String hdbh) throws Exception{
		return executor.queryObjectWithDBName(DxhdBean.class, CommonConstant.DBNAME_SQJW, "getDxhdByHdbh", hdbh);
	}
}
