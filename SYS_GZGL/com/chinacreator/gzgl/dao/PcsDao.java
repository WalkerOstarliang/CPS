package com.chinacreator.gzgl.dao;

import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.OrgJwsBean;
import com.chinacreator.common.cps.bean.PcsRyBean;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;
/**
 * 派出所管理Dao
 * @company  chinacreator
 * @author zhun.liu
 * @date  Dec 6, 2013  3:01:13 PM
 */
public class PcsDao {
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/gzgl/dao/pcs-sql.xml");
	
	public  static void insertPcsBean(OrgJwsBean bean) throws Exception{
		String id=CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "T_COMMON_ORGANIZATION_OTHER_ID"); 
		bean.setId(id);
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertPcsBean", bean);
	}
	
	public static  void updatePcsBean(OrgJwsBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updatePcsBean", bean);
	}
	
	public static  OrgJwsBean queryPcsBeanByOrgcode(String orgcode) throws Exception{
		return executor.queryObjectWithDBName(OrgJwsBean.class, CommonConstant.DBNAME_SQJW, "queryPcsBeanByOrgcode", orgcode);
	}
	
	/**
	 * 查询派出所荣誉
	 * @param orgid
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public static PageResultInfo<PcsRyBean> queryPcsRyList(String orgid,PageInfo pageinfo) throws SQLException{
		ListInfo list = executor.queryListInfoWithDBName(PcsRyBean.class, CommonConstant.DBNAME_SQJW, "queryPcsRyList", pageinfo.getOffset(), pageinfo.getPageSize(), orgid);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}
	
	/**
	 * 新增派出所荣誉
	 * @param bean
	 * @throws SQLException
	 */
	public static void inserPcsRy(PcsRyBean bean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "inserPcsRy", bean);
	}
	
	/**
	 * 修改派出所荣誉
	 * @param bean
	 * @throws SQLException
	 */
	public static void updatePcsRy(PcsRyBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updatePcsRy", bean);
	}
	
	/**
	 * 删除派出所荣誉
	 * @param bean
	 * @throws SQLException
	 */
	public static void deletePcsRy(PcsRyBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deletePcsRy", bean);
	}
	
	
	/**
	 * 更新机构数据计算表中的警务区分类
	 * @param orgcode
	 */
	public static void updateSjjsJwqfl(String orgcode,String jwqfl) throws SQLException{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateSjjsJwqfl", jwqfl,orgcode);
	}
	
}
