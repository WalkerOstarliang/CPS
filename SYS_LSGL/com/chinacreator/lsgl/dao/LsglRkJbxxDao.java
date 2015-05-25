package com.chinacreator.lsgl.dao;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.bean.RkJbxxBean;
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
import com.chinacreator.lsgl.query.RkQueryBean;

/**
 * 实有人口操作类
 * 
 * @filename LsglRkJbxxDao.java
 * @author mingchun.xiong
 * @date 2013-8-19
 *
 */
public interface LsglRkJbxxDao
{
	/**
	 * 查询人口基本信息通过人员编号
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午10:44:51
	 */
	public RkJbxxBean queryRkJbxxBeanByRybh(String rybh) throws Exception;
	
	
	/**
	 * 查询人口基本信息通过身份证号
	 * @param sfzh
	 * @return
	 * @throws Exception
	 * @date 2013-9-17 下午03:43:48
	 */
	public RkJbxxBean queryRkJbxxBeanBySfzh(String sfzh) throws Exception;
	
	/**
	 * 查询人口基本信息通过身份证号 从省厅前置库
	 * @param sfzh
	 * @return
	 * @throws Exception
	 * @date 2013-9-17 下午03:43:48
	 */
	public CzrkxxBean queryCzrkInfoBeanBySfzhFormSt(String sfzh) throws Exception;
	
	/**
	 * 通过国籍证件号码，证件种类查询境外人口
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-9-17 下午07:24:59
	 */
	public RkJbxxBean queryRkJbxxBeanByGjAndZjzlAndZjhm(RkQueryBean queryBean) throws Exception;
	
	/**
	 * 查询常驻人口类别
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午10:39:17
	 */
	public PageResultInfo<CzrkxxBean> queryCzrkxxPageResult(PageInfo pageInfo, RkQueryBean queryBean) throws Exception;
	
	/**
	 * 通过人员编号查询常驻人口
	 * @param czrkid
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:26:01
	 */
	public CzrkxxBean queryCzrkBeanByCzrkid(String czrkid) throws Exception;
	
	/**
	 * 通过人员编号查询常住人口信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 下午02:39:26
	 */
	public List<CzrkxxBean> queryCzrkBeansByRybh(String rybh) throws Exception;
	
	/**
	 * 查询流动人口类别
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-20 下午05:05:21
	 */
	public PageResultInfo<LdrkxxBean> queryLdrkxxPageResult(PageInfo pageInfo, RkQueryBean queryBean) throws Exception;
	
	
	/**
	 * 通过人员编号查询流动人口信息
	 * @param ldrkid 人员编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:28:46
	 */
	public LdrkxxBean queryLdrkBeanByLdrkid(String zzbh) throws Exception;
	
	/**
	 * 通过人员编号查询人员最近的暂住记录
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-24 下午04:29:54
	 */
	public LdrkxxBean queryLdrkBeanByRybh(String rybh) throws Exception;
	
	/**
	 * 查询寄住人口信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-20 下午05:05:21
	 */
	public PageResultInfo<JzrkxxBean> queryJzrkPageResult(PageInfo pageInfo, RkQueryBean queryBean) throws Exception;
	
	/**
	 * 通过人员编号查询寄住人口
	 * @param jzrkid 人员编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:35:50
	 */
	public JzrkxxBean queryJzrkBeanByJzrkid(String jzrkid) throws Exception;
	
	/**
	 * 通过人员编号查询人员最近寄住信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-24 下午04:59:23
	 */
	public JzrkxxBean queryJzrkBeanByRybh(String rybh) throws Exception;
	/**
	 * 查询境外人口信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-20 下午05:05:21
	 */
	public PageResultInfo<JwrkxxBean> queryJwrkPageResult(PageInfo pageInfo, RkQueryBean queryBean) throws Exception;
	
