package com.chinacreator.common.cps.business;



import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.OrgJwsBean;
import com.chinacreator.common.cps.bean.UserLxfsBean;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;

public class UserLxfsBusiness {
	private ConfigSQLExecutor executor=new ConfigSQLExecutor("com/chinacreator/common/cps/business/userlxfs-sql.xml");
	
	/**
	 * 插入联系方式
	 * @param bean
	 * @throws Exception
	 */
	public void insertUserLxfsBean(UserLxfsBean bean) throws Exception{
		String id=CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "T_COMMON_USER_LXFS_ID");
		bean.setId(id);
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertUserLxfsBean", bean);
	}
	
	public void updateUserLxfsBean(UserLxfsBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateUserLxfsBean", bean);
	}
	
	
	/**
	 * 根据警号查询联系方式
	 * @param jh
	 * @return
	 * @throws Exception
	 */
	public UserLxfsBean queryUserLxfsByJh(String jh) throws Exception{
		return executor.queryObjectWithDBName(UserLxfsBean.class, CommonConstant.DBNAME_SQJW, "queryUserLxfsByJh", jh);
	}
	
	/**
	 * 插入警务室维护信息
	 * @param jwsBean
	 * @throws Exception
	 */
	public void insertOrgJwsBean(OrgJwsBean jwsBean) throws Exception{
		String id=CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "T_COMMON_ORGANIZATION_OTHER_ID");
		jwsBean.setId(id);
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertOrgJwsBean", jwsBean);
	}
	
	
	/**
	 * 修改
	 * @throws Exception 
	 */
	public  void updateOrgJwsBean(OrgJwsBean jwsBean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateOrgJwsBean", jwsBean);
	}
	/**
	 * 根据机构id查询警务室
	 * @param orgcode
	 * @return
	 * @throws Exception
	 */
	public OrgJwsBean queryOrgJwsByOrgCode(String orgcode) throws Exception{
		return executor.queryObjectWithDBName(OrgJwsBean.class, CommonConstant.DBNAME_SQJW, "queryOrgJwsByOrgCode", orgcode);
	}
}
