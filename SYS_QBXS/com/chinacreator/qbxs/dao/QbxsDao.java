package com.chinacreator.qbxs.dao;


import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.qbxs.bean.QbxsGgxxBean;
import com.chinacreator.qbxs.bean.QbxsSjxxBean;
import com.chinacreator.qbxs.query.QbxsQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class QbxsDao {
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/qbxs/dao/qbxs-sql.xml");
	
	/**
	 * 新增情报线索事件信息
	 */
	public static void insertQbxsSjxx(QbxsSjxxBean sjxxBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertQbxsSjxx", sjxxBean);
	}
	
	
	/**
	 * 修改情报线索事件信息
	 */
	public static void updateQbxsSjxx(QbxsSjxxBean sjxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateQbxsSjxx", sjxxBean);
	}
	
	/**
	 * 分页查询情报线索事件信息
	 */
	
	public static PageResultInfo<QbxsSjxxBean> queryQbxsSjxxPageInfo(QbxsQueryBean queryBean,PageInfo pageInfo) throws Exception{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(QbxsSjxxBean.class, CommonConstant.DBNAME_SQJW	, "queryQbxsSjxxPageInfo", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 删除情报线索事件信息
	 */
	
	public static void deleteQbxsSjxx(String id) throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteQbxsSjxx", id);
	}
	
	/**
	 * 根据id 查询情报线索事件信息
	 */
	public static QbxsSjxxBean querySjxxBeanById(String id) throws Exception{
		return executor.queryObjectWithDBName(QbxsSjxxBean.class, CommonConstant.DBNAME_SQJW, "querySjxxBeanById", id);
	}
	
	/**
	 * 新增涉及骨干信息
	 * @throws Exception 
	 */
	public static void insertQbxsGgxx(QbxsGgxxBean ggxxBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertQbxsGgxx", ggxxBean);
	}
	
	/**
	 * 更新涉及骨干信息
	 */
	public static void updateQbxsGgxx(QbxsGgxxBean ggxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateQbxsGgxx", ggxxBean);
	}
	
	/**
	 * 分页查询涉及骨干信息
	 */
	public static PageResultInfo<QbxsGgxxBean> queryQbxsGgxxPageInfo(QbxsQueryBean queryBean,PageInfo pageInfo) throws Exception{
		ListInfo listInfo =  executor.queryListInfoBeanWithDBName(QbxsGgxxBean.class, CommonConstant.DBNAME_SQJW, "queryQbxsGgxxPageInfo", pageInfo.getOffset()	, pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 删除涉及骨干信息
	 */
	public static void deleteQbxsGgxx(String id) throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteQbxsGgxx", id);
	}
	
	/**
	 * 根据id 查询涉事骨干信息
	 */
	public static QbxsGgxxBean queryGgxxBeanById(String id) throws Exception{
		return executor.queryObjectWithDBName(QbxsGgxxBean.class, CommonConstant.DBNAME_SQJW, "queryGgxxBeanById", id);
	}
}
