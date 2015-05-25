package com.chinacreator.dwdj.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.dwdj.bean.WbdwJdhxBean;
import com.chinacreator.dwdj.bean.WbdwQzjcBean;
import com.chinacreator.dwdj.bean.WbdwShBean;
import com.chinacreator.dwdj.bean.WbdwWxhxBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class WbdwDaoImpl implements WbdwDao {
	private static final long serialVersionUID = 4742906269924195223L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
			"com/chinacreator/dwdj/dao/wbdwgl-sql.xml");
	
	/**
	 * 查询危爆单位枪支检查
	 * @param qzjcBean
	 * @throws SQLException
	 */
	public PageResultInfo<WbdwQzjcBean> queryWbdwQzjcPageResultInfo(PageInfo pageInfo, WbdwQzjcBean queryBean) {
		ListInfo listInfo = new ListInfo();
		try {
			listInfo = executor.queryListInfoBeanWithDBName(WbdwQzjcBean.class,
					CommonConstant.DBNAME_SQJW,
					"queryWbdwQzjc", pageInfo.getOffset(),
					pageInfo.getPageSize(), queryBean);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	/**
	 * 插入危爆单位枪支检查
	 * @param qzjcBean
	 * @throws SQLException
	 */
	public void insertQzjcBean(WbdwQzjcBean qzjcBean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertQzjcBean", qzjcBean);
	}
	
	/**
	 * 修改危爆单位枪支检查
	 * @param qzjcBean
	 * @throws SQLException
	 */
	public void updateQzjcBean(WbdwQzjcBean qzjcBean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateQzjcBean", qzjcBean);
	}
	/**
	 * 查询危爆单位枪支检查历史数据
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwQzjcBean> queryWbdwQzjcPageResultInfoByJgbh(PageInfo pageInfo, WbdwQzjcBean queryBean) {
		ListInfo listInfo = new ListInfo();
		try {
			listInfo = executor.queryListInfoBeanWithDBName(WbdwQzjcBean.class,
					CommonConstant.DBNAME_SQJW,
					"queryWbdwQzjcPageResultInfoByJgbh", pageInfo.getOffset(),
					pageInfo.getPageSize(), queryBean);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	/**
	 * 查询危爆单位枪支检查通过id
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwJdhxBean> queryWbdwQzjcPageResultInfoById(PageInfo pageInfo, WbdwJdhxBean queryBean) {
		ListInfo listInfo = new ListInfo();
		try {
			listInfo = executor.queryListInfoBeanWithDBName(WbdwJdhxBean.class,
					CommonConstant.DBNAME_SQJW,
					"queryWbdwQzjcPageResultInfoById", pageInfo.getOffset(),
					pageInfo.getPageSize(), queryBean);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	
	/**
	 * 插入危爆单位剧毒化学
	 * @param jdhxBean
	 * @throws SQLException
	 */
	public void insertJdhxBean(WbdwJdhxBean jdhxBean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertjdhxBean", jdhxBean);
	}
	
	/**
	 * 修改危爆单位剧毒化学
	 * @param jdhxBean
	 * @throws SQLException
	 */
	public void updateJdhxBean(WbdwJdhxBean jdhxBean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updatejdhxBean", jdhxBean);
	}
	/**
	 * 查询危爆单位剧毒化学历史数据通过机构编号
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwJdhxBean> queryWbdwJdhxPageResultInfoByJgbh(PageInfo pageInfo, WbdwJdhxBean queryBean) {
		ListInfo listInfo = new ListInfo();
		try {
			listInfo = executor.queryListInfoBeanWithDBName(WbdwJdhxBean.class,
					CommonConstant.DBNAME_SQJW,
					"queryWbdwJdhxPageResultInfoByJgbh", pageInfo.getOffset(),
					pageInfo.getPageSize(), queryBean);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	/**
	 * 查询危爆单位剧毒化学历史数据通过id
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwJdhxBean> queryWbdwJdhxPageResultInfoById(PageInfo pageInfo, WbdwJdhxBean queryBean) {
		ListInfo listInfo = new ListInfo();
		try {
			listInfo = executor.queryListInfoBeanWithDBName(WbdwJdhxBean.class,
					CommonConstant.DBNAME_SQJW,
					"queryWbdwJdhxPageResultInfoById", pageInfo.getOffset(),
					pageInfo.getPageSize(), queryBean);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	
	/**
	 * 插入危爆单位危险化学
	 * @param wxhxBean
	 * @throws SQLException
	 */
	public void insertWxhxBean(WbdwWxhxBean wxhxBean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertwxhxBean", wxhxBean);
	}
	
	/**
	 * 修改危爆单位危险化学
	 * @param wxhxBean
	 * @throws SQLException
	 */
	public void updateWxhxBean(WbdwWxhxBean wxhxBean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updatewxhxBean", wxhxBean);
	}
	/**
	 * 查询危爆单位危险化学历史数据通过机构编号
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwWxhxBean> queryWbdwWxhxPageResultInfoByJgbh(PageInfo pageInfo, WbdwWxhxBean queryBean) {
		ListInfo listInfo = new ListInfo();
		try {
			listInfo = executor.queryListInfoBeanWithDBName(WbdwWxhxBean.class,
					CommonConstant.DBNAME_SQJW,
					"queryWbdwWxhxPageResultInfoByJgbh", pageInfo.getOffset(),
					pageInfo.getPageSize(), queryBean);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	/**
	 * 查询危爆单位危险化学历史数据通过id
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwWxhxBean> queryWbdwWxhxPageResultInfoById(PageInfo pageInfo, WbdwWxhxBean queryBean) {
		ListInfo listInfo = new ListInfo();
		try {
			listInfo = executor.queryListInfoBeanWithDBName(WbdwWxhxBean.class,
					CommonConstant.DBNAME_SQJW,
					"queryWbdwWxhxPageResultInfoById", pageInfo.getOffset(),
					pageInfo.getPageSize(), queryBean);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	  @Override
	  public void insertWbdwsh(WbdwShBean bean) throws SQLException {
	    executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWbdwsh", bean);
		}
	  
	@Override
	public List<WbdwShBean> queryWbdwShByJgbh(String jgbh) throws SQLException {
		return executor.queryListWithDBName(WbdwShBean.class, CommonConstant.DBNAME_SQJW, "queryWbdwShByJgbh", jgbh);
	}
	
	@Override
	public PageResultInfo<WbdwShBean> queryWbDwShList(PageInfo pageInfo,
			QueryBean query) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(WbdwShBean.class, CommonConstant.DBNAME_SQJW,
				"queryWbDwShList", pageInfo.getOffset(), pageInfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageInfo, list);
	}
	
	@Override
	public WbdwShBean queryWbdwShById(String shid) throws SQLException {
		return executor.queryObjectWithDBName(WbdwShBean.class, CommonConstant.DBNAME_SQJW, "queryWbdwShById", shid);
	}
	
	@Override
	public void updateDwGlztByJgbh(String sfzagl, String jgbh)
			throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW,"updateDwGlztByJgbh", sfzagl,jgbh);
	}
	@Override
	public void updateWbdwShztById(WbdwShBean wbdwsh)
			throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWbdwShztById", wbdwsh);
	}
	
	
}
