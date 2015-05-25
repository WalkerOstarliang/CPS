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
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.qzgl.bean.ZyzdjxxBean;
import com.chinacreator.qzgl.bean.ZyzzcxxBean;
import com.chinacreator.qzgl.dao.ZyzDao;
import com.chinacreator.qzgl.query.ZyzQueryBean;
import com.frameworkset.orm.transaction.TransactionException;
import com.frameworkset.orm.transaction.TransactionManager;

public class ZyzService {

	public PageResultInfo<ZyzdjxxBean> getZyzxx(ZyzQueryBean queryBean,
			PageInfo pageInfo) throws SQLException {
		return ZyzDao.getZyzxx(queryBean,pageInfo);
	}

	public ZyzdjxxBean getZyzByBh(String bh) throws SQLException {
		return ZyzDao.getZyzByBh(bh);
	}

	public void deleteZyz(String bh) throws SQLException, RollbackException {
		TransactionManager tm = null;
		List<ZyzzcxxBean> list = ZyzDao.queryZcxx(bh);
		tm = new TransactionManager();
		try {
			tm.begin();
			if(list !=null){
		    ZyzDao.deleteZyzzc(bh);
			}
			ZyzDao.deleteZyz(bh);
			tm.commit();
		} catch (TransactionException e) {
			e.printStackTrace();
			tm.rollback();
		}
	}

	public void saveZcxx(ZyzzcxxBean zyzzcxxBean,String bh) throws SQLException {
		String zcbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_ZYZZCBH");
		zyzzcxxBean.setBh(zcbh);
	}

	public ZyzdjxxBean saveZyz(ZyzdjxxBean zyzdjxxBean,String operType) throws Exception {
		if(ValidateHelper.isEmptyString(zyzdjxxBean.getBh())){
			String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_ZYZDJ");
			zyzdjxxBean.setBh(bh);
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			zyzdjxxBean.setDjrsfzh(loginInfo.getSfzh());
			ZyzDao.insertZyz(zyzdjxxBean);
		}else{
		    ZyzDao.updateZyz(zyzdjxxBean);
		}
		return zyzdjxxBean;
		
	}
	public  List<ZyzzcxxBean> queryZcxx(String bh) throws SQLException{
		return ZyzDao.queryZcxx(bh);
	}

	public void insertZcxx(ZyzzcxxBean zyzzcxxBean) throws SQLException {
		String zcbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_ZYZZCBH");
		 zyzzcxxBean.setBh(zcbh);
		 ZyzDao.insertZcxx(zyzzcxxBean);
	}

	/*public PageResultInfo<ZyzzcxxBean> getZyzzcxx(ZyzdjxxBean zyzdjxxBean,
			PageInfo pageInfo) throws SQLException {
		return ZyzDao.getZyzzcxx(zyzdjxxBean,pageInfo);
	}
*/
	public void deleteZc(String bh) throws SQLException {
		ZyzDao.deleteZyzzcxx(bh);
	}

	public void deleteZyzxx(String bhs) throws SQLException, RollbackException {
		if (ValidateHelper.isNotEmptyString(bhs))
		{
			String[] sqbharr = bhs.split(",");
			for (String bh : sqbharr)
			{
				TransactionManager tm = null;
				List<ZyzzcxxBean> list = ZyzDao.queryZcxx(bh);
				tm = new TransactionManager();
				try {
					tm.begin();
					if(list !=null){
				    ZyzDao.deleteZyzzc(bh);
					}
					ZyzDao.deleteZyz(bh);
					tm.commit();
				} catch (TransactionException e) {
					e.printStackTrace();
					tm.rollback();
				}
			}
		}
		
		
	}

	public PageResultInfo<ZyzzcxxBean> getZyzzcxx(String bh, PageInfo pageInfo) throws SQLException {
		return ZyzDao.getZyzzcxx(bh, pageInfo);
	}

	public ZyzzcxxBean getZyzzcByBh(String bh) throws SQLException {
		return ZyzDao.getzyzzcBybh(bh);
	}

	public void insertOrupdateZcxx(ZyzzcxxBean zyzzcxxBean, String operType) throws SQLException {
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			String zcbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_ZYZZCBH");
			zyzzcxxBean.setBh(zcbh);
			ZyzDao.insertZcxx(zyzzcxxBean);
		}else if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
			ZyzDao.updateZyzzc(zyzzcxxBean);
		}
		
	}
	
	public  ZyzdjxxBean  getZyzxxBysfzh(String  sfzh) throws Exception{
		return ZyzDao.getZyzxxBysfzh(sfzh);
	}
	
	public  boolean queryZyzdjxxBeanBySfzhAndOrgcode(String sfzh,String orgcode) throws SQLException {
		ZyzdjxxBean bean=ZyzDao.queryZyzdjxxBeanBySfzhAndOrgcode(sfzh, orgcode);
		boolean flag=false;
		if(bean !=null){
			flag=true;
		}else{
			flag=false;
		}
		return flag;
	}

}
