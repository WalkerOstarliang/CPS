package com.chinacreator.lsgl.services;

import java.io.File;
import java.sql.Blob;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.lsgl.bean.JwrkxxBean;
import com.chinacreator.lsgl.bean.JzrkxxBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.RkDzxxBean;
import com.chinacreator.lsgl.bean.RkJhsyBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.lsgl.bean.RkgxrxxBean;
import com.chinacreator.lsgl.bean.RklxfsxxBean;
import com.chinacreator.lsgl.bean.RktmtzxxBean;
import com.chinacreator.lsgl.bean.RkwlczhkBean;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.lsgl.bean.RkzpxxBean;
import com.chinacreator.lsgl.query.RkQueryBean;

/**
 * 实有人口操作服务类
 * @param msgtype 消息类型 查询的是数据 0：全部  ,1:基本信息  2:历史信息 ，3：照片信息  4:社会信息 5:体貌特种信息 6：联系方式
 * @filename LsglRkJbxxService.java
 * @author mingchun.xiong
 * @date 2013-8-19
 *
 */
public interface LsglRkService
{
	/**
	 * 查询人口基本信息通过身份证号
	 * @param sfzh
	 * @return
	 * @throws Exception
	 * @date 2013-9-17 下午03:43:48
	 */
	public RkJbxxBean queryRkJbxxBeanBySfzh(String sfzh) throws Exception;
	
	/**
	 * 查询人口基本信息通过身份证号
	 * @param sfzh
	 * @return
	 * @throws Exception
	 * @date 2013-9-17 下午03:43:48
	 */
	public CzrkxxBean queryCzrkInfoStBeanBySfzh(String sfzh) throws Exception;
	
	/**
	 * 先查本地再查远程
	 * @param sfzh
	 * @param usersfzh 调用人身份证号码
	 * @param realname 调用人真实姓名
	 * @param orgcode 机构代码
	 * @return
	 * @throws Exception
	 * @date Jan 10, 2015 12:36:09 PM
	 */
	public CzrkxxBean queryCzrkInfoStBeanBySfzhAndUserInfo(String sfzh,String usersfzh, String realname, String orgcode) throws Exception;
	/**
	 * 查询人口信息对象
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-8-20 下午05:01:49
	 */
	public PageResultInfo<? extends RkJbxxBean> queryRkPageResultInfo(PageInfo pageInfo, RkQueryBean queryBean) throws Exception;

	/**
	 * 查询人口照片实有人口
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date Feb 21, 2014 2:39:28 PM
	 */
	public PageResultInfo<RkJbxxBean> queryRkZpPageResultInfo(PageInfo pageInfo, RkQueryBean queryBean) throws Exception;
	/**
	 * 查询人口信息对象通过人员编号
	 * @param rylb 人员类别
	 * @param sfzh 人员编号
	 * @param msgtype 消息类型 查询的是数据 0：全部  ,1:基本信息  2:历史信息 ，3：照片信息  4:社会信息 5:体貌特种信息 6：联系方式
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午11:07:28
	 */
	public RkxxBean queryRkxxBeanBySfzh(String rylb, String sfzh, String msgtype) throws Exception;
	
	/**
	 * 查询当前常驻人口信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-23 下午07:52:41
	 */
	public CzrkxxBean queryDqCzrkxxBeanByRybh(String rybh) throws Exception;
	
	/**
	 * 查询人口信息对象通过人员编号
	 * @param rylb 人员类别
	 * @param rybh 人员编号
	 * @param rkid 人口ID
	 * @param msgtype 消息类型 查询的是数据 0：全部  ,1:基本信息  2:历史信息 ，3：照片信息  4:社会信息 5:体貌特种信息 6：联系方式
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午11:07:28
	 */
	public RkxxBean queryRkxxBeanByRybh(String rylb, String rybh, String msgtype, String operType) throws Exception;
	
	/**
	 * 查询人口信息通过人口ID
	 * @param rylb
	 * @param rkid
	 * @param rybh
	 * @param msgtype
	 * @return
	 * @throws Exception
	 * @date 2013-11-28 上午08:45:53
	 */
	public RkxxBean queryRkxxBeanByRkid(String rylb, String rkid, String rybh,String msgtype, String operType) throws Exception;
	
	/**
	 * 保存人口信息对象
	 * @param rkBean
	 * @param msgtype 消息类型 查询的是数据 0：全部  ,1:基本信息  2:历史信息 ，3：照片信息  4:社会信息 5:体貌特种信息 6：联系方式
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午11:08:28
	 */
	public RkxxBean saveRkxxBean(RkxxBean rkBean, String msgtype) throws Exception;
	
	/**
	 * 保存人口信息对象 带照片保存
	 * @param rkBean
	 * @param msgtype 消息类型 查询的是数据 0：全部  ,1:基本信息  2:历史信息 ，3：照片信息  4:社会信息 5:体貌特种信息 6：联系方式
	 * @param zpUploads
	 * @param zpUploadsFileName
	 * @return
	 * @date 2013-8-23 上午09:13:24
	 */
	public RkxxBean saveRkxxBean(RkxxBean rkBean, String msgtype, File[] zpUploads, String[] zpUploadsFileName) throws Exception;
	
