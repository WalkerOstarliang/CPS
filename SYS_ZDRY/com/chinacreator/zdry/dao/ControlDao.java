package com.chinacreator.zdry.dao;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zdry.bean.Keypersonnel;
import com.chinacreator.zdry.query.KeypersonnelQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(在控管理数据访问层类)
 * @date Mar 6, 2013 2:54:14 PM
 */
public class ControlDao implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8739219595413981582L;
	
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/zdry/dao/Control-sql.xml");
	/**
	 * 查询重点人员信息
	 * @param personnel
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static PageResultInfo<Keypersonnel> queryKeyPersonnelList(KeypersonnelQueryBean personnel, PageInfo pageInfo) throws Exception{
		
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(Keypersonnel.class, 
																 CommonConstant.DBNAME_SQJW , 
																 "queryZdryJbxx" , 
																 pageInfo.getOffset(), 
																 pageInfo.getPageSize(), 
																 personnel);
		
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo.getTotalSize(), listInfo.getDatas());
		
	}
	
	public static PageResultInfo<Keypersonnel> queryLgdqtxList(Keypersonnel personnel, PageInfo pageInfo) throws Exception{
		
		return null;
	}
}
