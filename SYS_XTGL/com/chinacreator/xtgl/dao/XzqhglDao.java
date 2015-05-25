package com.chinacreator.xtgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.dzgl.bean.StxxBean;
import com.chinacreator.xtgl.bean.HnXzqhBean;
import com.chinacreator.xtgl.bean.StxxbgBean;
import com.frameworkset.common.poolman.CallableDBUtil;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;

/**
 * 行政区划
 * @author mingchun.xiong
 *
 */
public class XzqhglDao
{
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/xtgl/dao/xzqhgl-sql.xml");
	
	/**
	 * 查询最大乡镇街道代码
	 * @param parent_dm
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public static String queryMaxXzjddmByParentDM(String parent_dm, String type) throws Exception
	{
		// 父代码加上类型
		String parentDmType = parent_dm + type;
		return executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "queryMaxXzjddmByParentDM", parentDmType,parent_dm,parentDmType);
	}
	
	public static String queryMaxXzjddmByParentDm(String parent_dm) throws Exception
	{
		return executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "queryMaxXzjddm", parent_dm,parent_dm);
	}
	
	/**
	 * 查询最大社区代码
	 * @param parent_dm
	 * @return
	 * @throws Exception
	 */
	public static String queryMaxSqdmByParentDm(String parent_dm) throws Exception
	{
		return executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "queryMaxSqdmByParentDm", parent_dm,parent_dm);
	}
	
	/**
	 * 查询湖南行政区划
	 * @param parentdm
	 * @return
	 * @throws Exception
	 */
	public static List<HnXzqhBean> queryHnXzqhChildByParentDm(String parentdm) throws Exception
	{
		parentdm = "0".equals(parentdm) ? "000000000000" : parentdm;
		return executor.queryListWithDBName(HnXzqhBean.class, CommonConstant.DBNAME_SQJW, "queryHnxzqhChildByParentDm", parentdm);
	}
	
	/**
	 * 查询湖南行政区划通过父类代码
	 * @param parentdm
	 * @return
	 * @throws Exception
	 */
	public static List<HnXzqhBean> queryHnXzqhBeanByParentDm(String parentdm) throws Exception
	{
		return executor.queryListWithDBName(HnXzqhBean.class, CommonConstant.DBNAME_SQJW, "queryHnXzqhBeanByParentDm", parentdm);
	}
	
	/**
	 * 查询湖南行政区划对象
	 * @param dm
	 * @return
	 * @throws Exception
	 */
	public static HnXzqhBean queryHnXzqhBeanByDm(String dm) throws Exception
	{
		return executor.queryObjectWithDBName(HnXzqhBean.class, CommonConstant.DBNAME_SQJW, "queryHnXzqhBeanByDm", dm);
	}
	
	/**
	 * 插入湖南行政区划
	 * @param bean 对象bean
	 * @throws Exception
	 */
	public static void insertHnxzqhBean(HnXzqhBean bean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertHnxzqhBean", bean);
	 
	}
	
	/**
	 * 注销行政区划
	 * @param dm
	 * @throws SQLException
	 * @date Dec 30, 2014 9:50:38 AM
	 */
	public static void zxHnxzqhByDm(String dm) throws SQLException
	{
		SQLParams params = new SQLParams();
		params.addSQLParam("dm", dm, SQLParams.STRING);
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zxHnxzqhByDm", params);
	}
	
	/**
	 * 更新湖南行政区划
	 * @param bean
	 * @throws Exception
	 */
	public static void updateHnxzqhBean(HnXzqhBean bean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateHnxzqhBean", bean);
		updateChildxzqhSspcsdm(bean.getSspcsdm(), bean.getDm());
	}
	
	/**
	 * 更新所有父代码下的所属派出所
	 * @param sspcsdm
	 * @param parent_dm
	 * @date 2013-11-4 上午09:57:47
	 */
	public static void updateChildxzqhSspcsdm(String sspcsdm, String parent_dm) throws Exception
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateChildxzqhSspcsdm", sspcsdm, parent_dm);
	}
	
	/**
	 * 注销行政区划
	 * @param dm
	 * @throws Exception
	 */
	public static void zxHnxzqhBean(String dm) throws Exception
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "zxHnxzqhBean", dm);
	}
	
	/**
	 * 查询实体信息
	 * @param stid
	 * @return
	 * @throws Exception
	 * @date Mar 26, 2014 3:06:57 PM
	 */
	public static StxxBean queryStxxBeanByStid(String stid)
	{
		try
		{
			return executor.queryObjectWithDBName(StxxBean.class, CommonConstant.DBNAME_SQJW, "queryStxxBeanStid", stid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 更新实体
	 * @param stid
	 * @param toSqdm
	 * @date Mar 26, 2014 2:30:59 PM
	 */
	public static void updateStxxBeanOfSqdm(String stid, String toSqdm) throws Exception
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateStxxBeanOfSqdm", toSqdm,stid);
	}
	
	/**
	 * 插入实体变更记录
	 * @param stbgBean
	 * @throws Exception
	 * @date Mar 26, 2014 2:52:48 PM
	 */
	public static void insertStbgBean(StxxbgBean stbgBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertStbgBean", stbgBean);
	}
	
	/**
	 * 更新实体变更记录执行状态
	 * @param stid
	 * @param status
	 * @throws Exception
	 * @date Mar 26, 2014 2:55:00 PM
	 */
	public static void updateStbgExecuteStatus(String bhid, String status) throws Exception
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateStbgExecuteStatus", status,bhid);
	}
	
	/**
	 * 执行更新人口，地址，房屋，单位，从业人员等数据
	 * @param stid
	 * @param sqdm
	 * @date Mar 26, 2014 5:10:17 PM
	 */
	public static void updateStglData(String stid, String sqdm) throws Exception
	{
		
		String sql = "{call P_update_data_to_gajg_bystid(?,?)}";
		CallableDBUtil callUtil = new CallableDBUtil();
		callUtil.prepareCallable(CommonConstant.DBNAME_SQJW, sql);
		callUtil.setString(1, stid);
		callUtil.setString(2, sqdm);
		callUtil.executeCallable();
		
	}
}
