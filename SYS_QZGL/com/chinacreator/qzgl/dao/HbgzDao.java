package com.chinacreator.qzgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.qzgl.bean.HbgzBean;
import com.chinacreator.qzgl.bean.FjBean;
import com.chinacreator.qzgl.bean.HbgzyhrBean;
import com.chinacreator.qzgl.query.HbgzQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.util.ListInfo;

public class HbgzDao {
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/qzgl/dao/hbgz-sql.xml");
	/**
	 * 获得汇报工作的列表
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<HbgzBean> hbgzList(HbgzQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(HbgzBean.class, CommonConstant.DBNAME_SQJW, "Listhbgz", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 根据bh获取汇报工作信息
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public static HbgzBean getHbgzxxByBh(String bh)throws Exception{
		return executor.queryObjectWithDBName(HbgzBean.class, CommonConstant.DBNAME_SQJW, "gethbgzByBh", bh);
	}
//	/***
//	 * 新增汇报工作信息
//	 * @param bean
//	 * @throws SQLException
//	 */
//	public static void addHbgzxx(HbgzBean bean) throws Exception{
//		executor.insertWithDBName(CommonConstant.DBNAME_SQJW, "addhbgz", bean);
//	}
	/***
	 * 新增汇报工作信息
	 * @param bean
	 * @throws SQLException
	 */
	public static void addKongHbgzxx(HbgzBean bean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addhbgz", bean);
		executor.insertWithDBName(CommonConstant.DBNAME_SQJW, "updatecyrrs", bean.getBh());
	}
	/***
	 * 删除汇报工作信息（不包括汇报参与人信息）
	 * @param bh
	 * @throws Exception
	 */
	public static void deleteHbgzxx(String bh)throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deletehbgz", bh);
	}
	
	/***
	 * 修改汇报工作信息（不能修改登记人相关信息以及登记时间等）
	 * @param bean
	 * @throws Exception
	 */
	public static void updateHbgzxx(HbgzBean bean)throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updatehbgz", bean);
	}
	
	/**
	 * 删除某一汇报工作信息的所有参与人信息
	 * @param bh
	 * @throws Exception
	 */
	public static void deleteHbgzyhrxx(String bh) throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deletehbgzcyrByBgbh", bh);
	}
	/**
	 * 删除某一参与人信息
	 * @param bh
	 * @throws Exception
	 */
	public static void deleteHbgzyhrxxByBh(HbgzyhrBean bean) throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deletehbgzcyrBybh", bean.getBh());
		executor.insertWithDBName(CommonConstant.DBNAME_SQJW, "updatecyrrs", bean.getBgbh());
	}
	/**
	 * 获得参与人的列表(根据汇报工作信息的bh)
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public static List<HbgzyhrBean> cyrList(String bh) throws Exception
	{
		return executor.queryListWithDBName(HbgzyhrBean.class, CommonConstant.DBNAME_SQJW, "listhbgzByBh", bh);
	}
	/**
	 * 新增参与人信息
	 * @throws Exception
	 */
	public static void insertHngzcyr(HbgzyhrBean bean)throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addhbgzcyr", bean);
		executor.insertWithDBName(CommonConstant.DBNAME_SQJW, "updatecyrrs", bean.getBgbh());
	}
	
	/**
	 * 删除当前报告的所有附件并保存新附件信息
	 * @param bean
	 * @throws Exception
	 */
	public static void insertFjxx(FjBean bean)throws Exception{
		deleteFjxx(bean.getDjbh());
		StringBuffer sql = new StringBuffer();
		sql.append("insert into t_fwqz_fjxx  (bh, djbh, fjlx, fjmc, fj)values  (seq_qzgl_hbgzfjxx.nextval, ?, ?, ?, ?)");
		if(bean != null){
			PreparedDBUtil dbutil = new PreparedDBUtil();
			dbutil.preparedInsert(CommonConstant.DBNAME_SQJW, sql.toString());
			dbutil.setString(1, bean.getDjbh());
			dbutil.setString(2, bean.getFjlx());
			dbutil.setString(3, bean.getFjmc());
			dbutil.setBlob(4, bean.getFjxx());
			dbutil.executePrepared();
		}
	}
	/**
	 * 删除当前报告的所有附件
	 * @param bh
	 * @throws Exception
	 */
	public static void deleteFjxx(String bh) throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteOldFjxx", bh);
	}
	
	/**
	 * 根据当前报告编号获得相关的附件信息
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public static FjBean getFjxxByBgbh(String bh)throws Exception{
		return executor.queryObjectWithDBName(FjBean.class, CommonConstant.DBNAME_SQJW, "getFjxxByBgbh", bh);
	}

	public static void updateHbgzyhrxx(HbgzyhrBean yhr) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updatehbgzyhr", yhr);
		
	}

	public static HbgzyhrBean getHbgzyhrxx(String bh) throws SQLException {
		return executor.queryObjectWithDBName(HbgzyhrBean.class, CommonConstant.DBNAME_SQJW, "getHbgzyhrxxbybh", bh);
	}

	public static PageResultInfo<HbgzyhrBean> hbgzcyrList(String bh, PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfo(HbgzyhrBean.class, "queryhbgzcyrlist", pageInfo.getOffset(), pageInfo.getPageSize(), bh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public static String queryhbgzyhrcount(String bh) throws SQLException {
		//return executor.getSql(CommonConstant.DBNAME_SQJW, "countyhr");
		return executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "countyhr",bh);
	}

	public static void deleteHbgzyhrxxbybh(String bh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteyhrbybh", bh);
		
	}

	public static void updateFjxx(FjBean fjbean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updatefjxx", fjbean);
		
	}

}
