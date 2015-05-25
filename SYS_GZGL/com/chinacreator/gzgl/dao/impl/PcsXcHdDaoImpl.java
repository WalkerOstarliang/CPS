package com.chinacreator.gzgl.dao.impl;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.gzgl.bean.PcsXcHdBean;
import com.chinacreator.gzgl.bean.PcsXcHdTjBean;
import com.chinacreator.gzgl.bean.PcsXcHdZpBean;
import com.chinacreator.gzgl.dao.PcsXcHdDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.util.ListInfo;

public class PcsXcHdDaoImpl implements PcsXcHdDao {
	private static final long serialVersionUID = 6672569342359994604L;

	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
				"com/chinacreator/gzgl/dao/pcsxchd-sql.xml");
	
	@Override
	public void DeletePcsXcHd(PcsXcHdBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "DeletePcsXcHd", bean);
	}

	@Override
	public void deleteXcHdZpById(String zpid) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteXcHdZpById", zpid);
	}

	@Override
	public void insertPcsXcHd(PcsXcHdBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertPcsXcHd", bean);
	}

	@Override
	public void insertXcHdZp(PcsXcHdZpBean bean) throws SQLException {
		String sql = executor.getSql("insertXcHdZp");
		PreparedDBUtil util = new PreparedDBUtil();
		util.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
		util.setString(1, bean.getId());
		util.setString(2, bean.getHdid());
		util.setBlob(3, bean.getZp());
		util.setString(4, bean.getZpFileName());
		util.setString(5, bean.getDjrxm());
		util.setString(6, bean.getDjrjh());
		util.setString(7, bean.getDjdwdm());
		util.setString(8, bean.getDjdwmc());
		util.setString(9,bean.getDjrsfzh());
		util.executePrepared();
	}

	@Override
	public Blob queryHdZpById(String zpid) throws SQLException {
		String sql = executor.getSql("queryHdZpById");
		PreparedDBUtil util = new PreparedDBUtil();
		util.preparedSelect(CommonConstant.DBNAME_SQJW, sql);
		util.setString(1, zpid);
		util.executePrepared();
		Blob blob = null;
		if (util.size() > 0)
		{
			blob = util.getBlob(0, "zp");
		}
		return blob;
	}

	@Override
	public PcsXcHdBean queryPcsXcHdById(String id) throws SQLException {
		return executor.queryObjectWithDBName(PcsXcHdBean.class, CommonConstant.DBNAME_SQJW, "queryPcsXcHdById", id);
	}

	@Override
	public PageResultInfo<PcsXcHdBean> queryPcsXcHdList(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo listinfo = executor.queryListInfoBeanWithDBName(PcsXcHdBean.class, CommonConstant.DBNAME_SQJW, "queryPcsXcHdList", pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, listinfo);
	}

	@Override
	public List<PcsXcHdZpBean> queryZpByHdid(String id) throws SQLException {
		return executor.queryListWithDBName(PcsXcHdZpBean.class, CommonConstant.DBNAME_SQJW, "queryZpByHdid", id);
	}

	@Override
	public void updatePcsXcHd(PcsXcHdBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updatePcsXcHd", bean);
	}

	@Override
	public List<PcsXcHdTjBean> queryPcsXcHdTj(QueryBean query)
			throws SQLException {
		return executor.queryListBeanWithDBName(PcsXcHdTjBean.class, CommonConstant.DBNAME_SQJW, "queryPcsXcHdTj", query);
	}

}
