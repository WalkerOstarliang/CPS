package com.chinacreator.lsgl.services.impl;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.lsgl.bean.CzfwCzxxBean;
import com.chinacreator.lsgl.bean.CzrxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.dao.LsglCzfwCzxxDao;
import com.chinacreator.lsgl.dao.impl.LsglCzfwCzxxDaoImpl;
import com.chinacreator.lsgl.services.LsglCzfwCzxxService;
import com.frameworkset.orm.transaction.TransactionManager;

public class LsglCzfwCzxxServiceImpl implements LsglCzfwCzxxService {
	
	private LsglCzfwCzxxDao czxxDao;
	
	public LsglCzfwCzxxServiceImpl(){
		czxxDao = new LsglCzfwCzxxDaoImpl();
	}
	public void insertCzxxBean(CzfwCzxxBean czxxBean,FwJbxxBean fwBean) throws Exception {
		TransactionManager tm= null;
		try {
			tm =  new TransactionManager();
			tm.begin();
			String czxxbh=DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm") + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LSGL_CZFW_CZXX_CZBH");
			czxxBean.setCzxxbh(czxxbh);
			czxxDao.insertCzxxBean(czxxBean);
			tm.commit();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
			throw new Exception("插入出租信息失败.");  
		}
	}

	public void updateCzxxBean(CzfwCzxxBean czxxBean,FwJbxxBean fwBean) throws Exception {
		TransactionManager tm = null;
		try {
			tm = new TransactionManager();
			tm.begin();
			//修改出租信息
//			fwBean.setSfczw("1");
//			fwservice.saveCzfwBean(fwBean);
			//修改承租人信息
//			czxxBean.setCzfwbh(fwBean.getCzfwBean().getCzfwbh());
			czxxDao.updateCzxxBean(czxxBean);
			tm.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
			throw new Exception("更新出租信息失败."); 
		}
		
	}
	
	
	public PageResultInfo<CzfwCzxxBean> queryCzxxPageInfo(
			String czfwbh, PageInfo pageInfo) throws Exception {
		return czxxDao.queryCzxxPageInfo(czfwbh, pageInfo);
	}

	public CzfwCzxxBean queryCzxxPageInfobyCzxxbh(String czxxbh)
			throws Exception {
		return czxxDao.queryCzxxPageInfobyCzxxbh(czxxbh);
	}

	
	
	public boolean isExistSfzh(String sfzh,String czfwbh) throws Exception 
	{
		boolean flag=false;
		CzfwCzxxBean bean=czxxDao.queryCzfwCzxxBeanBySfzh(sfzh,czfwbh);
		if(bean!=null){
			flag=true;
		}else{
			flag=false;
		}
		return flag;
	}
	
	@Override
	public void insertCzrBean(CzrxxBean czrBean) throws Exception {
		String id=DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm") + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LSGL_CZRXX_ID");
		czrBean.setId(id);
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		czrBean.setCzdwdm(loginInfo.getOrgcode());
		czrBean.setCzdwmc(loginInfo.getOrgname());
		czrBean.setCzrsfzh(loginInfo.getSfzh());
		czrBean.setCzrxm(loginInfo.getRealname());
		czrBean.setDjrsfzh(loginInfo.getSfzh());
		czxxDao.insertCzrBean(czrBean);
	}
	@Override
	public void logoutCzrxxBean(CzrxxBean czrBean) throws Exception {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		czrBean.setZxdwdm(loginInfo.getOrgcode());
		czrBean.setZxdwmc(loginInfo.getOrgname());
		czrBean.setZxrxm(loginInfo.getRealname());
		czrBean.setZxrsfzh(loginInfo.getSfzh());
		czrBean.setCzdwdm(loginInfo.getOrgcode());
		czrBean.setCzdwmc(loginInfo.getOrgname());
		czrBean.setCzrsfzh(loginInfo.getSfzh());
		czrBean.setCzrxm(loginInfo.getRealname());
		czxxDao.logoutCzrxxBean(czrBean);
	}
	@Override
	public PageResultInfo<CzrxxBean> queryCzrPageInfoByCzfwbh(String czfwbh,
			PageInfo pageInfo) throws Exception {
		return czxxDao.queryCzrPageInfoByCzfwbh(czfwbh, pageInfo);
	}
	@Override
	public boolean queryCzrxxBeanBySfzh(String sfzh, String fwid)
			throws Exception 
	{
		boolean flag  = false;
		CzrxxBean czrxxBean= czxxDao.queryCzrxxBeanBySfzh(sfzh, fwid);
		if(czrxxBean != null)
		{
			flag = true;
		}
		return flag;
	}
	
	@Override
	public void updateCzrxxBean(CzrxxBean czrBean) throws Exception {
		czxxDao.updateCzrxxBean(czrBean);
	}
	@Override
	public CzrxxBean queryCzrxxBeanById(String id) throws Exception {
		return czxxDao.queryCzrxxBeanById(id);
	}
}
