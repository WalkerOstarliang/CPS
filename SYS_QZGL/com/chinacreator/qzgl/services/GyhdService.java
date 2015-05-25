package com.chinacreator.qzgl.services;

import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.qzgl.bean.FjBean;
import com.chinacreator.qzgl.bean.GyhdBean;
import com.chinacreator.qzgl.dao.GyhdDao;
import com.chinacreator.qzgl.query.GyhdQueryBean;
import com.frameworkset.orm.transaction.TransactionManager;

public class GyhdService {
	/***
	 * 根据查询条件获得相应的公益活动列表</br>
	 * 查询条件保存在querybean中
	 * @param querybean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<GyhdBean> getGyhdList(GyhdQueryBean querybean,PageInfo pageInfo)	throws Exception{
		return GyhdDao.gyhdList(querybean, pageInfo);
	}
	
	/**
	 * 查询某一公益活动的附件列表
	 * @param bh 公益活动编号
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<FjBean> getGyhdFjList(String bh,PageInfo pageInfo)throws Exception{
		return GyhdDao.getFjxxByGyhdBh(bh, pageInfo);
	}
	
	/**
	 * 根据操作类型选择新增或修改
	 * @param bean
	 * @param operType
	 * @param uploadFileName 
	 * @param upload 
	 * @throws Exception
	 */
	public void updateGyhdxx(GyhdBean bean,String operType,List<FjBean> fjBeanList )throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			bean.setDjrsfzh(loginInfo.getSfzh());
			GyhdDao.insertGyhd(bean);
		}
		else if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
			GyhdDao.updateGyhd(bean);
		}
		// 插入附件
		if (ValidateHelper.isNotEmptyCollection(fjBeanList))
		{
			GyhdDao.insertGyhdfjList(fjBeanList);
		}
	}
	
	/**
	 * 删除某条公益活动信息</br>
	 * 删除改公益活动信息下的所有附件
	 * @param bh
	 * @throws Exception
	 */
	public void deleteGyhbxx(String bh)throws Exception{
		GyhdDao.deleteFjxxByGyhdBh(bh);
		GyhdDao.deleteGyhd(bh);
	}
	
	/**
	 * 插入附件信息
	 * @param bean
	 * @throws Exception
	 */
	public void insertFjxx(FjBean bean)throws Exception{
		GyhdDao.insertFjxx(bean);
	}
	
	/**
	 * 删除附件信息</br>
	 * 删除编号为bh的附件信息
	 * @param bh
	 * @throws Exception
	 */
	public void deleteFjxxByBh(String bh)throws Exception{
		GyhdDao.deleteFjxxByBh(bh);
	}
	
	/**
	 * 根据编号获得公益活动的信息
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public GyhdBean getGyhdByBh(String bh) throws Exception{
		return GyhdDao.getGyhdByBh(bh);
	}
	
	public List<FjBean> getFjxxByGyhd(String bh)throws Exception{
		return GyhdDao.getFjxxByGyhd(bh);
	}

	public void insertFjxx(FjBean fjBean, String operType) throws Exception {
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			GyhdDao.insertFjxx(fjBean);
		}else if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
			GyhdDao.deleteFjxxByBh(fjBean.getBh());
			GyhdDao.insertFjxx(fjBean);
		}
		
	}

	public void batchdeleteGyhdxx(String bhs) throws RollbackException {
		if(ValidateHelper.isNotEmptyString(bhs)){
			String[] gyhdbh = bhs.split(",");
			for(String bh:gyhdbh){
				TransactionManager tm = null;
				try{
				tm = new TransactionManager();
				tm.begin();
				List<FjBean> fjList = GyhdDao.getFjxxByGyhd(bh);
				if(fjList!=null){
					for(FjBean bean:fjList){
						GyhdDao.deleteFjxxByGyhdBh(bean.getDjbh());
					}
				}
				GyhdDao.deleteGyhd(bh);
				tm.commit();
				}catch (Exception e) {
					e.printStackTrace();
					tm.rollback();
				}
			}
		}
		
		
	}
}
