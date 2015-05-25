package com.chinacreator.gzgl.service;


import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.OrgFjBean;
import com.chinacreator.gzgl.dao.FjDao;
import com.chinacreator.lsgl.query.RkQueryBean;

public class FjService {
	public  PageResultInfo<OrgFjBean> queryFjBeanPageInfo(String orgcode,PageInfo pageInfo) throws Exception{
		return FjDao.queryFjBeanPageInfo(orgcode, pageInfo);
	}
	
	public  PageResultInfo<OrgFjBean> queryFjBeanPageInfoByQueryBean(RkQueryBean queryBean,PageInfo pageInfo) throws Exception{
		return FjDao.queryFjBeanPageInfoByQueryBean(queryBean, pageInfo);
	}
	
	public   void insertFjBean(OrgFjBean bean) throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		bean.setDjrjh(loginInfo.getUsername());
		bean.setDjrxm(loginInfo.getRealname());
		bean.setDjrsfzh(loginInfo.getSfzh());
		bean.setDjdwdm(loginInfo.getOrgcode());
		bean.setDjdwmc(loginInfo.getOrgname());
		bean.setZxbs(CommonConstant.ZX_DIC_ZC);  //0
		String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
		String id=xzdm+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "T_COMMON_ORGANIZATION_FJ_ID");
		bean.setId(id);
		FjDao.insertFjBean(bean);
	}
	
	public  void updateFjBean(OrgFjBean bean) throws Exception{
		FjDao.updateFjBean(bean);
	}
	
	public  OrgFjBean queryFjBeanByJh(String fjjh) throws Exception{
		return FjDao.queryFjBeanByJh(fjjh);
	}
	
	public  OrgFjBean queryFjBeanByFjid(String fjid) throws Exception{
		return FjDao.queryFjBeanByFjid(fjid);
	}
	
	

	public  OrgFjBean queryFjBeanBySfzh(String sfzh) throws Exception{
		if (ValidateHelper.isNotEmptyString(sfzh))
		{
			return FjDao.queryFjBeanBySfzh(sfzh);
		}
		return null;
	}
	
	public void loginoutFjBeanById(String id ) throws Exception{
		FjDao.deleteFjBean(id);
	}
	
	public boolean queryFjBeanBySfzhAndDW(OrgFjBean bean) throws Exception{
		boolean flag = false;
		OrgFjBean fjBean = FjDao.queryFjBeanBySfzhInDw(bean);
		if(fjBean != null){
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}
	
	
	public  List<OrgFjBean> queryFjBeanByIds(String ids) throws Exception{
		return FjDao.queryFjBeanByIds(ids);
	}
	
	public List<OrgFjBean> queryFjBeansByQueryBean(RkQueryBean queryBean) throws Exception {
		return FjDao.queryFjBeansByQueryBean(queryBean);
	}
}
