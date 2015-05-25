package com.chinacreator.common.business;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PtglMenuBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.XzqhMappingBean;
import com.chinacreator.common.cps.business.DictionaryBusiness;
import com.chinacreator.common.helper.EncodePasswordHepler;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.SQLExecutor;

public class Logininfobusiness
{
	/**
	 * 更新用户密码
	 * @param userid
	 * @param newPassword
	 * @date Sep 9, 2014 2:43:29 PM
	 */
	public void updateUserPassword(String userid, String newPassword) throws Exception
	{
		String sql = "update td_sm_user set USER_PASSWORD=? where user_id=?";
		SQLExecutor.updateWithDBName(CommonConstant.DBNAME_PTGL, sql, EncodePasswordHepler.getEncodePassword(newPassword) ,userid);
	}
	
	/**
	 * 查询用户信息通过用户名
	 * @param username
	 * @return
	 */
	public LoginInfo getLoginUserInfoByUserName(String username)
	{
		StringBuffer sb = new StringBuffer();
		sb.append("select ");
		sb.append("u.userid as userid, u.username as username, u.password as password,");
		sb.append("u.realname as realname, u.realnamepy as realnamepy,u.mobile as mobile,");
		sb.append("u.telephone as telephone, u.sfzh as sfzh,u.isvalid as isvalid,");
		sb.append("u.createdate as createdate,o.orgid as orgid,o.orgcode as orgcode,");
		sb.append("o.orgname as orgname,o.parent_code as parent_code,o.orgjc as orgjc,");
		sb.append("(select dm from t_common_hnxzqh where leve='4' and sspcsdm=o.orgcode and rownum=1) as jdxzdm,");
		sb.append("o.leve as leve ");
		sb.append("from ");
		sb.append("v_common_user u inner join v_common_orguser ou on u.userid=ou.userid ");
		sb.append("inner join v_common_organization o on ou.orgid=o.orgid ");
		sb.append("where u.username=? and u.isvalid='1' ");
		
		LoginInfo loginInfo = null;
		try
		{
			loginInfo = SQLExecutor.queryObjectWithDBName(LoginInfo.class, CommonConstant.DBNAME_SQJW, sb.toString(), username);
			getGIS_Sqdm(loginInfo);
			getSqdm(loginInfo);
			setDefaultJdxzdm(loginInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return loginInfo;
	}
	
	/**
	 * 查询用户信息通过用户名
	 * @param username
	 * @return
	 */
	public LoginInfo getLoginUserInfoByUserName(String username, String password)
	{
		StringBuffer sb = new StringBuffer();
		sb.append("select ");
		sb.append("u.userid as userid, u.username as username, u.password as password,");
		sb.append("u.realname as realname, u.realnamepy as realnamepy,u.mobile as mobile,");
		sb.append("u.telephone as telephone, u.sfzh as sfzh,u.isvalid as isvalid,");
		sb.append("u.createdate as createdate,o.orgid as orgid,o.orgcode as orgcode,");
		sb.append("o.orgname as orgname,o.parent_code as parent_code,o.orgjc as orgjc,");
		sb.append("(select dm from t_common_hnxzqh where leve='4' and sspcsdm=o.orgcode and rownum=1) as jdxzdm,");
		sb.append("o.leve as leve ");
		sb.append("from ");
		sb.append("v_common_user u inner join v_common_orguser ou on u.userid=ou.userid ");
		sb.append("inner join v_common_organization o on ou.orgid=o.orgid ");
		sb.append("where u.username=? and password=? and u.isvalid='1' ");
		
		LoginInfo loginInfo = null;
		try
		{
			loginInfo = SQLExecutor.queryObjectWithDBName(LoginInfo.class, CommonConstant.DBNAME_SQJW, sb.toString(), username,password);
			getGIS_Sqdm(loginInfo);
			getSqdm(loginInfo);
			setDefaultJdxzdm(loginInfo);
			setMode(loginInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return loginInfo;
	}
	
	
	/**
	 * 查询用户信息通过用户名
	 * @param username
	 * @return
	 */
	public LoginInfo getLoginUserInfoBySfzh(String sfzh)
	{
		StringBuffer sb = new StringBuffer();
		sb.append("select ");
		sb.append("u.userid as userid, u.username as username, u.password as password,");
		sb.append("u.realname as realname, u.realnamepy as realnamepy,u.mobile as mobile,");
		sb.append("u.telephone as telephone, u.sfzh as sfzh,u.isvalid as isvalid,");
		sb.append("u.createdate as createdate,o.orgid as orgid,o.orgcode as orgcode,");
		sb.append("o.orgname as orgname,o.parent_code as parent_code,o.orgjc as orgjc,");
		sb.append("(select dm from t_common_hnxzqh where leve='4' and sspcsdm=o.orgcode and rownum=1) as jdxzdm,");
		sb.append("o.leve as leve ");
		sb.append("from ");
		sb.append("v_common_user u inner join v_common_orguser ou on u.userid=ou.userid ");
		sb.append("inner join v_common_organization o on ou.orgid=o.orgid ");
		sb.append("where u.sfzh=? and u.isvalid='1' ");
		LoginInfo loginInfo = null;
		try
		{
			loginInfo = SQLExecutor.queryObjectWithDBName(LoginInfo.class, CommonConstant.DBNAME_SQJW, sb.toString(), sfzh);
			if (loginInfo != null)
			{
				getGIS_Sqdm(loginInfo);
				getSqdm(loginInfo);
				setDefaultJdxzdm(loginInfo);
				setMode(loginInfo);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return loginInfo;
	}
	
	public void setMode(LoginInfo loginInfo)
	{
		DictionaryBusiness business = new DictionaryBusiness();
		List<XzqhMappingBean> mapBenas = business.getXzqhByPz(loginInfo.getCountrydm());
		if (ValidateHelper.isNotEmptyCollection(mapBenas))
		{
			for (XzqhMappingBean bean : mapBenas)
			{
				loginInfo.getGxYxzqhList().add(bean.getYxzqh());
			}
			loginInfo.setIsGxdz(true);
		}
		else
		{
			loginInfo.setIsGxdz(false);
		}
	}
	
	/**
	 * 查询平台管理系统菜单
	 * @param parent_id
	 * @return
	 * @date 2013-11-15 下午02:12:22
	 */
	public Map<PtglMenuBean,List<PtglMenuBean>> queryMenuBeans(String parent_id)
	{
		Map<PtglMenuBean,List<PtglMenuBean>> menuMap = new LinkedHashMap<PtglMenuBean,List<PtglMenuBean>>();
		try
		{
			List<PtglMenuBean> list = queryMenuBeanList(parent_id);
			if (ValidateHelper.isNotEmptyCollection(list))
			{
				for (PtglMenuBean menuBean : list)
				{
					menuMap.put(menuBean, queryMenuBeanList(menuBean.getFunction_id()));
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return menuMap;
	}
	
	public List<PtglMenuBean> queryMenuBeanList(String parent_id)
	{
		try
		{
			String sql = "select * from v_td_sm_function where parent_id=?  order by function_sn asc";
			return SQLExecutor.queryListWithDBName(PtglMenuBean.class, CommonConstant.DBNAME_SQJW, sql, parent_id);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public int getOrgLeve(String orgcode)
	{
		try
		{
			String sql = "select f_get_dwleve(?) from dual";
			String leve = SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, orgcode);
			if (ValidateHelper.isNotEmptyString(leve))
			{
				return Integer.parseInt(leve);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}
	
	public void setDefaultJdxzdm(LoginInfo loginInfo)
	{
		try
		{
			int leve = loginInfo.getLeve();
			String sql = "";
			if (leve == 4)
			{
				sql = "select dm from t_common_hnxzqh where leve='4' and sspcsdm='" + loginInfo.getOrgcode() + "'  and ISVALID='1'";
			}
			else if (leve ==5)
			{
				sql = "select parent_dm from t_common_hnxzqh where leve='5' and ssjwsdm='" + loginInfo.getOrgcode() + "' and ISVALID='1'";
			}
			if (ValidateHelper.isNotEmptyString(sql))
			{
				String jdxzdm = SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql);
				loginInfo.setJdxzdm(jdxzdm);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	//获取GIS_SQDM
	public void getGIS_Sqdm(LoginInfo logInfo)
	{
		if(logInfo == null)
		{
			return;
		}
		
		String sql = "";
		if(ValidateHelper.isNotEmptyString(logInfo.getJwsqdm()))
		{
			sql = "select distinct gis.gis_area from t_common_hnxzqh xzqh,gis_cs_sqjw_rela gis where xzqh.dm = gis.kc_code and ssjwsdm = '" + logInfo.getJwsqdm() + "'";
		}
		else if(ValidateHelper.isNotEmptyString(logInfo.getPcsdm())){
			sql = "select distinct gis.gis_area from t_common_hnxzqh xzqh,gis_cs_sqjw_rela gis where xzqh.dm = gis.kc_code and sspcsdm = '" + logInfo.getPcsdm() + "'";
		}
		//else if(ValidateHelper.isNotEmptyString(logInfo.getCitygajgdm())){
		//	sql = "select distinct gis.gis_area from t_common_hnxzqh xzqh,gis_cs_sqjw_rela gis where xzqh.dm = gis.kc_code and sspcsdm like '" + logInfo.getCitygajgdm().substring(0,6) + "%'";
		//}
		
		if(ValidateHelper.isNotEmptyString(sql)){
			DBUtil dbUtil = new DBUtil();
			String pgis_sqdm = "";
			try {
				dbUtil.executeSelect(CommonConstant.DBNAME_SQJW, sql);
				if(dbUtil.size()>0){
					for(int i=0; i<dbUtil.size();i++){
						if(i<dbUtil.size() -1){
							pgis_sqdm += dbUtil.getString(i, 0) + ",";
						}else{
							pgis_sqdm += dbUtil.getString(i, 0);
						}
					}
					
					logInfo.setPgis_sqdm(pgis_sqdm);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	//获取社区代码
	public void getSqdm(LoginInfo logInfo)
	{
		if(logInfo == null){
			return;
		}
		String sql = "";
		if(ValidateHelper.isNotEmptyString(logInfo.getJwsqdm()))
		{
			sql = "select dm from t_common_hnxzqh where isvalid='1' and ssjwsdm = '" + logInfo.getJwsqdm() + "'";
		}
		
		if(ValidateHelper.isNotEmptyString(sql))
		{
			try 
			{
				DBUtil dbUtil = new DBUtil();
				dbUtil.executeSelect(CommonConstant.DBNAME_SQJW, sql);
				if(dbUtil.size() > 0)
				{
					String jzdm = "";
					for (int i=0; i<dbUtil.size();i++)
					{
						if (i==dbUtil.size() -1)
						{
							jzdm += dbUtil.getString(i, "dm");
						}
						else
						{
							jzdm += dbUtil.getString(i, "dm") + ",";
						}
					}
					logInfo.setJzdm(jzdm);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
