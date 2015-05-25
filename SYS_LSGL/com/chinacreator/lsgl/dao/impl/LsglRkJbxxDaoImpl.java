package com.chinacreator.lsgl.dao.impl;


import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.JwrkxxBean;
import com.chinacreator.lsgl.bean.JzrkxxBean;
import com.chinacreator.lsgl.bean.LdrkYqzxBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.RkJhsyBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.lsgl.bean.RkgxrxxBean;
import com.chinacreator.lsgl.bean.RklxfsxxBean;
import com.chinacreator.lsgl.bean.RktmtzxxBean;
import com.chinacreator.lsgl.bean.RkwlczhkBean;
import com.chinacreator.lsgl.bean.RkxsbxxxBean;
import com.chinacreator.lsgl.bean.RkzpxxBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.dao.LsglRkJbxxDao;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

/**
 * 实有人口操作类
 * 
 * @filename LsglRkJbxxDao.java
 * @author mingchun.xiong
 * @date 2013-8-19
 *
 */
public class LsglRkJbxxDaoImpl implements LsglRkJbxxDao
{
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/lsgl/dao/lsglrkjbxx-sql.xml");
	
	/**
	 * 更新人口基本信息
	 * @param rkBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午10:43:55
	 */
	public RkJbxxBean queryRkJbxxBeanByRybh(String rybh) throws Exception
	{
		RkJbxxBean rkBean = executor.queryObjectWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryRkJbxxBeanByRybh", rybh);
		return rkBean;
	}
	
