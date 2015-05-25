package com.chinacreator.afgl.services;

import com.chinacreator.afgl.bean.ZapcxxBean;
import com.chinacreator.afgl.dao.KkpcxxDao;
import com.chinacreator.afgl.query.KkpcxxQuery;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;

/**
 * 卡口盘查信息
 *
 */
public class KkpcxxService {
	
	public PageResultInfo<ZapcxxBean> kkpcxxList(PageInfo pageInfo, 
			KkpcxxQuery kkpcxxQuery) throws Exception{
		return KkpcxxDao.kkpcxxList(pageInfo, kkpcxxQuery);
	}
	
	/**
	 * 新增卡口盘查信息
	 */
	public void addKkpcxx(ZapcxxBean zapcxxBean) throws Exception{
		if("1".equals(zapcxxBean.getCzbs())){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String pcbh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(), "seq_af_kkpcxx");
			zapcxxBean.setPcbh(pcbh);
			KkpcxxDao.addKkpcxx(zapcxxBean);
		}else if("2".equals(zapcxxBean.getCzbs())){
			KkpcxxDao.updateKkpcxxByPcbh(zapcxxBean);
		}
	}
	
	/**
	 * 得到卡口盘查信息
	 */
	public ZapcxxBean getKkpcxxByPcbh(KkpcxxQuery kkpcxxQuery) throws Exception{
		return KkpcxxDao.getKkpcxxByPcbh(kkpcxxQuery);
	}
}
