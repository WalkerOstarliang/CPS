package com.chinacreator.afgl.dao;

import com.chinacreator.afgl.bean.SqjwsxxBean;
import com.chinacreator.afgl.query.SqjwsxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 社区警务室信息DAO
 *
 */
public class SqjwsxxDao {
	private static ConfigSQLExecutor executor =  
		new ConfigSQLExecutor("com/chinacreator/afgl/dao/sqjwsxx-sql.xml");
	
	/**
	 * 查询社区警务室信息列表
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<SqjwsxxBean> sqjwsxxList(PageInfo pageInfo,  SqjwsxxQuery sqjwsxxQuery) throws Exception
	{
		PageResultInfo<SqjwsxxBean> resultInfo = new PageResultInfo<SqjwsxxBean>();
		ListInfo listInfo = new ListInfo();
		listInfo = executor.queryListInfoBeanWithDBName(SqjwsxxBean.class, CommonConstant.DBNAME_SQJW, 
				"sqjwsxxList", pageInfo.getOffset(), pageInfo.getPageSize(), sqjwsxxQuery);
		resultInfo.setDatas(listInfo.getDatas());
		resultInfo.setTotalCount(listInfo.getTotalSize());
		resultInfo.setCurrentPage(pageInfo.getCurrentPage());
		resultInfo.setPageSize(pageInfo.getPageSize());
		return resultInfo;
	}
	
	/**
	 * 修改社区警务室信息
	 */
	public static void updateSqjwsxxByJwsdm(SqjwsxxBean sqjwsxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSqjwsxxByJwsdm", sqjwsxxBean);
	}
	
	/**
	 * 插入社区警务室信息
	 * @param sqjwsxxBean
	 * @throws Exception
	 */
	public static void insertSqjwsxxByJwsdm(SqjwsxxBean sqjwsxxBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSqjwsxxByJwsdm", sqjwsxxBean);
	}
	
	/**
	 * 得到社区警务室信息
	 */
	public static SqjwsxxBean getSqjwsxxByJwsdm(SqjwsxxQuery sqjwsxxQuery) throws Exception{
		return executor.queryObjectBeanWithDBName(SqjwsxxBean.class, CommonConstant.DBNAME_SQJW, 
				"sqjwsxxList", sqjwsxxQuery);
	}
}
