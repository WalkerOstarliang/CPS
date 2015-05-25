package com.chinacreator.afgl.services;

import com.chinacreator.afgl.bean.KywpxxBean;
import com.chinacreator.afgl.dao.KywpxxDao;
import com.chinacreator.afgl.query.KywpxxQuery;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 可疑物品信息
 *
 */
public class KywpxxService {
	
	public PageResultInfo<KywpxxBean> kywpxxList(PageInfo pageInfo, 
			KywpxxQuery kywpxxQuery) throws Exception{
		return KywpxxDao.kywpxxList(pageInfo, kywpxxQuery);
	}
	
	/**
	 * 新增可疑物品；物品来源类别和盘查编号的填写
	 */
	public void addKywpxx(KywpxxBean kywpxxBean) throws Exception{
		if("1".equals(kywpxxBean.getCzbs())){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String kywpbh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(), "seq_af_kywpxx");
			kywpxxBean.setKywpbh(kywpbh);
			if(ValidateHelper.isNotEmptyString(kywpxxBean.getPcbh())){
				kywpxxBean.setWplylx("1");
			}else{
				kywpxxBean.setWplylx("2");
			}
			KywpxxDao.addKywpxx(kywpxxBean);
		}else if("2".equals(kywpxxBean.getCzbs())){
			KywpxxDao.updateKywpxxByKywpbh(kywpxxBean);
		}
	}
	
	/**
	 * 得到可疑物品详情
	 */
	public KywpxxBean getKywpxxByKywpbh(KywpxxQuery kywpxxQuery) throws Exception{
		return KywpxxDao.getKywpxxByKywpbh(kywpxxQuery);
	}
}
