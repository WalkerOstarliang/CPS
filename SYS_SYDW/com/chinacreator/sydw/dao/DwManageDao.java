package com.chinacreator.sydw.dao;

import java.sql.SQLException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.sydw.bean.DwGlbmHsBean;
import com.chinacreator.sydw.query.DwglQueryBean;
import com.chinacreator.zagl.bean.DwfwglBean;
import com.chinacreator.zagl.bean.DwjbxxBean;
import com.chinacreator.zagl.bean.DwjbxxExistsBean;
import com.chinacreator.zagl.bean.GgcsBean;
import com.chinacreator.zagl.bean.NbdwBean;
import com.chinacreator.zagl.bean.SwdwBean;
import com.chinacreator.zagl.bean.SwfwcsBean;
import com.chinacreator.zagl.bean.ThksyBean;
import com.chinacreator.zagl.bean.ThlgyBean;
import com.chinacreator.zagl.bean.TzhyBean;
import com.chinacreator.zagl.bean.WxwpdwBean;
import com.chinacreator.zagl.query.DwQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

/**
 * 单位管理
 * 
 * @filename DwManageDao.java
 * @author mingchun.xiong
 * @date Jun 27, 2014
 *
 */
public class DwManageDao
{
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/sydw/dao/dwgl-sql.xml");
	
