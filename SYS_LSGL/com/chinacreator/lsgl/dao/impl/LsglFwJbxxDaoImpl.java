package com.chinacreator.lsgl.dao.impl;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dzgl.bean.DzxxBean;
import com.chinacreator.lsgl.bean.CzfwJbxxBean;
import com.chinacreator.lsgl.bean.CzwxcdjxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.FwdzQyBean;
import com.chinacreator.lsgl.bean.FwzpxxBean;
import com.chinacreator.lsgl.bean.queryBean.LsfwQueryBean;
import com.chinacreator.lsgl.dao.LsglCzfwJbxxDao;
import com.chinacreator.lsgl.dao.LsglFwJbxxDao;
import com.chinacreator.lsgl.query.FwQueryBean;
import com.chinacreator.zagl.bean.DwjbxxBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

/**
 * 房屋基本信息操作实现类
 * 
 * @author mingchun.xiong
 * @date 2013-8-6
 */
public class LsglFwJbxxDaoImpl implements LsglFwJbxxDao
{
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/lsgl/dao/lsglfwjbxx-sql.xml");
	
	private LsglCzfwJbxxDao czfwDao;
	
	public LsglFwJbxxDaoImpl()
	{
		czfwDao=new LsglCzfwJbxxDaoImpl();
	}
	
