package com.chinacreator.afgl.services;

import java.sql.SQLException;

import com.chinacreator.afgl.bean.AfXldRyxxBean;
import com.chinacreator.afgl.bean.AfXldxxBean;
import com.chinacreator.afgl.dao.AFXldxxDao;
import com.chinacreator.afgl.dao.AFxfryDao;
import com.chinacreator.afgl.query.AfxldQueryBean;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.OrgFjBean;
import com.chinacreator.gzgl.service.FjService;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.frameworkset.orm.transaction.TransactionManager;

public class AFXldService
{
	private FjService fjService= null; 
	public AFXldService()
	{
		fjService = new FjService();
	}
	
	/**
	 * 安防巡逻队查询
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<AfXldxxBean> queryAfxldxxListByQueryBean(PageInfo pageInfo, AfxldQueryBean queryBean) throws Exception
	{
		return AFXldxxDao.queryAfxldxxListByQueryBean(pageInfo, queryBean);
	}
	
	/**
	 * 插入巡逻队信息
	 * @param bean
	 * @throws Exception
	 */
	public void insertXldxxBean(AfXldxxBean bean) throws Exception
	{
		String xldbh = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm") + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_af_xldbh", "left", 5, "0");
		bean.setXldbh(xldbh);
		AFXldxxDao.insertXldxxBean(bean);
	}
	
	/**
	 * 更新巡逻队信息bean
	 * @param bean
	 * @throws Exception
	 */
	public void updateXldxxBean(AfXldxxBean bean) throws Exception
	{
		AFXldxxDao.updateXldxxBean(bean);
	}
	
	/**
	 * 保存巡逻信息
	 * @param bean
	 * @param operType
	 * @return
	 * @throws Exception
	 */
	public String saveXldxxBean(AfXldxxBean bean, String operType) throws Exception
	{
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			LoginInfo loginInfo  = ActionContextHelper.getLoginInfo();
			bean.setDjrsfzh(loginInfo.getSfzh());
			insertXldxxBean(bean);
		}
		else if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			updateXldxxBean(bean);
		}
		return bean.getXldbh();
	}
	
	/**
	 * 删除巡逻队， 不做物理删除
	 * @param xldbh
	 * @throws Exception
	 */
	public void deleteXldxxBeanByXldbh(String xldbh) throws Exception
	{
		AFXldxxDao.deleteXldxxBeanByXldbh(xldbh);
	}
	
	/**
	 * 批量注销 巡逻队
	 * @param xldbhs
	 * @throws Exception
	 */
	public void deleteXldxxBeansByXldbhs(String xldbhs) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			if (ValidateHelper.isNotEmptyString(xldbhs))
			{
				String[] xldbharr = xldbhs.split(",");
				for (String xldbh : xldbharr)
				{
					deleteXldxxBeanByXldbh(xldbh);
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
	
	/**
	 * 通过巡逻队编号查询巡逻队信息
	 * @param xldbh
	 * @return
	 * @throws Exception
	 */
	public AfXldxxBean queryAfxldxxBeanByXldbh(String xldbh) throws Exception
	{
		return AFXldxxDao.queryAfxldxxBeanByXldbh(xldbh);
	}
	
	/**
	 * 巡逻队员信息列表查询
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<AfXldRyxxBean> queryAfxldRyxxBeanListByQueryBean(PageInfo pageInfo, AfxldQueryBean queryBean) throws Exception
	{
		return AFXldxxDao.queryAfxldRyxxBeanListByQueryBean(pageInfo, queryBean);
	}
	
	/**
	 * 通过编号查询巡逻队员信息
	 * @param xldybh
	 * @return
	 * @throws Exception
	 */
	public AfXldRyxxBean queryAfxldyxxBeanByXldybh(String xldybh) throws Exception
	{
		return AFXldxxDao.queryAfxldyxxBeanByXldybh(xldybh);
	}
	
	/**
	 * 保存巡逻队员信息
	 * @param xldryBean
	 * @param operType
	 * @throws Exception
	 */
	public void saveAfxldyxxBean(AfXldRyxxBean xldryBean, String operType) throws Exception
	{
		if (ValidateHelper.isEmptyString(xldryBean.getXldybh()))
		{
			xldryBean.setXldybh(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_AF_XLDYBH"));
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			xldryBean.setDjrsfzh(loginInfo.getSfzh());
			AFXldxxDao.insertAfxldyxxBean(xldryBean);
		}
		else 
		{
			AFXldxxDao.updateAfxldyxxBean(xldryBean);
		}
	}
	
	/**
	 * 删除巡逻队员信息
	 * @param xldybh
	 * @throws Exception
	 */
	public void deleteAfXldryxxBean(String xldybh) throws Exception
	{
		AFXldxxDao.deleteAfxldyxxBeanByXldybh(xldybh);
	}
	
	/**
	 * 批量删除巡逻队信息
	 * @param xldybhs
	 * @throws Exception
	 */
	public void batchDeleteXldryxx(String xldybhs) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			String[] xldybharr = xldybhs.split(",");
			tm = new TransactionManager();
			tm.begin();
			for (String xldybh : xldybharr)
			{
				deleteAfXldryxxBean(xldybh);
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tm.rollback();
		}
	}
	
	/**
	 * 查询巡逻队员通过巡逻队编号
	 * @param pageInfo
	 * @param xldbh
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<OrgFjBean> queryXldryBeanListByXldbh(PageInfo pageInfo, String xldbh) throws Exception
	{
		RkQueryBean queryBean = new RkQueryBean();
		queryBean.setXldbh(xldbh);
		queryBean.setFjlb("2");//治安巡防对
		return fjService.queryFjBeanPageInfoByQueryBean(queryBean, pageInfo);
	}
	
	/**
	 * 查询巡逻队员通过编号
	 * @param sfzh
	 * @return
	 * @throws Exception
	 */
	public  AfXldRyxxBean queryAfxldyxxBeanBySfzh(String sfzh) throws Exception
	{
		return AFXldxxDao.queryAfxldyxxBeanBySfzh(sfzh);
	}
	/**
	 * 查询巡防队员通过bean
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<AfXldRyxxBean>  queryAfxfdyxxBeanByqueryBean(PageInfo pageInfo,AfxldQueryBean queryBean) throws SQLException{
		return AFXldxxDao.queryAfxfdyxxBeanByqueryBean(pageInfo, queryBean);
	}
	/**
	 * 保存巡防员信息通过bean
	 * @throws SQLException 
	 */
	public void saveAfryxxBean(AfXldRyxxBean afryxxBean) throws SQLException{
		if(ValidateHelper.isNotEmptyString(afryxxBean.getXldybh())){
			AFxfryDao.updateXfryxxBean(afryxxBean);
		}else{
			String xldybh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_AF_XLDYBH");
			afryxxBean.setXldybh(xldybh);
			AFxfryDao.insertXfryxxBean(afryxxBean);
		}
		
	}
	public boolean selectXfryxxBysfzh(AfXldRyxxBean afryxxBean) throws SQLException {
		boolean isboolean=false;
		AfXldRyxxBean afrybean= AFxfryDao.selectXfryxxBysfzh(afryxxBean);
		if (afrybean!=null){
			isboolean=true;
		}
		return isboolean;
	}
}
