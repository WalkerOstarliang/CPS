package com.chinacreator.afgl.services;

import com.chinacreator.afgl.bean.XgdxxBean;
import com.chinacreator.afgl.bean.XgdyxxBean;
import com.chinacreator.afgl.dao.XgdyxxDao;
import com.chinacreator.afgl.query.XgdyxxQuery;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 协管队员信息
 *
 */
public class XgdyxxService {
	
	/**
	 * 协管队员信息列表
	 */
	public PageResultInfo<XgdyxxBean> xgdyxxList(PageInfo pageInfo, XgdyxxQuery xgdyxxQuery) throws Exception{
		return XgdyxxDao.xgdyxxList(pageInfo, xgdyxxQuery);
	}
	
	/**
	 * 协管队信息列表
	 */
	public PageResultInfo<XgdxxBean> xgdxxList(PageInfo pageInfo, XgdyxxQuery xgdyxxQuery) throws Exception{
		return XgdyxxDao.xgdxxList(pageInfo, xgdyxxQuery);
	}
	
	/**
	 * 新增、修改、删除协管队员信息
	 */
	public void addXgdyxx(XgdyxxBean xgdyxxBean) throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if("1".equals(xgdyxxBean.getCzbs())){//新增包括协管队
		/*	if(ValidateHelper.isEmptyString(xgdyxxBean.getXgdbh())){
				String xgdbh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(), "seq_af_xgdxx");
				xgdyxxBean.setXgdbh(xgdbh);
				XgdyxxDao.addXgdxx(xgdyxxBean);
			}else{
				XgdyxxDao.updateXgdxxByXgdbh(xgdyxxBean);
			}*/
			String dybh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(), "seq_af_xgdyxx");
			xgdyxxBean.setDybh(dybh);
			xgdyxxBean.setZxbs("0");
			xgdyxxBean.setDjrsfzh(loginInfo.getSfzh());
			XgdyxxDao.addXgdyxx(xgdyxxBean);
		}else if("2".equals(xgdyxxBean.getCzbs())){//修改
			/*if(ValidateHelper.isEmptyString(xgdyxxBean.getXgdbh())){
				String xgdbh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(), "seq_af_xgdxx");
				xgdyxxBean.setXgdbh(xgdbh);
				XgdyxxDao.addXgdxx(xgdyxxBean);
			}else{
				XgdyxxDao.updateXgdxxByXgdbh(xgdyxxBean);
			}
			xgdyxxBean.setZxbs("0");*/
			
			XgdyxxDao.updateXgdyxxByDybh(xgdyxxBean);
			
		}else if("3".equals(xgdyxxBean.getCzbs())){//删除
			xgdyxxBean.setZxbs("1");
			xgdyxxBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			xgdyxxBean.setZxdwdm(loginInfo.getOrgcode());
			xgdyxxBean.setZxdwmc(loginInfo.getOrgname());
			xgdyxxBean.setDjrdwdm(loginInfo.getOrgcode());
			xgdyxxBean.setDjrdwmc(loginInfo.getOrgname());
			xgdyxxBean.setDjrjh(loginInfo.getUsername());
			xgdyxxBean.setDjrxm(loginInfo.getRealname());
			xgdyxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			XgdyxxDao.deleteXgdyxxByDybh(xgdyxxBean);
		}
	}
	
	/**
	 * 得到协管队员信息
	 */
	public XgdyxxBean getXgdyxxByDybh(XgdyxxQuery xgdyxxQuery) throws Exception{
		XgdyxxBean xgdyxxBean = XgdyxxDao.getXgdyxxByDybh(xgdyxxQuery);
		xgdyxxBean.setCzbs(xgdyxxQuery.getCzbs());
		return xgdyxxBean;
	}
	
	/**
	 * 批量注销协管队员信息
	 */
	public void batchDeleteXgdyxxByDybhs(XgdyxxQuery xgdyxxQuery) throws Exception{
		TransactionManager tm = null;
		try{
			tm = new TransactionManager();
			tm.begin();
			if(ValidateHelper.isNotEmptyString(xgdyxxQuery.getDybh())){
				String[] dybhs = xgdyxxQuery.getDybh().split(",");
				for (String dybh : dybhs) {
					XgdyxxBean xgdyxxBean = new XgdyxxBean();
					xgdyxxBean.setDybh(dybh);
					xgdyxxBean.setZxbs("1");
					LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
					xgdyxxBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
					xgdyxxBean.setZxdwdm(loginInfo.getOrgcode());
					xgdyxxBean.setZxdwmc(loginInfo.getOrgname());
					xgdyxxBean.setDjrdwdm(loginInfo.getOrgcode());
					xgdyxxBean.setDjrdwmc(loginInfo.getOrgname());
					xgdyxxBean.setDjrjh(loginInfo.getUsername());
					xgdyxxBean.setDjrxm(loginInfo.getRealname());
					xgdyxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					XgdyxxDao.deleteXgdyxxByDybh(xgdyxxBean);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			tm.rollback();
		}
	}
	
	
	/**
	 * 根据身份证号查找协管队员信息
	 */
	public  XgdyxxBean queryXgdyxxBySfzh(String sfzh) throws Exception{
		return XgdyxxDao.queryXgdyxxBySfzh(sfzh);
	}
	/**
	 * 判断该身份证号是否存在该单位
	 * @param sfzh
	 * @param orgcode
	 * @return
	 * @throws Exception
	 */
	public boolean queryXgdyxxBySfzhAndOrgcode(String sfzh,String orgcode) throws Exception{
		boolean flag=false;
		XgdyxxBean xgdyxxBean=XgdyxxDao.queryXgdyxxBySfzhAndOrgcode(sfzh, orgcode);
		if(xgdyxxBean!=null){
			flag=true;
		}else{
			flag=false;
		}
		return flag;
	}
}
