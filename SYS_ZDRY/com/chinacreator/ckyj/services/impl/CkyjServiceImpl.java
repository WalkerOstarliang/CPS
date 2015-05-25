package com.chinacreator.ckyj.services.impl;

import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.ckyj.bean.CkyjQsFkBean;
import com.chinacreator.ckyj.bean.CkyjxxBean;
import com.chinacreator.ckyj.bean.YjfkBean;
import com.chinacreator.ckyj.bean.YjqsBean;
import com.chinacreator.ckyj.dao.CkyjDao;
import com.chinacreator.ckyj.dao.impl.CkyjDaoImpl;
import com.chinacreator.ckyj.query.CkyjQueryBean;
import com.chinacreator.ckyj.services.CkyjService;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.orm.transaction.TransactionManager;

public class CkyjServiceImpl implements CkyjService {

	private static final long serialVersionUID = -5321552209061340640L;
	
	private LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
	private CkyjDao dao = new CkyjDaoImpl();

	/**
	 * 签收预警
	 */
	public CkyjQsFkBean qsYj(CkyjQsFkBean bean) {
		if(bean == null){
			return null;
		}
		
		TransactionManager tr = new TransactionManager();
		try {
			tr.begin();
			String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDRY_YJQSID");
			YjqsBean yjqs = bean.getYjqs();
			yjqs.setId(id);
			yjqs.setLdxxbh(getLdxxBh(loginInfo.getOrgcode()));
			yjqs.setRksj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			yjqs.setSfwzdqs("0");
			
			//新增签收信息
			dao.insertCkyjQsxx(yjqs);
			bean.setYjqs(yjqs);
			
			//修改预警信息签收状态
			dao.updateCkyjQszt(yjqs.getYjxxbh(), CommonConstant.CKYJ_QSZT_QS);
			tr.commit();
		} catch (Exception e) {
			try {
				tr.rollback();
				bean = null;
			} catch (RollbackException e1) {
				e1.printStackTrace();
				bean = null;
			}
			e.printStackTrace();
			bean = null;
		}
		return bean;
	}

	//查询常控预警详情
	public CkyjQsFkBean queryCkyjDetail(String yjxxbh) {
		CkyjQsFkBean bean = null;
		try {
			bean = new CkyjQsFkBean();
			//查询常控预警
			CkyjxxBean ckyjxx = dao.queryCkyjxxByYjxxbh(yjxxbh);
			bean.setCkyj(ckyjxx);
			
			//查询签收信息
			YjqsBean yjqs = dao.queryCkYjqsxxByYjxxbh(yjxxbh);
			bean.setYjqs(yjqs);
			
			//查询反馈信息
			List<YjfkBean> yjfkList = dao.queryCkyjFkListByYjxxbh(yjxxbh);
			
			bean.setYjfkList(yjfkList);
		} catch (Exception e) {
			bean = null;
			e.printStackTrace();
		}
		return bean;
	}

	//分页查询常控预警信息
	public PageResultInfo<CkyjxxBean> queryCkyjPageResultInfo(
			CkyjQueryBean bean, PageInfo pageInfo) {
		try {
			return dao.queryCkyjxxPageResultInfo(bean, pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	//分页查询预警签收信息
	public PageResultInfo<YjqsBean> queryCkyjqsPageResultInfo(
			CkyjQueryBean bean, PageInfo pageInfo) {
		try {
			return dao.queryCkyjQsxxPageResultInfo(bean, pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	//保存预警反馈
	public CkyjQsFkBean saveYjfk(CkyjQsFkBean bean) {
		if(bean == null){
			return null;
		}
		
		TransactionManager tr = new TransactionManager();
		try {
			tr.begin();
			
			YjfkBean yjfk = bean.getYjfk();
			if(ValidateHelper.isEmptyString(yjfk.getId())){
				//新增预警反馈
				String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW,"SEQ_ZDRY_YJFKID");
				yjfk.setId(id);
				yjfk.setLdxxbh(getLdxxBh(loginInfo.getOrgcode()));
				
				//获取处置反馈编号
				String czfkxxbh = "";
				DBUtil db = new DBUtil();
				String sql = "select F_GET_CZYJCZFKBH('" + yjfk.getYjxxbh() + "','" + loginInfo.getOrgcode() + "') from dual";
				db.executeSelect(CommonConstant.DBNAME_SQJW, sql);
				if(db.size()>0){
					czfkxxbh = db.getString(0,0);
				}
				yjfk.setCzfkxxbh(czfkxxbh);
				yjfk.setRksj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				yjfk.setSfwzdfk("0");
				dao.insertCkyjFkxx(yjfk);
				
				//更新预警信息反馈状态
				dao.updateCkyjFkzt(yjfk.getYjxxbh(), CommonConstant.CKYJ_FKZT_FK);
				bean.setYjfk(yjfk);
			}else{
				//更新预警反馈信息
				dao.updateCkyjFkxx(yjfk);
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
	
	//根据ID查询预警反馈信息
	public YjfkBean queryYjfkById(String id){
		try {
			return dao.queryCkYjfkBeanById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//获取联动信息编号
	protected String getLdxxBh(String orgCode) throws Exception{
		String ldxxbh = "";
		DBUtil db = new DBUtil();
		String sql = "select f_get_ldxxbh('" + orgCode + "') from dual";
		try {
			db.executeSelect(CommonConstant.DBNAME_SQJW, sql);
			if(db.size()>0){
				ldxxbh = db.getString(0, 0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if("".equals(ldxxbh)){
			throw new Exception("获取联动信息编号失败!");
		}
		return ldxxbh;
	}
}