	public PageResultInfo<DwjbxxBean> queryDwDjCheckBeansPageResult(DwglQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		queryBean.setOrgcode(loginInfo.getOrgcode());
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW, "queryDwBeansPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询房屋基本信息
	 * @param fwid
	 * @return
	 * @throws Exception
	 * @date Jun 30, 2014 4:05:29 PM
	 */
	public FwJbxxBean queryFwJbxxBeanByFwid(String fwid) throws Exception
	{
		return executor.queryObjectWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwJbxxBeanByFwid", fwid);
	}
	
	/**
	 * 查询单位基本信息
	 * @param dwJbxxBean
	 * @throws Exception
	 * @date Jun 30, 2014 4:05:16 PM
	 */
	public void insertDwJbxxBean(DwjbxxBean dwJbxxBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwJbxxBean", dwJbxxBean);
	}
	
	/**
	 * 更新单位基本信息
	 * @param dwJbxxBean
	 * @throws Exception
	 * @date Jun 30, 2014 4:05:04 PM
	 */
	public void updateDwJbxxBean(DwjbxxBean dwJbxxBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwJbxxBean", dwJbxxBean);
	}
	
	/**
	 * 插入特种行业
	 * @param tzhyBean
	 * @throws Exception
	 * @date Jul 1, 2014 9:50:59 AM
	 */
	public void insertTzhyBean(TzhyBean tzhyBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertTzhyBean", tzhyBean);
	}
	
	/**
	 * 
	 * @param tzhyBean
	 * @throws Exception
	 * @date Jul 1, 2014 3:36:42 PM
	 */
	public void updateTzhyBean(TzhyBean tzhyBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateTzhyBean", tzhyBean);
		
	}
	
	public void updateTzhylbField(TzhyBean tzhyBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateTzhylbField", tzhyBean);
	}
	
	/**
	 * 插入特行旅馆
	 * @param thlgBean
	 * @throws Exception
	 * @date Jul 1, 2014 9:51:12 AM
	 */
	public void insertTzhyTgxxBean(ThlgyBean thlgBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertTzhyTgxxBean", thlgBean);
	}
	
	/**
	 * 更新特行旅馆信息
	 * @param thlgBean
	 * @throws Exception
	 * @date Jul 1, 2014 3:46:37 PM
	 */
	public void updateTzhylgxxBean(ThlgyBean thlgBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateTzhylgxxBean", thlgBean);
	}
	
	/**
	 * 插入特行开锁业
	 * @param thksyBean
	 * @throws Exception
	 * @date Jul 1, 2014 9:51:26 AM
	 */
	public void insertThksyBean(ThksyBean thksyBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertThksyBean", thksyBean);
	}
	
	/**
	 * 更新特行开锁业
	 * @param thksyBean
	 * @throws Exception
	 * @date Jul 1, 2014 4:00:04 PM
	 */
	public void updateThksyBean(ThksyBean thksyBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateThksyBean", thksyBean);
	}
	
	
	/**
	 * 插入公共场所
	 * @param ggcsBean
	 * @throws Exception
	 * @date Jul 1, 2014 11:09:06 AM
	 */
	public void insertGgcsBean(GgcsBean ggcsBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertGgcsBean", ggcsBean);
	}
	
	/**
	 * 更新公共场所对象
	 * @param ggcsBean
	 * @throws Exception
	 * @date Jul 1, 2014 4:14:42 PM
	 */
	public void updateGgcsBean(GgcsBean ggcsBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateGgcsBean", ggcsBean);
	}
	
	/**
	 * 更新公共场所类别字段
	 * @param ggcsBean
	 * @throws Exception
	 * @date Jul 1, 2014 8:02:19 PM
	 */
	public void updateGgcsCslbField(GgcsBean ggcsBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateGgcsCslbField", ggcsBean);
	}
	
	/**
	 * 插入内保单位对象
	 * @param nbdwBean
	 * @throws Exception
	 * @date Jul 1, 2014 6:46:37 PM
	 */
	public void insertNbdwBean(NbdwBean nbdwBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertNbdwBean", nbdwBean);
	}
	
	/**
	 * 更新内部单位对象
	 * @param nbdwBean
	 * @throws Exception
	 * @date Jul 1, 2014 6:47:33 PM
	 */
	public void updateNbdwBean(NbdwBean nbdwBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateNbdwBean", nbdwBean);
	}
	
	public void updateNbdwxlField(NbdwBean nbdwBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateNbdwxlField", nbdwBean);
	}
	
	/**
	 * 插入危险品单位
	 * @param wxpdwBean
	 * @throws Exception
	 * @date Jul 1, 2014 7:01:25 PM
	 */
	public void insertWxwpdwBean(WxwpdwBean wxpdwBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWxwpdwBean", wxpdwBean);
	}
	
	/**
	 * 更新危险物品单位
	 * @param wxpdwBean
	 * @throws Exception
	 * @date Jul 1, 2014 7:02:50 PM
	 */
	public void updateWxwpdwBean(WxwpdwBean wxpdwBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWxwpdwBean", wxpdwBean);
	}
	
	
	public void updateWxwpdwglField(WxwpdwBean wxpdwBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWxwpdwglField", wxpdwBean);
	}
	/**
	 * 插入上网服务场所
	 * @param swfwcsBean
	 * @throws Exception
	 * @date Jul 1, 2014 7:06:44 PM
	 */
	public void insertSwfwcsBean(SwfwcsBean swfwcsBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSwfwcsBean", swfwcsBean);
	}
	
	/**
	 * 更新上网服务场所
	 * @param swfwcsBean
	 * @throws Exception
	 * @date Jul 1, 2014 7:08:09 PM
	 */
	public void updateSwfwcsBean(SwfwcsBean swfwcsBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSwfwcsBean", swfwcsBean);
	}
	
	public void updateSwfwcsField(SwfwcsBean swfwcsBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSwfwcsField", swfwcsBean);
	}
	
	/**
	 * 插入涉外单位
	 * @param swdwBean
	 * @throws Exception
	 * @date Jul 1, 2014 7:13:10 PM
	 */
	public void insertSwdwBean(SwdwBean swdwBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSwdwBean", swdwBean);
	}
	
	/**
	 * 更新涉外单位
	 * @param swdwBean
	 * @throws Exception
	 * @date Jul 1, 2014 7:14:16 PM
	 */
	public void updateSwdwBean(SwdwBean swdwBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSwdwBean", swdwBean);
	}
	
	/**
	 * 删除特种行业通过机构编号
	 * @param jgbh
	 * @throws Exception
	 * @date Jul 1, 2014 9:51:40 AM
	 */
	public void deleteTzhyBeanByJgbh(String jgbh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteTzhyBeanByJgbh", jgbh);
	}
	
	/**
	 * 删除特种行业旅馆信息
	 * @param jgbh
	 * @throws Exception
	 * @date Jul 1, 2014 9:52:00 AM
	 */
	public void deleteTzhyTgxxBeanByJgbh(String jgbh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteTzhyTgxxBeanByJgbh", jgbh);
	}
	
	/**
	 * 删除特种行业开锁业
	 * @param jgbh
	 * @throws Exception
	 * @date Jul 1, 2014 9:52:25 AM
	 */
	public void deleteThksyBeanByJgbh(String jgbh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteThksyBeanByJgbh", jgbh);
	}
	
	/**
	 * 删除公共场所
	 * @param jgbh
	 * @throws Exception
	 * @date Jul 1, 2014 11:10:07 AM
	 */
	public void deleteGgcsBeanByJgbh(String jgbh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteGgcsBeanByJgbh", jgbh);
	}
	
	/**
	 * 删除内保单位
	 * @param jgbh
	 * @throws Exception
	 * @date Jul 1, 2014 11:33:54 AM
	 */
	public void deleteNbdwBeanByJgbh(String jgbh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteNbdwBeanByJgbh", jgbh);
	}
	
	/**
	 * 删除危险品单位
	 * @param jgbh
	 * @throws Exception
	 * @date Jul 1, 2014 11:34:11 AM
	 */
	public void deleteWxpdwBeanByJgbh(String jgbh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteWxpdwBeanByJgbh", jgbh);
	}
	
	/**
	 * 删除涉外单位
	 * @param jgbh
	 * @throws Exception
	 * @date Jul 1, 2014 11:34:21 AM
	 */
	public void deleteSwdwBeanByJgbh(String jgbh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteSwdwBeanByJgbh", jgbh);
	}
	
	public void deleteSwfwcsBeanByJgbh(String jgbh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteSwfwcsBeanByJgbh", jgbh);
	}
	
	/**
	 * 查询单位基本信息
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date Jul 1, 2014 9:23:23 PM
	 */
	public DwjbxxBean queryDwJbxxBeanByJgbh(DwglQueryBean queryBean) throws Exception
	{
		return executor.queryObjectBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW, "queryDwJbxxBeanByJgbh", queryBean);
	}
	
