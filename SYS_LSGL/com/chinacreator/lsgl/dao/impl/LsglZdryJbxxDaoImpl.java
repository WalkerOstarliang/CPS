package com.chinacreator.lsgl.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.lsgl.bean.QGQLZdryInfoBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryGzryxxBean;
import com.chinacreator.lsgl.bean.ZdryJzdxxxBean;
import com.chinacreator.lsgl.bean.ZdryPfxxBean;
import com.chinacreator.lsgl.bean.ZdryTgxxBean;
import com.chinacreator.lsgl.bean.ZdryThBean;
import com.chinacreator.lsgl.bean.ZdryWffzjlBean;
import com.chinacreator.lsgl.bean.ZdryXdryxxBean;
import com.chinacreator.lsgl.bean.ZdryXsbxBean;
import com.chinacreator.lsgl.dao.LsglZdryJbxxDao;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;


public class LsglZdryJbxxDaoImpl implements LsglZdryJbxxDao {
	
	private static ConfigSQLExecutor  executor = new ConfigSQLExecutor("com/chinacreator/lsgl/dao/lsglzdryjbxx-sql.xml");
	
	/**
	 * 插入重点人员关注对象
	 */
	public ZdryGzdxBean insertZdryGzdxInfo(ZdryGzdxBean zdryBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryGzdxInfo", zdryBean);
		return zdryBean;
	}

	public ZdryGzdxBean queryZdryGzdxByGzdxbh(String gzdxbh) throws Exception {
		return null;
	}

	public PageResultInfo<ZdryGzdxBean> queryZdryGzdxPageResult(
			RkQueryBean queryBean, PageInfo pageInfo) throws Exception {
		ListInfo list=executor.queryListInfoBeanWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryGzdxPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}
	
