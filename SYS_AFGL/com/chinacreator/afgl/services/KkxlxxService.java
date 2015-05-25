package com.chinacreator.afgl.services;

import com.chinacreator.afgl.bean.KkxlxxBean;
import com.chinacreator.afgl.dao.KkxlxxDao;
import com.chinacreator.afgl.query.KkxlxxQuery;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;

/**
 * 卡口巡逻信息
 *
 */
public class KkxlxxService {
	
	public PageResultInfo<KkxlxxBean> kkxlxxList(PageInfo pageInfo, 
			KkxlxxQuery kkxlxxQuery) throws Exception{
		return KkxlxxDao.kkxlxxList(pageInfo, kkxlxxQuery);
	}
	
	/**
	 * 新增修改卡口巡逻信息
	 */
	public void addKkxlxx(KkxlxxBean kkxlxxBean) throws Exception{
		if("1".equals(kkxlxxBean.getCzbs())){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String xlbh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(), "seq_af_kkxlxx");
			kkxlxxBean.setXlbh(xlbh);
			KkxlxxDao.addKkxlxx(kkxlxxBean);
		}else if("2".equals(kkxlxxBean.getCzbs())){
			KkxlxxDao.updateKkxlxx(kkxlxxBean);
		}
	}
	
	/**
	 * 得到卡口巡逻信息
	 */
	public KkxlxxBean getKkxlxxByXlbh(KkxlxxQuery kkxlxxQuery) throws Exception{
		return KkxlxxDao.getKkxlxxByXlbh(kkxlxxQuery);
	}
}
