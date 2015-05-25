package com.chinacreator.zdry.dao;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zdry.bean.CrimePersonnel;
import com.chinacreator.zdry.query.CrimePersonnelQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(犯罪人员数据访问层类)
 * @date Mar 18, 2013 9:55:02 AM
 */
public class CrimeDao implements java.io.Serializable{

	
	private static final long serialVersionUID = 7391649276360044494L;
	
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/zdry/dao/crime-sql.xml");
	
	/**
	 * 查询犯罪人员信息
	 * @param personnel
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<CrimePersonnel> queryCrimePersonnelList(CrimePersonnelQueryBean crime, PageInfo pageInfo) throws Exception{
		
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(CrimePersonnel.class, 
															 CommonConstant.DBNAME_SQJW , 
															 "queryFzryObj" , 
															 pageInfo.getOffset(),
															 pageInfo.getPageSize(),
															 crime);
		
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo.getTotalSize(), listInfo.getDatas());
		
	}
	
	/**
	 * 根据Bh主键查询犯罪嫌疑人详细信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static CrimePersonnel queryByIdCrimeDetails(String id) throws Exception{
		return executor.queryObjectWithDBName(CrimePersonnel.class, CommonConstant.DBNAME_SQJW, "queryByIdCrimeDetailsSQL", id);
	}
	
	public static void updateCrimeInfo(CrimePersonnel crimePersonnel) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCrimeInfoSQL", crimePersonnel);
	}
}
