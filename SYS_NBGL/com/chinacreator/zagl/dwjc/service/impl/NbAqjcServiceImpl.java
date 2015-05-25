package com.chinacreator.zagl.dwjc.service.impl;

import java.io.File;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.dwjc.bean.NbAqJcZpBean;
import com.chinacreator.zagl.dwjc.bean.NbaqjcBean;
import com.chinacreator.zagl.dwjc.dao.NbAqjcDao;
import com.chinacreator.zagl.dwjc.dao.impl.NbAqjcDaoImpl;
import com.chinacreator.zagl.dwjc.service.NbaqjcService;
import com.frameworkset.orm.transaction.TransactionManager;

public class NbAqjcServiceImpl implements NbaqjcService {

	private static final long serialVersionUID = 2972303998977065613L;

	private NbAqjcDao dao = new NbAqjcDaoImpl();

	@Override
	public NbaqjcBean queryNbAqjcById(String id) {
		NbaqjcBean aqjc = null;
		try {
				aqjc = dao.queryNbAqjcById(id);
		} catch (SQLException e) {
			aqjc = null;
			e.printStackTrace();
		}
		return aqjc;
	}

	@Override
	public PageResultInfo<NbaqjcBean> queryNbAqjcByJgbh(String jgbh,PageInfo pageinfo) {
		try{	
			return dao.queryNbAqjcByJgbh(jgbh,pageinfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return  null;
		}
		
	}

	@Override
	public NbaqjcBean saveNbAqjc(NbaqjcBean bean) {
		NbaqjcBean aqjc = null;
		if (ValidateHelper.isNotEmptyString(bean.getId())) {
			// 修改
			bean.initCzxx();
			bean.setCzbs(CommonConstant.CZBZ_UPDATE);
			try {
				dao.updateNbaqjc(bean);
				aqjc = bean;
				aqjc.setIssave(true);// 保存成功
			} catch (SQLException e) {
				aqjc = null;
				System.out.println("修改内保单位安全检查失败。");
				e.printStackTrace();
			}
		} else {
			// 新增
			String id = CommonDBBaseHelper.getSequence(
					CommonConstant.DBNAME_SQJW, "SEQ_ZA_NBDWJC_ID");
			bean.setId(id);
			bean.initDjxx();
			bean.initCzxx();
			bean.setCzbs(CommonConstant.CZBZ_ADD);
			try {
				dao.insertNbAqjc(bean);
				aqjc = bean;
			} catch (SQLException e) {
				aqjc = null;
				System.out.println("新增内保单位安全检查失败。");
				e.printStackTrace();
			}
		}
		return aqjc;
	}

	@Override
	public void saveNbAqjcZp(NbAqJcZpBean zpbean,File[] zpUploads) {
		
		try {
			List<NbAqJcZpBean> nbaqjczplist = wrapNbajzpBean(zpUploads,zpbean);
			dao.insertAqJcZp(nbaqjczplist);
			
		} catch (SQLException e) {
			System.out.println("上传内保单位安全检查隐患照片失败。");
			e.printStackTrace();
		}
		
	}
	private List<NbAqJcZpBean> wrapNbajzpBean(File[] zpUploads,NbAqJcZpBean zpbean){
		List<NbAqJcZpBean> list =null;
		if (zpUploads != null && zpUploads.length > 0){
			list = new ArrayList<NbAqJcZpBean>();
			NbAqJcZpBean ajzpBean =null;
			for (int i=0; i<zpUploads.length;i++){
				ajzpBean = new NbAqJcZpBean();
				ajzpBean.setZpid(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_NBAJZPID"));
				ajzpBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				ajzpBean.setAqjcid(zpbean.getAqjcid());
				ajzpBean.setYhdd(zpbean.getYhdd());
				ajzpBean.setJgbh(zpbean.getJgbh());
				ajzpBean.setDwlb(zpbean.getDwlb());
				ajzpBean.setYhddzp(zpUploads[i]);
				list.add(ajzpBean);
			}
		}
		return list;
	}

	@Override
	public Blob getNbaqjcZpxxInputStream(String zpid) throws Exception{
		return dao.getAjxxzpStream(zpid);
	}

	@Override
	public void deleteNbajZpxxByZpid(String zpid) throws SQLException {
		dao.deleteNbajZpxxByZpid(zpid);
	}

	@Override
	public List<NbAqJcZpBean> querNbAqjczplistbyaqid(String aqjcid,String yydd) {
		List<NbAqJcZpBean> list = new ArrayList<NbAqJcZpBean>();
		try {
			list=dao.queryNbAqjczpxxListbyaqid(aqjcid, yydd);
		} catch (SQLException e) {
			list=null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void cxnbhqCheck(String jgbh) throws Exception {
		TransactionManager tr = new TransactionManager();
		try{
			tr.begin();
			  dao.updatenbhqDWjgb(jgbh);
			  dao.updatenbhqhqb(jgbh);
			tr.commit();
			
		}catch(Exception e){
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}

	@Override
	public NbaqjcBean queryLastCheckByJgbh(String jgbh) {
		try {
			return dao.queryLastCheckByJgbh(jgbh);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
