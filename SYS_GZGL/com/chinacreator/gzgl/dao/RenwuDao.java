package com.chinacreator.gzgl.dao;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.bean.MinjChuliBean;
import com.chinacreator.gzgl.bean.MinjingBean;
import com.chinacreator.gzgl.bean.RenwuBean;
import com.chinacreator.gzgl.bean.RenwuJiegBean;
import com.chinacreator.gzgl.bean.RwfjBean;
import com.chinacreator.gzgl.query.RenwuQuery;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.util.ListInfo;

/**
 * 任务管理Dao
 * @author royee
 *
 */
public class RenwuDao
{
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/gzgl/dao/renwu-sql.xml");
	
	/**
	 * 增加任务派发民警信息
	 * @param minjs		民警列表
	 * @throws SQLException 可能抛出的异常
	 */
	public static void batchInsertMinjs(List<MinjingBean> minjs) throws SQLException
	{
		executor.insertBeans(CommonConstant.DBNAME_SQJW, "insertRenwumj", minjs);
	}
	
	/**
	 * 增加任务项信息
	 * @param renwuBean	任务bean
	 * @throws SQLException	可能抛出的异常
	 */
	public static void insertRenwuBean(RenwuBean renwuBean) throws SQLException
	{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertRenwu", renwuBean);
	}
	