	/**
	 * 插入房屋信息包括地址信息
	 */
	public void insertFwJbxxBean(FwJbxxBean fwBean) throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertFwJbxxBean", fwBean);
	}
	
	/**
	 * 查询分页信息
	 */
	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfo(
			PageInfo pageInfo, FwQueryBean queryBean) throws Exception
	{
		if("1".equals(queryBean.getZxbs()))
		{
			queryBean.setSfczw("0");
		}
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwJbxxBeanPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 通过房屋编号查询房屋信息
	 */
	public FwJbxxBean queryFwJbxxBeanByFwid(String fwid, String jsppage) throws Exception
	{
		FwJbxxBean fwBean = executor.queryObjectWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwJbxxBeanByFwid", fwid);
		if(fwBean != null)
		{
			//查询出租屋信息
			if ("1".equals(fwBean.getSfczw()))
			{
				CzfwJbxxBean czfwBean = czfwDao.queryCzfwBeanByfwid(fwBean.getFwid());
				fwBean.setCzfwBean(czfwBean);
			}
			
			//查询房屋照片信息
			if ("fwzpxx".equals(jsppage))
			{
				List<FwzpxxBean> fwzpxxList = queryFwzpxxListByFwid(fwBean.getFwid());
				fwBean.setFwzpxxList(fwzpxxList);
			}
			
			// 出租屋巡查登记
			if ("czfxcdj".equals(jsppage))
			{
				List<CzwxcdjxxBean> czwxcdjList = queryCzwxcdjxxBeans(fwBean.getFwid());
				if (ValidateHelper.isNotEmptyCollection(czwxcdjList))
				{
					fwBean.setCzwxcdjxxBeans(czwxcdjList);
				}
			}
			
			/*
			// 查询房屋人口信息
			List<FwrkxxBean> fwrkxxBeans = executor.queryListWithDBName(FwrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwrkxxBeans", fwid);
			if (ValidateHelper.isNotEmptyCollection(fwrkxxBeans))
			{
				fwBean.setFwrkxxBeans(fwrkxxBeans);
			}*/
		}
		return fwBean;
	}
	
	/**
	 * 更新房屋基本信息及地址信息
	 */
	public void updateFwJbxxBean(FwJbxxBean fwBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateFwJbxxByFwid", fwBean);
	}
	
	/**
	 * 插入房屋照片信息
	 * @param fwzpxxList 房屋照片信息
	 * @throws Exception
	 * @date 2013-8-14 下午05:47:38
	 */
	public void insertFwzpxxList(List<FwzpxxBean> fwzpxxList) throws Exception
	{
		if (ValidateHelper.isNotEmptyCollection(fwzpxxList))
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String sql = executor.getSql("insertFwZpxx");
			
			for (FwzpxxBean fwzpxxBean : fwzpxxList)
			{
				PreparedDBUtil util = new PreparedDBUtil();
				util.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
				util.setString(1, fwzpxxBean.getId());
				util.setString(2, fwzpxxBean.getFwid());
				util.setBlob(3, fwzpxxBean.getZp());
				util.setString(4, fwzpxxBean.getMs());
				util.setString(5, loginInfo.getRealname());
				util.setString(6, loginInfo.getOrgcode());
				util.setString(7, loginInfo.getOrgname());
				util.executePrepared();
			}
		}
	}

	/**
	 * 通过照片ID删除照片记录
	 * @param id
	 * @throws Exception
	 * @date 2013-8-14 下午05:57:29
	 */
	public void deleteFwzpxxById(String id) throws Exception
	{
		 String sql = "delete from t_lsgl_fw_zpxx where id=?";
		 SQLExecutor.deleteWithDBName(CommonConstant.DBNAME_SQJW, sql, id);
	}

	/**
	 * 通过房屋id(fwid) 查询出房屋照片信息
	 * @param fwid
	 * @return
	 * @throws Exception
	 * @date 2013-8-14 下午06:57:46
	 */
	public List<FwzpxxBean> queryFwzpxxListByFwid(String fwid) throws Exception
	{
		List<FwzpxxBean> list = executor.queryListWithDBName(FwzpxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwzpxxListByFwid", fwid);
		if (list == null)
		{
			list = new ArrayList<FwzpxxBean>();
		}
		return list;
	}

	/**
	 * 返回照片流
	 * @param zpid 照片ID
	 * @return 返回照片流
	 * @throws Exception
	 * @date 2013-8-15 上午09:52:10
	 */
	public Blob getFwzpStream(String zpid) throws Exception
	{
		String sql = " select zp from t_lsgl_fw_zpxx where id='" + zpid + "'";
		DBUtil util = new DBUtil();
		util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
		Blob blob = null;
		if (util.size() > 0)
		{
			blob = util.getBlob(0, "zp");
		}
		return blob;
	}

	/**
	 * 插入出租屋巡查登记信息
	 * @param czwxcdjxxBean
	 * @throws Exception
	 * @date 2013-9-10 上午11:29:21
	 */
	public void insertCzwxcdjxxBean(CzwxcdjxxBean czwxcdjxxBean)
			throws Exception
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertCzwxcdjxxBean", czwxcdjxxBean);
	}

	/**
	 * 查询出租屋巡查登记信息
	 * @param fwid 房屋ID
	 * @return
	 * @date 2013-9-10 上午11:28:21
	 */
	public List<CzwxcdjxxBean> queryCzwxcdjxxBeans(String fwid)
			throws Exception
	{
		return executor.queryListWithDBName(CzwxcdjxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzwxcdjxxBeans", fwid);
	}

	/**
	 * 更新出租屋巡查登记信息
	 * @param czwxcdjxxBean
	 * @throws Exception
	 * @date 2013-9-10 上午11:29:52
	 */
	public void updateCzwxcdjxxBean(CzwxcdjxxBean czwxcdjxxBean)
			throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCzwxcdjxxBean", czwxcdjxxBean);
	}
	/**
	 * 分页查询出租房巡查登记信息
	 * 2013年9月30日11:24:18
	 */
	public PageResultInfo<CzwxcdjxxBean> queryCzwxcdjxxPageResultInfo(
			PageInfo pageInfo, String fwid) throws Exception {
		ListInfo listInfo = executor.queryListInfoWithDBName(CzwxcdjxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzwxcdjxxBeans", pageInfo.getOffset(), pageInfo.getPageSize(), fwid);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public FwJbxxBean queryFwJbxxBeanByDzid(String dzid) throws Exception
	{
		return executor.queryObjectWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwJbxxBeanByDzid", dzid);
	}

	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByStid(
			PageInfo pageInfo, String stid) throws Exception {
		ListInfo listInfo = executor.queryListInfoWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwBeanPageResultInfoByStid", pageInfo.getOffset(), pageInfo.getPageSize(), stid);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	//TODO
	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByStidWithPicNum(
			PageInfo pageInfo, String stid, LsfwQueryBean query) throws Exception {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwBeanPageResultInfoByStidWithPicNum", pageInfo.getOffset(), pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByFwQueryBean(PageInfo pageInfo,FwQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwBeanPageResultInfoByFwQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public DzxxBean queryFwJbxxBeanByStidAndDyLcFj(DzxxBean bean) throws Exception {
		return executor.queryObjectBeanWithDBName(DzxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwJbxxBeanByStidAndDyLcFj", bean);
	}

	public FwJbxxBean queryFwJbxxBeanByStidAndDyLcFj(FwJbxxBean bean) throws Exception {
		
		return executor.queryObjectBeanWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwJbxxBeanByStidAndDyLcFj", bean);
	}
	@Override
	public List<RkJbxxBean> queryRklistInFwxx(String fwid) throws Exception 
	{
		SQLParams params = new SQLParams();
		params.addSQLParam("fwid", fwid, SQLParams.STRING);
		return  executor.queryListBeanWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryRklistInFwxx", params);
	}

	@Override
	public void deleteFwJbxxBean(FwJbxxBean fwBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteFwJbxxBean", fwBean);
	}
	
	/**
	 * 房屋关联单位信息查找
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @date Feb 24, 2014 2:19:22 PM
	 */
	@Override
	public PageResultInfo<DwjbxxBean> queryGlDwxxPageResultInfo(PageInfo pageInfo, FwQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW, "queryGlDwxxPageResultInfo", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public void deleteCzFwJbxxBean(FwJbxxBean fwBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteCzFwJbxxBean", fwBean);
	}

	/**
	 * 根据户主身份证查询房屋信息
	 */
	@Override
	public PageResultInfo<FwJbxxBean> queryFwInfoByHzsfzh(String hzsfzh,PageInfo pageInfo) throws Exception {
		ListInfo listInfo =  executor.queryListInfoWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwInfoByHzsfzh",pageInfo.getOffset(),pageInfo.getPageSize(),hzsfzh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	@Override
	public FwJbxxBean queryFwJbxxBeanByFwid(String fwid) throws Exception
	{
		return executor.queryObjectWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwJbxxBeanByFwid", fwid);
	}

	@Override
	public List<FwJbxxBean> queryFwListByFwids(String fwids) throws Exception {
		fwids = "'" + fwids.replace(",", "','") + "'";
		String sql = executor.getSql("queryFwListByFwids").replace("#[fwids]", fwids);
		return SQLExecutor.queryListWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, sql);
	}

	@Override
	public List<FwJbxxBean> queryFwlistByFwqueryBean(FwQueryBean queryBean)
			throws Exception {
		return executor.queryListBeanWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwlistByFwqueryBean", queryBean);
	}

	@Override
	/**
	 * 将房屋改成出租房屋
	 */
	public void updateFwtoCzfw(String fwbh) throws Exception {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateFwtoCzfw", fwbh);
	}

	@Override
	public void updateFwJbxxFromCzfw(FwJbxxBean fwJbxx) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateFwJbxxFromCzfw", fwJbxx);
	}

	@Override
	public PageResultInfo<FwJbxxBean> queryCzfwPageInfoByQueryBean(
			FwQueryBean queryBean, PageInfo pageInfo) throws Exception {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryCzfwPageInfoByQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public void logoutCzfwJbxxBean(String fwbh) throws Exception {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "logoutCzfwJbxxBean", fwbh);
	}

	public PageResultInfo<FwJbxxBean> queryFwBeanPageResultInfoByQueryBean(PageInfo pageInfo, FwQueryBean queryBean) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(FwJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryFwBeanPageResultInfoByStidAndQueryBean", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public void dzfwqyupdate(FwdzQyBean fwdzqyBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "dzfwqyrkfwglupdate", fwdzqyBean);

	}
	public void dzfwqydwfwglupdate(FwdzQyBean fwdzqyBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "dzfwqydwfwglupdate", fwdzqyBean);

	}
	public void dzfwqyryxzzxzupdate(FwdzQyBean fwdzqyBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "dzfwqyryxzzxzupdate", fwdzqyBean);

	}

	@Override
	public void updateCzfwJbxxZhxcsjForCurrentDate(String fwid) throws Exception
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateCzfwJbxxZhxcsjForCurrentDate", fwid);
	}
	
}
