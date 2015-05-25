package com.chinacreator.gzgl.dao;

import java.sql.SQLException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.bean.EmfyqkxxBean;
import com.chinacreator.gzgl.bean.ErmxxBean;
import com.chinacreator.gzgl.query.XxyQuery;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

public class XxyDao {
	public static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/gzgl/dao/xxy-sql.xml");

	/**
	 * 分页查询信息员列表
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public static PageResultInfo<ErmxxBean> getXxyListPage(XxyQuery queryBean,
			PageInfo pageInfo) throws SQLException {
		ListInfo listInfo= executor.queryListInfoBeanWithDBName(ErmxxBean.class, CommonConstant.DBNAME_SQJW, "queryxxyxx",pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 新增信息员
	 * @param emxxBean
	 * @throws SQLException
	 */
	public static void insertXxyBean(ErmxxBean emxxBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertEmxxBean", emxxBean);
		
	}
	
	/**
	 * 修改信息员
	 * @param emxxBean
	 * @throws SQLException
	 */
	public static void updateXxyBean(ErmxxBean emxxBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW,"updateEmxxBean", emxxBean);
	}
	
	/**
	 * 根据主键ID查询信息员
	 * @param zaembh
	 * @return
	 * @throws SQLException
	 */
	public static ErmxxBean getEmxxBeanByzaembh(String zaembh) throws SQLException {
		return executor.queryObjectWithDBName(ErmxxBean.class,CommonConstant.DBNAME_SQJW, "getEmxxBean",zaembh);
	}

	/**
	 * 根据身份证号和单位代码查询信息员
	 * @param sfzh
	 * @param orgCode
	 * @return
	 * @throws SQLException
	 */
	public static ErmxxBean queryEmxxBeanBySfzhAndOrgCode(String sfzh,String orgCode) throws SQLException {
		return executor.queryObjectWithDBName(ErmxxBean.class,CommonConstant.DBNAME_SQJW, "queryEmxxBeanBySfzhAndOrgCode",sfzh,orgCode);
	}
	
	public static void saveXxyfyBean(EmfyqkxxBean emfyqkxxBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertEmfyqkxxBean",emfyqkxxBean);
		
	}
	
	public static void updateXxyfyBean(EmfyqkxxBean emfyqkxxBean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateEmfyqkxxBean", emfyqkxxBean);
	}

	public static PageResultInfo<EmfyqkxxBean> getEmFyqkxxBeanByzaembh(
			String zaembh, PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoWithDBName(EmfyqkxxBean.class, CommonConstant.DBNAME_SQJW, "getEmFyqkxxBeanByZaembh", pageInfo.getOffset(), pageInfo.getPageSize(), zaembh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	
	public static ErmxxBean queryEmxxBeanBySfzhAndOrg(String sfzh,String orgcode) throws SQLException {
		return executor.queryObjectWithDBName(ErmxxBean.class,CommonConstant.DBNAME_SQJW, "queryEmxxBeanBySfzhAndOrg",sfzh,orgcode);
	}
	
	public static  EmfyqkxxBean queryEmfyqkxxBeanById(String id) throws SQLException{
		return executor.queryObjectWithDBName(EmfyqkxxBean.class, CommonConstant.DBNAME_SQJW, "queryEmfyqkxxBeanById", id);
	}
	
	public static void zxZaemxxBean(String zaembh) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		SQLParams params = new SQLParams();
		params.addSQLParam("czdwdm", loginInfo.getOrgcode(), SQLParams.STRING);
		params.addSQLParam("czdwmc", loginInfo.getOrgname(), SQLParams.STRING);
		params.addSQLParam("czrsfzh", loginInfo.getSfzh(), SQLParams.STRING);
		params.addSQLParam("czrjh", loginInfo.getUsername(), SQLParams.STRING);
		params.addSQLParam("zaembh", zaembh, SQLParams.STRING);
		
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zxZaemxxBean", params);
	}
}
