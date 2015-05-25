package com.chinacreator.afgl.services;

import java.util.List;

import com.chinacreator.afgl.bean.SqJbqktjBean;
import com.chinacreator.afgl.bean.SqJbxxBean;
import com.chinacreator.afgl.bean.Xqjbxx;
import com.chinacreator.afgl.bean.XzsqbgjlBean;
import com.chinacreator.afgl.dao.SqJbxxDao;
import com.chinacreator.afgl.query.SqJbxxQueryBean;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.orm.transaction.TransactionManager;

public class SqJbxxService
{
	/**
	 * 查询分页社区基本西悉尼
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<SqJbxxBean> querySqJbxxPageResultByQueryBean(SqJbxxQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		return SqJbxxDao.querySqJbxxPageResultByQueryBean(queryBean, pageInfo);
	}
	
	/**
	 * 同派出所代码查询社区
	 * @param pcsdm
	 * @return
	 * @throws Exception
	 */
	public List<SqJbxxBean> querySqJbxxBeanListByPcsdm(String pcsdm) throws Exception
	{
		return SqJbxxDao.querySqJbxxBeanListByPcsdm(pcsdm);
	}
	
	/**
	 * 通过警务室代码加载社区信息
	 * @param jwsdm
	 * @return
	 * @throws Exception
	 */
	public List<SqJbxxBean> querySqJbxxBeanListByJwsdm(String jwsdm) throws Exception
	{
		return SqJbxxDao.querySqJbxxBeanListByJwsdm(jwsdm);
	}
	
	public List<SqJbxxBean> querySqJbxxBeanListByJdxzdm(String jdxzdm) throws Exception
	{
		return SqJbxxDao.querySqJbxxBeanListByJdxzdm(jdxzdm);
	}
	
	public List<SqJbxxBean> querySqJbxxBeanListByJdxzdmAndJwqdm(String jwqdm) throws Exception
	{
		return SqJbxxDao.querySqJbxxBeanListByJdxzdmAndJwqdm(jwqdm);
	}
	
	/**
	 * 查询社区基本西悉尼
	 * @param sqbh
	 * @return
	 * @throws Exception
	 */
	public SqJbxxBean querySqJbxxBeanBySqbh(String sqbh) throws Exception
	{
		return SqJbxxDao.querySqJbxxBeanBySqbh(sqbh);
	}
	
	/**
	 * 插入社区基本信息
	 * @param bean
	 * @throws Exception
	 */
	public void insertSqJbxxBean(SqJbxxBean bean) throws Exception
	{
		SqJbxxDao.updateHnxzqhBySqbh(bean);
		SqJbxxDao.insertSqJbxxBean(bean);
		
	}
	
	/**
	 * 更新社区基本信息
	 * @param bean
	 * @throws Exception
	 */
	public void updateSqJbxxBean(SqJbxxBean bean) throws Exception
	{
		SqJbxxDao.updateSqJbxxBean(bean);
	}
	
	/**
	 * 保存社区信息
	 * @param sqBean
	 * @param operType
	 * @throws Exception
	 */
	public SqJbxxBean saveSqJbxxBean(SqJbxxBean sqBean, String operType)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TransactionManager tm = null;
		try
		{
			//保存社区信息
			tm = new TransactionManager();
			tm.begin();
			sqBean.setDjdwdm(loginInfo.getOrgcode());
			sqBean.setDjdwmc(loginInfo.getOrgname());
			sqBean.setDjrjh(loginInfo.getUsername());
			sqBean.setDjrxm(loginInfo.getRealname());
			sqBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
			if (ValidateHelper.isNotEmptyString(sqBean.getSqid()))
			{
				updateSqJbxxBean(sqBean);
			}
			else
			{
				sqBean.setSqid(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_af_sqjbxxid"));
				insertSqJbxxBean(sqBean);
			}
			
			//插入社区迁移变更记录
			if (ValidateHelper.isNotEmptyString(sqBean.getFromJwqdm()) 
					&& ValidateHelper.isNotEmptyString(sqBean.getGxsqjwsdm()) 
					&& !sqBean.getGxsqjwsdm().equals(sqBean.getFromJwqdm()))
			{
				XzsqbgjlBean bgjlBean = new XzsqbgjlBean();
				bgjlBean.setId(CommonDBBaseHelper.getCommonSequence());
				bgjlBean.setCzdwdm(loginInfo.getOrgcode());
				bgjlBean.setCzdwmc(loginInfo.getOrgname());
				bgjlBean.setCzrjh(loginInfo.getUsername());
				bgjlBean.setCzrsfzh(loginInfo.getSfzh());
				bgjlBean.setCzrxm(loginInfo.getRealname());
				bgjlBean.setFromjwqdm(sqBean.getFromJwqdm());
				bgjlBean.setIsexec("0");
				bgjlBean.setQysqdm(sqBean.getSqbh());
				bgjlBean.setTojwqdm(sqBean.getGxsqjwsdm());
				SqJbxxDao.insertXzqhbgjl(bgjlBean);
			}
			tm.commit();
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
		}
		return sqBean;
	}
	
	/**
	 * 注销社区基本信息，不做物理删除
	 * @param sqbh
	 * @throws Exception
	 */
	public void deleteSqJbxxBeanBySqbh(String sqbhs) throws Exception
	{
		if (ValidateHelper.isNotEmptyString(sqbhs))
		{
			String[] sqbharr = sqbhs.split(",");
			for (String sqbh : sqbharr)
			{
				SqJbxxDao.deleteSqJbxxBeanBySqbh(sqbh);
			}
		}
		
	}
	
	/**
	 * 批量注销
	 * @param sqbhs
	 * @throws Exception
	 */
	public void batchDeleteSqJbxxBeanBySqbhs(String sqbhs) throws Exception
	{
		
	}
	
	/**
	 * 通过社区编号获取社区的基本情况
	 * @param sqbh
	 * @throws Exception
	 */
	public SqJbqktjBean querySqjbqkBySqbh(String sqbh) throws Exception
	{
		return SqJbxxDao.querySqjbqkBySqbh(sqbh);
	}
	
	/**
	 * 通过社区警务
	 * @param jwsdm
	 * @return
	 * @throws Exception
	 */
	public List<SqJbqktjBean> querySqjbqkByJwsdm(String jwsdm) throws Exception
	{
		return SqJbxxDao.querySqjbqkByJwsdm(jwsdm);
	}
	
	public SqJbxxBean querySqJbxxBeanByDm(String sqdm)throws Exception
	{
		return SqJbxxDao.querySqJbxxBeanByDm(sqdm);
	}
	
	/**
	 * 查询辖区情况
	 * @throws Exception
	 */
	public Xqjbxx queryXqqk(QueryBean bean) throws Exception{
		return SqJbxxDao.queryXqqk(bean);
	}
}
