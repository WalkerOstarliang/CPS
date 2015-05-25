package com.chinacreator.ckyj.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.ckyj.bean.CkyjxxBean;
import com.chinacreator.ckyj.bean.YjfkBean;
import com.chinacreator.ckyj.bean.YjqsBean;
import com.chinacreator.ckyj.dao.CkyjDao;
import com.chinacreator.ckyj.query.CkyjQueryBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class CkyjDaoImpl implements CkyjDao {
	
	private static final long serialVersionUID = -5276638678489645010L;

	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/ckyj/dao/impl/ckyj-sql.xml");
	
	public YjfkBean insertCkyjFkxx(YjfkBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertCkyjFkxx", bean);
		return bean;
	}

	public YjqsBean insertCkyjQsxx(YjqsBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertCkyjQsxx", bean);
		return bean;
	}

	public YjqsBean queryCkYjqsxxById(String id) throws SQLException {
		return executor.queryObjectWithDBName(YjqsBean.class, CommonConstant.DBNAME_SQJW, "queryCkYjqsxxById", id);
	}

	public List<YjfkBean> queryCkyjFkListByYjxxbh(String yjxxbh)
			throws SQLException {
		return executor.queryListWithDBName(YjfkBean.class, CommonConstant.DBNAME_SQJW, "queryCkyjFkListByYjxxbh", yjxxbh);
	}

	public PageResultInfo<YjqsBean> queryCkyjQsxxPageResultInfo(CkyjQueryBean bean,PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(YjqsBean.class, CommonConstant.DBNAME_SQJW, "queryCkyjQsxxPageResultInfo", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo,list);
	}

	public CkyjxxBean queryCkyjxxByYjxxbh(String yjxxbh) throws SQLException{
		return executor.queryObjectWithDBName(CkyjxxBean.class, CommonConstant.DBNAME_SQJW, "queryCkyjxxByYjxxbh", yjxxbh);
	}

	public PageResultInfo<CkyjxxBean> queryCkyjxxPageResultInfo(CkyjQueryBean bean,PageInfo pageInfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(CkyjxxBean.class, CommonConstant.DBNAME_SQJW, "queryCkyjxxPageResultInfo", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo,list);
	}

	public YjfkBean updateCkyjFkxx(YjfkBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCkyjFkxx", bean);
		return bean;
	}

	public void updateCkyjQszt(String id, String qszt) throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateCkyjQszt", qszt, id);
	}

	public void updateCkyjFkzt(String id, String fkzt) throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateCkyjFkzt", fkzt, id);
	}

	public YjqsBean queryCkYjqsxxByYjxxbh(String yjxxbh) throws SQLException {
		return executor.queryObjectWithDBName(YjqsBean.class, CommonConstant.DBNAME_SQJW, "queryCkYjqsxxByYjxxbh", yjxxbh);
	}

	public YjfkBean queryCkYjfkBeanById(String id) throws SQLException {
		return executor.queryObjectWithDBName(YjfkBean.class, CommonConstant.DBNAME_SQJW, "queryCkYjfkBeanById", id);
	}
}
