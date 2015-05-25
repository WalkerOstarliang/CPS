package com.chinacreator.afgl.dao;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.afgl.bean.AfSqwfsszpxxBean;
import com.chinacreator.afgl.bean.XqjfwfssxxBean;
import com.chinacreator.afgl.query.XqjfwfssxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 小区技防物防设施信息DAO
 *
 */
public class XqjfwfssxxDao {
	private static ConfigSQLExecutor executor =  
		new ConfigSQLExecutor("com/chinacreator/afgl/dao/xqjfwfssxx-sql.xml");
	
	/**
	 * 查询小区技防物防设施信息列表
	 */
	public static PageResultInfo<XqjfwfssxxBean> xqjfwfssxxList(PageInfo pageInfo,  XqjfwfssxxQuery xqjfwfssxxQuery) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(XqjfwfssxxBean.class, CommonConstant.DBNAME_SQJW, "queryXqjfwfssxxList", 
				pageInfo.getOffset(), pageInfo.getPageSize(), xqjfwfssxxQuery);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 新增小区技防物防设施信息
	 */
	public static void insertXqjfwfssxx(XqjfwfssxxBean xqjfwfssxxBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXqjfwfssxx", xqjfwfssxxBean);
	}
	
	/**
	 * 插入照片附件信息
	 * @param sbzpBeanList
	 * @throws Exception
	 */
	public static void insertAfSqwfsszpxxList(List<AfSqwfsszpxxBean> sbzpBeanList) throws Exception
	{
		if (ValidateHelper.isNotEmptyCollection(sbzpBeanList))
		{
			executor.insertBeans(CommonConstant.DBNAME_SQJW, "insertSqjfwfsbzpxx", sbzpBeanList);
			for (AfSqwfsszpxxBean bean : sbzpBeanList)
			{
				PreparedDBUtil util = new PreparedDBUtil();
				String sql = "update t_af_sqjfwfsszpxx set ZP=? where id=?";
				util.preparedUpdate(CommonConstant.DBNAME_SQJW, sql);
				util.setBlob(1, bean.getZp());
				util.setString(2, bean.getId());
				util.executePrepared();
			}
		}
	}
	
	/**
	 * 插入设备信息
	 * @param sqbh
	 * @return
	 * @throws Exception
	 */
	public static List<AfSqwfsszpxxBean> queryAfSqwfsszpxxList(String sbbh) throws Exception
	{
		return executor.queryListWithDBName(AfSqwfsszpxxBean.class, CommonConstant.DBNAME_SQJW, "querySqwfsbfjxx", sbbh);
	}
	
	/**
	 * 修改小区技防物防设施信息
	 */
	public static void updateXqjfwfssxxBySsbh(XqjfwfssxxBean xqjfwfssxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXqjfwfssxxBySsbh", xqjfwfssxxBean);
	}
	
	/**
	 * 得到小区技防物防设施信息
	 */
	public static XqjfwfssxxBean queryXqjfwfssxxBySsbh(String sbbh) throws Exception
	{
		return executor.queryObjectWithDBName(XqjfwfssxxBean.class, CommonConstant.DBNAME_SQJW, "queryXqjfwfssxxBySsbh", sbbh);
	}
	
	/**
	 * 删除小区技防物防设施信息
	 */
	public static void deleteXqjfwfssxxBySsbh(XqjfwfssxxBean xqjfwfssxxBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteXqjfwfssxxBySsbh", xqjfwfssxxBean);
	}
	
	/**
	 * 下载物防照片信息
	 * @param fjid
	 * @return
	 * @throws SQLException
	 */
	public static Blob getWfzpFile(String fjid) throws SQLException 
	{
		java.sql.Blob blob = null;
		String sql = "select zp from t_af_sqjfwfsszpxx t where id='" + fjid + "'";
		DBUtil db = new DBUtil();
		db.executeSelect(sql);
		if (db.size() > 0) 
		{
			blob = (oracle.sql.BLOB) db.getBlob(0, "zp");
		}
		return blob;
	}
	
	/**
	 * deleteWfzpByFjId
	 * @param fjid
	 * @throws SQLException
	 */
	public static void deleteWfzpByFjId(String fjid) throws SQLException
	{
		String sql = "delete from t_af_sqjfwfsszpxx where id=?";
		SQLExecutor.deleteWithDBName(CommonConstant.DBNAME_SQJW, sql, fjid);
	}
	
	/**
	 * 删除小区设备ID
	 * @param wfid
	 * @throws SQLException
	 */
	public static void deleteWfxxbyId(String wfid) throws SQLException
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteXqWfxxById", wfid);
	}

	public static AfSqwfsszpxxBean getWfzpFileByid(String fjid) throws SQLException {
		return executor.queryObjectWithDBName(AfSqwfsszpxxBean.class, CommonConstant.DBNAME_SQJW, "getWfzpFileByid", fjid);
	}
}
