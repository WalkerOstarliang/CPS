package com.chinacreator.gzgl.dao;
/**
 * 巡逻队奖励DAO
 */
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.bean.XunldJLBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class XunldJLDao extends BaseValue {

	private static final long serialVersionUID = 3307399059266954595L;
	
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/gzgl/dao/xunldJL-sql.xml");
	
	/**
	 * 新增巡逻队奖励
	 * @param bean
	 * @throws SQLException
	 */
	public static void addXunldJL(XunldJLBean bean) throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addXunldJL", bean);
	}
	
	/**
	 * 修改巡逻队奖励
	 * @param bean
	 * @throws SQLException
	 */
	public static void updateXunldJL(XunldJLBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateXunldJL", bean);
	}
	
	/**
	 * 批量删除巡逻队奖励
	 * @param bean
	 * @throws SQLException
	 */
	public static void batchDelXunldJL(List<XunldJLBean> beans) throws SQLException{
		executor.deleteBeans(CommonConstant.DBNAME_SQJW, "delXunldJL", beans);
	}
	
	/**
	 * 分页查询巡逻队任务奖励列表
	 * @param bean
	 * @param page
	 * @return
	 * @throws SQLException
	 */
	public static PageResultInfo<XunldJLBean> queryXunldJL(XunldJLBean bean,PageInfo page) throws SQLException{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(XunldJLBean.class, CommonConstant.DBNAME_SQJW, "queryXunldJLList", page.getOffset(), page.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(page, listInfo);
	}
	
	/**
	 * 根据主键查询巡逻队奖励
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public static XunldJLBean queryXunldJLByPK(XunldJLBean bean) throws SQLException{
		return executor.queryObjectBeanWithDBName(XunldJLBean.class, CommonConstant.DBNAME_SQJW, "queryXunldJLByPK", bean);
	}
}