	/**
	 * 未落常驻户口列表查询
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-29 上午08:49:49
	 */
	public PageResultInfo<RkwlczhkBean> queryWlczhkPageResult(PageInfo pageInfo, RkQueryBean queryBean) throws Exception;
	
	/**
	 * 通过人员编号查关系人表
	 * @param rybh 人员编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:38:51
	 */
	public List<RkgxrxxBean> queryRkgxrBeansByRybh(String rybh) throws Exception;
	
	/**
	 * 插入社会关系人
	 * @param gxrBean
	 * @throws Exception
	 * @date 2013-8-30 下午04:49:24
	 */
	public void insertRkgxrxxBean(RkgxrxxBean gxrBean) throws Exception;
	
	/**
	 * 更新人口关系人信息
	 * @param gxrBean
	 * @throws Exception
	 * @date 2013-8-30 下午04:50:07
	 */
	public void updateRkgxrxxBean(RkgxrxxBean gxrBean) throws Exception;
	
	/**
	 * 通过人员编号查询人口联系方式
	 * @param rybh 人员编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:43:25
	 */
	public List<RklxfsxxBean> queryRklxfsBeansByRybh(String rybh)throws Exception; 
	
	/**
	 * 查询人口的现实表现信息通过人员编号
	 * @param rybh 人员编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:45:17
	 */
	public RkxsbxxxBean queryRkxsbxBeanByRybh(String rybh) throws Exception;
	
	/**
	 * 通过人口编号查询人员的体貌特种
	 * @param rybh 人员编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:46:38
	 */
	public RktmtzxxBean queryRktmtzBeanByRybh(String rybh) throws Exception;
	
	/**
	 * 查询人口照片信息
	 * @param rybh 人员编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 上午10:49:05
	 */
	public List<RkzpxxBean> queryRkzpxxBeansByRybh(String rybh) throws Exception;
	
	/**
	 * 查询流动人口暂住信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 下午02:55:51
	 */
	public List<LdrkxxBean> queryLdrkZzxxByRybh(String rybh) throws Exception;
	
	/**
	 * 查询未落户常住人口信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-8-29 上午09:31:22
	 */
	public List<RkwlczhkBean> queryWlhczrkByRybh(String rybh) throws Exception;
	
	/**
	 * 查询寄住人口寄住信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 下午02:56:43
	 */
	public List<JzrkxxBean> queryJzrkJzxxByRybh(String rybh) throws Exception;
	
	/**
	 * 境外人员居住信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-8-21 下午03:10:17
	 */
	public List<JwrkxxBean> queryJwrkJzxxByRybh(String rybh) throws Exception;
	
	/**
	 * 通过境外编号查询境外人口信息
	 * @param jwbh 境外人口记录编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-29 上午09:55:16
	 */
	public JwrkxxBean queryJwrkBeanByJwrkid(String jwbh) throws Exception;
	
	/**
	 * 通过人员编号查询境外人口最近一次记录
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-24 下午04:33:10
	 */
	public JwrkxxBean queryJwrkBeanByRybh(String rybh) throws Exception;
	
	/**
	 * 通过未落户编号查询未落户人口信息
	 * @param wlhbh
	 * @return
	 * @throws Exception
	 * @date 2013-8-29 上午09:35:19
	 */
	public RkwlczhkBean queryWlhczrkBeanByWlhrkid(String wlhbh) throws Exception;
	
	/**
	 * 通过人员编号查询当前最近一次未落户记录
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-24 下午04:31:48
	 */
	public RkwlczhkBean queryWlhczrkBeanByRybh(String rybh) throws Exception;
	
	/**
	 * 插入人口基本信息
	 * @param rkBean
	 * @return 
	 * @throws Exception
	 * @date 2013-8-19 上午10:42:16
	 */
	public RkJbxxBean insertRkJbxxBean(RkJbxxBean rkBean) throws Exception;
	
	/**
	 * 更新人口基本信息
	 * @param rkBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午10:43:55
	 */
	public RkJbxxBean updateRkJbxxBean(RkJbxxBean rkBean) throws Exception;
	
