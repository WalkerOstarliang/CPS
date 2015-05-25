package com.chinacreator.qzgl.services;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.qzgl.bean.JfcyrxxBean;
import com.chinacreator.qzgl.bean.JftjdjxxBean;
import com.chinacreator.qzgl.dao.JftjDao;
import com.chinacreator.qzgl.query.JftjQueryBean;
import com.frameworkset.orm.transaction.TransactionException;
import com.frameworkset.orm.transaction.TransactionManager;

public class JftjService {

	public PageResultInfo<JftjdjxxBean> queryJftjxx(JftjQueryBean queryBean,
			PageInfo pageInfo) throws SQLException {
		return JftjDao.queryJftjxx(queryBean,pageInfo);
	}

	public void saveJftjdjxx(JftjdjxxBean jftjBean, String operType) throws SQLException
	{	
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (ValidateHelper.isEmptyString(jftjBean.getBh()))
		{
			String bh = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm")
						+ DateTimeHelper.getNowDateStr("yyyyMMdd") 
						+ CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_JFTJCYR", "left", 8, "0");
			jftjBean.setBh(bh);
			jftjBean.setDjrxm(loginInfo.getRealname());
			jftjBean.setDjrsfzh(loginInfo.getSfzh());
			jftjBean.setDjdwdm(loginInfo.getOrgcode());
			jftjBean.setDjdwmc(loginInfo.getOrgname());
			jftjBean.setDjrjh(loginInfo.getUsername());
			JftjDao.insertJftj(jftjBean);
		}
		else
		{
			JftjDao.updateJftj(jftjBean);
		}
	}

	public JftjdjxxBean getJftjByBh(String bh) throws SQLException {
		
		return JftjDao.getJftjByBh(bh);
	}

	public void deleteJftjxx(String bh) throws SQLException, RollbackException {
		TransactionManager tm = null;
		List<JfcyrxxBean> list = JftjDao.getJfcyrxxByjfbh(bh);
		tm = new TransactionManager();
		try {
			tm.begin();
			if(list !=null){
		    JftjDao.deleteJfcyrxx(bh);
			}
			JftjDao.deleteJftjxx(bh);
			tm.commit();
		} catch (TransactionException e) {
			e.printStackTrace();
			tm.rollback();
		}
		
	}

	public void deleteJftjxxByBh(String bhs) throws Exception {
		if (ValidateHelper.isNotEmptyString(bhs))
		{
			String[] sqbharr = bhs.split(",");
			for (String bh : sqbharr)
			{
				TransactionManager tm = null;
				List<JfcyrxxBean> list = JftjDao.getJfcyrxxByjfbh(bh);
				tm = new TransactionManager();
				try {
					tm.begin();
					if(list !=null){
				    JftjDao.deleteJfcyrxx(bh);
					}
					JftjDao.deleteJftjxx(bh);
					tm.commit();
				} catch (TransactionException e) {
					e.printStackTrace();
					tm.rollback();
				}
			}
		}
		
	}

	public List<JfcyrxxBean> getJfcyrxxByjfbh(String bh) throws SQLException {
		return JftjDao.getJfcyrxxByjfbh(bh);
	}

	public void deleteJfdsrxx(String bh) throws SQLException {
		JftjDao.deleteJfdsrxx(bh);
	}

	public PageResultInfo<JfcyrxxBean> getJftjcyrxxbyjfbh(String bh,
			PageInfo pageInfo) throws SQLException {
		return JftjDao.getJftjcyrxxbyjfbh(bh,pageInfo);
	}

	public void saveorupdatedsrxx(JfcyrxxBean jfcyrxxBean, String operType) throws SQLException {
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_JFTJCYR");
			jfcyrxxBean.setBh(bh);
			JftjDao.insertJfcyrxx(jfcyrxxBean);
		}else if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
			JftjDao.updateJftjcyr(jfcyrxxBean);
		}
		
	}

	public JfcyrxxBean getJftjcyrxxbybh(String dsrbh) throws SQLException {
		return JftjDao.getJftjcyrxxbybh(dsrbh);
	}
	
	public boolean isExistSfzh(String sfzh,String bh) throws Exception {
		boolean flag =false;
		JfcyrxxBean cyrxxBean = JftjDao.queryJfcyrxxBeanBySfzhAndBh(sfzh, bh);
		if(cyrxxBean != null){
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}

}