	public PageResultInfo<ZdryGzdxBean> queryWrlZdryGzdxPageResult(
			RkQueryBean queryBean, PageInfo pageInfo) throws Exception {
		ListInfo list=executor.queryListInfoBeanWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW, "queryWrlZdryGzdxPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	public ZdryGzdxBean updateZdryGzdxInfo(ZdryGzdxBean zdryBean) throws Exception 
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdryGzdxInfo", zdryBean);
		return zdryBean;
	}
    
	
	/**
	 * 插入 重点人员违法犯罪经历
	 */
	public ZdryWffzjlBean insertZdryWffzjlBean(ZdryWffzjlBean wffzjlBean)
			throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryWffzjlBean", wffzjlBean);
		return wffzjlBean;
	}
	
	/**
	 * 分页查询 重点人员违法犯罪经历
	 */
	public PageResultInfo<ZdryWffzjlBean> queryZdryWffzjbPageInfo(
			String rybh,PageInfo pageInfo) throws Exception {
		ListInfo list=executor.queryListInfoWithDBName(ZdryWffzjlBean.class, CommonConstant.DBNAME_SQJW, "queryZdryWffzjbPageInfo", pageInfo.getOffset(), pageInfo.getPageSize(), rybh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}
	
	/**
	 * 修改 重点人员违法犯罪经历
	 */
	public ZdryWffzjlBean updateZdryWffzjlBean(ZdryWffzjlBean wffzjlBean)
			throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdryWffzjlBean", wffzjlBean);
		return wffzjlBean;
	}
	
	/**
	 * 判断人口基本信息表是否存在该身份证号码
	 */
	public boolean isExistSfzh(String sfzh) throws Exception {
		RkJbxxBean bean=executor.queryObjectWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "isExistSfzh", sfzh);
		if(bean!=null){
			return true;
		}
		return false;
	}
	
	/**
	 * 根据身份证查询工作对象
	 */
	public ZdryGzdxBean queryZdryGzdxBysfzh(String sfzh) throws Exception 
	{
		return executor.queryObjectWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryGzdxBysfzh", sfzh);
	}

	public ZdryGzdxBean getZdryGzdxBySfzh(String sfzh) throws Exception
	{
		return executor.queryObjectWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW, "getZdryGzdxBySfzh", sfzh);
	}
	
	public ZdryJzdxxxBean queryJzdxBeanByGzdxbh(String gzdxbh) throws SQLException {
		return executor.queryObjectWithDBName(ZdryJzdxxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzdxBeanByGzdxbh",gzdxbh);
	}

	public ZdryGzryxxBean queryGzryBeanByGzdxbh(String gzdxbh) throws SQLException {
		return executor.queryObjectWithDBName(ZdryGzryxxBean.class, CommonConstant.DBNAME_SQJW, "queryGzryBeanByGzdxbh",gzdxbh);
	}

	public ZdryXdryxxBean queryXdryBeanByGzdxbh(String gzdxbh) throws SQLException {
		return executor.queryObjectWithDBName(ZdryXdryxxBean.class, CommonConstant.DBNAME_SQJW, "queryXdryBeanByGzdxbh", gzdxbh);
	}
	
	/**
	 * 修改时其他信息时   更新重点人员工作对象表的变更时间
	 */
	public void updateZdryGzdxBgsj(String sfzh) throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateZdryGzdxBgsj", sfzh);
	}
	
	public void zdryRlUpdate(ZdryGzdxBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zdryRl", bean);
	}

	@Override
	public void insertZdryPfxx(ZdryPfxxBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryPfxx", bean);
	}

	@Override
	public void zdryPf(ZdryGzdxBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zdryPf", bean);
		
	}

	@Override
	public void insertZdryWtxx(ZdryTgxxBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryWtxx", bean);
		
	}

	@Override
	public void updateZdryWtxx(ZdryTgxxBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdryWtxx", bean);
	}

	@Override
	public PageResultInfo<ZdryTgxxBean> queryWtxxList(RkQueryBean bean,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(ZdryTgxxBean.class,
				CommonConstant.DBNAME_SQJW, "queryWtxxList", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		PageResultInfo<ZdryTgxxBean> result = PaginationHelper.wrapPageResultInfo(pageInfo, list);
		return result;
	}
	
	@Override
	public ZdryTgxxBean queryZdryWtxxById(String id) throws SQLException{
		return executor.queryObjectWithDBName(ZdryTgxxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryWtxxById", id);
	}
	
	@Override
	public ZdryTgxxBean queryTgxxBySfzh(String sfzh) throws SQLException{
		return executor.queryObjectWithDBName(ZdryTgxxBean.class, CommonConstant.DBNAME_SQJW, "queryTgxxBySfzh", sfzh);
	}

	@Override
	public void zdryTh(ZdryGzdxBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zdryTh", bean);
	}

	@Override
	public void insertZdryThxx(ZdryThBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdryThxx", bean);
	}

	@Override
	public ZdryThBean queryThxx(String sfzh, String mbdwdm) throws SQLException {
		return executor.queryObjectWithDBName(ZdryThBean.class, CommonConstant.DBNAME_SQJW, "queryThxx", sfzh,mbdwdm);
	}

	@Override
	public ZdryTgxxBean queryTgxx(String sfzh, String jgdwdm)
			throws SQLException {
		return executor.queryObjectWithDBName(ZdryTgxxBean.class, CommonConstant.DBNAME_SQJW, "queryTgxx", sfzh,jgdwdm);
	}

	@Override
	public ZdryPfxxBean queryPfxx(String sfzh) throws SQLException {
		return executor.queryObjectWithDBName(ZdryPfxxBean.class, CommonConstant.DBNAME_SQJW, "queryPfxx", sfzh);
	}

	@Override
	public void sjth(ZdryThBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSjth", bean);
	}

	@Override
	public PageResultInfo<ZdryXsbxBean> queryXsbxPageResultInfo(String sfzh,
			PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoWithDBName(ZdryXsbxBean.class, CommonConstant.DBNAME_SQJW, "queryXsbxListBySfzh", pageInfo.getOffset(), pageInfo.getPageSize(), sfzh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}

	@Override
	public QGQLZdryInfoBean queryQGQLZdryInfoBeanByZdrybh(String zdrybh) throws Exception
	{
		return executor.queryObjectWithDBName(QGQLZdryInfoBean.class, CommonConstant.DBNAME_SQJW, "queryQGQLZdryInfoBeanByZdrybh", zdrybh);
	}
	
	@Override
	public ZdryXsbxBean queryXsbxById(String id) throws SQLException{
		return executor.queryObjectWithDBName(ZdryXsbxBean.class, CommonConstant.DBNAME_SQJW, "queryXsbxById", id);
	}

	@Override
	public List<ZdryGzdxBean> queryZdryList(RkQueryBean bean) throws SQLException{
		return executor.queryListBeanWithDBName(ZdryGzdxBean.class, CommonConstant.DBNAME_SQJW, "queryZdryGzdxPageResult", bean);
	}
}
