package com.chinacreator.gzgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.afgl.bean.AfXldRyxxBean;
import com.chinacreator.afgl.bean.AfXldxxBean;
import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.bean.XunldBean;
import com.chinacreator.gzgl.query.XunldRwQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class XunldDao extends BaseValue{

	private static final long serialVersionUID = 5172133740860968979L;
	
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/gzgl/dao/xunldRW-sql.xml");
	
	/**
	 * 新增巡逻队任务
	 * @param bean
	 */
	public static void addXunldRW(XunldBean bean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addXunldRW", bean);
	}
	
	/**
	 * 修改巡逻队任务
	 * @param bean
	 */
	public static void updateXunldRW(XunldBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXunldRW", bean);
	}
	
	/**
	 * 批量删除巡逻队任务
	 * @param list
	 */
	public static void batchDelXunldRW(List<XunldBean> list) throws SQLException{
		executor.updateBeans(CommonConstant.DBNAME_SQJW, "delXunldRW", list);	
	}
	
	/**
	 * 根据主键查询巡逻队任务
	 * @param bean
	 * @return
	 */
	public static XunldBean queryXunldRWByPK(XunldRwQueryBean bean) throws SQLException{
		return executor.queryObjectBeanWithDBName(XunldBean.class, CommonConstant.DBNAME_SQJW, "queryXunldRWByPK", bean);
	}
	
	/**
	 * 分页查询巡逻队任务
	 * @param offset
	 * @param pageSize
	 * @param bean
	 * @return
	 */
	public static PageResultInfo<XunldBean> queryXunldRW(PageInfo page,XunldRwQueryBean bean) throws SQLException{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(XunldBean.class, CommonConstant.DBNAME_SQJW, "queryXunldRW", page.getOffset(), page.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(page, listInfo);
	}
	
	/**
	 * 通过机构代码查询巡逻队
	 * @param orgCode 机构代码
	 * @return
	 * @throws SQLException
	 */
	public static List<AfXldxxBean> queryXldsByOrgCode(String orgCode) throws SQLException{
		return executor.queryListWithDBName(AfXldxxBean.class,CommonConstant.DBNAME_SQJW, "queryXldsByOrgCode", orgCode);
	}
	
	/**
	 * 通过巡逻队编号查询巡逻队队员
	 * @param bh 巡逻队编号
	 * @return
	 * @throws SQLException
	 */
	public static List<AfXldRyxxBean> queryXldyByBh(String bh) throws SQLException{
		return executor.queryListWithDBName(AfXldRyxxBean.class,CommonConstant.DBNAME_SQJW, "queryXldyByBh", bh);
	}

	/**
	 * 查询巡逻信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<AfXldxxBean> queryAfxldxxListByQueryBean(PageInfo pageInfo, XunldRwQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(AfXldxxBean.class, CommonConstant.DBNAME_SQJW, "queryAfxldxxListByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
}
