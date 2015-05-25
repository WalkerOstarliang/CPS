package com.chinacreator.zagl.services.impl;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.zagl.bean.NbdwaqjcBean;
import com.chinacreator.zagl.dao.DwAqjcDao;
import com.chinacreator.zagl.dao.impl.DwAqjcDaoImpl;
import com.chinacreator.zagl.services.DwAqjcService;

public class DwAqjcServiceImpl implements DwAqjcService{

	private DwAqjcDao aqjcDao;
	public DwAqjcServiceImpl(){
		aqjcDao = new DwAqjcDaoImpl();
	}
	@Override
	public void insertAqjcBean(NbdwaqjcBean aqjcBean) {
		String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_T_ZA_DW_NBAQJC_ID");
		aqjcBean.setId(id);
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		aqjcBean.setDjrjh(loginInfo.getUsername());
		aqjcBean.setDjrxm(loginInfo.getRealname());
		aqjcBean.setDjrsfzh(loginInfo.getSfzh());
		aqjcBean.setDjdwdm(loginInfo.getOrgcode());
		aqjcBean.setDjdwmc(loginInfo.getOrgname());
		aqjcBean.setCzrjh(loginInfo.getUsername());
		aqjcBean.setCzrxm(loginInfo.getRealname());
		aqjcBean.setCzrsfzh(loginInfo.getSfzh());
		aqjcBean.setCzdwdm(loginInfo.getOrgcode());
		aqjcBean.setCzdwmc(loginInfo.getOrgname());
		aqjcDao.insertAqjcBean(aqjcBean);
	}

	@Override
	public PageResultInfo<NbdwaqjcBean> queryNbAqjcPageInfoByJcdwdm(
			String jcdwdm, PageInfo pageInfo) {
		return aqjcDao.queryNbAqjcPageInfoByJcdwdm(jcdwdm, pageInfo);
	}

	@Override
	public void updateAqjcBean(NbdwaqjcBean aqjcBean) {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		aqjcBean.setCzrjh(loginInfo.getUsername());
		aqjcBean.setCzrxm(loginInfo.getRealname());
		aqjcBean.setCzrsfzh(loginInfo.getSfzh());
		aqjcBean.setCzdwdm(loginInfo.getOrgcode());
		aqjcBean.setCzdwmc(loginInfo.getOrgname());
		aqjcDao.updateAqjcBean(aqjcBean);
	}
}
