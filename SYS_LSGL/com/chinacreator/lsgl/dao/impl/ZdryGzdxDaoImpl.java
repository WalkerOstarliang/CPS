package com.chinacreator.lsgl.dao.impl;

import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.lsgl.bean.ZdryGzryxxBean;
import com.chinacreator.lsgl.bean.ZdryJsbrzsxxBean;
import com.chinacreator.lsgl.bean.ZdryJsbxBean;
import com.chinacreator.lsgl.bean.ZdryJzdxxxBean;
import com.chinacreator.lsgl.bean.ZdrySwryBean;
import com.chinacreator.lsgl.bean.ZdrySwrysfjlBean;
import com.chinacreator.lsgl.bean.ZdryXdchNjxxBean;
import com.chinacreator.lsgl.bean.ZdryXdryxxBean;
import com.chinacreator.lsgl.dao.ZdryGzdxDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;
/**
 * 
 * @author zhun.liu
 *
 */
public class ZdryGzdxDaoImpl  implements ZdryGzdxDao{
	
	private static ConfigSQLExecutor  executor = new ConfigSQLExecutor("com/chinacreator/lsgl/dao/zdrygzdx-sql.xml");

	/**
	 * 插入精神病人
	 */
	public void insertZdryJsbrBean(ZdryJsbxBean jsbrBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryJsbrBean", jsbrBean);
	}

	public ZdryJsbxBean queryZdryJsbrBySfzh(String sfzh) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 根据工作对象编号查询精神病人信息
	 */
	public ZdryJsbxBean queryZdryJsbrByGzdxbh(String gzdxbh) throws Exception {
		return executor.queryObjectWithDBName(ZdryJsbxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryJsbrByGzdxbh", gzdxbh);
	}
	/**
	 * 更新精神病人
	 */
	public void updateZdryJsbrBean(ZdryJsbxBean jsbrBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdryJsbrBean", jsbrBean);
	}
	
	/**
	 * 插入精神病人肇事信息
	 */
	public void insertZdryJsbrzsxxBean(ZdryJsbrzsxxBean jsbrzsBean)
			throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryJsbrzsxxBean", jsbrzsBean);
		
	}
	
	/**
	 * 更新精神病人肇事信息
	 */
	public void updateZdryJsbrzsxxBean(ZdryJsbrzsxxBean jsbrzsBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdryJsbrzsxxBean", jsbrzsBean);
	}
	
	/**
	 * 插入涉稳人员
	 */
	public void insertZdrySwryBean(ZdrySwryBean swryBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdrySwryBean", swryBean);
	}
	
	/**
	 * 修改涉稳人员
	 */
	public void updateZdrySwryBean(ZdrySwryBean swryBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdrySwryBean", swryBean);
	}
	
	/**
	 * 插入涉稳人员上访记录
	 */
	public void insertZdrySwrySfjlBean(ZdrySwrysfjlBean swrysfjlBean)
			throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdrySwrySfjlBean", swrysfjlBean);
	}

	/**
	 * 根据jsbrbh分页查询精神病人肇事信息
	 */
	public PageResultInfo<ZdryJsbrzsxxBean> queryZdryJsbrzsPageResult(
			String jsbrbh, PageInfo pageInfo) throws Exception {
		ListInfo list=executor.queryListInfoWithDBName(ZdryJsbrzsxxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryJsbrzsPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), jsbrbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	public ZdryJsbrzsxxBean queryZdryJsbrzsxxBeanByJsbrbh(String jsbrbh)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 根据身份证号查询涉稳人员基本信息
	 */
	public ZdrySwryBean queryZdrySwryBeanBySfzh(String sfzh) throws Exception {
		return executor.queryObjectWithDBName(ZdrySwryBean.class,CommonConstant.DBNAME_SQJW,"queryZdrySwryBeanBySfzh"	, sfzh);
	}
	
	/**
	 * 根据涉稳人员编号分页查询涉稳人员上访记录
	 */
	public PageResultInfo<ZdrySwrysfjlBean> queryZdrySwrysfjlPageResult(
			String swrybh, PageInfo pageInfo) throws Exception {
		ListInfo listInfo=executor.queryListInfoWithDBName(ZdrySwrysfjlBean.class, CommonConstant.DBNAME_SQJW, "queryZdrySwrysfjlPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), swrybh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 修改涉稳人员上访记录bean
	 */
	public void updateZdrySwrySfjlBean(ZdrySwrysfjlBean swrysfjlBean)
			throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdrySwrySfjlBean", swrysfjlBean);
	}
	
	/**
	 * 更新矫正对象信息
	 */
	public void updateZdryJzdxInfo(ZdryJzdxxxBean jzdxBean) throws SQLException {
		// TODO Auto-generated method stub
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdryJzdxInfo", jzdxBean);
	}
	
	/**
	 * 插入矫正对象信息
	 */
	public void insertZdryJzdxInfo(ZdryJzdxxxBean jzdxBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryJzdxInfo", jzdxBean);
	}

    /**
     * 插入关注人员信息
     */
	public void insertZdryGzryInfo(ZdryGzryxxBean gzryxxBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryGzryInfo", gzryxxBean);
		
	}
    
	/**
	 * 更新关注人员信息
	 */
	public void updateZdryGzryInfo(ZdryGzryxxBean gzryxxBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdryGzryInfo", gzryxxBean);
		
	}
    /**
     * 插入吸毒人员信息
     */
	public void insertZdryXdryInfo(ZdryXdryxxBean xdryxxBean)
			throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryXdryInfo", xdryxxBean);
		
	}
    /**
     * 更新吸毒人员信息
     */
	public void updateZdryXdryInfo(ZdryXdryxxBean xdryxxBean)
			throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdryXdryInfo", xdryxxBean);
		
	}
	
	/**
	 * 分页查询吸毒人员尿检信息
	 */
	public PageResultInfo<ZdryXdchNjxxBean> queryZdryXdryhdPageResult(
			String rybh, PageInfo pageInfo) throws SQLException {
		ListInfo listInfo=executor.queryListInfoWithDBName(ZdryXdchNjxxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryXdryhdPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), rybh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
   
	/**
	 * 插入吸毒人员尿检信息
	 */
	public void insertZdryXdnjxxBean(ZdryXdchNjxxBean xdNjxxBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryXdnjxxBean", xdNjxxBean);
		
	}
    /**
     * 更新吸毒人员尿检信息
     */
	public void updateZdryXdnjxxBean(ZdryXdchNjxxBean xdNjxxBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdryXdnjxxBean", xdNjxxBean);
		
	}
    
	/**
	 * 根据对象编号查询对象信息
	 */
	public ZdryJsbxBean queryZdryJsbrBeanByJsbrbh(String jsbrbh)
			throws Exception {
		return executor.queryObjectWithDBName(ZdryJsbxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryJsbrBeanByJsbrbh", jsbrbh);
	}

	public ZdrySwryBean queryZdrySwryBeanBySwrybh(String swrybh)
			throws Exception {
		return executor.queryObjectWithDBName(ZdrySwryBean.class, CommonConstant.DBNAME_SQJW, "queryZdrySwryBeanBySwrybh", swrybh);
	}

	public ZdryXdryxxBean queryZdryXdryxxBeanByXdrybh(String xdrybh)
			throws Exception {
		return executor.queryObjectWithDBName(ZdryXdryxxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryXdryxxBeanByXdrybh", xdrybh);
	}
}
