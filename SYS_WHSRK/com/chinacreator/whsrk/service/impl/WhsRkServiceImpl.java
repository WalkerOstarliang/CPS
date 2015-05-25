package com.chinacreator.whsrk.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.whsrk.bean.WhsRkBean;
import com.chinacreator.whsrk.bean.WhsRkFkBean;
import com.chinacreator.whsrk.bean.WhsRkPfBean;
import com.chinacreator.whsrk.bean.WhsRkThBean;
import com.chinacreator.whsrk.dao.WhsRkDao;
import com.chinacreator.whsrk.dao.impl.WhsRkDaoImpl;
import com.chinacreator.whsrk.service.WhsRkService;
import com.frameworkset.orm.transaction.TransactionManager;

public class WhsRkServiceImpl implements WhsRkService {
	private static final long serialVersionUID = 7421316609390595252L;
	
	private WhsRkDao dao = new WhsRkDaoImpl();
	private LoginInfo loginUser = ActionContextHelper.getLoginInfo();
	
	@Override
	public PageResultInfo<WhsRkBean> queryWhsRkList(QueryBean query,
			PageInfo pageInfo) {
		try {
			return dao.queryWhsRkList(query, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean whsRkTh(WhsRkThBean bean) {
		boolean flag = false;
		TransactionManager tr = null;
		try {
			tr = new TransactionManager();
			tr.begin();
			String rkids = bean.getRkid();
			if(rkids.contains(",")){
				for(String rkid : rkids.split(",")){
					WhsRkThBean whsrkth = bean;
					whsrkth.setRkid(rkid);
					whsRkThCell(whsrkth);
				}
			}else{
				whsRkThCell(bean);
			}
			tr.commit();
			flag = true;
		} catch (Exception e) {
			flag = false;
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
		}
		return flag;
	}

	@Override
	public boolean whsRkFk(WhsRkFkBean bean) {
		boolean flag = false;
		TransactionManager tr = null;
		try {
			tr = new TransactionManager();
			tr.begin();
			String rkids = bean.getRkid();
			if(rkids.contains(",")){
				for(String rkid : rkids.split(",")){
					WhsRkFkBean whsrkfk = bean;
					whsrkfk.setRkid(rkid);
					whsRkFkCell(whsrkfk);
				}
			}else{
				whsRkFkCell(bean);
			}
			tr.commit();
			flag = true;
		} catch (Exception e) {
			flag = false;
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
		}
		return flag;
	}

	@Override
	public boolean whsRkPf(WhsRkPfBean bean) {
		boolean flag = false;
		TransactionManager tr = null;
		try {
			tr = new TransactionManager();
			tr.begin();
			String rkids = bean.getRkid();
			if(rkids.contains(",")){
				for(String rkid : rkids.split(",")){
					WhsRkPfBean whsrkpf = bean;
					whsrkpf.setRkid(rkid);
					whsRkPfCell(whsrkpf);
				}
			}else{
				whsRkPfCell(bean);
			}
			tr.commit();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
		}
		return flag;
	}
	
	private void whsRkThCell(WhsRkThBean bean) throws Exception {
		bean.setThdwdm(loginUser.getOrgcode());
		bean.setThdwmc(loginUser.getOrgname());
		bean.setThrjh(loginUser.getUsername());
		bean.setThrsfzh(loginUser.getSfzh());
		bean.setThrxm(loginUser.getRealname());
		if(loginUser.getLeve() == 5){
			bean.setMbdwdm(loginUser.getParent_code().substring(0,8) + "0000");
			bean.setMbdwmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(bean.getMbdwdm()));
		}else{
			bean.setMbdwdm(loginUser.getParent_code());
			bean.setMbdwmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(loginUser.getParent_code()));
		}
		//新增退回信息
		dao.insertWhsRkTh(bean);
		
		WhsRkBean whsrk = new WhsRkBean();
		whsrk.setRkid(bean.getRkid());
		whsrk.initCzxx();
		whsrk.setCzzt("2");
		//更新操作状态
		dao.updateWhrkCzzt(whsrk);
		
		whsrk.setFkzt("0");
		//更新反馈状态
		dao.updateWhrkFkzt(whsrk);
	}
	
	private void whsRkFkCell(WhsRkFkBean bean) throws Exception{
		bean.setFkdwdm(loginUser.getOrgcode());
		bean.setFkdwmc(loginUser.getOrgname());
		bean.setFkrjh(loginUser.getUsername());
		bean.setFkrsfzh(loginUser.getSfzh());
		bean.setFkrxm(loginUser.getRealname());
		/**
		 * 新增反馈信息
		 */
		dao.insertWhsRkFk(bean);
		
		WhsRkBean whsrk = new WhsRkBean();
		whsrk.setRkid(bean.getRkid());
		whsrk.initCzxx();
		whsrk.setFkzt("1");
		/**
		 * 更新反馈信息
		 */
		dao.updateWhrkFkzt(whsrk);
	}
	
	private void whsRkPfCell(WhsRkPfBean bean) throws Exception{
		bean.setPfdwdm(loginUser.getOrgcode());
		bean.setPfdwmc(loginUser.getOrgname());
		bean.setPfrjh(loginUser.getUsername());
		bean.setPfrsfzh(loginUser.getSfzh());
		bean.setPfrxm(loginUser.getRealname());
		/**
		 * 新增派发信息
		 */
		dao.insertWhsRkPf(bean);
		
		WhsRkBean whsrk = new WhsRkBean();
		whsrk.setRkid(bean.getRkid());
		whsrk.setSssqdm(bean.getMbdwdm());
		whsrk.setSssqmc(bean.getMbdwmc());
		whsrk.setSsdwdm(bean.getJwqdm());
		whsrk.setSsdwmc(bean.getJwqmc());
		whsrk.initCzxx();
		/**
		 * 更新派发信息
		 */
		dao.updateWhsRkPfxx(whsrk);
		
		whsrk.setCzzt("1");
		//更新操作状态
		dao.updateWhrkCzzt(whsrk);
		
		whsrk.setFkzt("0");
		/**
		 * 更新反馈信息
		 */
		dao.updateWhrkFkzt(whsrk);
	}

	@Override
	public List<WhsRkBean> queryWhsRkList(QueryBean query) {
		try {
			return dao.queryWhsRkList(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
