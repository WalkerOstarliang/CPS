package com.chinacreator.afgl.services;

import com.chinacreator.afgl.bean.SqddbxxBean;
import com.chinacreator.afgl.bean.SqgbxxBean;
import com.chinacreator.afgl.dao.SqgbxxDao;
import com.chinacreator.afgl.query.SqddbxxQueryBean;
import com.chinacreator.afgl.query.SqgbxxQueryBean;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.orm.transaction.TransactionManager;

public class SqgbxxService
{

	/**
	 * 社区干部类别查询对象
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<SqgbxxBean> querySqgbxxPageResultInfoByQueryBean(SqgbxxQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		return SqgbxxDao.querySqgbxxPageResultInfoByQueryBean(queryBean, pageInfo);
	}
	public PageResultInfo<SqddbxxBean> querySqddbxxPageResultInfoByQueryBean(SqddbxxQueryBean queryBeanddb, PageInfo pageInfo) throws Exception
	{
		return SqgbxxDao.querySqddbxxPageResultInfoByQueryBean(queryBeanddb, pageInfo);
	} 
	
	/**
	 * 查询社区干部信息通过干部编号
	 * @param gbbh
	 * @return
	 * @throws Exception
	 */
	public SqgbxxBean querySqgbxxBeanByGbbh(String gbbh) throws Exception
	{
		return SqgbxxDao.querySqgbxxBeanByGbbh(gbbh);
	}
	
	public SqddbxxBean  querySqddbxxBeanById(String id) throws Exception{
		return SqgbxxDao.querySqddbxxBeanById(id);
	}
	/**
	 * 插入社区干部
	 * @param bean
	 * @throws Exception
	 */
	public void insertSqgbxxBean(SqgbxxBean bean) throws Exception
	{
		SqgbxxDao.insertSqgbxxBean(bean);
	}
	
	public void insertSqddbxxBean(SqddbxxBean bean) throws Exception
	{
		SqgbxxDao.insertSqddbxxBean(bean);
	}
	
	/**
	 * 更新社区干部信息
	 * @param bean
	 * @throws Exception
	 */
	public void updateSqgbxxBean(SqgbxxBean bean) throws Exception
	{
		SqgbxxDao.updateSqgbxxBean(bean);
	}
	public void updateSqddbxxBean(SqddbxxBean bean) throws Exception
	{
		SqgbxxDao.updateSqddbxxBean(bean);
	}
	/**
	 * 通过干部编号删除干部信息，做物理删除
	 * @param gbbh
	 * @throws Exception
	 */
	public void deleteSqgbxxBeanByGbbh(String gbbh) throws Exception
	{
		SqgbxxDao.deleteSqgbxxBeanByGbbh(gbbh);
	}
	
	public void deleteSqddbxxBeanById(String id) throws Exception{
		SqgbxxDao.deleteSqddbxxBeanById(id);
	}
	
	/**
	 * 保存社区干部信息
	 * @param bean
	 * @param operType
	 * @return
	 * @throws Exception
	 */
	public SqgbxxBean saveSqgbxxBean(SqgbxxBean bean, String operType) throws Exception
	{
		if (ValidateHelper.isEmptyString(bean.getGbbh()))
		{
			bean.setGbbh(CommonSequenceHelper.getSQGBBH(bean.getSssqbh()));
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			bean.setDjrsfzh(loginInfo.getSfzh());
			insertSqgbxxBean(bean);
		}
		else
		{
			updateSqgbxxBean(bean);
		}
		return bean;
	}

	/**
	 * SqddbxxBean ddbbean
	 * @param ddbbean
	 * @param operType
	 * @return
	 * @throws Exception
	 */
	public SqddbxxBean saveSqddbxxBean(SqddbxxBean ddbbean, String operType) throws Exception
	{
		if (ValidateHelper.isEmptyString(ddbbean.getId()))
		{
			// 获得主键id
			StringBuffer sbf = new StringBuffer();
			sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
			sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
			sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_AFGL_SQDDBID"));
			ddbbean.setId(sbf.toString());
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			ddbbean.setDjrsfzh(loginInfo.getSfzh());
			insertSqddbxxBean(ddbbean);
		}
		else
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			ddbbean.setXgrjh(loginInfo.getUsername());
			ddbbean.setXgrxm(loginInfo.getRealname());
			updateSqddbxxBean(ddbbean);
		}
		return ddbbean;
	}

	/**
	 * 批量删除干部信息
	 * @param gbbhs
	 * @throws Exception
	 */
	public void batchDeleteSqgbxxBeanByGbbhs(String gbbhs) throws Exception
	{
		if (ValidateHelper.isNotEmptyString(gbbhs))
		{
			TransactionManager tm = null;
			try
			{
				tm = new TransactionManager();
				tm.begin();
				String[] gbbharr = gbbhs.split(",");
				for (String gbbh : gbbharr)
				{
					deleteSqgbxxBeanByGbbh(gbbh);
				}
				tm.commit();
			}
			catch(Exception e)
			{
				e.printStackTrace();
				tm.rollback();
			}
		}
	}
	
	public void DeleteSqddbxxBeanById(String id) throws Exception{
		if (ValidateHelper.isNotEmptyString(id))
		{
			try
			{
				deleteSqddbxxBeanById(id);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 根据身份证查询干部信息
	 * @param sfzh
	 * @return
	 * @throws Exception
	 */
	public  SqgbxxBean querySqgbxxBeanBySfzh(String sfzh) throws Exception
	{
		return SqgbxxDao.querySqgbxxBeanBySfzh(sfzh);
	}
	
	/**
	 * 查询社区里社区干部数量
	 * @param sssqbh
	 * @param sfzh
	 * @return
	 * @date Feb 28, 2014 8:38:38 AM
	 */
	public int querySqgbCountBySssqbhAndSfzh(String sssqbh, String sfzh) throws Exception
	{
		return SqgbxxDao.querySqgbCountBySssqbhAndSfzh(sssqbh, sfzh);
	}
	
	public int querySqddbCountBySssqbhAndSfzh(String sqdm,String sfzh) throws Exception{
		return SqgbxxDao.querySqddbCountBySssqbhAndSfzh(sqdm, sfzh);
	}
}
