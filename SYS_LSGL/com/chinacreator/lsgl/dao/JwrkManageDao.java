package com.chinacreator.lsgl.dao;

import java.sql.SQLException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.JwrkxxBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

public class JwrkManageDao
{
	private static ConfigSQLExecutor executor=new ConfigSQLExecutor("com/chinacreator/lsgl/dao/lsgl-jwrk-sql.xml");
	
	/**
	 * 查询境外人口列表
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @date Aug 14, 2014 8:53:08 AM
	 */
	public PageResultInfo<JwrkxxBean> queryJwrkPageResultInfo(RkQueryBean queryBean, PageInfo pageInfo)
	{
		PageResultInfo<JwrkxxBean> pageResultInfo = null;
		try
		{
			ListInfo listinfo = executor.queryListInfoBeanWithDBName(JwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJwrkPageResultInfo", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
			pageResultInfo = PaginationHelper.wrapPageResultInfo(pageInfo, listinfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResultInfo = new PageResultInfo<JwrkxxBean>();
		}
		return pageResultInfo;
	}
	
	/**
	 * 查询历史居住信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @date Aug 16, 2014 2:06:37 PM
	 */
	public PageResultInfo<JwrkxxBean> queryLsJzJwrkPageResultInfo(RkQueryBean queryBean, PageInfo pageInfo)
	{
		PageResultInfo<JwrkxxBean> pageResultInfo = null;
		try
		{
			ListInfo listinfo = executor.queryListInfoBeanWithDBName(JwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLsJzJwrkPageResultInfo", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
			pageResultInfo = PaginationHelper.wrapPageResultInfo(pageInfo, listinfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResultInfo = new PageResultInfo<JwrkxxBean>();
		}
		return pageResultInfo;
	}
	
	/**
	 * 通过条件查询境外人口信息
	 * @param queryBean
	 * @return
	 * @date Aug 15, 2014 2:51:21 PM
	 */
	public JwrkxxBean queryJwrkJbxxBeanByQueryBean(RkQueryBean queryBean)
	{
		try
		{
			if (ValidateHelper.isNotEmptyString(queryBean.getJwbh()))
			{
				return executor.queryObjectBeanWithDBName(JwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJwrkJbxxBeanByJwbh", queryBean);
			}
			else
			{
				return executor.queryObjectBeanWithDBName(JwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJwrkJbxxBeanByQueryBean", queryBean);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 通过登记单位和人员编号找境外人口
	 * @param rybh
	 * @param djdwdm
	 * @return
	 * @date Aug 15, 2014 6:22:25 PM
	 */
	public JwrkxxBean queryJwrkInfoByRybhAndDjdwdm(String rybh, String djdwdm)
	{
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("rybh", rybh, SQLParams.STRING);
			params.addSQLParam("djdwdm", djdwdm, SQLParams.STRING);
			return executor.queryObjectBeanWithDBName(JwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJwrkInfoByRybhAndDjdwdm", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 插入境外人口信息
	 * @param queryBean
	 * @return
	 * @date Aug 15, 2014 3:46:32 PM
	 */
	public void insertJwrkBean(JwrkxxBean jwrkBean) throws SQLException
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertJwrkBean", jwrkBean);
	}
	
	/**
	 * 更新境外人口信息
	 * @param jwrkBean
	 * @date Aug 15, 2014 3:48:16 PM
	 */
	public void updateJwrkBean(JwrkxxBean jwrkBean) throws SQLException
	{
		
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJwrkBean", jwrkBean);
	}
	
	public RkfwglBean getJwrkCurrentRkfwglBean(String rybh) throws Exception
	{
		return executor.queryObjectWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "getJwrkCurrentRkfwglBean", rybh);
	}
	
	public void zxRkfwglByRybh(String rybh,String zxyy) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		SQLParams params = new SQLParams();
		params.addSQLParam("rybh", rybh, SQLParams.STRING);
		params.addSQLParam("zxmjxm", loginInfo.getRealname(), SQLParams.STRING);
		params.addSQLParam("zxdwdm", loginInfo.getOrgcode(), SQLParams.STRING);
		params.addSQLParam("zxdwmc", loginInfo.getOrgname(), SQLParams.STRING);
		params.addSQLParam("zxyy", zxyy, SQLParams.STRING);
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zxRkfwglByRybh", params);
	}
	
	
	/**
	 * 注销境外人信息
	 * @param queryBean
	 * @throws Exception
	 * @date Aug 16, 2014 12:49:32 PM
	 */
	public void updateJwrkZxbs(RkQueryBean queryBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJwrkZxbs", queryBean);
	}
	
	
	
}
