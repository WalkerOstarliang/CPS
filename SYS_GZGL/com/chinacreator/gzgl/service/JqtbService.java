package com.chinacreator.gzgl.service;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.gzgl.bean.JqtbBean;
import com.chinacreator.gzgl.dao.JqtbDao;
import com.chinacreator.gzgl.query.JqtbQueryBean;

public class JqtbService {
	
	public void insertJqtbBean(JqtbBean bean) throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String id=DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm") + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "t_gzgl_jqtb_id");
		bean.setId(id);
		bean.setDjdwdm(loginInfo.getOrgcode());
		bean.setDjdwmc(loginInfo.getOrgname());
		JqtbDao.insertJqtbBean(bean);
	}
	
	public PageResultInfo<JqtbBean> queryJqtbPageInfo(JqtbQueryBean queryBean,PageInfo pageInfo) throws Exception{
		return JqtbDao.queryJqtbPage(queryBean, pageInfo);
	}
	
	public void updateJqtbBean(JqtbBean bean) throws Exception{
		JqtbDao.updateJqtbBean(bean);
	}
	
	public JqtbBean queryJqtbBeanByid(String id, String tjyf, String orgcode) throws Exception{
		return JqtbDao.queryJqtbBeanByid(id, tjyf, orgcode);
	}
	
	public boolean queryJqtbBeanByny(String ny,String djdw) throws Exception{
		return JqtbDao.queryJqtbBeanByny(ny,djdw);
	}
}