	/**
	 * 查询常驻人口信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午10:39:17
	 */
	public PageResultInfo<CzrkxxBean> queryCzrkxxPageResult(PageInfo pageInfo,
			RkQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrkxxPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询境外人口信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-20 下午05:05:21
	 */
	public PageResultInfo<JwrkxxBean> queryJwrkPageResult(PageInfo pageInfo,
			RkQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(JwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJwrkPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 查询寄住人口信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-20 下午05:05:21
	 */
	public PageResultInfo<JzrkxxBean> queryJzrkPageResult(PageInfo pageInfo,
			RkQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(JzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzrkPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 查询流动人口类别
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-20 下午05:05:21
	 */
	public PageResultInfo<LdrkxxBean> queryLdrkxxPageResult(PageInfo pageInfo,
			RkQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkxxPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 通过人员编号查询常驻人口
	 * @param czrkid
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:26:01
	 */
	public CzrkxxBean queryCzrkBeanByCzrkid(String czrkid) throws Exception
	{
		return executor.queryObjectWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrkBeanByCzrkid", czrkid);
	}

	/**
	 * 通过人员编号查询常住人口信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 下午02:39:26
	 */
	public List<CzrkxxBean> queryCzrkBeansByRybh(String rybh) throws Exception
	{
		return executor.queryListWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrkBeanByRybh", rybh);
	}
	
	/**
	 * 通过人员编号查询流动人口信息
	 * @param jzbh 寄住编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:28:46
	 */
	public JzrkxxBean queryJzrkBeanByJzrkid(String jzbh) throws Exception
	{
		return executor.queryObjectWithDBName(JzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzrkBeanByJzrkid", jzbh);
	}

	/**
	 * 通过人员编号查询流动人口信息
	 * @param zzbh 暂住编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:28:46
	 */
	public LdrkxxBean queryLdrkBeanByLdrkid(String zzbh) throws Exception
	{
		return executor.queryObjectWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkBeanByLdrkid", zzbh);
	}

	/**
	 * 通过人员编号查关系人表
	 * @param rybh 人员编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:38:51
	 */
	public List<RkgxrxxBean> queryRkgxrBeansByRybh(String rybh)
			throws Exception
	{
		return executor.queryListWithDBName(RkgxrxxBean.class, CommonConstant.DBNAME_SQJW, "queryRkgxrBeansByRybh", rybh);
	}

	public List<RklxfsxxBean> queryRklxfsBeansByRybh(String rybh) throws Exception
	{
		return executor.queryListWithDBName(RklxfsxxBean.class, CommonConstant.DBNAME_SQJW, "queryRklxfsBeansByRybh", rybh);
	}

	public RktmtzxxBean queryRktmtzBeanByRybh(String rybh) throws Exception
	{
		return executor.queryObjectWithDBName(RktmtzxxBean.class, CommonConstant.DBNAME_SQJW, "queryRktmtzBeanByRybh", rybh);
	}

	public RkxsbxxxBean queryRkxsbxBeanByRybh(String rybh) throws Exception
	{
		return executor.queryObjectWithDBName(RkxsbxxxBean.class, CommonConstant.DBNAME_SQJW, "queryRkxsbxBeanByRybh", rybh);
	}

	public List<RkzpxxBean> queryRkzpxxBeansByRybh(String rybh)
			throws Exception
	{
		return executor.queryListWithDBName(RkzpxxBean.class, CommonConstant.DBNAME_SQJW, "queryRkzpxxBeansByRybh", rybh);
	}

	/**
	 * 插入人口照片信息
	 */
	public void insertRkzpxx(List<RkzpxxBean> rkzpxxBeans) throws Exception
	{
		if (ValidateHelper.isNotEmptyCollection(rkzpxxBeans))
		{
			
			String sql = executor.getSql("insertRkzpxx");
			
			for (RkzpxxBean zpxxBean : rkzpxxBeans)
			{
				PreparedDBUtil util = new PreparedDBUtil();
				util.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
				if (ValidateHelper.isEmptyString(zpxxBean.getId()))
				{
					String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
					zpxxBean.setId(xzdm+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW,"seq_lsg_zpid"));
				}
				util.setString(1, zpxxBean.getId());
				util.setString(2, zpxxBean.getRybh());
				util.setString(3, zpxxBean.getSfzh());
				if (zpxxBean.getZp() != null)
				{
					util.setBlob(4, zpxxBean.getZp());
				}
				else if (zpxxBean.getZpbytes() != null && zpxxBean.getZpbytes().length > 0)
				{
					util.setBlob(4, zpxxBean.getZpbytes());
				}
				else
				{
					util.setBlob(4, zpxxBean.getZp());
				}
				util.setString(5, zpxxBean.getMs());
				util.setString(6, zpxxBean.getDjrxm());
				util.setString(7, zpxxBean.getDjdwdm());
				util.setString(8, zpxxBean.getDjdwmc());
				util.setString(9, zpxxBean.getYcfwzp());
				util.setString(10, zpxxBean.getRxfw());
				util.setString(11, zpxxBean.getDjrsfzh());
				util.executePrepared();
			}
		}
	}
	
	/**
	 * 插入人口基本信息
	 * @param rkBean
	 * @return 
	 * @throws Exception
	 * @date 2013-8-19 上午10:42:16
	 */
	public RkJbxxBean insertRkJbxxBean(RkJbxxBean rkBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertRkJbxxBean", rkBean);
		return rkBean;
	}
	
	/**
	 * 查询人口基本信息通过人员编号
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午10:44:51
	 */
	public RkJbxxBean updateRkJbxxBean(RkJbxxBean rkBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo != null)
		{
			rkBean.setCzdwdm(loginInfo.getOrgcode());
			rkBean.setCzdwmc(loginInfo.getOrgname());
			rkBean.setCzrjh(loginInfo.getUsername());
			rkBean.setCzrxm(loginInfo.getRealname());
		}
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateRkJbxxBean", rkBean);
		return rkBean;
	}

	/**
	 * 插入常住人口信息
	 * @param czrkBean
	 * @throws Exception
	 * @date 2013-8-23 上午10:54:17
	 */
	public void insertCzrkxxBean(CzrkxxBean czrkBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertCzrkxxBean", czrkBean);
	}
	
	/**
	 * 更新常住人口信息
	 * @param czrkBean
	 * @throws Exception
	 * @date 2013-8-23 上午10:55:17
	 */
	public void updateCzrkxxBean(CzrkxxBean czrkBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCzrkxxBean", czrkBean);
	}
	

	public List<JzrkxxBean> queryJzrkJzxxByRybh(String rybh) throws Exception
	{
		return executor.queryListWithDBName(JzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzrkJzxxByRybh", rybh);
	}

	public List<LdrkxxBean> queryLdrkZzxxByRybh(String rybh) throws Exception
	{
		return executor.queryListWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkZzxxByRybh", rybh);
	}

	public List<JwrkxxBean> queryJwrkJzxxByRybh(String rybh) throws Exception
	{
		return executor.queryListWithDBName(JwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJwrkJzxxByRybh", rybh);
	}

	/**
	 * 插入房屋人口关联对象
	 * @param rybh
	 * @param fwid
	 * @param dzid
	 * @throws Exception
	 * @date 2013-8-23 下午08:20:32
	 */
	public void insertFwRkGlBean(RkfwglBean fwrkglBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertFwRkGlBean", fwrkglBean);
	}
	
	/**
	 * 更新房屋人口管理
	 * @param fwrkglBean
	 * @throws Exception
	 * @date 2013-8-24 下午04:18:37
	 */
	public void updateFwrkGlBean(RkfwglBean fwrkglBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "updateFwrkGlBean", fwrkglBean);
	}
	
	/**
	 * 通过人员编号找房屋信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午01:38:31
	 */
	public List<FwJbxxBean> queryFwJbxxBeanByRybh(String rybh) throws Exception
	{
		return executor.queryListWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwJbxxBeanByRybh", rybh);
	}

	/**
	 * 查询房屋人口关联表
	 * @param fwrkglid
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午04:28:28
	 */
	public RkfwglBean queryFwRkGlBeanByFwrkglid(String fwrkglid)
			throws Exception
	{
		return executor.queryObjectWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "queryFwRkGlBeanByFwrkglid", fwrkglid);
	}

	/**
	 * 获取人口照片信息
	 * @param zpid
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午04:44:29
	 */
	public Blob getRkzpBlob(String zpid) throws Exception
	{
		String sql = " select zp from t_lsgl_rk_zpxx where id='" + zpid + "'";
		DBUtil util = new DBUtil();
		util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
		Blob blob = util.getBlob(0, "zp");
		return blob;
	}
	
	/**
	 * 未落常驻户口列表查询
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-29 上午08:49:49
	 */
	public PageResultInfo<RkwlczhkBean> queryWlczhkPageResult(
			PageInfo pageInfo, RkQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(RkwlczhkBean.class, CommonConstant.DBNAME_SQJW, "queryWlczhkPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询未落户常住人口信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-8-29 上午09:31:22
	 */
	public List<RkwlczhkBean> queryWlhczrkByRybh(String rybh) throws Exception
	{
		return executor.queryListWithDBName(RkwlczhkBean.class, CommonConstant.DBNAME_SQJW, "queryWlhczrkByRybh", rybh);
	}
	
	/** 通过未落户编号查询未落户人口信息
	 * @param wlhbh
	 * @return
	 * @throws Exception
	 * @date 2013-8-29 上午09:35:19
	 */
	public RkwlczhkBean queryWlhczrkBeanByWlhrkid(String wlhbh)
			throws Exception
	{
		return executor.queryObjectWithDBName(RkwlczhkBean.class, CommonConstant.DBNAME_SQJW, "queryWlhczrkBeanByWlhrkid", wlhbh);
	}

	/**
	 * 通过境外编号查询境外人口信息
	 * @param jwbh 境外人口记录编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-29 上午09:55:16
	 */
	public JwrkxxBean queryJwrkBeanByJwrkid(String jwbh) throws Exception
	{
		return executor.queryObjectWithDBName(JwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJwrkBeanByJwrkid", jwbh);
	}

	/**
	 * 删除人口照片
	 * @param zpid
	 * @throws Exception
	 * @date 2013-8-30 下午03:15:15
	 */
	public void deleteRkzpImage(String zpid) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteRkzpImage", zpid);
	}

	/**
	 * 插入社会关系人
	 * @param gxrBean
	 * @throws Exception
	 * @date 2013-8-30 下午04:49:24
	 */
	public void insertRkgxrxxBean(RkgxrxxBean gxrBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertRkgxrxxBean", gxrBean);
	}

	/**
	 * 更新人口关系人信息
	 * @param gxrBean
	 * @throws Exception
	 * @date 2013-8-30 下午04:50:07
	 */
	public void updateRkgxrxxBean(RkgxrxxBean gxrBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateRkgxrxxBean", gxrBean);
	}

	/**
	 * 插入体貌特征信息
	 * @param tmtzBean
	 * @throws Exception
	 * @date 2013-8-31 下午03:26:02
	 */
	public void insertTmtzxxBean(RktmtzxxBean tmtzBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertTmtzxxBean", tmtzBean);
	}

	/**
	 * 更新体貌特征信息
	 * @param tmtzBean
	 * @throws Exception
	 * @date 2013-8-31 下午03:26:49
	 */
	public void updateTmtzxxBean(RktmtzxxBean tmtzBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateTmtzxxBean", tmtzBean);
	}

	/**
	 * 插入联系方式信息
	 * @param lxfsBean
	 * @throws Exception
	 * @date 2013-8-31 下午05:02:47
	 */
	public void insertLxfsxxBean(RklxfsxxBean lxfsBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertLxfsxxBean", lxfsBean);
	}
	
	/**
	 * 更新联系方式信息
	 * @param lxfsBean
	 * @throws Exception
	 * @date 2013-8-31 下午05:03:33
	 */
	public void updateLxfsxxBean(RklxfsxxBean lxfsBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateLxfsxxBean", lxfsBean);
	}

	/**
	 * 插入流动人口信息bean
	 * @param ldrkBean
	 * @throws Exception
	 * @date 2013-9-2 上午10:05:09
	 */
	public void insertLdrkxxBean(LdrkxxBean ldrkBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertLdrkxxBean", ldrkBean);
	}

	/**
	 * 更新流动人口信息
	 * @param ldrkBean
	 * @throws Exception
	 * @date 2013-8-19 上午11:28:50
	 */
	public void updateLdrkxxBean(LdrkxxBean ldrkBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateLdrkxxBean", ldrkBean);
	}

	/**
	 * 插入寄住人口对象
	 * @param jzrkBean
	 * @throws Exception
	 * @date 2013-9-3 下午02:12:12
	 */
	public void insertJzrkBean(JzrkxxBean jzrkBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertJzrkBean", jzrkBean);
	}
	
	/**
	 * 更新居住人口
	 * @param jzrkBean
	 * @throws Exception
	 * @date 2013-9-3 下午02:12:53
	 */
	public void updateJzrkBean(JzrkxxBean jzrkBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJzrkBean", jzrkBean);
	}

	/**
	 * 插入未落户人口信息
	 * @param wlrlBean
	 * @throws Exception
	 * @date 2013-9-4 上午09:35:56
	 */
	public void insertWlhrkBean(RkwlczhkBean wlrlBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWlhrkBean", wlrlBean);
	}
	
	/**
	 * 更新未落户人口信息
	 * @param wlrlBean
	 * @throws Exception
	 * @date 2013-9-4 上午09:36:09
	 */
	public void updateWlhrkBean(RkwlczhkBean wlrlBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWlhrkBean", wlrlBean);
	}

	/**
	 * 插入境外人口信息对象
	 * @param jwrkBean
	 * @throws Exception
	 * @date 2013-9-4 下午06:25:41
	 */
	public void insertJwrkxxBean(JwrkxxBean jwrkBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertJwrkxxBean", jwrkBean);
	}

	/**
	 * 更新境外人口信息对象
	 * @param jwrkBean
	 * @throws Exception
	 * @date 2013-9-4 下午06:26:14
	 */
	public void updateJwrkxxBean(JwrkxxBean jwrkBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJwrkxxBean", jwrkBean);
	}

	/**
	 * 注销房屋人口关联
	 * @param fwrkglBean
	 * @throws Exception
	 * @date 2013-9-11 下午05:02:54
	 */
	public void zxFwrkGlBean(RkfwglBean fwrkglBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zxFwrkGlBean", fwrkglBean);
	}

	/**
	 * 获取人口的房屋
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-11 下午05:25:06
	 */
	public RkfwglBean getRkfwBean(String rybh) throws Exception
	{
		return executor.queryObjectWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "getRkfwBean", rybh);
	}

	/**
	 * 查询人口基本信息通过身份证号
	 * @param sfzh
	 * @return
	 * @throws Exception
	 * @date 2013-9-17 下午03:43:48
	 */
	public RkJbxxBean queryRkJbxxBeanBySfzh(String sfzh) throws Exception
	{
		return executor.queryObjectWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryRkJbxxBeanBySfzh", sfzh);
	}

	/**
	 * 通过国籍证件号码，证件种类查询境外人口
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-9-17 下午07:24:59
	 */
	public RkJbxxBean queryRkJbxxBeanByGjAndZjzlAndZjhm(RkQueryBean queryBean)
			throws Exception
	{
		return executor.queryObjectBeanWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryRkJbxxBeanByGjAndZjzlAndZjhm", queryBean);
	}

	/**
	 * 注销人口房屋管理记录
	 * @param rkfwglid
	 * @throws Exception
	 * @date 2013-9-22 下午02:08:58
	 */
	public void zxRkfwBean(String rkfwglid) throws Exception
	{
		LoginInfo login = ActionContextHelper.getLoginInfo();

		RkfwglBean rkfw = new RkfwglBean();
		rkfw.setRkfwglid(rkfwglid);
		if (login != null)
		{
			rkfw.setZxdwdm(login.getOrgcode());
			rkfw.setZxdwmc(login.getOrgname());
			rkfw.setZxmjxm(login.getRealname());
		}
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zxRkfwBean", rkfw);
	}

	/**
	 * 查询实有人口通过查询条件
	 * @param queryBean
	 * @throws Exception
	 * @date 2013-9-23 上午09:48:28
	 */
	public PageResultInfo<RkJbxxBean> querySyrkBeanByConditionForPageResultInfo(RkQueryBean queryBean, PageInfo pageInfo)
			throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "querySyrkBeanByConditionForPageResultInfo", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询当前常驻人口信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-23 下午07:52:41
	 */
	public CzrkxxBean queryDqCzrkxxBeanByRybh(String rybh) throws Exception
	{
		return executor.queryObjectWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrkBeanByRybh", rybh);
	}

	/**
	 * 通过人员编号查询境外人口最近一次记录
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-24 下午04:33:10
	 */
	public JwrkxxBean queryJwrkBeanByRybh(String rybh) throws Exception
	{
		return executor.queryObjectWithDBName(JwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJwrkJzxxByRybh", rybh);
	}

	/**
	 * 通过人员编号查询人员最近寄住信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-24 下午04:59:23
	 */
	public JzrkxxBean queryJzrkBeanByRybh(String rybh) throws Exception
	{
		return executor.queryObjectWithDBName(JzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzrkJzxxByRybh", rybh);
	}

	/**
	 * 查询境外人口信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-20 下午05:05:21
	 */
	public LdrkxxBean queryLdrkBeanByRybh(String rybh) throws Exception
	{
		return executor.queryObjectWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkZzxxByRybh", rybh);
	}

	public LdrkxxBean queryLdrkBeanByRybhAndYxzt(String rybh) throws Exception
	{
		return executor.queryObjectWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkBeanByRybhAndYxzt", rybh);
	}
	
	/**
	 * 未落常驻户口列表查询
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-29 上午08:49:49
	 */
	public RkwlczhkBean queryWlhczrkBeanByRybh(String rybh) throws Exception
	{
		return executor.queryObjectWithDBName(RkwlczhkBean.class, CommonConstant.DBNAME_SQJW, "queryWlhczrkByRybh", rybh);
	}
	
	/*
	 * 通过身份证号查询工作对象信息
	 * 
	 */
	public ZdryGzdxBean queryGzdxBeanBySfzh(String sfzh) throws SQLException {
		return executor.queryObjectWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW,"queryGzdxBySfzh", sfzh);
	}

	/**
	 * 更新人员属性
	 * @param sfzh
	 * @throws Exception
	 * @date 2013-10-16 下午04:43:35
	 */
	public void updateRysxBySfzh(String sfzh,String rysx) throws Exception
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateRysxBySfzh", rysx, sfzh);
	}

	public CzrkxxBean queryCzrkxxBeanBySfzhAndFwid(String sfzh, String fwid)
			throws Exception
	{
		CzrkxxBean bean = executor.queryObjectWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrkxxBeanBySfzhAndFwid", sfzh, fwid);
		return bean;
	}

	public JzrkxxBean queryJzrkxxBeanBySfzhAndFwid(String sfzh, String fwid)
			throws Exception
	{
		JzrkxxBean bean = executor.queryObjectWithDBName(JzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzrkxxBeanBySfzhAndFwid", sfzh, fwid);
		return bean;
	}

	public LdrkxxBean queryLdrkxxBeanBySfzhAndFwid(String sfzh, String fwid)
			throws Exception
	{
		LdrkxxBean bean = executor.queryObjectWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkxxBeanBySfzhAndFwid", sfzh, fwid);
		return bean;
	}

	public RkwlczhkBean queryWlhrkxxBeanBySfzhAndFwid(String sfzh, String fwid)
			throws Exception
	{
		RkwlczhkBean bean = executor.queryObjectWithDBName(RkwlczhkBean.class, CommonConstant.DBNAME_SQJW, "queryWlhrkxxBeanBySfzhAndFwid", sfzh, fwid);
		return bean;
	}

	public void updateFwrkGlDzBean(RkfwglBean fwrkglBean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "updateFwrkGlDzBean", fwrkglBean);
	}
	
	public RkfwglBean queryRkFwGlBySfzh(String sfzh) throws Exception {
		return executor.queryObjectWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "queryRkFwGlBySfzh", sfzh);
	}

	public RkfwglBean queryRkFwGlByRybh(String rybh) throws Exception {
		return executor.queryObjectWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "queryRkFwGlByRybh", rybh);
	}

	public void updateLdrkxxJzzxxBean(LdrkxxBean ldrkBean) throws Exception 
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateLdrkxxJzzxxBean", ldrkBean);
	}

	public void updateLdrkInfoBean(LdrkxxBean ldrkBean) throws Exception 
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateLdrkInfoBean", ldrkBean);
	}

	public LdrkxxBean queryLdrkBeanByZzbh(String zzbh) throws Exception {
		return executor.queryObjectWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkBeanByZzbh", zzbh);
	}

	public void updateLdrkInfoBeanForZX(LdrkxxBean ldrkBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateLdrkInfoBeanForZX", ldrkBean);
	}

	@Override
	public void deleteJwrkInfo(String jwbh) throws Exception {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteJwrkInfo", jwbh);
		
	}

	@Override
	public void deleteJzrkInfo(String jzbh) throws Exception {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteJzrkInfo", jzbh);
	}

	@Override
	public void deleteLdrkInfo(String zzbh) throws Exception {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteLdrkInfo", zzbh);
	}

	@Override
	public void logoutCzrkInfo(CzrkxxBean czrkBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "logoutCzrkInfo", czrkBean);
	}

	@Override
	public void logoutJwrkInfo(JwrkxxBean jwrkBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "logoutJwrkInfo", jwrkBean);
	}