	/**
	 * 保存人口照相信息
	 * @param rkBean
	 * @param zpUploads
	 * @param zpUploadsFileName
	 * @throws Exception
	 * @date 2013-8-29 下午08:25:11
	 */
	public RkxxBean saveRkzpxx(RkxxBean rkBean, File[] zpUploads, String[] zpUploadsFileName) throws Exception;
	
	/**
	 * 通过身份证号查询常驻人口信息
	 * @param rybh 人员编号
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午12:58:46
	 */
	public List<CzrkxxBean> queryCzrkxxBeansByRybh(String rybh) throws Exception;
	
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
	 * @param zpid 照片ID
	 * @throws Exception
	 * @date 2013-8-30 下午03:13:29
	 */
	public void deleteRkzpImage(String zpid) throws Exception;
	
	/**
	 * 通过国籍证件号码，证件种类查询境外人口
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-9-17 下午07:24:59
	 */
	public RkJbxxBean queryRkJbxxBeanByGjAndZjzlAndZjhm(RkQueryBean queryBean) throws Exception;
	
	/**
	 * 检查人员是否存在
	 * @param sfzh
	 * @param rylb
	 * @param fwid
	 * @return
	 * @throws Exception
	 * @date 2013-11-28 上午10:19:53
	 */
	public RkJbxxBean getExsitRkxxObject(String sfzh,String rylb, String fwid) throws Exception;
	
	
	/**
	 * 根据身份证号码查询人员住址
	 * @param sfzh
	 * @return
	 * @throws Exception
	 */
	public RkDzxxBean queryDzxxBySfzh(String sfzh) throws Exception;
	
	/**
	 * 根据人员编号查询人员住址
	 * @param rybh
	 * @return
	 * @throws Exception
	 */
	public RkDzxxBean queryDzxxByRybh(String rybh) throws Exception;
	
	public boolean isExistsSfzh(String sfzh) throws Exception;
	/**
	 * 更新流动人口信息(延期处理)
	 * @param ldrkBean
	 * @throws Exception
	 * @date 2013-8-19 上午11:28:50
	 */
	public void updateLdrkInfoBean(LdrkxxBean ldrkBean) throws Exception;
	/**
	 * 更新流动人口信息(延期处理(注销))
	 * @param ldrkBean
	 * @throws Exception
	 * @date 2013-8-19 上午11:28:50
	 */
	public void updateLdrkInfoBeanForZX(LdrkxxBean ldrkBean) throws Exception;
	/**
	 * 根据zzbh 查询流动人口信息
	 */
	public LdrkxxBean  queryLdrkBeanByZzbh(String zzbh)  throws Exception;
	
	/**
	 * 注销流动人口
	 * @param ldrkBean
	 * @throws Exception
	 */
	public void logoutLdrkInfo(LdrkxxBean ldrkBean) throws Exception;
	
	/**
	 * 批量注销流动人口
	 */
	public void batchLogoutLdrkInfo(List<LdrkxxBean>  ldrkList) throws Exception;
	
	
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
	 * 恢复人口数据
	 * @param rkBean
	 * @param rylb
	 * @throws Exception
	 */
	public void recoveryRkInfo(RkxxBean rkBean,String rylb,String bh) throws Exception;
	
	public void deleteWlhrkInfo(String wlhrkbh) throws Exception;
	
	public void logoutWlhrkInfo(RkwlczhkBean wlczhkBean) throws Exception;
	
	
	/**
	 * 计划生育模块 
	 */
	public void insertRkJhsyBean(RkJhsyBean jhsyBean) throws Exception;
	
	public void updateRkJhsyBean(RkJhsyBean jhsyBean) throws Exception;
	
	public void deleteRkJhsyBean(String id) throws Exception;
	
	public PageResultInfo<RkJhsyBean> queryJhsyBeanPage(RkQueryBean queryBean,PageInfo pageInfo) throws Exception;
	
	public RkJhsyBean queryJhsyBeanByjlbh(String id) throws Exception;
	
	public RkJhsyBean queryJhsyBeanByRybh(String rybh) throws Exception;
	
	//删除关系人
	public void delGxr(String id);
	

	public JwrkxxBean queryJwrkJbxxByRybh(String rybh) throws Exception;
	
	public void delLxfs(String lxfsId);
	
	/**
	 * 根据 fwrkid 删除房屋人口管理表 
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

	public LdrkxxBean queryLdrkBeanByRybhAndYxzt(String rybh) throws Exception;
	
	
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
	 * 恢复房屋人口关联表
	 * @param rkfwBean
	 * @throws Exception
	 */
	public void recoveryRkfwInfo(RkfwglBean rkfwBean) throws Exception;
	
