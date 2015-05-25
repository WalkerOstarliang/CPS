package com.chinacreator.qzgl.services;


import java.io.File;
import java.sql.SQLException;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.qzgl.bean.FjBean;
import com.chinacreator.qzgl.bean.HbgzBean;
import com.chinacreator.qzgl.bean.HbgzyhrBean;
import com.chinacreator.qzgl.dao.HbgzDao;
import com.chinacreator.qzgl.query.HbgzQueryBean;
import com.frameworkset.orm.transaction.TransactionManager;

public class HbgzService {
	public PageResultInfo<HbgzBean> getHbgzList(HbgzQueryBean queryBean, PageInfo pageInfo)throws Exception{
		return HbgzDao.hbgzList(queryBean, pageInfo);
	}

	public HbgzBean getHbgzByBh(String bh) throws Exception{
		return HbgzDao.getHbgzxxByBh(bh);
	}
	
	public void addHbgz(HbgzBean bean)throws Exception{
		String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_HBGZ");
		String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
		bean.setBh(xzdm+bh);
		HbgzDao.addKongHbgzxx(bean);
	}
	
	public void updateHbgz(HbgzBean bean,String operType, String filename, File fj)throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			//String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_HBGZ");
			//bean.setBh(bh);
			TransactionManager tm = null;
			try
			{
				tm = new TransactionManager();
				tm.begin();
				bean.setCjrs(HbgzDao.queryhbgzyhrcount(bean.getBh()));
				LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
				bean.setDjrsfzh(loginInfo.getSfzh());
				HbgzDao.addKongHbgzxx(bean);
				if(fj!=null){
				FjBean fjbean = new FjBean();
				fjbean.setDjbh(bean.getBh());
				fjbean.setFjxx(fj);
				fjbean.setFjlx("1");
				fjbean.setFjmc(filename);
				HbgzDao.insertFjxx(fjbean); 
				}  
				if(bean.getYhrList()!=null){
				for(HbgzyhrBean yhr:bean.getYhrList()){
					if(yhr!=null){
					    String yhrbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_HBGZYHR");
					    yhr.setBh(yhrbh);
					    yhr.setBgbh(bean.getBh());
					 //  yhr.setBgbh(bh);
					    HbgzDao.insertHngzcyr(yhr);
					}
				}
				}
				tm.commit();
			}
			catch(Exception e)
			{
				e.printStackTrace();
				tm.rollback();
			}
			}else if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
				  HbgzDao.updateHbgzxx(bean);
				  FjBean fjbean= HbgzDao.getFjxxByBgbh(bean.getBh());
				  if(!filename.equals("")||filename!=null){
					  HbgzDao.deleteFjxx(bean.getBh());
					  fjbean = new FjBean();
					  fjbean.setDjbh(bean.getBh());
					  fjbean.setFjxx(fj);
					  fjbean.setFjlx("1");
					  fjbean.setFjmc(filename);
					  HbgzDao.insertFjxx(fjbean);  
				  }	   
			     /* for(HbgzyhrBean yhr:bean.getYhrList()){
			    	  if(CommonConstant.OPERTYPE_ADD.equals(yhr.getOperType())){
			    		  String hyrbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_HBGZYHR");
						  yhr.setBh(hyrbh);
						  yhr.setBgbh(bean.getBh());
						  HbgzDao.insertHngzcyr(yhr);
			    	  }else if(CommonConstant.OPERTYPE_UPDATE.equals(yhr.getOperType())){
			    	      HbgzDao.updateHbgzyhrxx(yhr);
			    	  
			     }}*/
			}
	}
	
	public void deleteHbgz(String bh)throws Exception{
		TransactionManager tm = null;
		try{
		tm = new TransactionManager();
		tm.begin();
		FjBean fjBean =HbgzDao.getFjxxByBgbh(bh);
		List<HbgzyhrBean> list = HbgzDao.cyrList(bh);
		if(fjBean!=null){
		HbgzDao.deleteFjxx(bh);
		}
		if(list!=null){
		HbgzDao.deleteHbgzyhrxx(bh);
		}
		HbgzDao.deleteHbgzxx(bh);
		tm.commit();
		}catch (Exception e) {
			e.printStackTrace();
			tm.rollback();
		}
	}
	

	public PageResultInfo<HbgzyhrBean> getHbgzcyrList(String bh, PageInfo pageInfo) throws Exception{
		return HbgzDao.hbgzcyrList(bh,pageInfo);
	}
	
	public void insertHbgzcyr(HbgzyhrBean bean, String operType) throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
		String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_HBGZYHR");
		bean.setBh(bh);
		HbgzDao.insertHngzcyr(bean);
		}else if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
			HbgzDao.updateHbgzyhrxx(bean);
		}
	}
	
	public void deleteHbgzcyr(HbgzyhrBean bean)throws Exception{
		HbgzDao.deleteHbgzyhrxxByBh(bean);
	}
	
	public void insertFjxx(FjBean bean)throws Exception{
		HbgzDao.insertFjxx(bean);
	}
	
	public void addCyrxx(HbgzyhrBean bean)throws Exception{
		HbgzDao.insertHngzcyr(bean);
		
	}
	
	public FjBean getFjxxByBgbh(String bgbh)throws Exception{
		return HbgzDao.getFjxxByBgbh(bgbh);
	}

	public void deletehbgzyhrxx(String bh) throws Exception {
		HbgzyhrBean bean = HbgzDao.getHbgzyhrxx(bh);
		HbgzDao.deleteHbgzyhrxxByBh(bean);
	}

	public void batchdeletehbgzxx(String bhs) throws RollbackException {
		if(ValidateHelper.isNotEmptyString(bhs)){
			String[] hbgzbh = bhs.split(",");
			for(String bh:hbgzbh){
				TransactionManager tm = null;
				try{
				tm = new TransactionManager();
				tm.begin();
				FjBean fjBean =HbgzDao.getFjxxByBgbh(bh);
				List<HbgzyhrBean> list = HbgzDao.cyrList(bh);
				if(fjBean!=null){
				HbgzDao.deleteFjxx(bh);
				}
				if(list!=null){
				HbgzDao.deleteHbgzyhrxx(bh);
				}
				HbgzDao.deleteHbgzxx(bh);
				tm.commit();
				}catch (Exception e) {
					e.printStackTrace();
					tm.rollback();
				}
			}
		}
		
	}

	public List<HbgzyhrBean> getHbgzcyrListbybh(String bh) throws Exception {
		return HbgzDao.cyrList(bh);
	}

	public HbgzyhrBean getHbgzcyrbybh(String cyrbh) throws SQLException {
		return HbgzDao.getHbgzyhrxx(cyrbh);
	}

	public void deletehbgzyhr(String bh) throws SQLException {
		HbgzDao.deleteHbgzyhrxxbybh(bh);
		
	}

	
}
