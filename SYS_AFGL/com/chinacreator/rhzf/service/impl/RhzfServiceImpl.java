package com.chinacreator.rhzf.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.rhzf.bean.ExpRhzfBean;
import com.chinacreator.rhzf.bean.RhzfBean;
import com.chinacreator.rhzf.bean.ZfryBean;
import com.chinacreator.rhzf.dao.RhzfDao;
import com.chinacreator.rhzf.dao.impl.RhzfDaoImpl;
import com.chinacreator.rhzf.service.RhzfService;
import com.frameworkset.orm.transaction.TransactionManager;

public class RhzfServiceImpl implements RhzfService {

	private static final long serialVersionUID = -6082385938343578045L;

	private RhzfDao dao = new RhzfDaoImpl();
	
	@Override
	public PageResultInfo<RhzfBean> queryRhzfList(QueryBean query,
			PageInfo pageinfo) {
		try {
			return dao.queryRhzfList(query, pageinfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ZfryBean> queryZfryListByDzid(String dzid) {
		try {
			return dao.queryZfryByDzid(dzid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public RhzfBean queryZfxxBeanByZfid(String zfid) {
		RhzfBean rhzf = null;
		try {
			rhzf = dao.queryRhzfByZfid(zfid);
			if(rhzf != null){
				List<ZfryBean> zfryList = dao.queryZfryByZfid(zfid);
				rhzf.setZfryList(zfryList);
				
				String zfry_old = "";
				for(ZfryBean zfry : zfryList){
					if("1".equals(zfry.getSfjm())){
						zfry_old += zfry.getRybh() + ",";
					}
				}
				rhzf.setRhzfry_old(zfry_old);
			}else{
				rhzf = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rhzf;
	}

	@Override
	public RhzfBean saveZfxx(RhzfBean bean,String operType) {
		LoginInfo loguser = ActionContextHelper.getLoginInfo();
		TransactionManager tr = null;
		try {
			tr = new TransactionManager();
			tr.begin();
			if(ValidateHelper.isEmptyString(bean.getId())){   //新增入户走访
				String id = loguser.getOrgcode().substring(0,6) + DateTimeHelper.getNowDateStr("yyyyMMddhhmmss") + 
							CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_RHZF_ID");
				bean.setId(id);
				bean.initDjxx();
				bean.initCzxx();
				bean.setCzbs(CommonConstant.CZBZ_ADD);
				dao.insertRhzf(bean);
				
				//新增走访人员
				for(ZfryBean zfry : bean.getZfryList()){
					if("1".equals(zfry.getSfjm())){
						dao.insertZfry(id, zfry.getRybh());
					}
				}
			}else{
				if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){ //修改入户走访
					bean.initCzxx();
					bean.setCzbs(CommonConstant.CZBZ_UPDATE);
					dao.updateRhzf(bean);
					dao.deleteZfry(bean.getId());
					for(ZfryBean zfry : bean.getZfryList()){
						if("1".equals(zfry.getSfjm())){
							dao.insertZfry(bean.getId(), zfry.getRybh());
						}
					}
					
					/*
					String zfry_old = bean.getRhzfry_old();
					if(ValidateHelper.isEmptyString(zfry_old)){
						for(ZfryBean zfry : bean.getZfryList()){
							if("1".equals(zfry.getSfjm())){
								dao.insertZfry(bean.getId(), zfry.getRybh());
							}
						}
					}else{
						List<String> addTemp = new ArrayList<String>();
						for(String str : zfry_old.split(",")){
							for(ZfryBean zfry : bean.getZfryList()){
								if(str.equals(zfry.getRybh())){
									if("".equals(zfry.getSfjm()) || zfry.getSfjm() == null){
										dao.deleteZfry(bean.getId(), zfry.getRybh());
										break;
									}
								}else{
									addTemp.add(zfry.getRybh());
								}
							}
						}
					}
					List<ZfryBean> zfryList = dao.queryZfryByZfid(bean.getId());
					String zfry_old_new  = "";
					for(ZfryBean zfry : zfryList){
						if("1".equals(zfry.getSfjm())){
							zfry_old_new  += zfry.getRybh() + ",";
						}
					}
					bean.setRhzfry_old(zfry_old_new);*/
					
				}else if(CommonConstant.OPERTYPE_DELETE.equals(operType)){//注销入户走访
					bean.initCzxx();
					bean.setCzbs(CommonConstant.CZBZ_ZX);
					dao.cancelRhzf(bean);
				}
				
			}
			tr.commit();
		} catch (Exception e) {
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			bean = null;
		}
		
		return bean;
	}

	@Override
	public List<ZfryBean> queryZfryListByZfid(String zfid) {
		try {
			return dao.queryZfryByZfid(zfid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ExpRhzfBean> excRhzf(QueryBean query) {
		try {
			return dao.expRhzf(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