	/**
	 * 注销单位房屋关联对象
	 * @param jgbh
	 * @throws Exception
	 * @date Jul 2, 2014 9:33:36 AM
	 */
	public void zxDwfwglBean(String jgbh) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		SQLParams params = new SQLParams();
		params.addSQLParam("jgbh", jgbh, SQLParams.STRING);
		params.addSQLParam("zxmjxm", loginInfo.getRealname(), SQLParams.STRING);
		params.addSQLParam("zxdwdm", loginInfo.getOrgcode(), SQLParams.STRING);
		params.addSQLParam("zxdwmc", loginInfo.getOrgname(), SQLParams.STRING);
		params.addSQLParam("zxbs", "1", SQLParams.STRING);
		params.addSQLParam("zxyy", "地址发送变更", SQLParams.STRING);
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zxDwfwglBean", params);
	}
	
	public void insertDwfwglBean(DwfwglBean dwfwglBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwfwglBean", dwfwglBean);
	}
	
	/**
	 * 插入单位管理部门核实记录
	 * @param bean
	 * @throws SQLException
	 */
	public void insertDwglbmHs(DwGlbmHsBean bean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW,  "insertDwglbmHs", bean);
	}
	
	public void updateDwglbmHs(DwGlbmHsBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW,  "updateDwglbmHs", bean);
	}
	
	
	/**
	 * 更新单位管理部门标识
	 * @param bean
	 * @throws SQLException
	 */
	public void updateDwjbxxGlbmBz(DwjbxxBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwjbxxGlbmBz", bean);
	}
	
	/**
	 * 通过单位名称获取单位数量
	 */
	public DwjbxxExistsBean queryDwBeanBeanByXqDwmc(String dwmc)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try
		{
			DwQueryBean query = new DwQueryBean();
			query.setDwmc(dwmc);
			query.setOrgcode(loginInfo.getOrgcode());
			return executor.queryObjectBeanWithDBName(DwjbxxExistsBean.class, CommonConstant.DBNAME_SQJW, "queryDwBeanBeanByXqDwmc", query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public DwGlbmHsBean queryDwhcByJgbhAndHylb(DwQueryBean query) throws SQLException{
		return executor.queryObjectBeanWithDBName(DwGlbmHsBean.class, CommonConstant.DBNAME_SQJW, "queryDwhcByJgbhAndHylb", query);
	}
	
	/**
	 * 根据机构编号查询单位行业类别
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public String queryDwHylbByJgbh(String jgbh) throws SQLException{
		String hylb = "";
		hylb = executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "queryDwHylbByJgbh", jgbh);
		return hylb;
	}
	
	/**
	 * 根据机构编号更新单位行业类别
	 * @param hylb
	 * @param jgbh
	 */
	public void updateDwHylbByJgbh(String hylb,String jgbh) throws SQLException{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateDwHylbByJgbh", hylb,jgbh);
	}
}
