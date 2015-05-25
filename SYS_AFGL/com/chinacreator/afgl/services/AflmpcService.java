package com.chinacreator.afgl.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.afgl.bean.AflmpcBean;
import com.chinacreator.afgl.bean.AflmpctxrBean;
import com.chinacreator.afgl.dao.LmpcDao;
import com.chinacreator.afgl.query.LmpcxxQuery;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.frameworkset.orm.transaction.TransactionManager;

public class AflmpcService {

	public PageResultInfo<AflmpcBean> queryLmpcList(LmpcxxQuery queryBean,
			PageInfo pageInfo) throws SQLException {
		return LmpcDao.queryLmpcList(queryBean,pageInfo);
	}

	public AflmpcBean queryLmpcBeanByJlbh(String jlbh) throws SQLException {
		return LmpcDao.queryLmpcBeanByJlbh(jlbh);
	}

	public PageResultInfo<AflmpctxrBean> queryLmpctxrBeanList(String jlbh, PageInfo pageInfo) throws SQLException {
		return LmpcDao.queryLmpctxrBeanList(jlbh,pageInfo);
	}

	public void saveLmpcxx(String operType, AflmpcBean lmpcBean, List<AflmpctxrBean> txrBeanList) throws RollbackException {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TransactionManager tm = new TransactionManager();
		try{
		tm.begin();
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			String pcbh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(), "seq_af_kkpcxx");
			lmpcBean.setJlbh(pcbh);
			LmpcDao.insertLmpcxxBean(lmpcBean);
			List<AflmpctxrBean> txrList = new ArrayList<AflmpctxrBean>();
			for(AflmpctxrBean txr:txrBeanList){
				if(!txr.getTxrsfzh().equals("")||!txr.getTxrxm().equals("")){
				String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LMPC_TXR");
				txr.setId(id);
				txr.setPcbh(pcbh);
				txrList.add(txr);
				}
			}
			LmpcDao.batchInsertTxrxx(txrList);
		
		}else if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
			lmpcBean.setXgrdwdm(loginInfo.getOrgcode());
			lmpcBean.setXgrdwmc(loginInfo.getOrgname());
			lmpcBean.setXgrxm(loginInfo.getRealname());
			String xgsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
			lmpcBean.setXgsj(xgsj);
			LmpcDao.updateLmpcxxBean(lmpcBean);
			List<AflmpctxrBean> txrList = new ArrayList<AflmpctxrBean>();
			for(AflmpctxrBean txr:txrBeanList){
				if(txr!=null){
				String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LMPC_TXR");
				txr.setId(id);
				txr.setPcbh(lmpcBean.getJlbh());
				txrList.add(txr);
				}
			}
			LmpcDao.batchInsertTxrxx(txrList);
			
		}
		tm.commit();
		}catch (Exception e) {
			e.printStackTrace();
		
			tm.rollback();
		}
		
	}

	public void deltxrxxById(String id) throws SQLException {
		LmpcDao.deltxrxxById(id);
		
	}
   /**
    * 导出路面盘查信息
    * @param queryBean
    * @return
    */
	public List<AflmpcBean> queryLmpcBeanListDown(LmpcxxQuery queryBean){
		try {
			return LmpcDao.queryLmpcBeanListDowns(queryBean);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<AflmpcBean> queryLmpcBeanListXZDown(String v_ljbh){
		try {
			return LmpcDao.queryLmpcBeanListXZDowns(v_ljbh);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean updateZxLmpcxx(String v_jlbh){
		try {
			LmpcDao.updateZxLmpcxx(v_jlbh);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
