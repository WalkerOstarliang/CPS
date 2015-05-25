package com.chinacreator.yjcj.business;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.yjcj.bean.CommonWtfjBean;
import com.chinacreator.yjcj.bean.CommonWthdxxBean;
import com.chinacreator.yjcj.bean.CommonWtxxBean;
import com.chinacreator.yjcj.bean.CommonXxfbBean;
import com.chinacreator.yjcj.bean.CommonXxfbfjBean;
import com.chinacreator.yjcj.query.CommonWtxxQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

public class CommonYjcjBusiness
{
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/yjcj/business/yjcj-sql.xml");
	
	public PageResultInfo<CommonWtxxBean> queryWtxxBeansPageResult(CommonWtxxQueryBean queryBean, PageInfo pageInfo)
	{
		try
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(CommonWtxxBean.class, CommonConstant.DBNAME_SQJW, "queryWtxxBeansPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new PageResultInfo<CommonWtxxBean>();
	}
	
	/**
	 * 保存问题信息
	 * @param wtxxBean
	 * @throws Exception
	 * @date Oct 9, 2014 9:04:43 AM
	 */
	public void saveWtxxBean(CommonWtxxBean wtxxBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (ValidateHelper.isNotEmptyString(wtxxBean.getWtid()))
		{
			wtxxBean.setDjdwdm(loginInfo.getOrgcode());
			wtxxBean.setDjdwmc(loginInfo.getOrgname());
			wtxxBean.setDjrsfzh(loginInfo.getSfzh());
			wtxxBean.setDjrxm(loginInfo.getRealname());
			executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWtxxBean", wtxxBean);
		}
		else
		{
			String wtid = UUID.randomUUID().toString();
			wtxxBean.setWtid(wtid);
			wtxxBean.setSffk("0");
			wtxxBean.setDjdwdm(loginInfo.getOrgcode());
			wtxxBean.setDjdwmc(loginInfo.getOrgname());
			wtxxBean.setDjrsfzh(loginInfo.getSfzh());
			wtxxBean.setDjrxm(loginInfo.getRealname());
			wtxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWtxxBean", wtxxBean);
		}
	}
	
	public void saveWthdBean(CommonWthdxxBean wthdBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		wthdBean.setDjdwdm(loginInfo.getOrgcode());
		wthdBean.setDjdwmc(loginInfo.getOrgname());
		wthdBean.setDjrsfzh(loginInfo.getSfzh());
		wthdBean.setDjrxm(loginInfo.getRealname());
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWthfBean", wthdBean);
	}
	
	public CommonWtxxBean queryWtxxBeanByWtid(String wtid)
	{
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("wtid", wtid, SQLParams.STRING);
			return executor.queryObjectBeanWithDBName(CommonWtxxBean.class, CommonConstant.DBNAME_SQJW, "queryWtxxBeanByWtid", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<CommonWthdxxBean> queryWthdxxBeansByWtid(String wtid)
	{
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("wtid", wtid, SQLParams.STRING);
			return executor.queryListBeanWithDBName(CommonWthdxxBean.class, CommonConstant.DBNAME_SQJW, "queryWthdxxBeansByWtid", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	
	public void savewtfjBean(CommonWtfjBean fjBean) throws Exception
    {
		SQLParams params = new SQLParams();
		params.addSQLParam("fjid", fjBean.getFjid(), SQLParams.STRING);
		params.addSQLParam("wtid", fjBean.getWtid(), SQLParams.STRING);
		params.addSQLParam("upload", fjBean.getUpload(), SQLParams.BLOB);
		params.addSQLParam("type", fjBean.getType(), SQLParams.STRING);
		params.addSQLParam("wthdid", fjBean.getWthdid(), SQLParams.STRING);
		String sql = executor.getSql("insertWtfjBean");
		PreparedDBUtil putil = new PreparedDBUtil();
		putil.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
		putil.setString(1, fjBean.getFjid());
		putil.setString(2,  fjBean.getWtid());
		putil.setBlob(3,  fjBean.getUpload());
		putil.setString(4,  fjBean.getType());
		putil.setString(5,  fjBean.getWthdid());
		putil.executePrepared();
	}
	
	public List<CommonWtfjBean> queryWtfjBeansByWthdid(String wthdid)
	{
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("wthdid", wthdid, SQLParams.STRING);
			return executor.queryListBeanWithDBName(CommonWtfjBean.class, CommonConstant.DBNAME_SQJW, "queryWtfjBeansByWthdid", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<CommonWtfjBean> queryWtfjBeansBywtid(String wtid)
	{
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("wtid", wtid, SQLParams.STRING);
			return executor.queryListBeanWithDBName(CommonWtfjBean.class, CommonConstant.DBNAME_SQJW, "queryWtfjBeansBywtid", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	
	public Blob getWtfjBlob(String fjid) 
	{
		try
		{
			String sql = "select upload from t_yjcj_wtfjb where fjid='" + fjid + "'";
			DBUtil util = new DBUtil();
			util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
			if (util.size() > 0)
			{
				Blob blob = util.getBlob(0, "upload");
				return blob;
			}
			else
			{
				return null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public CommonXxfbBean queryCommonXxfbBeanByXxid(String xxid)
	{
		try
		{
			return executor.queryObjectWithDBName(CommonXxfbBean.class, CommonConstant.DBNAME_SQJW, "queryCommonXxfbBeanByXxid", xxid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public PageResultInfo<CommonXxfbBean> queryXxfbBeansPageResult(PageInfo pageInfo)
	{
		try
		{
			ListInfo listInfo = executor.queryListInfoWithDBName(CommonXxfbBean.class, CommonConstant.DBNAME_SQJW, "queryXxfbBeansPageResult", pageInfo.getOffset(), pageInfo.getPageSize());
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return new PageResultInfo<CommonXxfbBean>();
		}
	}
	
	/**
	 * 保存信息发布对象
	 * @param xxfbBean
	 * @date Mar 6, 2015 9:04:01 AM
	 */
	public void saveXxfbBean(CommonXxfbBean xxfbBean) throws SQLException
	{
		if (ValidateHelper.isEmptyString(xxfbBean.getXxid()))
		{
			String xxid = UUID.randomUUID().toString();
			xxfbBean.setXxid(xxid);
			executor.insertBean(CommonConstant.DBNAME_SQJW, "insertXxfbBean", xxfbBean);
		}
		else
		{
			executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXxfbBean", xxfbBean);
		}
	}
	
	/**
	 * 保存信息发布附件信息
	 * @param fjBean
	 * @throws Exception
	 * @date Mar 6, 2015 9:24:41 AM
	 */
	public void saveXxfbfjBean(CommonXxfbfjBean fjBean) throws Exception
    {
		SQLParams params = new SQLParams();
		params.addSQLParam("fjid", fjBean.getFjid(), SQLParams.STRING);
		params.addSQLParam("xxid", fjBean.getXxid(), SQLParams.STRING);
		params.addSQLParam("upload", fjBean.getUpload(), SQLParams.BLOB);
		String sql = executor.getSql("insertXxfbfjBean");
		PreparedDBUtil putil = new PreparedDBUtil();
		putil.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
		putil.setString(1, fjBean.getFjid());
		putil.setString(2,  fjBean.getXxid());
		putil.setBlob(3,  fjBean.getUpload());
		putil.setString(4,  fjBean.getUploadfilename());
		putil.executePrepared();
	}
	
	public void deleteXxfbfjBean(String fjid) throws Exception
	{
		SQLParams params = new SQLParams();
		params.addSQLParam("fjid", fjid, SQLParams.STRING);
		executor.deleteBean(CommonConstant.DBNAME_SQJW, "deleteXxfbfjBean", params);
	}
	
	/**
	 * 
	 * @param pageInfo
	 * @param xxid
	 * @return
	 * @date Mar 6, 2015 9:39:07 AM
	 */
	public List<CommonXxfbfjBean> queryXxfbfjBeansPageResult(String xxid) throws Exception
	{
		SQLParams params = new SQLParams();
		params.addSQLParam("xxid", xxid, SQLParams.STRING);
		List<CommonXxfbfjBean> list = executor.queryListBeanWithDBName(CommonXxfbfjBean.class, CommonConstant.DBNAME_SQJW, "queryXxfbfjBeansPageResult", params);
		return list;
	}
	
	public CommonXxfbBean queryXxfbBeanOfLastTimeToSm()
	{
		try
		{
			return executor.queryObjectWithDBName(CommonXxfbBean.class, CommonConstant.DBNAME_SQJW, "queryXxfbBeanOfLastTimeToSm");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public Blob getXxfbfjBlob(String fjid) 
	{
		try
		{
			String sql = "select upload from t_yjcj_xxfj where fjid='" + fjid + "'";
			DBUtil util = new DBUtil();
			util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
			if (util.size() > 0)
			{
				Blob blob = util.getBlob(0, "upload");
				return blob;
			}
			else
			{
				return null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
}