	/**
	 * 插入常住人口信息
	 * @param czrkBean
	 * @throws Exception
	 * @date 2013-8-23 上午10:54:17
	 */
	public void insertCzrkxxBean(CzrkxxBean czrkBean) throws Exception;
	
	/**
	 * 更新常住人口信息
	 * @param czrkBean
	 * @throws Exception
	 * @date 2013-8-23 上午10:55:17
	 */
	public void updateCzrkxxBean(CzrkxxBean czrkBean) throws Exception;
	/**
	 * 插入人口照片信息
	 * @param rkzpxxBeans
	 * @throws Exception
	 * @date 2013-8-19 上午11:13:51
	 */
	public void insertRkzpxx(List<RkzpxxBean> rkzpxxBeans) throws Exception;
	 
	/**
	 * 插入房屋人口关联对象
	 * @param rybh
	 * @param fwid
	 * @param dzid
	 * @throws Exception
	 * @date 2013-8-23 下午08:20:32
	 */
	public void insertFwRkGlBean(RkfwglBean fwrkglBean) throws Exception;
	
	/**
	 * 更新房屋人口管理
	 * @param fwrkglBean
	 * @throws Exception
	 * @date 2013-8-24 下午04:18:37
	 */
	public void updateFwrkGlBean(RkfwglBean fwrkglBean) throws Exception;
	
	/**
	 * 注销房屋人口关联
	 * @param fwrkglBean
	 * @throws Exception
	 * @date 2013-9-11 下午05:02:54
	 */
	public void zxFwrkGlBean(RkfwglBean fwrkglBean) throws Exception;
	
	/**
	 * 查询房屋人口关联表
	 * @param fwrkglid
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午04:28:28
	 */
	public RkfwglBean queryFwRkGlBeanByFwrkglid(String fwrkglid) throws Exception;
	
	/**
	 * 通过人员编号找房屋信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午01:38:31
	 */
	public List<FwJbxxBean> queryFwJbxxBeanByRybh(String rybh) throws Exception;
	
	/**
	 * 获取人口照片信息
	 * @param zpid
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午04:44:29
	 */
	public Blob getRkzpBlob(String zpid) throws Exception;
	
	/**
	 * 删除人口照片
	 * @param zpid
	 * @throws Exception
	 * @date 2013-8-30 下午03:15:15
	 */
	public void deleteRkzpImage(String zpid) throws Exception;
	
	/**
	 * 插入体貌特征信息
	 * @param tmtzBean
	 * @throws Exception
	 * @date 2013-8-31 下午03:26:02
	 */
	public void insertTmtzxxBean(RktmtzxxBean tmtzBean) throws Exception;
	
	/**
	 * 更新体貌特征信息
	 * @param tmtzBean
	 * @throws Exception
	 * @date 2013-8-31 下午03:26:49
	 */
	public void updateTmtzxxBean(RktmtzxxBean tmtzBean) throws Exception;
	
	/**
	 * 插入联系方式信息
	 * @param lxfsBean
	 * @throws Exception
	 * @date 2013-8-31 下午05:02:47
	 */
	public void insertLxfsxxBean(RklxfsxxBean lxfsBean) throws Exception;
	
	/**
	 * 更新联系方式信息
	 * @param lxfsBean
	 * @throws Exception
	 * @date 2013-8-31 下午05:03:33
	 */
	public void updateLxfsxxBean(RklxfsxxBean lxfsBean) throws Exception;
	
	/**
	 * 插入流动人口信息bean
	 * @param ldrkBean
	 * @throws Exception
	 * @date 2013-9-2 上午10:05:09
	 */
	public void insertLdrkxxBean(LdrkxxBean ldrkBean) throws Exception;
	
