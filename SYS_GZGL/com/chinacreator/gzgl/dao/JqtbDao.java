package com.chinacreator.gzgl.dao;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.bean.JqtbBean;
import com.chinacreator.gzgl.query.JqtbQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

public class JqtbDao {
	private static ConfigSQLExecutor executor=new ConfigSQLExecutor("com/chinacreator/gzgl/dao/jqtb-sql.xml");
	
	
	/**
	 * 插入警情通报
	 * @param bean
	 * @throws Exception
	 */
	public static void insertJqtbBean(JqtbBean bean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertJqtbBean", bean);
	}
	
	/**
	 * 分页查询
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public static PageResultInfo<JqtbBean> queryJqtbPage(JqtbQueryBean queryBean,PageInfo pageInfo) throws Exception{
		ListInfo listInfo=executor.queryListInfoBeanWithDBName(JqtbBean.class, CommonConstant.DBNAME_SQJW, "queryJqtbPage", pageInfo.getOffset(),pageInfo.getPageSize()	, queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public static void updateJqtbBean(JqtbBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJqtbBean", bean);
	}
	
	public static JqtbBean queryJqtbBeanByid(String id, String tjyf, String orgcode) throws Exception
	{
		SQLParams params = new SQLParams();
		params.addSQLParam("id", id, SQLParams.STRING);
		params.addSQLParam("tjyf", tjyf, SQLParams.STRING);
		params.addSQLParam("orgcode", orgcode, SQLParams.STRING);
		return executor.queryObjectBeanWithDBName(JqtbBean.class, CommonConstant.DBNAME_SQJW, "queryJqtbBeanByid", params);
	}
	
	public static boolean queryJqtbBeanByny(String ny,String djdw) throws Exception{
		boolean flag=false;
		JqtbBean bean=executor.queryObjectWithDBName(JqtbBean.class, CommonConstant.DBNAME_SQJW, "queryJqtbBeanByny", ny,djdw);
		if(bean!=null){
			flag=true;
		}else{
			flag=false;
		}
		return flag;
	}
}
