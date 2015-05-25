package com.chinacreator.xqgk.dao;

import java.sql.SQLException;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.xqgk.bean.base.DeptRelationOrg;
import com.chinacreator.xqgk.bean.base.UserRelationOrg;
import com.chinacreator.xqgk.bean.query.SqmjQueryBean;
import com.chinacreator.xqgk.utils.CommonDataCache;
import com.chinacreator.xqgk.utils.UtilsConf;
import com.frameworkset.common.poolman.ConfigSQLExecutor;

public class XqgkBaseDao implements java.io.Serializable {

	private static final long serialVersionUID = 8475917313147698117L;

	public static XqgkBaseDao getInstance(){
		return new XqgkBaseDao();
	}
	
	private ConfigSQLExecutor executor=new ConfigSQLExecutor("com/chinacreator/xqgk/dao/sql/xqgkBase-sql.xml");
	
	public UserRelationOrg getRelaUserDeptCode(String userId) throws Exception{
		UserRelationOrg userRela = null;
		Object obj = CommonDataCache.getInstance().getUserRelaFromCache(userId);
		if(obj == null){
			userRela = executor.queryObjectWithDBName(UserRelationOrg.class, UtilsConf.DBNAME_PTGL, "getRelaUserDeptCode", userId);
			if(userRela != null){
				CommonDataCache.getInstance().addUserRela2Cache(userRela);	
			}else{
				userRela = null;
			}
		}
		else
		{
			userRela = (UserRelationOrg)obj;
		}
		return userRela; 
	}
	
	public DeptRelationOrg getRelaDeptCode(String orgCode) throws Exception{
		DeptRelationOrg deptRela = null;
		Object obj = CommonDataCache.getInstance().getUserRelaFromCache(orgCode);
		if(obj == null){
			deptRela = executor.queryObjectWithDBName(DeptRelationOrg.class, UtilsConf.DBNAME_PTGL, "getRelaDeptCode", orgCode);
			if(deptRela != null){
				CommonDataCache.getInstance().addDeptRela2Cache(deptRela);	
			}else{
				deptRela = null;	
			}
		}else{
			deptRela = (DeptRelationOrg)obj;
		}
		return deptRela; 
	}
	
	/**
	 * 根据机构查该机构以及所有子机构下面的民警人数
	 * @param orgCode 格式：4301%
	 * @return
	 * @throws SQLException
	 */
	public String queryMjNumByOrgCode(String orgCode) throws SQLException{
		return executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "queryMjNumByOrgCode", orgCode);
	}
	
	/**
	 * 获取辖区内社区民警数量
	 * @param deptCode
	 * @return
	 * @throws SQLException
	 */
	public String querySqmjNumByOrgCode(SqmjQueryBean queryBean) throws SQLException{
		return executor.queryFieldBeanWithDBName(CommonConstant.DBNAME_SQJW, "querySqmjNumByOrgCode", queryBean);
	}
}
