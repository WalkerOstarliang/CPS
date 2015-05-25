package com.chinacreator.nbgl.service.impl;

import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.nbgl.bean.GjcBean;
import com.chinacreator.nbgl.dao.GjcDao;
import com.chinacreator.nbgl.dao.impl.GjcDaoImpl;
import com.chinacreator.nbgl.service.GjcService;
import com.frameworkset.orm.transaction.TransactionManager;

public class GjcServiceImpl implements GjcService {
	private static final long serialVersionUID = 8234875854577050564L;

	private GjcDao dao;
	private LoginInfo user;
	
	public GjcServiceImpl(){
		dao = new GjcDaoImpl();
		user = ActionContextHelper.getLoginInfo();
	}
	
	@Override
	public boolean deleteGjc(String gjcId) {
		boolean flag = false;
		TransactionManager tr = new TransactionManager();
		try {
			tr.begin();
			GjcBean bean = new GjcBean();
			bean.setId(gjcId);
			bean.setCzr(user.getRealname());
			bean.setCzrsfzh(user.getSfzh());
			dao.deleteGjc(bean);
			
			bean = dao.queryGjcById(gjcId);
			bean.setGjc_new(bean.getGjc());
			bean.setCzbz("2");
			dao.insertGjcLog(bean);
			tr.commit();
			
			flag = true;
		} catch (Exception e) {
			flag = false;
			System.out.println("删除关键词失败.");
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public GjcBean saveGjc(GjcBean bean) {
		TransactionManager tr = new TransactionManager();
		try {
			tr.begin();
			if(ValidateHelper.isEmptyString(bean.getId())){
				String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GJCID");
				bean.setId(id);
				
				bean.setCjr(user.getRealname());
				bean.setCjrsfzh(user.getSfzh());
				bean.setCzr(user.getRealname());
				bean.setCzrsfzh(user.getSfzh());
				dao.insertGjc(bean);
				
				bean.setCzbz("0");
				bean.setGjc_new(bean.getGjc());
				dao.insertGjcLog(bean);				
			}else{
				bean.setCzr(user.getRealname());
				bean.setCzrsfzh(user.getSfzh());
				dao.updateGjc(bean);
				
				bean.setCzbz("1");
				bean.setGjc_new(bean.getGjc());
				dao.insertGjcLog(bean);	
			}
			tr.commit();
		} catch (Exception e) {
			bean = null;
			System.out.println("保存关键词失败.");
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return bean;
	}

	@Override
	public boolean checkGjcIsExists(String gjc) {
		boolean flag = false;
		try{
			List<GjcBean> list = dao.queryGjcListByGjc(gjc);
			if(list.size() != 0){
				flag = true;
			}
		}catch (Exception e) {
			System.out.println("查询关键词失败");
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public PageResultInfo<GjcBean> queryGjcList(QueryBean query,
			PageInfo pageinfo) {
		try {
			return dao.queryGjcList(query, pageinfo);
		} catch (Exception e) {
			System.out.println("分页查询关键词失败");
			e.printStackTrace();
			return null;
		}
	}

	
}
