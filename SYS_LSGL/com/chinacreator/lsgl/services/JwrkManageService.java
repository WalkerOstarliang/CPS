package com.chinacreator.lsgl.services;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.JwrkxxBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.lsgl.dao.JwrkManageDao;
import com.chinacreator.lsgl.dao.LsglRkJbxxDao;
import com.chinacreator.lsgl.dao.impl.LsglRkJbxxDaoImpl;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.frameworkset.orm.transaction.TransactionManager;

public class JwrkManageService
{
	private JwrkManageDao dao;
	private LsglRkJbxxDao rkDao;
	
	public JwrkManageService()
	{
		dao = new JwrkManageDao();
		rkDao = new LsglRkJbxxDaoImpl();
	}
	
	/**
	 * 查询境外人口列表
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @date Aug 14, 2014 8:53:08 AM
	 */
	public PageResultInfo<JwrkxxBean> queryJwrkPageResultInfo(RkQueryBean queryBean, PageInfo pageInfo)
	{
		return dao.queryJwrkPageResultInfo(queryBean, pageInfo);
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
		return dao.queryLsJzJwrkPageResultInfo(queryBean, pageInfo);
	}
	
	/**
	 * 通过条件查询境外人口信息
	 * @param queryBean
	 * @return
	 * @date Aug 15, 2014 2:51:21 PM
	 */
	public JwrkxxBean queryJwrkBeanByQueryBean(RkQueryBean queryBean)
	{
		return dao.queryJwrkJbxxBeanByQueryBean(queryBean);
	}
	
	/**
	 * 保存境外人口信息
	 * @param queryBean
	 * @return
	 * @date Aug 15, 2014 3:46:32 PM
	 */
	public boolean saveJwrkBean(JwrkxxBean jwrkBean)
	{
		TransactionManager tm = new TransactionManager();
		try
		{
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			jwrkBean.setDjdwdm(loginInfo.getOrgcode());
			jwrkBean.setDjdwmc(loginInfo.getOrgname());
			jwrkBean.setDjrsfzh(loginInfo.getSfzh());
			jwrkBean.setDjrxm(loginInfo.getRealname());
			jwrkBean.setCzdwdm(loginInfo.getOrgcode());
			jwrkBean.setCzdwmc(loginInfo.getOrgname());
			jwrkBean.setCzrsfzh(loginInfo.getSfzh());
			jwrkBean.setCzrxm(loginInfo.getRealname());
			jwrkBean.setCzrjh(loginInfo.getUsername());
			jwrkBean.setZrdwdm(loginInfo.getOrgcode());
			jwrkBean.setZrdwmc(loginInfo.getOrgname());
			jwrkBean.setZrmjxm(loginInfo.getRealname());
			jwrkBean.setZrmjjh(loginInfo.getUsername());
			
			//人口房屋关联
			RkfwglBean rkfwglBean = new RkfwglBean();
			String rkfwglid = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
			rkfwglBean.setFwid(jwrkBean.getFwid());
			rkfwglBean.setDzid(jwrkBean.getDzid());
			rkfwglBean.setRzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			rkfwglBean.setZxbs("0");
			rkfwglBean.setZxsj(null);
			rkfwglBean.setZxdwdm(null);
			rkfwglBean.setZxdwmc(null);
			rkfwglBean.setZxmjxm(null);
			rkfwglBean.setRkfwglid(rkfwglid);
			if (ValidateHelper.isNotEmptyString(jwrkBean.getRybh()))
			{
				//保存人口房屋关联数据
				RkfwglBean oldrkfwglbean = dao.getJwrkCurrentRkfwglBean(jwrkBean.getRybh());
				rkfwglBean.setRybh(jwrkBean.getRybh());
				if (oldrkfwglbean != null && !oldrkfwglbean.getFwid().equals(jwrkBean.getFwid()))
				{
					String rybh = jwrkBean.getRybh();
					String zxyy = "该境外人员已经被登记到别的地址下";
					dao.zxRkfwglByRybh(rybh, zxyy);
					rkDao.insertFwRkGlBean(rkfwglBean);
					jwrkBean.setRkfwglid(rkfwglid);
				}
				else if (oldrkfwglbean == null || ValidateHelper.isEmptyString(oldrkfwglbean.getFwid()))
				{
					rkDao.insertFwRkGlBean(rkfwglBean);
					jwrkBean.setRkfwglid(rkfwglid);
				}
				else if (oldrkfwglbean != null)
				{
					jwrkBean.setRkfwglid(oldrkfwglbean.getRkfwglid());
				}
			}
			else
			{
				String rybh =  CommonSequenceHelper.getRybh(loginInfo.getOrgcode());
				jwrkBean.setRybh(rybh);
				rkfwglBean.setRybh(rybh);
				jwrkBean.setRkfwglid(rkfwglid);
				rkDao.insertFwRkGlBean(rkfwglBean);
			}
			
			//查询境外人员是否在本辖区内登记如果登记，则更新
			JwrkxxBean oldJwrkBean = dao.queryJwrkInfoByRybhAndDjdwdm(jwrkBean.getRybh(), loginInfo.getOrgcode());
			if (oldJwrkBean != null)
			{
				jwrkBean.setJwbh(oldJwrkBean.getJwbh());
			}
			
			//更新
			if (ValidateHelper.isNotEmptyString(jwrkBean.getJwbh()))
			{
				dao.updateJwrkBean(jwrkBean);
			}
			//新增
			else
			{
				String jwbh = CommonSequenceHelper.getJwbh(loginInfo.getOrgcode());
				jwrkBean.setJwbh(jwbh);
				dao.insertJwrkBean(jwrkBean);
			}
			tm.commit();
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			jwrkBean.setJwbh("");
			try
			{
				tm.rollback();
			}
			catch(Exception e1)
			{
			}
		}
		return false;
	}
	
	public void updateJwrkZxbs(RkQueryBean queryBean) throws Exception
	{
		dao.updateJwrkZxbs(queryBean);
	}
}
