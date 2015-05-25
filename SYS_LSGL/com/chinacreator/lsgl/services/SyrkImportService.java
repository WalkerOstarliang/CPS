package com.chinacreator.lsgl.services;

import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.SyrkImportBean;
import com.chinacreator.lsgl.dao.SyrkImportDao;

/**
 * 导入的实有人口信息
 * @param syrkBeans
 * @throws Exception
 * @date Jan 5, 2015 10:13:40 AM
 */
public class SyrkImportService
{
	
	private SyrkImportDao syrkDao;
	
	public SyrkImportService()
	{
		syrkDao = new SyrkImportDao();
	}
	
	/**
	 * 保存导入的实有人口信息
	 * @param syrkBeans
	 * @throws Exception
	 * @date Jan 5, 2015 10:13:40 AM
	 */
	public void saveImportSyrkxx(List<SyrkImportBean> syrkBeans) throws Exception
	{
		if (ValidateHelper.isNotEmptyCollection(syrkBeans))
		{
			SyrkImportBean yczSyrkZdryBean = null;
			for (SyrkImportBean syrkBean : syrkBeans)
			{
				yczSyrkZdryBean = syrkDao.getImportSyrkBean(syrkBean.getSfzh(), syrkBean.getFwid());
				if (yczSyrkZdryBean != null)
				{
					syrkDao.updateImportSyrkxx(syrkBean);
				}
				else
				{
					syrkDao.insertImportSyrkxx(syrkBean);
				}
			}
		}
	}
	
	/**
	 * 查询导入实有人口的重点人员
	 * @param syrkBean
	 * @param pageInfo
	 * @return
	 * @date Jan 6, 2015 2:34:04 PM
	 */
	public PageResultInfo<SyrkImportBean> queryImportSyrkZdryPageResult(SyrkImportBean syrkBean, PageInfo pageInfo) throws Exception
	{
		return syrkDao.queryImportSyrkZdryPageResult(syrkBean, pageInfo);
	}
	
	/**
	 * 查询导入实有人口
	 * @param syrkBean
	 * @param pageInfo
	 * @return
	 * @date Jan 6, 2015 2:34:04 PM
	 */
	public PageResultInfo<SyrkImportBean> queryImportSyrkPageResult(SyrkImportBean syrkBean, PageInfo pageInfo) throws Exception
	{
		return syrkDao.queryImportSyrkPageResult(syrkBean, pageInfo);
	}
	
	/**
	 * 实有人口核查导入查询
	 * @param syrkBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 * @date Jan 8, 2015 10:44:53 AM
	 */
	public PageResultInfo<SyrkImportBean> querySyrkImportHcPageResult(SyrkImportBean syrkBean, PageInfo pageInfo) throws Exception
	{
		return syrkDao.querySyrkImportHcPageResult(syrkBean, pageInfo);
	}
}