	/**
	 * 分页查询任务派发信息
	 * @param renwuQuery	查询条件
	 * @param page		分页条件
	 * @return	返回分页结果集
	 * @throws SQLException	可能抛出的异常
	 */
	public static PageResultInfo<RenwuBean> queryRenwuListPage(RenwuQuery renwuQuery, PageInfo page) throws SQLException
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(RenwuBean.class, CommonConstant.DBNAME_SQJW, "queryRenwu", page.getOffset(), page.getPageSize(), renwuQuery);
		return PaginationHelper.wrapPageResultInfo(page, listInfo);
	}
	
	/**
	 * 查询符合条件的任务集合
	 * @param renwuQuery	查询条件
	 * @return	结果集
	 * @throws SQLException	可能抛出的异常
	 */
	public static List<RenwuBean> queryRenwuList(RenwuQuery renwuQuery) throws SQLException
	{
		return executor.queryListBean(RenwuBean.class, "queryRenwuDetail", renwuQuery);
	}
	
	/**
	 * 动态查询任务民警信息，参数绑定顺序参照sql
	 * @param params	动态参数
	 * @return			返回条件查询的结果集
	 * @throws SQLException	可能抛出的异常
	 */
	public static List<MinjingBean> queryMinjList(Object[] params) throws SQLException
	{
		if (params == null || params.length < 1)
		{
			return null;
		}
		return executor.queryListWithDBName(MinjingBean.class, CommonConstant.DBNAME_SQJW, "queryRenwumj", params);
	}
	
	/**
	 * 增加任务处理结果明细信息
	 * @param chulis	待插入的数据bean
	 * @throws SQLException	可能抛出的异常
	 */
	public static void batchInsertRenwuMinjChuls(List<MinjChuliBean> chulis) throws SQLException
	{
		executor.insertBeans(CommonConstant.DBNAME_SQJW, "insertMjChuljin", chulis);
	}
	
	/**
	 * 分页查询任务执行情况集合
	 * @param renwuQuery	查询条件
	 * @param page	分页条件
	 * @return	结果集
	 * @throws SQLException	可能抛出的异常
	 */
	public static PageResultInfo<RenwuJiegBean> queryMinjChuliListPage(RenwuQuery renwuQuery, PageInfo page) throws SQLException
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(RenwuJiegBean.class, CommonConstant.DBNAME_SQJW, "queryRenwufk", page.getOffset(), page.getPageSize(), renwuQuery);
		return PaginationHelper.wrapPageResultInfo(page, listInfo);
	}
	
	/**
	 * 查询任务执行情况集合
	 * @param renwuQuery	查询条件
	 * @return	结果集
	 * @throws SQLException	可能抛出的异常
	 */
	public static List<RenwuJiegBean> queryMinjChuliList(RenwuQuery renwuQuery) throws SQLException
	{
		return executor.queryListBeanWithDBName(RenwuJiegBean.class, CommonConstant.DBNAME_SQJW, "queryRenwufk", renwuQuery);
	}
	
	/**
	 * 更新民警处理任务结果数据
	 * @param minjChuliBean	处理结果bean
	 * @throws SQLException	可能抛出的异常
	 */
	public static void updateMinjChuli(MinjChuliBean minjChuliBean) throws SQLException
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateMinjchuli", minjChuliBean);
	}
	
	/**
	 * 更新任务完成状态信息
	 * @param rwbh	任务编号
	 * @param rwclzt	任务状态
	 * @throws SQLException	可能抛出的异常
	 */
	public static void updateRenwuBean(String rwbh, String rwclzt) throws SQLException
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateRenwu", new Object[] {rwclzt, rwbh});
	}
	
	/**
	 * 删除任务
	 * @param bean
	 * @throws SQLException
	 */
	public static void delRenwu(RenwuBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "delRenwu", bean);
	}
	
	/**
	 * 签收任务
	 * @param bean
	 * @throws SQLException
	 */
	public static void qsRenwu(RenwuBean bean) throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		bean.setQsrxm(loginInfo.getRealname());
		bean.setQsrsfzh(loginInfo.getSfzh());
		bean.setQsdwdm(loginInfo.getOrgcode());
		bean.setQsdwmc(loginInfo.getOrgname());
		executor.updateBean(CommonConstant.DBNAME_SQJW, "qsRenwu", bean);
	}
	
	/**
	 * 批量删除执行民警
	 */
	public static void batchDelmj(List<MinjingBean> list) throws SQLException{
		executor.deleteBeans(CommonConstant.DBNAME_SQJW, "batchDelmj", list);
	}
	
	/**
	 * 修改任务
	 */
	public  static void updateRenwu(RenwuBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateRenwu", bean);
	}
	
	/**
	 * 反馈任务
	 */
	public static void fkRenwe(RenwuBean bean) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "fkRenwu", bean);
	}
	
	/**
	 * 新增任务反馈结果
	 */
	public  static  void addRenwuCljg(RenwuJiegBean bean)throws SQLException{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "addRenwuCljg", bean);
	}
	
	/**
	 * 查询任务反馈结果
	 */
	public static List<RenwuJiegBean> queryRenwuFkxx(RenwuQuery bean) throws SQLException{
		return executor.queryListBeanWithDBName(RenwuJiegBean.class, CommonConstant.DBNAME_SQJW, "queryRenwuFkxx", bean);
	}

	/**
	 * 新增附件
	 * @param fjBean
	 * @throws SQLException 
	 */
	public static void insertRenwuFj(RwfjBean fjBean) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into t_gzgl_rwfjxx(id, title, fj, fjlx) values  (?, ?, ?, ?)");
		if(fjBean != null){
			PreparedDBUtil dbutil = new PreparedDBUtil();
			dbutil.preparedInsert(CommonConstant.DBNAME_SQJW, sql.toString());
			dbutil.setString(1, fjBean.getId());
			dbutil.setString(2, fjBean.getTitle());
			dbutil.setBlob(3, fjBean.getFj());
			dbutil.setString(4, fjBean.getFjlx());
			dbutil.executePrepared();
		}
		
	}
	
	/**
	 * 通过编号查找附件信息
	 * @param fjbh
	 * @return
	 * @throws SQLException
	 */
	public static RwfjBean getRwfjBeanById(String fjbh) throws SQLException {
		return executor.queryObjectWithDBName(RwfjBean.class, CommonConstant.DBNAME_SQJW, "getRwfjBeanById", fjbh);
	}

	/**
	 * 更新任务附件
	 * @param fjBean
	 * @throws SQLException 
	 */
	public static void updateRwfj(RwfjBean fjBean) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("update t_gzgl_rwfjxx set title = ?,fj =? where id = ?");
		if(fjBean != null){
			PreparedDBUtil dbutil = new PreparedDBUtil();
			dbutil.preparedInsert(CommonConstant.DBNAME_SQJW, sql.toString());
			dbutil.setString(1, fjBean.getTitle());
			dbutil.setBlob(2, fjBean.getFj());
			dbutil.setString(3, fjBean.getId());
			dbutil.executePrepared();
		}
		
	}

	public static PageResultInfo<RenwuBean> getRenwuclListPage(
			RenwuQuery renwuQuery, PageInfo page) throws SQLException {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(RenwuBean.class, CommonConstant.DBNAME_SQJW, "getRenwuclListPage", page.getOffset(), page.getPageSize(), renwuQuery);
		return PaginationHelper.wrapPageResultInfo(page, listInfo);
	}

	public static RenwuBean queryRenwuBean(String bh) throws SQLException {
			return executor.queryObjectWithDBName(RenwuBean.class, CommonConstant.DBNAME_SQJW, "queryRenwuBean", bh);
	}

	public static Blob getRwfjById(String id) throws SQLException {
		java.sql.Blob blob = null;
		String sql = "select  fj from t_gzgl_rwfjxx where id ="+id;
		DBUtil db = new DBUtil();
		db.executeSelect(sql);
		if (db.size() > 0) 
		{
			blob = (oracle.sql.BLOB) db.getBlob(0, "fj");
		}
		return blob;
	}
}