	@Override
	public void logoutJzrkInfo(JzrkxxBean jzrkBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "logoutJzrkInfo", jzrkBean);
	}

	@Override
	public void logoutLdrkInfo(LdrkxxBean ldrkBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "logoutLdrkInfo", ldrkBean);
		
	}

	@Override
	public void recoveryCzrkInfo(CzrkxxBean czrkBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "recoveryCzrkInfo", czrkBean);
	}

	@Override
	public void recoveryJwrkInfo(JwrkxxBean jwrkBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "recoveryJwrkInfo", jwrkBean);
	}

	@Override
	public void recoveryJzrkInfo(JzrkxxBean jzrkBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "recoveryJzrkInfo", jzrkBean);
	}

	@Override
	public void recoveryLdrkInfo(LdrkxxBean ldrkBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "recoveryLdrkInfo", ldrkBean);
	}

	@Override
	public void deleteWlhrkInfo(String wlhrkbh) throws Exception {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteWlhrkInfo", wlhrkbh);
	}

	@Override
	public void logoutWlhrkInfo(RkwlczhkBean wlczhkBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "logoutWlhrkInfo", wlczhkBean);
	}

	@Override
	public void recoveryWlhrkInfo(RkwlczhkBean wlczhkBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "recoveryWlhrkInfo", wlczhkBean);
	}

	@Override
	public void deleteRkJhsyBean(String id) throws Exception {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteRkJhsyBean", id);
	}

	@Override
	public void insertRkJhsyBean(RkJhsyBean jhsyBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertRkJhsyBean",jhsyBean);
	}

	@Override
	public RkJhsyBean queryJhsyBeanByjlbh(String id) throws Exception {
		return executor.queryObjectWithDBName(RkJhsyBean.class, CommonConstant.DBNAME_SQJW, "queryJhsyBeanByjlbh", id);
	}

	@Override
	public PageResultInfo<RkJhsyBean> queryJhsyBeanPage(RkQueryBean queryBean,
			PageInfo pageInfo) throws Exception {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(RkJhsyBean.class, CommonConstant.DBNAME_SQJW, "queryJhsyBeanPage", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public void updateRkJhsyBean(RkJhsyBean jhsyBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateRkJhsyBean", jhsyBean);
	}

	@Override
	public void zxLdrkxxBySfzh(String sfzh,String zxyy) throws Exception
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "zxLdrkxxBySfzh", zxyy,sfzh);
	}
	
	public void delGxr(String id) throws Exception{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "delGxr", id);
	}

	@Override
	public void deleteRkfwInfo(String fwrkid) throws Exception {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteRkfwInfo", fwrkid);
	}

	
	public void delLxfs(RklxfsxxBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "delLxfs", bean);
	}

	@Override
	public void updateRkfwInfo(RkfwglBean rkfwBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateRkfwInfo",rkfwBean);
	}

	@Override
	public CzrkxxBean queryCzrkInfoByCzrkbh(String czrkbh) throws Exception {
		return executor.queryObjectWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrkInfoByCzrkbh", czrkbh);
	}

	@Override
	public JwrkxxBean queryJwrkInfoByJwbh(String jwbh) throws Exception {
		return executor.queryObjectWithDBName(JwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJwrkInfoByJwbh", jwbh);
	}

	@Override
	public JzrkxxBean queryJzrkInfoByJzbh(String jzbh) throws Exception {
		return executor.queryObjectWithDBName(JzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzrkInfoByJzbh", jzbh);
	}

	@Override
	public RkwlczhkBean queryWlhrkInfoByWlhbh(String wlhbh) throws Exception {
		return executor.queryObjectWithDBName(RkwlczhkBean.class, CommonConstant.DBNAME_SQJW, "queryWlhrkInfoByWlhbh", wlhbh);
	}

	@Override
	public void recoveryRkfwInfo(RkfwglBean rkfwBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "recoveryRkfwInfo",rkfwBean);
	}

	@Override
	public PageResultInfo<RkJbxxBean> queryRkZpPageResultInfo(
			PageInfo pageInfo, RkQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryRkZpPageResultInfo", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public int getRemoteZpCount(String sfzh)
	{
		try
		{
			String sql = "select count(1) from t_lsgl_rk_zpxx where zxbs='0' and ycfwzp='1' and sfzh=?";
			String count = SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, sfzh);
			return Integer.parseInt(count);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public RkJhsyBean queryJhsyBeanByRybh(String rybh) throws Exception {
		return executor.queryObjectWithDBName(RkJhsyBean.class, CommonConstant.DBNAME_SQJW, "queryJhsyBeanByRybh", rybh);
	}

	@Override
	public List<LdrkxxBean> queryLdrkAllListByRkQueryBean(RkQueryBean queryBean)
	{
		try
		{
			return executor.queryListBeanWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkxxPageResult", queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<LdrkxxBean> queryLdrkBeanListByLdrkids(String ldrkids)
	{
		try
		{
			ldrkids = "'" + ldrkids.replace(",", "','") + "'";
			String sql = executor.getSql("queryLdrkBeanListByLdrkids").replace("#[ldrkids]", ldrkids);
			return SQLExecutor.queryListWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public RkJbxxBean queryHzRkJbxxByHH(String hh) throws Exception
	{
		return executor.queryObjectWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryHzRkJbxxByHH", hh);
	}

	@Override
	public List<CzrkxxBean> queryCzrkBeansByQueryBean(RkQueryBean queryBean) throws Exception
	{
		return executor.queryListBeanWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrkBeansByQueryBean", queryBean);
	}

	@Override
	public List<CzrkxxBean> queryCzrkBeansByczrkbhs(String czrkbhs) throws Exception
	{
		czrkbhs = "'" + czrkbhs.replace(",", "','") + "'";
		String sql = executor.getSql("queryCzrkBeansByczrkbhs").replace("#[czrkbhs]", czrkbhs);
		return SQLExecutor.queryListWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, sql);
	}

	@Override
	public List<JzrkxxBean> queryJzrkBeansByQueryBean(RkQueryBean queryBean) throws Exception
	{
		return executor.queryListBeanWithDBName(JzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzrkBeansByQueryBean", queryBean);
	}

	@Override
	public List<JzrkxxBean> queryJzrkBeansByczrkbhs(String jzbhs) throws Exception
	{
		jzbhs = "'" + jzbhs.replace(",", "','") + "'";
		String sql =executor.getSql("queryJzrkBeansByJzrkbhs").replace("#[jzbhs]", jzbhs);
		return SQLExecutor.queryListWithDBName(JzrkxxBean.class, CommonConstant.DBNAME_SQJW, sql);
	}
	
	@Override
	public PageResultInfo<RkfwglBean> queryRkfwglByRybh(String rybh,
			PageInfo pageInfo) throws Exception {
		ListInfo listInfo = executor.queryListInfoWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "queryLsjlRkfwglByRybh", pageInfo.getOffset(), pageInfo.getPageSize(), rybh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public CzrkxxBean queryCzrkFwglInfoByCzrkbh(String bhs) {
		try {
			return executor.queryObjectWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrkFwglInfoByCzrkbh", bhs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public JwrkxxBean queryJwrkFwglInfoByJwbh(String bhs) {
		try {
			return executor.queryObjectWithDBName(JwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJwrkFwglInfoByJwbh", bhs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public JzrkxxBean queryJzrkFwglInfoByJzbh(String bhs) {
		try {
			return executor.queryObjectWithDBName(JzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzrkFwglInfoByJzbh", bhs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public LdrkxxBean queryLdrkFwglBeanByZzbh(String bhs) {
		try {
			return executor.queryObjectWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkFwglBeanByZzbh", bhs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public RkwlczhkBean queryWlhrkFwglInfoByWlhbh(String bhs) {
		try {
			return executor.queryObjectWithDBName(RkwlczhkBean.class, CommonConstant.DBNAME_SQJW, "queryWlhrkFwglInfoByWlhbh", bhs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public PageResultInfo<RkfwglBean> queryRkFwGlBySfzh(String sfzh,
			PageInfo pageInfo) {
		ListInfo listInfo= null;
		try {
			 listInfo = executor.queryListInfoWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "queryLsjlRkFwGlBySfzh", pageInfo.getOffset(), pageInfo.getPageSize(), sfzh);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);

	}

	@Override
	public void zxCzrkxxBySfzh(String sfzh, String zxyy) throws Exception {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "zxCzrkxxBySfzh", zxyy,sfzh);
	}

	@Override
	public void zxJwrkxxBySfzh(String sfzh, String zxyy) throws Exception {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "zxJwrkxxBySfzh", zxyy,sfzh);
	}

	@Override
	public void zxJzrkxxBySfzh(String sfzh, String zxyy) throws Exception {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "zxJzrkxxBySfzh", zxyy,sfzh);
	}

	@Override
	public void zxWlhrkxxBySfzh(String sfzh, String zxyy) throws Exception {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "zxWlhrkxxBySfzh", zxyy,sfzh);
	}

	@Override
	public List<RkfwglBean> queryJzxxListByRybh(String rybh) throws Exception {
		return executor.queryListWithDBName(RkfwglBean.class, CommonConstant.DBNAME_SQJW, "queryJzxxListByRybh", rybh);
	}

	@Override
	public PageResultInfo<RkJbxxBean> querySyrkListBeanByCondition(
			RkQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "querySyrkListBeanByCondition", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		//queryBean.setPagesize(pageInfo.getPageSize());
		//queryBean.setCurrentpage(pageInfo.getCurrentPage());
		//List<RkJbxxBean> list = executor.queryListBeanWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "querySyrkListBeanByCondition", queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public void insertLdryYqzxBean(LdrkYqzxBean yqzxBean) throws Exception 
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertLdryYqzxBean", yqzxBean);
	}

	@Override
	public List<RkJbxxBean> querySyrkBeansByQueryBean(RkQueryBean queryBean)
			throws Exception {
		//querySyrkBeansByQueryBean
		return executor.queryListBeanWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "querySyrkListBeanByCondition", queryBean);
	}

	@Override
	public List<RkJbxxBean> querySyrkBeanByrkids(String rkids) throws Exception {
		rkids = "'" + rkids.replace(",", "','") + "'";
		String sql = executor.getSql("querySyrkBeanByrkids").replace("#[rkids]", rkids);
		return SQLExecutor.queryListWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, sql);
	}
	
	public List<RkJbxxBean> queryRkjbxxByRybhs(String rybhs) throws Exception {
		rybhs = "'" + rybhs.replace(",", "','") + "'";
		String sql = executor.getSql("queryRkjbxxByRybhs").replace("#[rybhs]", rybhs);
		return SQLExecutor.queryListWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, sql);
	}
	@Override
	public CzrkxxBean queryCzrkInfoBeanBySfzhFormSt(String sfzh) throws Exception
	{
		return executor.queryObjectWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryRkJbxxBeanBySfzhFormSt", sfzh);
	}

	@Override
	public CzrkxxBean queryCzrkxxBeanByFwidAndSfzh(String sfzh, String fwid)
			throws Exception
	{
		return executor.queryObjectWithDBName(CzrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzrkxxBeanByFwidAndSfzh", fwid, sfzh);
	}

	public String queryFwidByRkfwglid(String rkfwglid) throws Exception
	{
		return executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "queryFwidByRkfwglid", rkfwglid);
	}

	@Override
	public String getExistsRkBeanDzmc(String sfzh)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String dzmc = null;
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("sfzh", sfzh, SQLParams.STRING);
			params.addSQLParam("orgcode", loginInfo.getOrgcode(), SQLParams.STRING);
			dzmc = executor.queryFieldBeanWithDBName(CommonConstant.DBNAME_SQJW, "isExistsRkBean", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return dzmc;
	}
	
	public String getExistsRkBeanOfRybh(String sfzh, String djdwdm)
	{
		String rybh = null;
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("sfzh", sfzh, SQLParams.STRING);
			params.addSQLParam("orgcode", djdwdm, SQLParams.STRING);
			rybh = executor.queryFieldBeanWithDBName(CommonConstant.DBNAME_SQJW, "getExistsRkBeanOfRybh", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rybh;
	}
	
	/**
	 * 获取人员编号
	 * @param params
	 * @return
	 * @throws Exception
	 * @date Aug 12, 2014 9:11:04 AM
	 */
	public String getRybhBySfzh(String sfzh)
	{
		try
		{
			return executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "getRybhBySfzh", sfzh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public PageResultInfo<RkgxrxxBean> queryGlgxrPageResultBySfzh(String sfzh, PageInfo pageInfo)
	{
		try
		{
			ListInfo listInfo = executor.queryListInfoWithDBName(RkgxrxxBean.class, CommonConstant.DBNAME_SQJW, "queryGlgxrPageResultBySfzh", pageInfo.getOffset(), pageInfo.getPageSize(), sfzh);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new PageResultInfo<RkgxrxxBean>();
	}

	 
}
