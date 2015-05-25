package com.chinacreator.gzgl.service;

import java.sql.SQLException;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.EmfyqkxxBean;
import com.chinacreator.gzgl.bean.ErmxxBean;
import com.chinacreator.gzgl.dao.XxyDao;
import com.chinacreator.gzgl.query.XxyQuery;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.impl.LsglRkServiceImpl;
import com.frameworkset.orm.transaction.TransactionManager;

public class XxyService extends GzglBaseService{

	/**
	 * 分页查询信息员
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<ErmxxBean> getXxyListPage(XxyQuery queryBean,
			PageInfo pageInfo) throws SQLException {
		return XxyDao.getXxyListPage(queryBean,pageInfo);
	}

	/**
	 * 保存信息员
	 * @param emxxBean
	 * @return
	 * @throws SQLException
	 */
	public ErmxxBean saveXxyBean(ErmxxBean emxxBean) throws SQLException {
		LoginInfo loginUser = ActionContextHelper.getLoginInfo();
		LsglRkService rkService = new LsglRkServiceImpl();
		TransactionManager tr = null;
		try{
			tr = new TransactionManager();
			tr.begin();
			
			//保存人口基本信息
			RkxxBean rkBean = new RkxxBean();
			rkBean.setJbxxBean(emxxBean);
			rkService.saveRkJbxxBean(rkBean);
			
			//保存耳目信息
			if(ValidateHelper.isEmptyString(emxxBean.getZaembh())){
				String zaembh = CommonSequenceHelper.getZAEMBH(loginUser.getOrgcode().substring(0,6));
				emxxBean.setZaembh(zaembh);
				
				emxxBean.setDjrxm(loginUser.getRealname());
				emxxBean.setDjmjjh(loginUser.getUsername());
				emxxBean.setDjdwdm(loginUser.getOrgcode());
				emxxBean.setDjdwmc(loginUser.getOrgname());
				
				emxxBean.setCzrxm(loginUser.getRealname());
				emxxBean.setCzrjh(loginUser.getUsername());
				emxxBean.setCzdwdm(loginUser.getOrgcode());
				emxxBean.setCzdwmc(loginUser.getOrgname());
				emxxBean.setCzbs(CommonConstant.CZBZ_ADD);
				
				XxyDao.insertXxyBean(emxxBean);	
			}else{	
				
				emxxBean.setCzrxm(loginUser.getRealname());
				emxxBean.setCzrjh(loginUser.getUsername());
				emxxBean.setCzdwdm(loginUser.getOrgcode());
				emxxBean.setCzdwmc(loginUser.getOrgname());
				emxxBean.setCzbs(CommonConstant.CZBZ_UPDATE);
				
				XxyDao.updateXxyBean(emxxBean);
			}
			
			tr.commit();
		}catch (Exception e) {
			System.out.println("保存耳目信息失败.");
			emxxBean = null;
			if(tr != null){
				try {
					tr.rollback();
				} catch (RollbackException e1) {
					return null;
				}
			}
		}
		
		return emxxBean;
	}

	/**
	 * 根据治安耳目编号查询信息员
	 * @param zaembh
	 * @return
	 * @throws SQLException
	 */
	public ErmxxBean getEmxxBeanByzaembh(String zaembh) throws SQLException {
		return XxyDao.getEmxxBeanByzaembh(zaembh);
	}

	/**
	 * 根据身份证和单位查询信息员
	 * @param sfzh
	 * @param orgCode
	 * @return
	 * @throws SQLException
	 */
	public  ErmxxBean queryEmxxBeanBySfzhAndOrgCode(String sfzh,String orgCode) throws SQLException {
		return XxyDao.queryEmxxBeanBySfzhAndOrgCode(sfzh,orgCode);
	}
	
	public EmfyqkxxBean saveXxyFyBean(EmfyqkxxBean emfyqkxxBean){
		try{
			if(ValidateHelper.isEmptyString(emfyqkxxBean.getId())){
				String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_EMFYQK");
				emfyqkxxBean.setId(id);
				XxyDao.saveXxyfyBean(emfyqkxxBean);
			}else{
				XxyDao.updateXxyfyBean(emfyqkxxBean);
			}
		}catch (Exception e) {
			emfyqkxxBean = null;
			System.out.println("保存反馈信息失败");
		}
		return emfyqkxxBean;
	}
	
	public PageResultInfo<EmfyqkxxBean> getEmFyqkxxBeanByzaembh(String zaembh,
			PageInfo pageInfo) throws SQLException {
		return XxyDao.getEmFyqkxxBeanByzaembh(zaembh,pageInfo);
	}
	
	public  boolean  queryEmxxBeanBySfzhAndOrg(String sfzh,String orgcode) throws SQLException {
		boolean flag=false;
		ErmxxBean emxxBean=XxyDao.queryEmxxBeanBySfzhAndOrg(sfzh, orgcode);
		if(emxxBean!=null){
			flag=true;
		}else{
			flag=false;
		}
		return flag;
	}
	
	
	public  EmfyqkxxBean queryEmfyqkxxBeanById(String id){
		try
		{
			return XxyDao.queryEmfyqkxxBeanById(id);
		}catch (Exception e) {
			return null;
		}
	}
	
	public void zxZaemxxBean(String zaembh) throws Exception
	{
		XxyDao.zxZaemxxBean(zaembh);
	}
}
