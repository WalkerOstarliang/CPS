package com.chinacreator.common.helper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.OrganizationBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.bean.SystemParameterBean;
import com.chinacreator.common.constant.CommonConstant;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.SQLExecutor;

/**
 * 字典缓存初始化工具类
 * @author mingchun.xiong
 *
 */
public class DictionaryCacheHellper
{
	/**
	 * 系统参数缓存
	 */
	private static Map<String, String> parameterMap = new HashMap<String, String>();
	
	/**
	 * 	数据字典
	 */
	private static Map<String, List<SystemDictionaryBean>> dictionaryMap = new HashMap<String,List<SystemDictionaryBean>>();
	
	/**
	 * 组织结构列表
	 */
	private static List<OrganizationBean> orgList = new ArrayList<OrganizationBean>();
	
	/**
	 * 初始化缓存
	 */
	public static void initCache()
	{
		System.out.println(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss") + "-初始化系统缓存" );
		parameterMap.clear();
		dictionaryMap.clear();
		orgList.clear();
		
		initParameter();
		
		initDictionary();
		
		// 初始化湖南行政区划精确到乡镇街道
		initHNXZQHDictionay();
		
		//初始化结构
		initOrganizationList();
		
		//初始化自定义字典
		initDmDictionary();
		
		//初始化重点人员类别
		initZdrylb();
	}
	
	/**
	 * 初始化重点人员类别
	 * 
	 * @date 2013-12-17 上午11:05:03
	 */
	public static void initZdrylb()
	{
		try
		{
			String sql = "select '' as id, zdlb, zdlbmc as zdmc, dm, mc, parent_dm, jc, is_used as isyx, '' sn from t_common_zdrylb ";
			List<SystemDictionaryBean> list = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, sql);
			dictionaryMap.put("GA_ZDRYLBDM", list);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 初始化系统参数
	 */
	public static void initParameter()
	{
		String sql = "select id, prokey, provalue,descr from t_common_parameter";
		try
		{
			List<SystemParameterBean> list = SQLExecutor.queryListWithDBName(SystemParameterBean.class, CommonConstant.DBNAME_SQJW, sql);
			if (ValidateHelper.isNotEmptyCollection(list))
			{
				for (SystemParameterBean paramBean : list)
				{
					parameterMap.put(paramBean.getProKey(), paramBean.getProValue());
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 初始化字典
	 */
	public static void initDictionary()
	{
		try
		{
			//查询字典类别
			String queryzdlbsql = "select distinct zdlb from t_common_dictionary t where isyx='1'";
			DBUtil util = new DBUtil();
			util.executeSelect(CommonConstant.DBNAME_SQJW, queryzdlbsql);
			for (int i=0;i<util.size();i++)
			{
				dictionaryMap.put(util.getString(i, "zdlb"), new ArrayList<SystemDictionaryBean>());
			}
			
			// 初始化字典
			String querysql = "select id, zdlb, zdmc, dm, mc, parent_dm, jc, isyx, sn from t_common_dictionary where isyx='1' order by sn,dm";
			List<SystemDictionaryBean> beanList = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, querysql);
			
			if (ValidateHelper.isNotEmptyCollection(beanList))
			{
				for (SystemDictionaryBean bean : beanList)
				{
					dictionaryMap.get(bean.getZdlb()).add(bean);
				}
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 初始化湖南行政区划
	 */
	public static void initHNXZQHDictionay()
	{
		
		try
		{
			String sql = "select dm as id, 'HN_XZQH' as zdlb,'湖南行政区划' AS zdmc, dm as dm, mc as mc, parent_dm as parent_dm, leve as leve, jc as jc, isvalid as isyx,'' as sn  from t_common_hnxzqh where isvalid='1' order by dm";
			List<SystemDictionaryBean> list = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, sql);
			if (ValidateHelper.isNotEmptyCollection(list))
			{
				dictionaryMap.put(CommonConstant.HN_XZQH, list);
			}
			else
			{
				dictionaryMap.put(CommonConstant.HN_XZQH, new ArrayList<SystemDictionaryBean>());
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 初始化组织机构
	 */
	public static void initOrganizationList()
	{
		try
		{
			String sql = "select orgid, orgcode, orgname, parent_code, orgjc from v_common_organization where isyx='1'";
			orgList = SQLExecutor.queryListWithDBName(OrganizationBean.class, CommonConstant.DBNAME_SQJW, sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取组织结构名称通过代码
	 * @param orgcode
	 * @return
	 */
	public static String getOrganizationOrgNameByCode(String orgcode)
	{
		if (ValidateHelper.isNotEmptyString(orgcode))
		{
			if (ValidateHelper.isNotEmptyString(orgcode) && ValidateHelper.isNotEmptyCollection(orgList))
			{
				for (OrganizationBean bean : orgList)
				{
					if (bean.getOrgcode().equals(orgcode))
					{
						return bean.getOrgname();
					}
				}
			}
		}
		return "";
	}
	
	/**
	 * 获取组织结构名称的简称通过代码
	 * @param orgcode
	 * @return
	 */
	public static String getOrganizationOrgSimpleNameByCode(String orgcode)
	{
		if (ValidateHelper.isNotEmptyString(orgcode))
		{
			if (ValidateHelper.isNotEmptyString(orgcode) && ValidateHelper.isNotEmptyCollection(orgList))
			{
				for (OrganizationBean bean : orgList)
				{
					if (bean.getOrgcode().equals(orgcode))
					{
						return bean.getOrgjc();
					}
				}
			}
		}
		return "";
	}
	
	/**
	 * 获取org对象
	 * @param orgCode
	 * @return
	 */
	public static OrganizationBean getOrganizationBeanByOrgCode(String orgCode)
	{
		if (ValidateHelper.isNotEmptyString(orgCode) && ValidateHelper.isNotEmptyCollection(orgList))
		{
			for (OrganizationBean bean : orgList)
			{
				if (bean.getOrgcode().equals(orgCode))
				{
					return bean;
				}
			}
		}
		return null;
	}
	
	/**
	 * 获取系统参数值
	 * @param proKey
	 * @return
	 */
	public static String getSystemParamenterValueByKey(String proKey)
	{
		return parameterMap.get(proKey);
	}
	
	/**
	 * 获取字典集合
	 * @param zdlb
	 * @return
	 */
	public static List<SystemDictionaryBean> getSystemDictionaryListByZdlb(String zdlb)
	{
		return dictionaryMap.get(zdlb);
	}
	
	public static List<SystemDictionaryBean> getSystemDictionaryListByZdlbAndOnLevel(String zdlb)
	{
		List<SystemDictionaryBean> newlist = new ArrayList<SystemDictionaryBean>();
		List<SystemDictionaryBean> list = dictionaryMap.get(zdlb);
		if (ValidateHelper.isNotEmptyCollection(list))
		{
			for (SystemDictionaryBean bean : list)
			{
				if ("0".equals(bean.getParent_dm()))
				{
					newlist.add(bean);
				}
			}
		}
		return newlist;
	}
	
	/**
	 * 获取字典名称
	 * @param zdlb 字典类别
	 * @param dm 代码
	 * @return
	 */
	public static String getSystemDictionaryValueByZdlbAndDm(String zdlb, String dm)
	{
		List<SystemDictionaryBean> list = dictionaryMap.get(zdlb);
		if (ValidateHelper.isNotEmptyCollection(list))
		{
			for (SystemDictionaryBean bean : list)
			{
				if (bean.getDm().equalsIgnoreCase(dm))
				{
					return bean.getMc();
				}
			}
		}
		return "";
	}
	
	
	/**
	 * 通过父代码获取子节点数据
	 * @param zdlb
	 * @param parentDm
	 * @return
	 */
	public static List<SystemDictionaryBean> getSystemDictionaryBeanListByParentDm(String zdlb, String parentDm)
	{
		List<SystemDictionaryBean> list = dictionaryMap.get(zdlb);
		List<SystemDictionaryBean> resultList = new ArrayList<SystemDictionaryBean>();
		if (ValidateHelper.isNotEmptyCollection(list))
		{
			for (SystemDictionaryBean bean : list)
			{
				if (parentDm.equals(bean.getParent_dm()))
				{
					resultList.add(bean);
				}
			}
		}
		return resultList;
	}
	
	/**
	 * 通过级别获取字典数据
	 * @param zdlb 字典类别
	 * @param leve 级别层级
	 * @return
	 * @date 2013-8-7 下午04:02:46
	 */
	public static List<SystemDictionaryBean> getSystemDictionaryBeanListByLevel(String zdlb, String leve)
	{
		List<SystemDictionaryBean> list = dictionaryMap.get(zdlb);
		List<SystemDictionaryBean> resultList = new ArrayList<SystemDictionaryBean>();
		if (ValidateHelper.isNotEmptyCollection(list))
		{
			for (SystemDictionaryBean bean : list)
			{
				if (leve.equals(bean.getLeve()))
				{
					resultList.add(bean);
				}
			}
		}
		return resultList;
	}
	
	
	/**
	 * 初始化自定义字典
	 */
	public static void initDmDictionary()
	{
		try
		{
			//查询字典类别
			String queryzdlbsql = "select distinct zdlb from t_common_dm_dictionary t where isyx='1'";
			DBUtil util = new DBUtil();
			util.executeSelect(CommonConstant.DBNAME_SQJW, queryzdlbsql);
			for (int i=0;i<util.size();i++)
			{
				dictionaryMap.put(util.getString(i, "zdlb"), new ArrayList<SystemDictionaryBean>());
			}
			
			// 初始化字典
			String querysql = "select id, zdlb, zdmc, dm, mc, parent_dm, jc, isyx, sn from t_common_dm_dictionary where isyx='1' order by sn,dm";
			List<SystemDictionaryBean> beanList = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, querysql);
			
			if (ValidateHelper.isNotEmptyCollection(beanList))
			{
				for (SystemDictionaryBean bean : beanList)
				{
					dictionaryMap.get(bean.getZdlb()).add(bean);
				}
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询市级公安机构机构代码
	 * @param rootOrgcode
	 * @return
	 * @date 2013-10-24 上午09:13:15
	 */
	public static List<SystemDictionaryBean> queryCityGajgjgdws(String parentcode)
	{
		List<SystemDictionaryBean> list = null;
		try
		{
			String sql = "select orgid as id,orgcode as dm,orgname as mc ,parent_code as parent_dm,orgjc as jc,'2' as leve  " +
					"from v_common_organization t  " +
					"where t.PARENT_CODE=? " +
					"and substr(t.orgcode,5,8)='00000000'" +
					"order by t.orgcode";
			list = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, sql,parentcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询县区公安机关机构代码 以及机场派出所
	 * @param rootorgcode 省级机构代码 430000000000
	 * @return
	 * @date 2013-10-24 上午09:13:30
	 */
	public static List<SystemDictionaryBean> queryCountryGajgjgdws(String parentcode)
	{
		List<SystemDictionaryBean> list = null;
		try
		{
			String sql = "select orgid as id,orgcode as dm,orgname as mc ,parent_code as parent_dm,orgjc as jc,'3' as leve  " +
					"from v_common_organization t  " +
					"where (t.PARENT_CODE=? " +
					"and substr(t.orgcode,7,6)='000000' " +
					" and substr(t.orgcode,5,2)<>'97') " +
					"order by t.orgcode";
			list = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, sql, parentcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询派出所通过县区公安机关机构代码
	 * @param parentcode 市级机构代码
	 * @return
	 * @date 2013-10-24 上午09:17:17
	 */
	public static List<SystemDictionaryBean> queryPcsGajgjgdws(String parentcode)
	{
		List<SystemDictionaryBean> list = null;
		try
		{
			String sql = "select orgid as id,orgcode as dm,orgname as mc ,parent_code as parent_dm,orgjc as jc,'4' as leve  " +
					"from v_common_organization t  " +
					"where t.PARENT_CODE=? " +
					"and substr(t.orgcode,9,4)='0000'  " +
					"and ispcs='1' " +
					"and isyx='1' " +
					"order by t.orgcode";
			list = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, sql, parentcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询可访问派出所通过县区公安机关机构代码
	 * @param parentcode 市级机构代码
	 * @return
	 * @date 2013-10-24 上午09:17:17
	 */
	public static List<SystemDictionaryBean> queryKfwPcsGajgjgdws(String parentcode)
	{
		List<SystemDictionaryBean> list = null;
		try
		{
			LoginInfo login = ActionContextHelper.getLoginInfo();
			String userId = login.getUserid();
			
			String sql = "select orgid as id,orgcode as dm,orgname as mc ,parent_code as parent_dm,orgjc as jc,'4' as leve  " +
					"from v_common_organization t  " +
					"where t.PARENT_CODE=? " +
					"and substr(t.orgcode,9,4)='0000'  " +
					"and ispcs='1' " +
					"and isyx='1' " +
					" and orgid in (select org_id from cs_jz_ptgl.v_tb_res_org_user_write where user_id = '" + userId + "' ) " +
					"order by t.orgcode";
			list = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, sql, parentcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询派出所警务室
	 * @param parentcode 派出所代码
	 * @return
	 * @date 2013-10-24 上午09:16:54
	 */
	public static List<SystemDictionaryBean> queryJwsGajgjgdws(String parentcode)
	{
		List<SystemDictionaryBean> list = null;
		try
		{
			String sql = "select orgid as id,orgcode as dm,orgname as mc ,parent_code as parent_dm,orgjc as jc,'5' as leve  " +
					"from v_common_organization t  " +
					" where t.PARENT_CODE=substr(?,1,8)||'3100' " +
					"order by t.orgcode";
			list = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, sql, parentcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 获取字典
	 * @param zdlb 字典类别
	 * @param dm 代码
	 * @return
	 */
	public static SystemDictionaryBean getSystemDictionaryBeanByZdlbAndDm(String zdlb, String dm)
	{
		List<SystemDictionaryBean> list = dictionaryMap.get(zdlb);
		if (ValidateHelper.isNotEmptyCollection(list))
		{
			for (SystemDictionaryBean bean : list)
			{
				if (bean.getDm().equalsIgnoreCase(dm))
				{
					return bean;
				}
			}
		}
		return null;
	}
	
	/**
	 * 根据行政区划代码获取区划名称 (湖南)
	 * @param qhdm
	 * @return
	 */
	public static String getXzqhmcByQhdm(String qhdm){
		String qhmc = "";
		if(ValidateHelper.isNotEmptyString(qhdm)){
			List<SystemDictionaryBean> list = dictionaryMap.get("GB_XZQH");
			for(SystemDictionaryBean bean : list){
				if(bean.getDm().equals(qhdm)){
					qhmc = bean.getMc();
					break;
				}
			}
		}
		return qhmc;
	} 
	
	
	
	/**
	 * 查询派出所通过县区公安机关机构代码
	 * 流口协管员专用
	 * 需要把派出所和人境大队都查出来
	 * @param parentcode 市级机构代码
	 * @return
	 * @date 2013-10-24 上午09:17:17
	 */
	public static List<SystemDictionaryBean> queryPcsGajgjgdwsForLkXgy(String parentcode)
	{
		List<SystemDictionaryBean> list = null;
		try
		{
			String sql = "select orgid as id,orgcode as dm,orgname as mc ,parent_code as parent_dm,orgjc as jc,'4' as leve  " +
					"from v_common_organization t  " +
					"where t.PARENT_CODE=? " +
					"and substr(t.orgcode,9,4)='0000'  " +
					"and (ispcs='1'  or  substr(t.orgcode,7,2)='06') " +
					"and isyx='1' " +
					"order by t.orgcode";
			list = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, sql, parentcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 根据警务室代码获取社区
	 * @param jwsdm
	 * @return
	 */
	public static List<SystemDictionaryBean> getSqcByJwsdm(String jwsdm){
		List<SystemDictionaryBean> list = new ArrayList<SystemDictionaryBean>();
		try{
			String sql = "select dm as id, 'HN_XZQH' as zdlb,'湖南行政区划' AS zdmc, dm as dm, mc as mc, parent_dm as parent_dm, leve as leve, jc as jc, isvalid as isyx,'' as sn  " +
						"from t_common_hnxzqh t  " +
						" where t.ssjwsdm=? " +
						" and isvalid='1' " +
						" order by dm";
			list = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, sql, jwsdm);
		}catch(Exception e){
			list = null;
			e.printStackTrace();
		}
		return list;
	}
	
	/*public static List<SystemDictionaryBean> queryOtherOrgSelect(String qleve)
	{
		List<SystemDictionaryBean> list = new ArrayList<SystemDictionaryBean>();
		try{
			String sql = "select orgid as id,orgcode as dm,orgname as mc ,parent_code as parent_dm,orgname as jc,qleve as leve  " +
						 " from t_common_dataorg t " +
						 " where qleve=? ";
			list = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, sql, qleve);
		}catch(Exception e){
			list = null;
			e.printStackTrace();
		}
		return list;
	}*/
	/**
	 * 获取机构代码通过机构名称
	 * @param orgName
	 * @return orgCode
	 */
	public static String getOrgCode(String orgName){
		if (ValidateHelper.isNotEmptyString(orgName)
				&& ValidateHelper.isNotEmptyCollection(orgList)) {
			String orgjc = orgName.substring(orgName.lastIndexOf('-') + 1,
					orgName.length() - 1);
			if (orgjc.equals(PropertiesUtil.getValue("changsha"))) {
				orgjc = orgName.substring(orgName.lastIndexOf('-') + 1, orgName
						.length());
			}
			for (OrganizationBean bean : orgList) {
				String orgCode = bean.getOrgcode();
				if (bean.getOrgname().contains(orgjc)
						&& orgCode.subSequence(orgCode.length() - 6,
								orgCode.length()).equals("000000")) {
					return bean.getOrgcode();
				}
			}
		}
		//返回市局机构代码
		return PropertiesUtil.getValue("cssjdm");
	} 
	
	/**
	 * 根据父代码获取机构
	 * @param parent_dm
	 * @return
	 */
	public static List<OrganizationBean> getOrgListByParentDm(String parent_dm){
		int leve = CommonDBBaseHelper.getOrgLeve(parent_dm);
		List<OrganizationBean> orgList = new ArrayList<OrganizationBean>();
		String sql = "select orgcode, orgname, parent_code,orgjc ,leve  from v_common_organization " 
					+ " where parent_code = ?";
		if(leve == 3){
			sql += " and ispcs = '1'";
		}else if(leve == 2 ){
			sql += " and orgcode like '%000000'";
		}
		sql += " order by orgcode ";
		try {
			orgList = SQLExecutor.queryListWithDBName(OrganizationBean.class, CommonConstant.DBNAME_SQJW, sql, parent_dm);
		} catch (SQLException e) {
			orgList = null;
			e.printStackTrace();
		}
		return orgList;
	}
	
	/**
	 * 根据附代码获取机构
	 * @param parent_dm
	 * @return
	 */
	public static List<SystemDictionaryBean> getDicListByParentDm(String parent_dm){
		int leve = CommonDBBaseHelper.getOrgLeve(parent_dm);
		List<SystemDictionaryBean> orgList = new ArrayList<SystemDictionaryBean>();
		String sql = "select orgcode as id, orgcode as dm, orgname as mc,orgjc as jc , parent_code as parent_dm, leve from v_common_organization " 
					+ " where parent_code = ?";
		if(leve == 3){
			sql += " and ispcs = '1'";
		}else if(leve == 2 ){
			sql += " and orgcode like '%000000'";
		}
		sql += " order by orgcode ";
		try {
			orgList = SQLExecutor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, sql, parent_dm);
		} catch (SQLException e) {
			orgList = null;
			e.printStackTrace();
		}
		return orgList;
	}
	
	
	/**
	 * 根据社区代码查询警务区
	 * @param sqdm
	 * @return
	 */
	public static OrganizationBean queryJwqBySqdm(String sqdm){
		OrganizationBean jwq = null;
		String sql = "select orgcode, orgname, parent_code,orgjc ,leve from v_common_organization where orgcode = (select ssjwsdm from t_common_hnxzqh where dm = ?)";
		try {
			jwq = SQLExecutor.queryObjectWithDBName(OrganizationBean.class, CommonConstant.DBNAME_SQJW, sql, sqdm);
		} catch (SQLException e) {
			e.printStackTrace();
			jwq = null;
		}
		return jwq;
	}
}