	/**
	 * 更新流动人口信息
	 * @param ldrkBean
	 * @throws Exception
	 * @date 2013-8-19 上午11:28:50
	 */
	public void updateLdrkxxBean(LdrkxxBean ldrkBean) throws Exception;
	
	/**
	 * 更新流动人口信息居住证信息
	 * @param ldrkBean
	 * @throws Exception
	 * @date 2013-8-19 上午11:28:50
	 */
	public void updateLdrkxxJzzxxBean(LdrkxxBean ldrkBean) throws Exception;
	
	/**
	 * 插入寄住人口对象
	 * @param jzrkBean
	 * @throws Exception
	 * @date 2013-9-3 下午02:12:12
	 */
	public void insertJzrkBean(JzrkxxBean jzrkBean) throws Exception;
	
	/**
	 * 更新居住人口
	 * @param jzrkBean
	 * @throws Exception
	 * @date 2013-9-3 下午02:12:53
	 */
	public void updateJzrkBean(JzrkxxBean jzrkBean) throws Exception;
	
	/**
	 * 插入未落户人口信息
	 * @param wlrlBean
	 * @throws Exception
	 * @date 2013-9-4 上午09:35:56
	 */
	public void insertWlhrkBean(RkwlczhkBean wlrlBean) throws Exception;
	
	/**
	 * 更新未落户人口信息
	 * @param wlrlBean
	 * @throws Exception
	 * @date 2013-9-4 上午09:36:09
	 */
	public void updateWlhrkBean(RkwlczhkBean wlrlBean) throws Exception;
	
	/**
	 * 插入境外人口信息对象
	 * @param jwrkBean
	 * @throws Exception
	 * @date 2013-9-4 下午06:25:41
	 */
	public void insertJwrkxxBean(JwrkxxBean jwrkBean) throws Exception;
	
	/**
	 * 更新境外人口信息对象
	 * @param jwrkBean
	 * @throws Exception
	 * @date 2013-9-4 下午06:26:14
	 */
	public void updateJwrkxxBean(JwrkxxBean jwrkBean) throws Exception;
	
	/**
	 * 获取人口的房屋
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-11 下午05:25:06
	 */
	public RkfwglBean getRkfwBean(String rybh) throws Exception;
	
	/**
	 * 注销人口房屋ID
	 * @param rkfwglid
	 * @throws Exception
	 * @date 2013-9-22 下午02:08:58
	 */
	public void zxRkfwBean(String rkfwglid) throws Exception;
	
	/**
	 * 查询实有人口通过查询条件
	 * @param queryBean
	 * @throws Exception
	 * @date 2013-9-23 上午09:48:28
	 */
	public PageResultInfo<RkJbxxBean> querySyrkBeanByConditionForPageResultInfo(RkQueryBean queryBean, PageInfo pageInfo) throws Exception;
	
	/**
	 * 查询当前常驻人口信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-23 下午07:52:41
	 */
	public CzrkxxBean queryDqCzrkxxBeanByRybh(String rybh) throws Exception;
	
	/**
	 * 更新人员属性
	 * @param sfzh
	 * @throws Exception
	 * @date 2013-10-16 下午04:43:35
	 */
	public void updateRysxBySfzh(String sfzh, String rysx) throws Exception;
	
	/**
	 * 通过身份证号和房屋ID检查该人员是否在改房屋下面已经登记
	 * @param sfzh
	 * @param fwid
	 * @return
	 * @throws Exception
	 * @date 2013-11-28 上午10:29:25
	 */
	public LdrkxxBean queryLdrkxxBeanBySfzhAndFwid(String sfzh, String fwid) throws Exception;
	
	/**
	 *  通过身份证号和房屋ID检查该人员是否在改房屋下面已经登记
	 * @param sfzh
	 * @param fwid
	 * @return
	 * @throws Exception
	 * @date 2013-11-28 上午10:29:56
	 */
	public CzrkxxBean queryCzrkxxBeanBySfzhAndFwid(String sfzh, String fwid) throws Exception;
	
