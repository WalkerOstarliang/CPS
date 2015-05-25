package com.chinacreator.zagl.dao.impl;

import java.sql.SQLException;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zagl.bean.WyxqAqjcBean;
import com.chinacreator.zagl.bean.WyxqBean;
import com.chinacreator.zagl.query.WyxqQuery;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class WyxqDaoImpl extends BaseValue {

	private static final long serialVersionUID = -6213212010350091502L;
	
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor(
					"com/chinacreator/zagl/dao/sql/wyxq-sql.xml");

	/**
	 * 新增物业小区信息
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public static WyxqBean insertWyxq(WyxqBean bean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWyxq", bean);
		return bean;
	}
	/**
	 * 保存物业小区安全检查
	 * @throws SQLException 
	 */
	
	public static WyxqAqjcBean insertWyxqaJ(WyxqAqjcBean bean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWyxqaJ", bean);
		//System.out.println(bean.getJcrq());
		return bean;
	}
	/* 修改物业小区安全检查
	 * */
	public static WyxqAqjcBean updateWyxqaJ(WyxqAqjcBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWyxqaJ", bean);
		return bean;
	}
	/**
	 * 修改物业小区
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public static WyxqBean updateWyxq(WyxqBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWyxq", bean);
		return bean;
	}
	
	/**
	 * 注销物业小区
	 * @param bean
	 * @throws SQLException
	 */
	public static void zxWyxq(WyxqBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zxWyxq", bean);
	}
	
	/**
	 * 根据ID查询物业小区
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public static WyxqBean queryWyxqById(String id) throws SQLException{
		return executor.queryObjectWithDBName(WyxqBean.class, CommonConstant.DBNAME_SQJW, "queryWyxqById", id);
	}
	
	/**
	 * 分页查询物业小区
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public static PageResultInfo<WyxqBean> queryWyxqPageResultInfo(WyxqQuery bean,PageInfo pageinfo) throws SQLException{
		ListInfo list = executor.queryListInfoBeanWithDBName(WyxqBean.class, CommonConstant.DBNAME_SQJW,"queryWyxqPageResultInfo", pageinfo.getOffset(), pageinfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageinfo,list);
	}
	/**
	 * 分页查询物业小区安全检查信息
	 * @throws SQLException 
	 */
	 public static PageResultInfo<WyxqAqjcBean> queryWyxqaJResultPageInfo(String beanid,PageInfo pageinfo) throws SQLException{
		 ListInfo list = executor.queryListInfoWithDBName(WyxqAqjcBean.class, CommonConstant.DBNAME_SQJW, "queryWyxqaJResultPageInfo", pageinfo.getOffset(), pageinfo.getPageSize(), beanid);
	     return  PaginationHelper.wrapPageResultInfo(pageinfo,list);
	 }
}
