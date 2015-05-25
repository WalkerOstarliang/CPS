package com.chinacreator.zagl.dao.impl;

import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zagl.bean.NbdwaqjcBean;
import com.chinacreator.zagl.dao.DwAqjcDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class DwAqjcDaoImpl implements DwAqjcDao{

	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
	"com/chinacreator/zagl/dao/sql/aqjc-sql.xml");
	
	/**
	 * 插入安全检查信息
	 */
	public void insertAqjcBean(NbdwaqjcBean aqjcBean) {
		try {
			executor.insertBean(CommonConstant.DBNAME_SQJW, "insertAqjcBean", aqjcBean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 跟新安全检查信息
	 */
	public void updateAqjcBean(NbdwaqjcBean aqjcBean){
		try {
			executor.updateBean(CommonConstant.DBNAME_SQJW, "updateAqjcBean", aqjcBean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 分页查询 根据jcdwdm
	 */
	@Override
	public PageResultInfo<NbdwaqjcBean> queryNbAqjcPageInfoByJcdwdm(
			String jcdwdm, PageInfo pageInfo) {
		try {
			ListInfo listInfo = executor.queryListInfoWithDBName(NbdwaqjcBean.class, CommonConstant.DBNAME_SQJW, "queryNbAqjcPageInfoByJcdwdm", pageInfo.getOffset(), pageInfo.getPageSize(), jcdwdm);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
