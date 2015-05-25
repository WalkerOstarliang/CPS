package com.chinacreator.afgl.dao;


import com.chinacreator.afgl.bean.ZbhcyxxBean;
import com.chinacreator.afgl.query.ZbhcyxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 治保会成员信息DAO
 *
 */
public class ZbhcyxxDao {
	private static ConfigSQLExecutor executor =  
		new ConfigSQLExecutor("com/chinacreator/afgl/dao/zbhcyxx-sql.xml");
	
	/**
	 * 查询治保会成员信息列表
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<ZbhcyxxBean> zbhcyxxList(PageInfo pageInfo,  ZbhcyxxQuery zbhcyxxQuery) throws Exception
	{
		PageResultInfo<ZbhcyxxBean> resultInfo = new PageResultInfo<ZbhcyxxBean>();
		ListInfo listInfo = new ListInfo();
		listInfo = executor.queryListInfoBeanWithDBName(ZbhcyxxBean.class, CommonConstant.DBNAME_SQJW, "zbhcyxxList", pageInfo.getOffset(), pageInfo.getPageSize(), zbhcyxxQuery);
		resultInfo.setDatas(listInfo.getDatas());
		resultInfo.setTotalCount(listInfo.getTotalSize());
		resultInfo.setCurrentPage(pageInfo.getCurrentPage());
		resultInfo.setPageSize(pageInfo.getPageSize());
		return resultInfo;
	}
	
	/**
	 * 新增治保会成员信息
	 */
	public static void addZbhcyxx(ZbhcyxxBean zbhcyxxBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addZbhcyxx", zbhcyxxBean);
	}
	
	/**
	 * 修改治保会成员信息
	 */
	public static void updateZbhcyxxByZbhcybh(ZbhcyxxBean zbhcyxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZbhcyxxByZbhcybh", zbhcyxxBean);
	}
	
	/**
	 * 得到治保会成员信息
	 */
	public static ZbhcyxxBean getZbhcyxxByZbhcybh(ZbhcyxxQuery zbhcyxxQuery) throws Exception{
		return executor.queryObjectBeanWithDBName(ZbhcyxxBean.class, CommonConstant.DBNAME_SQJW, "zbhcyxxList", zbhcyxxQuery);
	}
	
	/**
	 * 删除治保会成员信息
	 */
	public static void deleteZbhcyxxByZbhcybh(ZbhcyxxBean zbhcyxxBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteZbhcyxxByZbhcybh", zbhcyxxBean);
	}
	
	/**
	 * 得到治保会成员信息By身份证
	 */
	public static ZbhcyxxBean getZbhcyxxBySfzh(String sfzh) throws Exception{
		return executor.queryObjectWithDBName(ZbhcyxxBean.class, CommonConstant.DBNAME_SQJW, "getZbhcyxxBySfzh", sfzh);
	}
	
	public static ZbhcyxxBean getZbhcyxxBySfzhAndZbhbh(String sfzh,String zbhbh) throws Exception{
		return executor.queryObjectWithDBName(ZbhcyxxBean.class, CommonConstant.DBNAME_SQJW, "getZbhcyxxBySfzhAndZbhbh", sfzh);
	}
}
