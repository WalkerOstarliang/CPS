package com.chinacreator.afgl.services;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.KkxxBean;
import com.chinacreator.afgl.dao.KkxxDao;
import com.chinacreator.afgl.query.KkxxQuery;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 卡口信息
 *
 */
public class KkxxService {
	
	/**
	 * 卡口信息列表
	 */
	public PageResultInfo<KkxxBean> kkxxList(PageInfo pageInfo, KkxxQuery kkxxQuery) throws Exception{
		return KkxxDao.kkxxList(pageInfo, kkxxQuery);
	}
	
	/**
	 * 新增、修改、删除卡口信息
	 */
	public void addKkxx(KkxxBean kkxxBean) throws Exception{
		if("1".equals(kkxxBean.getCzbs())){//新增
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String kkbh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(), "seq_af_kkxx");
			kkxxBean.setKkbh(kkbh);
			kkxxBean.setZxbs("0");
			KkxxDao.addKkxx(kkxxBean);
		}else if("2".equals(kkxxBean.getCzbs())){//修改
			kkxxBean.setZxbs("0");
			KkxxDao.updateKkxxByKkbh(kkxxBean);
		}else if("3".equals(kkxxBean.getCzbs())){//删除
			kkxxBean.setZxbs("1");
			KkxxDao.deleteKkxxByKkbh(kkxxBean);
		}
	}
	
	/**
	 * 得到卡口信息
	 */
	public KkxxBean getKkxxByKkbh(KkxxQuery kkxxQuery) throws Exception{
		KkxxBean kkxxBean = KkxxDao.getKkxxByKkbh(kkxxQuery);
		kkxxBean.setCzbs(kkxxQuery.getCzbs());
		return kkxxBean;
	}
	
	/**
	 * 得到卡口列表信息
	 */
	public List<KkxxBean> getKkxxListByKkbhs(KkxxQuery kkxxQuery) throws Exception{
		List<KkxxBean> kkxxList = new ArrayList<KkxxBean>();
		String kkbhs = kkxxQuery.getKkbh();
		if(ValidateHelper.isNotEmptyString(kkbhs)){
			for (String kkbh : kkbhs.split(",")) {
				KkxxQuery kkxxQuerys = new KkxxQuery();
				kkxxQuerys.setKkbh(kkbh);
				KkxxBean kkxxBean = KkxxDao.getKkxxByKkbh(kkxxQuery);
				kkxxList.add(kkxxBean);
			}
		}
		return kkxxList;
	}
	
	/**
	 * 批量注销卡口信息
	 */
	public void batchDeleteKkxxByKkbhs(List<KkxxBean> kkxxList, KkxxBean kkxxBean) throws Exception{
		TransactionManager tm = null;
		try{
			tm = new TransactionManager();
			tm.begin();
			if(ValidateHelper.isNotEmptyCollection(kkxxList)){
				for (KkxxBean kkxxsBean : kkxxList) {
					kkxxsBean.setZxbs("1");
					kkxxsBean.setZxrq(kkxxBean.getZxrq());
					kkxxsBean.setZxyy(kkxxBean.getZxyy());
					
					LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
					kkxxsBean.setDjdwdm(loginInfo.getOrgcode());
					kkxxsBean.setDjdwmc(loginInfo.getOrgname());
					kkxxsBean.setDjrjh(loginInfo.getUsername());
					kkxxsBean.setDjrxm(loginInfo.getRealname());
					kkxxsBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					KkxxDao.deleteKkxxByKkbh(kkxxsBean);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			tm.rollback();
		}
	}
}
