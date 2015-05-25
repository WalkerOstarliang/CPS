package com.chinacreator.afgl.dao;

import java.util.List;

import com.chinacreator.afgl.bean.ZapcxxBean;
import com.chinacreator.afgl.query.KkpcxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 卡口盘查信息DAO
 *
 */
public class KkpcxxDao {
	private static ConfigSQLExecutor executor =  
		new ConfigSQLExecutor("com/chinacreator/afgl/dao/kkpcxx-sql.xml");
	
	/**
	 * 查询卡口盘查信息列表
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<ZapcxxBean> kkpcxxList(PageInfo pageInfo,  
			KkpcxxQuery kkpcxxQuery) throws Exception{
		PageResultInfo<ZapcxxBean> resultInfo = new PageResultInfo<ZapcxxBean>();
		ListInfo listInfo = new ListInfo();
		listInfo = executor.queryListInfoBeanWithDBName(ZapcxxBean.class, CommonConstant.DBNAME_SQJW,
					"kkpcxxList", pageInfo.getOffset(), pageInfo.getPageSize(), kkpcxxQuery);
		resultInfo.setDatas((List<ZapcxxBean>)listInfo.getDatas());
		resultInfo.setTotalCount(listInfo.getTotalSize());
		resultInfo.setCurrentPage(pageInfo.getCurrentPage());
		resultInfo.setPageSize(pageInfo.getPageSize());
		return resultInfo;
	}
	
	/**
	 * 新增卡口盘查信息
	 */
	public static void addKkpcxx(ZapcxxBean kkpcxxBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addKkpcxx", kkpcxxBean);
	}
	
	/**
	 * 修改卡口盘查信息
	 */
	public static void updateKkpcxxByPcbh(ZapcxxBean kkpcxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateKkpcxxByPcbh", kkpcxxBean);
	}
	
	/**
	 * 得到卡口盘查信息
	 */
	public static ZapcxxBean getKkpcxxByPcbh(KkpcxxQuery kkpcxxQuery) throws Exception{
		return executor.queryObjectBeanWithDBName(ZapcxxBean.class, CommonConstant.DBNAME_SQJW, "kkpcxxList", kkpcxxQuery);
	}
}