	/**
	 *  通过身份证号和房屋ID检查该人员是否在改房屋下面已经登记
	 * @param sfzh
	 * @param fwid
	 * @return
	 * @throws Exception
	 * @date 2013-11-28 上午10:29:59
	 */
	public JzrkxxBean queryJzrkxxBeanBySfzhAndFwid(String sfzh, String fwid) throws Exception;
	
	/**
	 *  通过身份证号和房屋ID检查该人员是否在改房屋下面已经登记
	 * @param sfzh
	 * @param fwid
	 * @return
	 * @throws Exception
	 * @date 2013-11-28 上午10:30:02
	 */
	public RkwlczhkBean queryWlhrkxxBeanBySfzhAndFwid(String sfzh, String fwid) throws Exception;
	

	/**
	 * 更新房屋人口关联
	 * @param fwrkglBean
	 * @throws Exception
	 * @date 2013-8-24 下午04:18:37
	 */
	public void updateFwrkGlDzBean(RkfwglBean fwrkglBean) throws Exception;
	
	/**
	 * 根据身份证查询人口房屋关联信息
	 * @param sfzh
	 * @return
	 * @throws Exception
	 */
	public RkfwglBean queryRkFwGlBySfzh(String sfzh) throws Exception;
	
	/**
	 * 根据人员编号查询人口房屋关联信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 */
	public RkfwglBean queryRkFwGlByRybh(String rybh) throws Exception;
	
	/**
	 * 更新流动人口信息(延期处理(正常))
	 * @param ldrkBean
	 * @throws Exception
	 * @date 2013-8-19 上午11:28:50
	 */
	public void updateLdrkInfoBean(LdrkxxBean ldrkBean) throws Exception;
	
	/**
	 * 根据zzbh 查询流动人口信息
	 */
	public LdrkxxBean  queryLdrkBeanByZzbh(String zzbh)  throws Exception;
	
	/**
	 * 更新流动人口信息(延期处理(注销))
	 * @param ldrkBean
	 * @throws Exception
	 * @date 2013-8-19 上午11:28:50
	 */
	public void updateLdrkInfoBeanForZX(LdrkxxBean ldrkBean) throws Exception;
	
	public LdrkxxBean queryLdrkBeanByRybhAndYxzt(String rybh) throws Exception;
	
	/**
	 * 注销流动人口
	 * @param ldrkBean
	 * @throws Exception
	 */
	public void logoutLdrkInfo(LdrkxxBean ldrkBean) throws Exception;
	
	/**
	 * 删除流动人口
	 */
	public void deleteLdrkInfo(String zzbh) throws Exception;
	
	/**
	 * 注销寄住人口
	 */
	public void logoutJzrkInfo(JzrkxxBean  jzrkBean) throws Exception;
	
	/**
	 * 删除流动人口
	 */
	public void deleteJzrkInfo(String jzbh) throws Exception;
	
	/**
	 * 注销境外人口
	 */
	public void logoutJwrkInfo(JwrkxxBean jwrkBean) throws Exception;
	
	/**
	 * 删除境外人口
	 */
	public void deleteJwrkInfo(String jwbh) throws Exception;
	
	/**
	 * 注销常住人口
	 */
	public void logoutCzrkInfo(CzrkxxBean czrkBean) throws Exception;
	
	
	/**
	 * 恢复常住人口
	 */
	public void recoveryCzrkInfo(CzrkxxBean czrkBean) throws Exception;
	
	/**
	 * 恢复流动人口
	 * @param ldrkBean
	 * @throws Exception
	 */
	public void recoveryLdrkInfo(LdrkxxBean ldrkBean) throws Exception;
	
	/**
	 * 恢复寄住人口
	 * @param jzrkBean
	 * @throws Exception
	 */
	public void recoveryJzrkInfo(JzrkxxBean jzrkBean) throws Exception;
	
