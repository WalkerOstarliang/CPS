package com.chinacreator.qzgl.services;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.qzgl.bean.LxdjBean;
import com.chinacreator.qzgl.dao.LxdjDao;
import com.chinacreator.qzgl.query.LxclQueryBean;
import com.chinacreator.qzgl.query.LxdjQueryBean;
import com.frameworkset.orm.transaction.TransactionManager;

public class LxdjService {
	/**
	 * 获得来信来访登记页面的列表 </br>
	 * queryBean保存查询条件
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<LxdjBean> lxcxList(LxdjQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		return LxdjDao.lxcxList(queryBean, pageInfo);
	}
	
	/**
	 * 获得来信来访处理页面的列表 </br>
	 * queryBean保存查询条件 
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<LxdjBean> lxcxList(LxclQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		return LxdjDao.lxclList(queryBean, pageInfo);
	}
	
	/***
	 * 根据编号获得来信来访的详细信息
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public LxdjBean getLxdjBeanByBh(String bh) throws Exception{
		return LxdjDao.getBeanByBh(bh);
	}

	/**
	 * 新增或更新来信来访登记信息表
	 * @param bean
	 * @param operType
	 * @param zf
	 * @throws Exception
	 */
	public void insertLxdjBean(LxdjBean bean,String operType) throws Exception
	{
		//新增
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			//生成主键值
			String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_LFLXBH");
			bean.setBh(bh);
			/*if("zhuanfa".equals(zf)){
				//如果新增的时候就转发
				//新增转发流转信息
				//获得转发流转的主键值
				String zfbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_ZFXX");
				bean.setZfbh(zfbh);
				//先保存转发信息（暂未新增来访来信信息，所以只能更新流转表）
				LxdjDao.zhuanfaOnlyLxdj(bean);
			}
			//新增来访信息*/
			TransactionManager tm = new TransactionManager();
			try{
			tm.begin();
			bean.setClsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			LxdjDao.insertLxdjBean(bean);
			String zfbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_ZFXX");
			bean.setZfbh(zfbh);
			bean.setCzlx("1");//登记
			bean.setCzrxm(bean.getDjrxm());
			bean.setCzrjh(bean.getDjrjh());
			bean.setCzrdwdm(bean.getDjdwdm());
			bean.setCzrdwmc(bean.getDjdwmc());
		    bean.setZfdwdm(bean.getJsdwdm());
		    bean.setZfdwmc(bean.getJsdwmc());
		   
		    LxdjDao.zhuanfaLxdj(bean);
		    tm.commit();
			}catch (Exception e) {
				tm.rollback();
				e.printStackTrace();
			}
			
		
		}
		else if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
			//只更新来访信息而未转发
			updateLxdj(bean);
		}
		
	}
	
	/**
	 * 根据编号删除来信登记
	 * @param bh
	 * @throws Exception
	 */
	public void deleteLxdjByBh(String bh) throws Exception{
		TransactionManager tm = new TransactionManager();
		try{
		tm.begin();
		LxdjDao.deleteLxdjByBh(bh);
		LxdjDao.deleteZfByBh(bh);
		tm.commit();
		}catch (Exception e) {
			// TODO: handle exception
		   tm.rollback();
		   e.printStackTrace();
		}
	}
	
	/**
	 * 更新来信来访信息
	 * @param bean
	 * @throws Exception
	 */
	public void updateLxdj(LxdjBean bean) throws Exception{
		LxdjDao.updateLxdj(bean);
	}
	
	/**
	 * 更行来信来访（处理完成）
	 * @param bean
	 * @throws Exception
	 */
	public void chuliLxdj(LxdjBean bean) throws Exception{
		bean.setCzlx("3");//处理
		String zfbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_ZFXX");
		bean.setZfbh(zfbh);
		bean.setCzrxm(bean.getClrxm());
		bean.setCzrjh(bean.getClrjh());
		bean.setCzrdwdm(bean.getCldwdm());
		bean.setCzrdwmc(bean.getCldwmc());
	    bean.setZfdwdm(bean.getJsdwdm());
	    bean.setZfdwmc(bean.getJsdwmc());
	    bean.setClsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		LxdjDao.zhuanfaLxdj(bean);
		LxdjDao.chuliLxdj(bean);
	}
	
	/**
	 * 转发（更改包括来信来访信息和转发流转表信息）
	 * @param bean
	 * @throws Exception
	 */
	public void zhuanfaLxdj(LxdjBean bean) throws Exception{
		//获得转发流转的主键值
		bean.setJsdwdm(bean.getZfdwdm());
		bean.setJsdwmc(bean.getZfdwmc());
		String zfbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_ZFXX");
		bean.setZfbh(zfbh);
		bean.setClsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		TransactionManager tm = new TransactionManager();
		try{
			tm.begin();
			bean.setCllx("2");
			LxdjDao.updateLxdj(bean);
			LxdjDao.zhuanfaLxdj(bean);
			tm.commit();
		}catch (Exception e) {
			// TODO: handle exception
			tm.rollback();
			e.printStackTrace();
		}
	}
}
