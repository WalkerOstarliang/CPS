package com.chinacreator.afgl.dao;

import java.util.List;

import com.chinacreator.afgl.bean.KywpxxBean;
import com.chinacreator.afgl.query.KywpxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 可疑物品信息DAO
 *
 */
public class KywpxxDao {
	private static ConfigSQLExecutor executor =  
		new ConfigSQLExecutor("com/chinacreator/afgl/dao/kywpxx-sql.xml");
	
	/**
	 * 可疑物品信息列表
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<KywpxxBean> kywpxxList(PageInfo pageInfo,  
			KywpxxQuery kywpxxQuery) throws Exception{
		PageResultInfo<KywpxxBean> resultInfo = new PageResultInfo<KywpxxBean>();
		ListInfo listInfo = new ListInfo();
		listInfo = executor.queryListInfoBeanWithDBName(KywpxxBean.class, CommonConstant.DBNAME_SQJW,
					"kywpxxList", pageInfo.getOffset(), pageInfo.getPageSize(), kywpxxQuery);
		resultInfo.setDatas((List<KywpxxBean>)listInfo.getDatas());
		resultInfo.setTotalCount(listInfo.getTotalSize());
		resultInfo.setCurrentPage(pageInfo.getCurrentPage());
		resultInfo.setPageSize(pageInfo.getPageSize());
		return resultInfo;
	}
	
	/**
	 * 新增可疑物品
	 */
	public static void addKywpxx(KywpxxBean kywpxxBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addKywpxx", kywpxxBean);
	}
	
	/**
	 * 修改可疑物品
	 */
	public static void updateKywpxxByKywpbh(KywpxxBean kywpxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateKywpxxByKywpbh", kywpxxBean);
	}
	
	/**
	 * 得到可疑物品详情
	 */
	public static KywpxxBean getKywpxxByKywpbh(KywpxxQuery kywpxxQuery) throws Exception{
		return executor.queryObjectBeanWithDBName(KywpxxBean.class, CommonConstant.DBNAME_SQJW, "kywpxxList", kywpxxQuery);
	}
}