	/**
	 * 恢复境外人口
	 * @param jwrkBean
	 * @throws Exception
	 */
	public void recoveryJwrkInfo(JwrkxxBean jwrkBean) throws Exception;
	
	
	public void deleteWlhrkInfo(String wlhrkbh) throws Exception;
	
	public void logoutWlhrkInfo(RkwlczhkBean wlczhkBean) throws Exception;
	
	public void recoveryWlhrkInfo(RkwlczhkBean wlczhkBean) throws Exception;
	
	public void insertRkJhsyBean(RkJhsyBean jhsyBean) throws Exception;
	
	public void updateRkJhsyBean(RkJhsyBean jhsyBean) throws Exception;
	
	public void deleteRkJhsyBean(String id) throws Exception;
	
	public PageResultInfo<RkJhsyBean> queryJhsyBeanPage(RkQueryBean queryBean,PageInfo pageInfo) throws Exception;
	
	public RkJhsyBean queryJhsyBeanByjlbh(String id) throws Exception;
	
	public void zxLdrkxxBySfzh(String sfzh,String zxyy) throws Exception;
	
	/**
	 * 删除关系人
	 * @throws SQLException
	 */
	public void delGxr(String id) throws Exception;
	//删除联系方式
	public void delLxfs(RklxfsxxBean bean) throws Exception;
	
	/**
	 * 根据 fwrkid 删除房屋人口关联表 
	 * @param fwrkid
	 * @throws Exception
	 */
	public void deleteRkfwInfo(String fwrkid) throws Exception;
	
	/**
	 * 注销房屋人口关联表
	 * @param rkfwBean
	 * @throws Exception
	 */
	public void updateRkfwInfo(RkfwglBean rkfwBean) throws Exception;
	
	/**
	 * 恢复房屋人口关联表
	 * @param rkfwBean
	 * @throws Exception
	 */
	public void recoveryRkfwInfo(RkfwglBean rkfwBean) throws Exception;
	
	/**
	 * 根据jzbh 查询寄住人口
	 * @param jzbh
	 * @throws Exception
	 */
	public JzrkxxBean queryJzrkInfoByJzbh(String jzbh) throws Exception;
	
	
	/**
	 * 查询境外人口
	 * @param jwbh
	 * @return
	 * @throws Exception
	 */
	public JwrkxxBean queryJwrkInfoByJwbh(String jwbh) throws Exception;
	
	
	/**
	 * 查询常住人口
	 * @param czrkbh
	 * @return
	 * @throws Exception
	 */
	public CzrkxxBean queryCzrkInfoByCzrkbh(String czrkbh) throws Exception;
	
	/**
	 * 查询未落户人口
	 * @param wlhbh
	 * @return
	 * @throws Exception
	 */
	public RkwlczhkBean queryWlhrkInfoByWlhbh(String wlhbh) throws Exception; 
	
	/**
	 * 人员相片管理人口查询
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date Feb 21, 2014 2:41:44 PM
	 */
	public PageResultInfo<RkJbxxBean> queryRkZpPageResultInfo(PageInfo pageInfo, RkQueryBean queryBean) throws Exception;
	
	/**
	 * 判断远程照片是否存在
	 * @param sfzh
	 * @return
	 * @date Feb 23, 2014 11:28:51 AM
	 */
	public int getRemoteZpCount(String sfzh);

	/**
	 * 根据人员编号查询计划生育信息
	 * @param rybh
	 * @return
	 */
	public RkJhsyBean queryJhsyBeanByRybh(String rybh) throws Exception;
	
	/**
	 * 查询流动人口信息查询集合
	 * @param queryBean
	 * @return
	 * @date Feb 26, 2014 4:45:55 PM
	 */
	public List<LdrkxxBean> queryLdrkAllListByRkQueryBean(RkQueryBean queryBean);
	
