package com.chinacreator.common.cps.business;
 
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.XzqhMappingBean;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class DictionaryBusiness {
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/common/cps/business/dictionary_dmbusiness-sql.xml");
	
	/**
	 * 分页查询t_common_dictionary_dm  信息
	 * @param zdlb
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<SystemDictionaryBean> queryDictionaryBeanByZdlb(SystemDictionaryBean bean,PageInfo  pageInfo) throws Exception{
		ListInfo listInfo=executor.queryListInfoBeanWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, "queryDictionaryBeanByZdlb", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 插入 t_common_dictionary_dm 信息
	 * @param bean
	 * @throws Exception
	 */
	public void insertDictionaryBean(SystemDictionaryBean bean) throws Exception{
		String id=CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "T_COMMON_DICTIONARY_DM_ID");
		String dm=CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "T_COMMON_DICTIONARY_DM_dm");
		bean.setId(id);
		bean.setDm(bean.getZdlb().substring(bean.getZdlb().length()-4)+dm);	
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDictionaryBean", bean);
	}
	
	/**
	 * 判断zdmc是否存在
	 * @throws Exception 
	 */
	public boolean isExistMC(String mc) throws Exception{
		List<SystemDictionaryBean> list=executor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, "isExistMC", mc);
		if(list.size()>0){
			return true;
		}
		return false;
	}
	
	public List<SystemDictionaryBean> queryXzjdDicBeanByPcsdm(String sspcsdm)
	{
		try
		{
			return executor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, "queryXzjdDicBeanByPcsdm", sspcsdm);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new ArrayList<SystemDictionaryBean>();
	}
	
	public List<SystemDictionaryBean> queryXzjdDicBeanByPcsdmAndXzqhdm(String sspcsdm, String xzqhdm)
	{
		try
		{
			return executor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, "queryXzjdDicBeanByPcsdmAndXzqhdm",xzqhdm, sspcsdm);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new ArrayList<SystemDictionaryBean>();
	}
	
	/**
	 * 根据配置读取行政区划
	 * @param xzqh
	 * @return
	 */
	public List<XzqhMappingBean> getXzqhByPz(String xzqh)
	{
		try
		{
			return executor.queryListWithDBName(XzqhMappingBean.class, CommonConstant.DBNAME_SQJW, "getXzqhByPz", xzqh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	 
}
