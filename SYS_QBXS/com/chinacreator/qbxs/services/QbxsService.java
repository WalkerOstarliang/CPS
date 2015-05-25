package com.chinacreator.qbxs.services;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.qbxs.bean.QbxsGgxxBean;
import com.chinacreator.qbxs.bean.QbxsSjxxBean;
import com.chinacreator.qbxs.dao.QbxsDao;
import com.chinacreator.qbxs.query.QbxsQueryBean;
import com.frameworkset.common.poolman.DBUtil;

public class QbxsService {
	
	LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
	
	/**
	 * 保存情报线索
	 * @return
	 */
	public QbxsSjxxBean saveQbxs(QbxsSjxxBean bean){
		if(ValidateHelper.isEmptyString(bean.getId())){
			try {
				String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QBXS_ID");
				bean.setId(id);
				LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
				bean.setCjrsfzh(loginInfo.getSfzh());
				String ldxxbh = getLdxxBh(loginInfo.getOrgcode());
				bean.setLdxxbh(ldxxbh);
				QbxsDao.insertQbxsSjxx(bean);
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}else{
			try {
				QbxsDao.updateQbxsSjxx(bean);
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		
		return bean;
	}
	
	/**
	 * 分页查询情报线索事件信息
	 */
	
	public PageResultInfo<QbxsSjxxBean> queryQbxsSjxxPageInfo(QbxsQueryBean queryBean,PageInfo pageInfo) throws Exception{
		return QbxsDao.queryQbxsSjxxPageInfo(queryBean, pageInfo);
	}
	
	/**
	 * 删除情报线索事件信息
	 */
	
	public void deleteQbxsSjxx(String id) throws Exception{
		QbxsDao.deleteQbxsSjxx(id);
	}
	
	
	/**
	 * 新增涉及骨干信息
	 * @throws Exception 
	 */
	public void insertQbxsGgxx(QbxsGgxxBean ggxxBean) throws Exception{
		QbxsDao.insertQbxsGgxx(ggxxBean);
	}
	
	/**
	 * 更新涉及骨干信息
	 */
	public void updateQbxsGgxx(QbxsGgxxBean ggxxBean) throws Exception{
		QbxsDao.updateQbxsGgxx(ggxxBean);
	}
	
	/**
	 * 分页查询涉及骨干信息
	 */
	public PageResultInfo<QbxsGgxxBean> queryQbxsGgxxPageInfo(QbxsQueryBean queryBean,PageInfo pageInfo) throws Exception{
		return QbxsDao.queryQbxsGgxxPageInfo(queryBean, pageInfo);
	}
	
	/**
	 * 删除涉及骨干信息
	 */
	public void deleteQbxsGgxx(String id) throws Exception{
		QbxsDao.deleteQbxsGgxx(id);
	}
	
	
	/**
	 * 根据id 查询涉事骨干信息
	 */
	public QbxsGgxxBean queryGgxxBeanById(String id) throws Exception{
		return QbxsDao.queryGgxxBeanById(id);
	}
	
	/**
	 * 根据id 查询情报线索事件信息
	 */
	public QbxsSjxxBean querySjxxBeanById(String id) throws Exception{
		return QbxsDao.querySjxxBeanById(id);
	}
	
	//获取联动信息编号
	protected String getLdxxBh(String orgCode) throws Exception{
		String ldxxbh = "";
		DBUtil db = new DBUtil();
		String sql = "select f_get_ldxxbh('" + orgCode + "') from dual";
		try {
			db.executeSelect(CommonConstant.DBNAME_SQJW, sql);
			if(db.size()>0){
				ldxxbh = db.getString(0, 0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if("".equals(ldxxbh)){
			throw new Exception("获取联动信息编号失败!");
		}
		return ldxxbh;
	}

	/**
	 * 保存或修改骨干信息
	 * @param ggxxBean
	 * @throws Exception
	 */
	public void saveQbxsGgxx(QbxsGgxxBean ggxxBean) throws Exception {
		if(ValidateHelper.isEmptyString(ggxxBean.getId())){
			String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QBXS_GGXX_ID");
			ggxxBean.setId(id);
			insertQbxsGgxx(ggxxBean);
		}else{
			updateQbxsGgxx(ggxxBean);
		}
	}
}
