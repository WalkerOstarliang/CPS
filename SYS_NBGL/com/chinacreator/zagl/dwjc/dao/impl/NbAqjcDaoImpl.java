package com.chinacreator.zagl.dwjc.dao.impl;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.dwjc.bean.NbAqJcZpBean;
import com.chinacreator.zagl.dwjc.bean.NbaqjcBean;
import com.chinacreator.zagl.dwjc.dao.NbAqjcDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.util.ListInfo;

public class NbAqjcDaoImpl implements NbAqjcDao{

	private static final long serialVersionUID = -8603665937695197795L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
							"com/chinacreator/zagl/dwjc/dao/impl/nbaqjc-sql.xml");
	@Override
	public void insertNbAqjc(NbaqjcBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertNbAqjc", bean);
	}

	@Override
	public NbaqjcBean queryNbAqjcById(String id) throws SQLException {
		return executor.queryObjectWithDBName(NbaqjcBean.class, CommonConstant.DBNAME_SQJW, "queryNbAqjcById", id);
	}

	@Override
	public PageResultInfo<NbaqjcBean> queryNbAqjcByJgbh(String jgbh,PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoWithDBName(NbaqjcBean.class, CommonConstant.DBNAME_SQJW, "queryNbAqjcByJgbh", pageinfo.getOffset(), pageinfo.getPageSize(), jgbh);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}

	@Override
	public void updateNbaqjc(NbaqjcBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateNbaqjc", bean);
	}

	@Override
	public void insertAqJcZp(List<NbAqJcZpBean> nbaqjczplist)
			throws SQLException {
		if(ValidateHelper.isNotEmptyCollection(nbaqjczplist)){
			String sql = executor.getSql("insertAqJcZp");
			for(NbAqJcZpBean ajzpbean: nbaqjczplist){
				PreparedDBUtil util = new PreparedDBUtil();
				util.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
				util.setString(1, ajzpbean.getZpid());
				util.setString(2, ajzpbean.getYhdd());
				util.setBlob(3, ajzpbean.getYhddzp());
				util.setString(4, ajzpbean.getAqjcid());
				util.setString(5, ajzpbean.getJgbh());
				util.setString(6, ajzpbean.getDwlb());
				util.executePrepared();
			}
		}
	}

	@Override
	public Blob getAjxxzpStream(String zpid) throws SQLException {
		String sql=" select yhddzp from T_ZA_NB_DWJC_ZP where zpid='" +zpid+ "'" ;
		DBUtil util = new DBUtil();
		util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
		Blob blob = null;
		if (util.size() > 0)
		{
			blob = util.getBlob(0, "yhddzp");
		}
		return blob;
	}

	@Override
	public void deleteNbajZpxxByZpid(String zpid) throws SQLException {
		String sql = "delete from T_ZA_NB_DWJC_ZP where zpid=?";
		SQLExecutor.deleteWithDBName(CommonConstant.DBNAME_SQJW, sql, zpid);
	}

	@Override
	public List<NbAqJcZpBean> queryNbAqjczpxxListbyaqid(String aqjcid,
			String yhdd) throws SQLException {
		return  executor.queryListWithDBName(NbAqJcZpBean.class, CommonConstant.DBNAME_SQJW, "queryNbAqjczpxxListbyaqid", aqjcid,yhdd);
	}

	@Override
	public void updatenbhqDWjgb(String jgbh) throws Exception {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updatenbhqDWjgb", jgbh);
	}

	@Override
	public void updatenbhqhqb(String jgbh) throws Exception {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updatenbhqhqb", jgbh);
	}

	@Override
	public NbaqjcBean queryLastCheckByJgbh(String jgbh) throws SQLException {
		return executor.queryObjectWithDBName(NbaqjcBean.class, CommonConstant.DBNAME_SQJW, "queryLastCheckByJgbh", jgbh);
	}

}