	/**
	 * 通过流动人口id查询
	 * @param ldrkids
	 * @return
	 * @date Feb 26, 2014 5:18:07 PM
	 */
	public  List<LdrkxxBean> queryLdrkBeanListByLdrkids(String ldrkids);
	
		
	/**
	 * 通过人员编号查询居住记录 t_lsgl_rkfw_gl
	 */
	public PageResultInfo<RkfwglBean> queryRkfwglByRybh(String rybh,PageInfo pageInfo) throws Exception;

	public CzrkxxBean queryCzrkFwglInfoByCzrkbh(String bhs);

	public JwrkxxBean queryJwrkFwglInfoByJwbh(String bhs);

	public JzrkxxBean queryJzrkFwglInfoByJzbh(String bhs);

	public LdrkxxBean queryLdrkFwglBeanByZzbh(String bhs);

	public RkwlczhkBean queryWlhrkFwglInfoByWlhbh(String bhs);
	
	public RkJbxxBean queryHzRkJbxxByHH(String hh) throws Exception;
	
	public List<CzrkxxBean> queryCzrkBeansByQueryBean(RkQueryBean queryBean) throws Exception;
	
	public List<CzrkxxBean> queryCzrkBeansByczrkbhs(String czrkbhs) throws Exception;
	
	public List<JzrkxxBean> queryJzrkBeansByQueryBean(RkQueryBean queryBean) throws Exception;
	
	public List<JzrkxxBean> queryJzrkBeansByczrkbhs(String czrkbhs) throws Exception;
	
	public List<RkJbxxBean> querySyrkBeansByQueryBean(RkQueryBean queryBean) throws Exception;

	public List<RkJbxxBean> querySyrkBeanByrkids(String rkids) throws Exception;

	public List<RkJbxxBean> queryRkjbxxByRybhs(String rybhs) throws Exception;

	public PageResultInfo<RkfwglBean> queryRkFwGlBySfzh(String sfzh,
			PageInfo pageInfo) ;
	
	/**
	 * 注销常住人口
	 * @param sfzh
	 * @param zxyy
	 * @throws Exception
	 */
	public void zxCzrkxxBySfzh(String sfzh,String zxyy) throws Exception;
	
	/**
	 * 注销寄口人口
	 * @param sfzh
	 * @param zxyy
	 * @throws Exception
	 */
	public void zxJzrkxxBySfzh(String sfzh,String zxyy) throws Exception;
	
	
	/**
	 * 注销未落户人口
	 * @param sfzh
	 * @param zxyy
	 * @throws Exception
	 */
	public void zxWlhrkxxBySfzh(String sfzh,String zxyy) throws Exception;
	
	/**
	 * 注销境外人口
	 * @param sfzh
	 * @param zxyy
	 * @throws Exception
	 */
	public void zxJwrkxxBySfzh(String sfzh,String zxyy) throws Exception;
	
	
	/**
	 * 根据人员bh 去查询所以居住记录
	 */
	public List<RkfwglBean> queryJzxxListByRybh(String rybh) throws Exception;
	
	/**
	 * 执行实有人口查询
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 * @date Mar 18, 2014 5:27:03 PM
	 */
	public PageResultInfo<RkJbxxBean> querySyrkListBeanByCondition(RkQueryBean queryBean, PageInfo pageInfo) throws Exception;

	public void insertLdryYqzxBean(LdrkYqzxBean yqzxBean) throws Exception;
	
	public CzrkxxBean queryCzrkxxBeanByFwidAndSfzh(String sfzh, String fwid) throws Exception;
	
	public String queryFwidByRkfwglid(String rkfwglid) throws Exception;
	
	public String getExistsRkBeanDzmc(String sfzh);
	
	public String getExistsRkBeanOfRybh(String sfzh, String djdwdm);
	
	public String getRybhBySfzh(String sfzh);
	
	public PageResultInfo<RkgxrxxBean> queryGlgxrPageResultBySfzh(String sfzh, PageInfo pageInfo);
	
}
