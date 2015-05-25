package com.chinacreator.zdry.services;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.zdry.bean.Lcsqxx;
import com.chinacreator.zdry.constant.ZdryConstant;
import com.chinacreator.zdry.dao.CollectDao;
import com.chinacreator.zdry.dao.IndexDao;
import com.chinacreator.zdry.query.LgdqtxQueryBean;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(首页逻辑层类)
 * @date Mar 7, 2013 4:50:56 PM
 */
public class IndexService implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8014541823967553357L;


	
	public PageResultInfo<LgdqtxQueryBean> queryLgdqtxList(LgdqtxQueryBean lgdqtx, PageInfo pageInfo) throws Exception {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(lgdqtx == null){
			lgdqtx = new LgdqtxQueryBean();
		}
		lgdqtx.setSspcsdm(loginInfo.getOrgcode());
		return IndexDao.queryLgdqtxList(lgdqtx, pageInfo);
	}
	
	public PageResultInfo<Lcsqxx> queryLgsqtxList(Lcsqxx lcsqxx, PageInfo pageInfo) throws Exception {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		lcsqxx.setJbshdwdm(loginInfo.getOrgcode());
		lcsqxx.setSqzt(ZdryConstant.ZDRY_SQZT_JS);
		return CollectDao.queryLcsqxxList(lcsqxx, pageInfo);
	}
}
