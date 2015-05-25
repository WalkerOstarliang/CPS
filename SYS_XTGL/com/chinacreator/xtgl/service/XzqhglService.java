package com.chinacreator.xtgl.service;

import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.dzgl.bean.StxxBean;
import com.chinacreator.xtgl.bean.HnXzqhBean;
import com.chinacreator.xtgl.bean.StxxbgBean;
import com.chinacreator.xtgl.dao.XzqhglDao;
import com.frameworkset.orm.transaction.TransactionManager;

public class XzqhglService
{
	
	/**
	 * 查询最大乡镇街道代码
	 * @param parent_dm
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public String queryMaxXzjddmByParentDM(String parent_dm, String type) throws Exception
	{
		return XzqhglDao.queryMaxXzjddmByParentDM(parent_dm, type);
	}
	
	public String queryMaxXzjddm(String parent_dm) throws Exception
	{
		return XzqhglDao.queryMaxXzjddmByParentDm(parent_dm);
	}
	
	/**
	 * 查询最大社区代码
	 * @param parent_dm
	 * @return
	 * @throws Exception
	 */
	public String queryMaxSqdmByParentDm(String parent_dm) throws Exception
	{
		return XzqhglDao.queryMaxSqdmByParentDm(parent_dm);
	}
	

	/**
	 * 查询湖南行政区划
	 * @param parentdm
	 * @return
	 * @throws Exception
	 */
	public List<HnXzqhBean> queryHnXzqhChildByParentDm(String parentdm) throws Exception
	{
		List<HnXzqhBean> list = XzqhglDao.queryHnXzqhChildByParentDm(parentdm);
		return list;
		
	}
	
	/**
	 * 查询湖南行政区划通过父类代码
	 * @param parentdm
	 * @return
	 * @throws Exception
	 */
	public List<HnXzqhBean> queryHnXzqhBeanByParentDm(String parentdm) throws Exception
	{
		
		return XzqhglDao.queryHnXzqhBeanByParentDm(parentdm);
		
	}
	
	/**
	 * 查询湖南行政区划对象
	 * @param dm
	 * @return
	 * @throws Exception
	 */
	public HnXzqhBean queryHnXzqhBeanByDm(String dm) throws Exception
	{
		return XzqhglDao.queryHnXzqhBeanByDm(dm);
	}
	
	/**
	 * 插入湖南行政区划
	 * @param bean 对象bean
	 * @throws Exception
	 */
	public void insertHnxzqhBean(HnXzqhBean bean) throws Exception
	{
		XzqhglDao.insertHnxzqhBean(bean);
	}
	
	/**
	 * 更新湖南行政区划
	 * @param bean
	 * @throws Exception
	 */
	public void updateHnxzqhBean(HnXzqhBean bean) throws Exception
	{
		XzqhglDao.updateHnxzqhBean(bean);
	}
	
	/**
	 * 注销行政区划
	 * @param dm
	 * @throws Exception
	 */
	public void zxHnxzqhBean(String dm) throws Exception
	{
		XzqhglDao.zxHnxzqhBean(dm);
	}
	
	/**
	 * 保存湖南行政区划
	 * @param bean
	 * @param operType
	 * @throws Exception
	 */
	public void saveHnxzqhBean(HnXzqhBean bean,String operType) throws Exception
	{
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			insertHnxzqhBean(bean);
		}
		else if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			updateHnxzqhBean(bean);
			
			//如果是注销则注销下面的孩子节点
			if ("0".equals(bean.getIsvalid()))
			{
				XzqhglDao.zxHnxzqhByDm(bean.getIsvalid());
			}
		}
	}
	
	/**
	 * 执行实体信息的迁移
	 * @param stids
	 * @param toSqdm
	 * @param toJwqdm
	 * @return
	 * @date Mar 26, 2014 2:19:36 PM
	 */
	public boolean executeStxxBeanChange(String stid, String toSqdm, String toJwqdm)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		//查询原始实体信息
		StxxBean stxxBean = XzqhglDao.queryStxxBeanByStid(stid);
		if (stxxBean !=null)
		{
			TransactionManager tm = null;
			try
			{
				tm = new TransactionManager();
				tm.begin();
				//更新实体社区代码
				XzqhglDao.updateStxxBeanOfSqdm(stid, toSqdm);
				
				//更新实体关联数据
				XzqhglDao.updateStglData(stid, toSqdm);
				
				//生成实体变更记录
				StxxbgBean stbgBean = new StxxbgBean();
				stbgBean.setId(CommonDBBaseHelper.getCommonSequence());
				stbgBean.setQystid(stid);
				stbgBean.setCzdwdm(loginInfo.getOrgcode());
				stbgBean.setCzdwmc(loginInfo.getOrgname());
				stbgBean.setCzrjh(loginInfo.getUsername());
				stbgBean.setCzrsfzh(loginInfo.getSfzh());
				stbgBean.setCzrxm(loginInfo.getRealname());
				stbgBean.setFromsqdm(stxxBean.getSqdm());
				stbgBean.setFromjwqdm(stxxBean.getSsjwqdm());
				stbgBean.setIsexec("1");
				stbgBean.setTojwqdm(toJwqdm);
				stbgBean.setTosqdm(toSqdm);
				XzqhglDao.insertStbgBean(stbgBean);
				tm.commit();
				return true;
			}
			catch(Exception e)
			{
				e.printStackTrace();
				try
				{
					tm.rollback();
				}
				catch(Exception e1)
				{
				}
				try
				{
					//生成实体变更记录
					StxxbgBean stbgBean = new StxxbgBean();
					stbgBean.setId(CommonDBBaseHelper.getCommonSequence());
					stbgBean.setQystid(stid);
					stbgBean.setCzdwdm(loginInfo.getOrgcode());
					stbgBean.setCzdwmc(loginInfo.getOrgname());
					stbgBean.setCzrjh(loginInfo.getUsername());
					stbgBean.setCzrsfzh(loginInfo.getSfzh());
					stbgBean.setCzrxm(loginInfo.getRealname());
					stbgBean.setFromsqdm(stxxBean.getSqdm());
					stbgBean.setFromjwqdm(stxxBean.getSsjwqdm());
					stbgBean.setIsexec("0");
					stbgBean.setTojwqdm(toJwqdm);
					stbgBean.setTosqdm(toSqdm);
					XzqhglDao.insertStbgBean(stbgBean);
				}
				catch(Exception e1)
				{
				}
			}
		}
		return false;
	}
}
