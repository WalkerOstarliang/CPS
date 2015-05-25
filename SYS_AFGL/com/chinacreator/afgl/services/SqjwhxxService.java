package com.chinacreator.afgl.services;

import com.chinacreator.afgl.bean.SqjwhxxBean;
import com.chinacreator.afgl.dao.SqjwhxxDao;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.orm.transaction.TransactionManager;

public class SqjwhxxService
{
	/**
	 * 查询社区警务会分页信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<SqjwhxxBean> querySqJwhPageResultInfoByQueryBean(
			QueryBean queryBean, PageInfo pageInfo) throws Exception {
		return SqjwhxxDao.querySqJwhPageResultInfoByQueryBean(queryBean, pageInfo);
	}
	
	
	
	/**
	 * 查询社区居委会对象通过居委会编号
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public SqjwhxxBean querySqjwhBeanByJwhbh(String jwhbh) throws Exception {
		return SqjwhxxDao.querySqjwhBeanByJwhbh(jwhbh);
	}
	
	/**
	 * 插入居委会对象
	 * @param bean
	 * @throws Exception
	 */
	public void insertJwhBean(SqjwhxxBean bean) throws Exception
	{
		SqjwhxxDao.insertJwhBean(bean);
	}
	
	/**
	 * 更新居委会对象
	 * @param bean
	 * @throws Exception
	 */
	public void updateJwhBean(SqjwhxxBean bean) throws Exception
	{
		SqjwhxxDao.updateJwhBean(bean);
	}
	
	/**
	 * 保存社区居委会基本信息
	 * @param bean
	 * @param operType
	 * @throws Exception
	 */
	public SqjwhxxBean saveJwhBean(SqjwhxxBean bean, String operType) throws Exception
	{
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			bean.setJwhbh(CommonSequenceHelper.getSQJWHBH(bean.getSsxzqh()));
			insertJwhBean(bean);
		}
		else if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			updateJwhBean(bean);
		}
		return bean;
	}
	
	/**
	 * 删除居委会对象通过居委会编号
	 * @param jwhbh
	 * @throws Exception
	 */
	public void deleteJwhBeanByJwhbh(String jwhbh) throws Exception
	{
		SqjwhxxDao.deleteJwhBeanByJwhbh(jwhbh);
	}

	/**
	 * 批量删除居委会
	 * @param jwhbhs
	 * @throws Exception
	 */
	public void batchDeleteJwhBeanByJwhbhs(String jwhbhs) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			if (ValidateHelper.isNotEmptyString(jwhbhs))
			{
				String[] jwhbharr = jwhbhs.split(",");
				for (String jwhbh : jwhbharr)
				{
					deleteJwhBeanByJwhbh(jwhbh);
				}
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
