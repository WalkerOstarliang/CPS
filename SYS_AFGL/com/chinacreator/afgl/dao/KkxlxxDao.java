package com.chinacreator.afgl.dao;

import java.util.List;

import com.chinacreator.afgl.bean.KkxlxxBean;
import com.chinacreator.afgl.query.KkxlxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 卡口巡逻信息DAO
 * @author Administrator
 *
 */
public class KkxlxxDao {
	private static ConfigSQLExecutor executor =  
		new ConfigSQLExecutor("com/chinacreator/afgl/dao/kkxlxx-sql.xml");
	
	/**
	 * 查询卡口巡逻信息列表
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<KkxlxxBean> kkxlxxList(PageInfo pageInfo,  
			KkxlxxQuery kkxlxxQuery) throws Exception{
		PageResultInfo<KkxlxxBean> resultInfo = new PageResultInfo<KkxlxxBean>();
		ListInfo listInfo = new ListInfo();
		listInfo = executor.queryListInfoBeanWithDBName(KkxlxxBean.class, CommonConstant.DBNAME_SQJW,
					"kkxlxxList", pageInfo.getOffset(), pageInfo.getPageSize(), kkxlxxQuery);
		resultInfo.setDatas((List<KkxlxxBean>)listInfo.getDatas());
		resultInfo.setTotalCount(listInfo.getTotalSize());
		resultInfo.setCurrentPage(pageInfo.getCurrentPage());
		resultInfo.setPageSize(pageInfo.getPageSize());
		return resultInfo;
	}
	
	/**
	 * 新增卡口巡逻信息
	 */
	public static void addKkxlxx(KkxlxxBean kkxlxxBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addKkxlxx", kkxlxxBean);
	}
	
	/**
	 * 修改卡口巡逻信息
	 */
	public static void updateKkxlxx(KkxlxxBean kkxlxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateKkxlxx", kkxlxxBean);
	}
	
	/**
	 * 得到卡口巡逻信息
	 */
	public static KkxlxxBean getKkxlxxByXlbh(KkxlxxQuery kkxlxxQuery) throws Exception{
		return executor.queryObjectBeanWithDBName(KkxlxxBean.class, CommonConstant.DBNAME_SQJW, "kkxlxxList", kkxlxxQuery);
	}
}
