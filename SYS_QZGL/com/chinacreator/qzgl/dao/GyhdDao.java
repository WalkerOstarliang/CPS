package com.chinacreator.qzgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.qzgl.bean.FjBean;
import com.chinacreator.qzgl.bean.GyhdBean;
import com.chinacreator.qzgl.query.GyhdQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.util.ListInfo;

public class GyhdDao {
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/qzgl/dao/gyhd-sql.xml");
	
	/**
	 * 获取公益活动列表
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<GyhdBean> gyhdList(GyhdQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(GyhdBean.class, CommonConstant.DBNAME_SQJW, "querygyhdxx", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 根据编号获取某一公益活动的具体信息
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public static GyhdBean getGyhdByBh(String bh) throws Exception{
		return executor.queryObjectWithDBName(GyhdBean.class, CommonConstant.DBNAME_SQJW, "querygyhdxxbybh", bh);
	}
	
	public static void insertGyhd(GyhdBean bean)throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addgyhdxx", bean);
	}
	
	public static void deleteGyhd(String bh)throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deletegyhdxx", bh);
	}
	
	public static void updateGyhd(GyhdBean bean)throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updategyhdxx", bean);
	}
	
	public static void deleteFjxxByGyhdBh(String bh) throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteOldFjxx", bh);
	}
	
	public static void deleteFjxxByBh(String bh)throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteFjxxByBh", bh);
	}
	
	public static PageResultInfo<FjBean> getFjxxByGyhdBh(String bh,PageInfo pageInfo) throws Exception{
		ListInfo info = executor.queryListInfoWithDBName(FjBean.class, CommonConstant.DBNAME_SQJW, "",  pageInfo.getOffset(), pageInfo.getPageSize(), bh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, info);
	}
	
	public static void insertFjxx(FjBean bean)throws Exception{
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
	
	public static List<FjBean> getFjxxByGyhd(String bh)throws Exception{
		return executor.queryListWithDBName(FjBean.class, CommonConstant.DBNAME_SQJW, "getFjxxByHdbh", bh);
	}

	public static void updateFjxx(FjBean fjBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateFjxx", fjBean);
	}

	public static void insertGyhdfjList(List<FjBean> fjBeanList) throws SQLException {
		if (ValidateHelper.isNotEmptyCollection(fjBeanList))
		{
			executor.insertBeans(CommonConstant.DBNAME_SQJW, "insertFjxx", fjBeanList);
			for (FjBean bean : fjBeanList)
			{
				PreparedDBUtil util = new PreparedDBUtil();
				String sql = "update t_fwqz_fjxx  set  fj = ? where bh = ?";
				util.preparedUpdate(CommonConstant.DBNAME_SQJW, sql);
				util.setBlob(1, bean.getFj());
				util.setString(2, bean.getBh());
				util.executePrepared();
			}
		}
		
	}
	
}
