package com.chinacreator.afgl.dao;

import com.chinacreator.afgl.bean.KkxxBean;
import com.chinacreator.afgl.query.KkxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 卡口信息DAO
 *
 */
public class KkxxDao {
	private static ConfigSQLExecutor executor =  
		new ConfigSQLExecutor("com/chinacreator/afgl/dao/kkxx-sql.xml");
	
	/**
	 * 查询卡口信息列表
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<KkxxBean> kkxxList(PageInfo pageInfo,  KkxxQuery kkxxQuery) throws Exception
	{
		PageResultInfo<KkxxBean> resultInfo = new PageResultInfo<KkxxBean>();
		ListInfo listInfo = new ListInfo();
		listInfo = executor.queryListInfoBeanWithDBName(KkxxBean.class, CommonConstant.DBNAME_SQJW, "kkxxList", pageInfo.getOffset(), pageInfo.getPageSize(), kkxxQuery);
		resultInfo.setDatas(listInfo.getDatas());
		resultInfo.setTotalCount(listInfo.getTotalSize());
		resultInfo.setCurrentPage(pageInfo.getCurrentPage());
		resultInfo.setPageSize(pageInfo.getPageSize());
		return resultInfo;
	}
	
	/**
	 * 新增卡口信息
	 */
	public static void addKkxx(KkxxBean kkxxBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addKkxx", kkxxBean);
	}
	
	/**
	 * 修改卡口信息
	 */
	public static void updateKkxxByKkbh(KkxxBean kkxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateKkxxByKkbh", kkxxBean);
	}
	
	/**
	 * 得到卡口信息
	 */
	public static KkxxBean getKkxxByKkbh(KkxxQuery kkxxQuery) throws Exception{
		return executor.queryObjectBeanWithDBName(KkxxBean.class, CommonConstant.DBNAME_SQJW, "kkxxList", kkxxQuery);
	}
	
	/**
	 * 删除卡口信息
	 */
	public static void deleteKkxxByKkbh(KkxxBean kkxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteKkxxByKkbh", kkxxBean);
	}
}
