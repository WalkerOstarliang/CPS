package com.chinacreator.zagl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.lsgl.bean.QGQLZdryInfoBean;
import com.chinacreator.sydw.bean.CyryImportBean;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.chinacreator.zagl.query.CyryQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class CyryManageDao
{
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/zagl/dao/zagl-cyry.xml");
	
	/**
	 * 插入从业人员
	 * @param cyryBean
	 * @throws SQLException
	 * @date Aug 19, 2014 10:15:03 AM
	 */
	public void insertCyryBean(DwcyryBean cyryBean) throws SQLException
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertCyryBean", cyryBean);
	}
	
	/**
	 * 更新从业人员
	 * @param cyryBean
	 * @throws SQLException
	 * @date Aug 19, 2014 10:15:13 AM
	 */
	public void updateCyryBean(DwcyryBean cyryBean) throws SQLException
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCyryBean", cyryBean);
	}
	
	/**
	 * 查询单位从业人员
	 * @param queryBean
	 * @return
	 * @throws SQLException
	 * @date Aug 19, 2014 3:56:49 PM
	 */
	public DwcyryBean queryDwCyryBeanByQueryBean(CyryQueryBean queryBean) throws SQLException
	{
		return executor.queryObjectBeanWithDBName(DwcyryBean.class, CommonConstant.DBNAME_SQJW, "queryDwCyryBeanByQueryBean", queryBean);
	}
	
	
	/**
	 * 更新从业人员反馈信息
	 * @param cyrybh
	 * @param rybh
	 * @date Aug 23, 2014 4:35:52 PM
	 */
	public void updateCyryDjFkxx(DwcyryBean cyryBean) throws SQLException
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCyryDjFkxx", cyryBean);
	}
	
	/**
	 * 从业人员导入Bean
	 * @param cyryImportBean
	 * @date Jan 4, 2015 5:19:34 PM
	 */
	public void insertImportCyryxx(CyryImportBean cyryImportBean) throws SQLException
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertImportCyryxx", cyryImportBean);
	}
	
	/**
	 * 更新导入从业人员
	 * @param cyryImportBean
	 * @throws SQLException
	 * @date Jan 6, 2015 4:31:24 PM
	 */
	public void updateImportCyryxx(CyryImportBean cyryImportBean) throws SQLException
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateImportCyryxx", cyryImportBean);
	}
	
	/**
	 * 用与判断是否已经导入库中
	 * @param sfzh
	 * @param jgbh
	 * @return
	 * @date Jan 6, 2015 4:34:22 PM
	 */
	public CyryImportBean getImportCyryxx(String sfzh, String jgbh)
	{
		try
		{
			return executor.queryObjectWithDBName(CyryImportBean.class, CommonConstant.DBNAME_SQJW, "getImportCyryxx",jgbh, sfzh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 *  查询重点人员从业人员
	 * @param importBean
	 * @param pageInfo
	 * @return
	 * @date Jan 6, 2015 10:48:56 AM
	 */
	public PageResultInfo<CyryImportBean> queryImportCyryZdryPageResult(CyryImportBean importBean, PageInfo pageInfo) throws SQLException
	{
		if (pageInfo != null)
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(CyryImportBean.class, CommonConstant.DBNAME_SQJW, "queryImportCyryZdryPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), importBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		else
		{
			List<CyryImportBean> list = executor.queryListBeanWithDBName(CyryImportBean.class, CommonConstant.DBNAME_SQJW, "queryImportCyryZdryPageResult", importBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
		}
	}
	
	/**
	 *  查询导入从业人员
	 * @param importBean
	 * @param pageInfo
	 * @return
	 * @date Jan 6, 2015 10:48:56 AM
	 */
	public PageResultInfo<CyryImportBean> queryImportCyryPageResult(CyryImportBean importBean, PageInfo pageInfo) throws SQLException
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(CyryImportBean.class, CommonConstant.DBNAME_SQJW, "queryImportCyryPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), importBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询核查导入人员
	 * @param importBean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 * @date Jan 7, 2015 2:27:27 PM
	 */
	public  PageResultInfo<CyryImportBean> queryHcImportCyryPageResult(CyryImportBean importBean, PageInfo pageInfo) throws SQLException
	{
		if (pageInfo != null)
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(CyryImportBean.class, CommonConstant.DBNAME_SQJW, "queryHcImportCyryPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), importBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		else
		{
			List<CyryImportBean> list = executor.queryListBeanWithDBName(CyryImportBean.class, CommonConstant.DBNAME_SQJW, "queryHcImportCyryPageResult", importBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
		}
	}
	
	/**
	 * 根据身份证号查询全国七类重点人员
	 * @param sfzh
	 * @return
	 * @throws SQLException
	 */
	public QGQLZdryInfoBean queryQGQLZdryBySfzh(String sfzh) throws SQLException{
		return executor.queryObjectWithDBName(QGQLZdryInfoBean.class, CommonConstant.DBNAME_SQJW, "queryQGQLZdryBySfzh", sfzh);
	}
}
