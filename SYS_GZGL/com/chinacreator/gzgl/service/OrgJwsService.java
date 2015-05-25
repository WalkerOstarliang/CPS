package com.chinacreator.gzgl.service;

import java.sql.SQLException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.OrgJwsBean;
import com.chinacreator.common.cps.bean.PcsRyBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.dao.OrgJwsDao;
import com.chinacreator.gzgl.dao.PcsDao;
import com.chinacreator.gzgl.query.OrgJwsQuery;
import com.frameworkset.orm.transaction.TransactionManager;

public class OrgJwsService {

	public PageResultInfo<OrgJwsBean> queryOrgJwsBean(PageInfo pageInfo,
			OrgJwsQuery jwsQuery) throws SQLException {
		return OrgJwsDao.queryOrgJwsBean(pageInfo,jwsQuery);
	}

	public OrgJwsBean queryOrgJwsBeanById(String id) throws SQLException {
		return OrgJwsDao.queryOrgJwsBeanById(id);
	}

	public void updateJwsBean(OrgJwsBean jwsBean) throws Exception {
		TransactionManager tr = null;
		try{
			tr = new TransactionManager();
			tr.begin();
			OrgJwsDao.updateJwsBean(jwsBean);
			//PcsDao.updateSjjsJwqfl(jwsBean.getOrgcode(), jwsBean.getDj());
			tr.commit();
		}catch (Exception e) {
			tr.rollback();
			e.printStackTrace();
		}
		
	}
	
	/*新增的*/
	public OrgJwsBean queryPcsBeanByOrgcode(String orgcode) throws Exception{
		return PcsDao.queryPcsBeanByOrgcode(orgcode);
	}
	
	public void insertPcsBean(OrgJwsBean bean) throws Exception{
		TransactionManager tr = null;
		try{
			tr = new TransactionManager();
			tr.begin();
			PcsDao.insertPcsBean(bean);
			//PcsDao.updateSjjsJwqfl(bean.getOrgcode(), bean.getDj());
			tr.commit();
		}catch (Exception e) {
			tr.rollback();
			e.printStackTrace();
		}
	}
	
	public void updatePcsBean(OrgJwsBean bean) throws Exception{
		TransactionManager tr = null;
		try{
			tr = new TransactionManager();
			tr.begin();
			PcsDao.updatePcsBean(bean);
			//PcsDao.updateSjjsJwqfl(bean.getOrgcode(), bean.getDj());
			tr.commit();
		}catch (Exception e) {
			tr.rollback();
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据机构ID查询派出所荣誉
	 * @param orgid
	 * @return
	 */
	public PageResultInfo<PcsRyBean> queryPcsRyList(String orgid,PageInfo pageinfo){
		try {
			return PcsDao.queryPcsRyList(orgid, pageinfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 保存派出所荣誉
	 * @param bean
	 * @return
	 */
	public PcsRyBean savePcsRy(PcsRyBean bean){
		LoginInfo logininfo = ActionContextHelper.getLoginInfo();
		try{
			if(ValidateHelper.isEmptyString(bean.getId())){
				String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_PCSRYID");
				bean.setId(id);
				bean.setDjdwdm(logininfo.getOrgcode());
				bean.setDjdwmc(logininfo.getOrgname());
				bean.setDjrjh(logininfo.getUsername());
				bean.setDjrsfzh(logininfo.getSfzh());
				bean.setDjrxm(logininfo.getRealname());
				bean.setCzbs(CommonConstant.CZBZ_ADD);
				
				bean.setCzdwdm(logininfo.getOrgcode());
				bean.setCzdwmc(logininfo.getOrgname());
				bean.setCzrjh(logininfo.getUsername());
				bean.setCzrsfzh(logininfo.getSfzh());
				bean.setCzrxm(logininfo.getRealname());
				
				PcsDao.inserPcsRy(bean);
			}else{
				bean.setCzbs(CommonConstant.CZBZ_UPDATE);
				bean.setCzdwdm(logininfo.getOrgcode());
				bean.setCzdwmc(logininfo.getOrgname());
				bean.setCzrjh(logininfo.getUsername());
				bean.setCzrsfzh(logininfo.getSfzh());
				bean.setCzrxm(logininfo.getRealname());
				
				PcsDao.updatePcsRy(bean);
			}
		}catch (SQLException e) {
			bean = null;
			System.out.println("保存派出所荣誉失败。");
			e.printStackTrace();
		}
		return bean;
	}
	
	/**
	 * 删除派出所荣誉
	 * @param bean
	 */
	public void delPcsRy(PcsRyBean bean){
		
		LoginInfo logininfo = ActionContextHelper.getLoginInfo();
		try {
			bean.setCzbs(CommonConstant.CZBZ_DEL);
			bean.setCzdwdm(logininfo.getOrgcode());
			bean.setCzdwmc(logininfo.getOrgname());
			bean.setCzrjh(logininfo.getUsername());
			bean.setCzrsfzh(logininfo.getSfzh());
			bean.setCzrxm(logininfo.getRealname());
		
			PcsDao.deletePcsRy(bean);
		} catch (SQLException e) {
			System.out.println("删除派出所荣誉失败。");
			e.printStackTrace();
		}
	}
}