	/***
	 * 插入照片信息
	 * @param zpxxBean
	 * @throws Exception
	 * @date Feb 22, 2014 4:01:41 PM
	 */
	public void saveRkzpxxBean(RkzpxxBean zpxxBean) throws Exception;
	
	/**
	 * 查询人口照片信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date Feb 22, 2014 4:54:39 PM
	 */
	public List<RkzpxxBean> queryRkzpxxBeansByRybh(String rybh) throws Exception;
	
	public void saveRemoteZpxx(RkxxBean rkBean);
	
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
	
	
	public RkJbxxBean queryRkxxBeanBysfzh(String sfzh) throws Exception;
	
	public RkJbxxBean queryHzRkJbxxByHH(String hh) throws Exception;
	
	public List<CzrkxxBean> queryCzrkBeansByQueryBean(RkQueryBean queryBean) throws Exception;
	
	public List<CzrkxxBean> queryCzrkBeansByczrkbhs(String czrkbhs) throws Exception;
	
	public List<JzrkxxBean> queryJzrkBeansByQueryBean(RkQueryBean queryBean)  throws Exception;
	
	public List<JzrkxxBean> queryJzrkBeansByczrkbhs(String czrkbhs)  throws Exception;

	public List<RkJbxxBean> querySyrkBeansByQueryBean(RkQueryBean queryBean) throws Exception;
	
	public List<RkJbxxBean> querySyrkBeanByrkids(String rkids) throws Exception;
	
	public List<RkJbxxBean> queryRkjbxxByRybhs(String rybhs) throws Exception;

	
	/**
	 * 通过人员编号查询居住记录 t_lsgl_rkfw_gl
	 */
	public PageResultInfo<RkfwglBean> queryRkfwglByRybh(String rybh,PageInfo pageInfo) throws Exception;
	
	/**
	 *查询各个人员类别的人员与房屋管理bean
	 * @param bhs
	 * @return
	 */
	public CzrkxxBean queryCzrkFwglInfoByCzrkbh(String bhs);
	public JwrkxxBean queryJwrkFwglInfoByJwbh(String bhs);
	public JzrkxxBean queryJzrkFwglInfoByJzbh(String bhs);
	public LdrkxxBean queryLdrkFwglBeanByZzbh(String bhs);
	public RkwlczhkBean queryWlhrkFwglInfoByWlhbh(String bhs);
	public PageResultInfo<RkfwglBean> queryRkfwglBySfzh(String sfzh,
			PageInfo pageInfo);
	
	
	
	public void zxRkjlByRylbAndRybh(String rylb,String rybh) throws Exception;
	
	public PageResultInfo<RkJbxxBean> queryCzrkInfoBeanBySfzh(PageInfo pageInfo, RkQueryBean queryBean);
	
	public void saveRkJbxxBean(RkxxBean rkBean) throws Exception;
	
	public void saveCzrkxxInfo(RkxxBean rkBean) throws Exception;
	
	public CzrkxxBean queryCzrkxxBeanByFwidAndSfzh(String sfzh, String fwid) throws Exception;
	
	public void saveRkfwglBean(RkxxBean rkBean) throws Exception;
	
	public RkxxBean queryRklsjlBeans(RkxxBean rkBean, String rybh) throws Exception;
	
	public List<RkgxrxxBean> queryRkgxrBeansByRybh(String rybh) throws Exception;
	
	public RktmtzxxBean queryRktmtzBeanByRybh(String rybh) throws Exception;
	
	public List<RklxfsxxBean> queryRklxfsBeansByRybh(String rybh) throws Exception;
	
	public void saveGxrShxx(RkxxBean rkBean) throws Exception;
	
	public void saveTmtzxx(RkxxBean rkBean) throws Exception;
	
	public void saveLxfsxx(RkxxBean rkBean) throws Exception;
	
	public LdrkxxBean queryLdrkxxBeanBySfzhAndFwid(String sfzh, String fwid) throws Exception;
	
	public void saveLdrkxx(RkxxBean rkBean) throws Exception;
	
	public JzrkxxBean queryJzrkxxBeanBySfzhAndFwid(String sfzh, String fwid) throws Exception;
	
	public void saveJzrkxx(RkxxBean rkBean) throws Exception;
	
	public RkwlczhkBean queryWlhrkxxBeanBySfzhAndFwid(String sfzh, String fwid) throws Exception;
	
	public void saveWlhrkxx(RkxxBean rkBean) throws Exception;
	
	public RkJbxxBean queryRkJbxxBeanByRybh(String rybh) throws Exception;
	
	public String queryFwidByRkfwglid(String rkfwglid) throws Exception;
	
	public void saveJwrkxxBean(RkxxBean rkBean) throws Exception;
	
	public String getExistsRkBeanDzmc(String sfzh);
	
	public void converCzrkInfoToRkJbxx(CzrkxxBean czrkxxBean, RkJbxxBean jbxxBean);
	
	public PageResultInfo<RkgxrxxBean> queryGlgxrPageResultBySfzh(String sfzh, PageInfo pageInfo);
	
}
