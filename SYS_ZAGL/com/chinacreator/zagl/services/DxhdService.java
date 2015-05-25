package com.chinacreator.zagl.services;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.DxhdBean;
import com.chinacreator.zagl.dao.DxhdDao;
import com.chinacreator.zagl.query.DxhdQuery;

public class DxhdService extends BaseValue{
	private static final long serialVersionUID = -5271958711882326379L;
	
	private LoginInfo login = ActionContextHelper.getLoginInfo();

	/**
	 * 分页查询大型活动
	 */
	public PageResultInfo<DxhdBean>  dxhdList(DxhdQuery dxhdQuery, PageInfo pageInfo) throws Exception{
		return DxhdDao.dxhdList(dxhdQuery, pageInfo);
	}
	
	/**
	 * 新增大型活动
	 */
	public DxhdBean addDxhd(DxhdBean dxhdBean) throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		dxhdBean.setCzrjh(login.getUsername());
		dxhdBean.setCzrsfzh(login.getSfzh());
		dxhdBean.setCzrxm(login.getRealname());
		dxhdBean.setCzdwdm(login.getOrgcode());
		dxhdBean.setCzdwmc(login.getOrgname());
		if(ValidateHelper.isEmptyString(dxhdBean.getHdbh()))
		{
			String hdbh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(), "seq_za_dxhd");
			dxhdBean.setHdbh(hdbh);
			dxhdBean.setDjrjh(login.getUsername());
			dxhdBean.setDjrxm(login.getRealname());
			dxhdBean.setDjdwdm(login.getOrgcode());
			dxhdBean.setDjdwmc(login.getOrgname());
			dxhdBean.setDjrsfzh(login.getSfzh());
			DxhdDao.addDxhd(dxhdBean);
		}
		else
		{//修改大型活动
			DxhdDao.updateDxhdByHdbh(dxhdBean);
		}
		return dxhdBean;
	}
	
	/**
	 * 删除大型活动
	 */
	public void deleteDxhdByHdbh(DxhdBean dxhdBean) throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		dxhdBean.setCzbs(CommonConstant.CZBZ_DEL);
		dxhdBean.setCzdwdm(loginInfo.getOrgcode());
		dxhdBean.setCzdwmc(loginInfo.getOrgname());
		dxhdBean.setCzrxm(loginInfo.getRealname());
		dxhdBean.setCzrjh(login.getUsername());
		dxhdBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		dxhdBean.setCzrsfzh(login.getSfzh());
		DxhdDao.deleteDxhdByHdbh(dxhdBean);
	}
	
	/**
	 * 批量删除大型活动
	 */
	public void batchDeleteDxhdByHdbh(DxhdBean dxhdBean) throws Exception{
		if(null != dxhdBean && ValidateHelper.isNotEmptyString(dxhdBean.getHdbh())){
			for (String hdbh : dxhdBean.getHdbh().split(",")) {
				DxhdBean dxhdBeans = new DxhdBean();
				dxhdBeans.setHdbh(hdbh);
				deleteDxhdByHdbh(dxhdBeans);
			}
		}
	}
	
	/**
	 * 通过主键查询大型活动
	 */
	public DxhdBean getDxhdByHdbh(String hdbh) throws Exception{
		return DxhdDao.getDxhdByHdbh(hdbh);
	}
}
