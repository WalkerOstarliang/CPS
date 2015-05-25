package com.chinacreator.nbgl.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.nbgl.bean.AjtjByDwflBean;
import com.chinacreator.nbgl.bean.NbfatjBean;
import com.chinacreator.nbgl.dao.NbdwfatjDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;

public class NbdwfatjDaoImpl implements NbdwfatjDao {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2455756669334282214L;

	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
	"com/chinacreator/nbgl/dao/impl/nbfatj-sql.xml");
	
	
	public List<NbfatjBean> queryNbdwfatjList(QueryBean query) {
		try {
			String sql = ""; 
			String jb = "";
			jb = executor.queryFieldBeanWithDBName(CommonConstant.DBNAME_SQJW, "GetDwleveSQL", query);
			// 获取单位所在级别    1：省厅       2：市级        3：县级        4:派出所      5：警务室
			if("2".equals(jb)){
				sql = "queryNbdwfatjListFxj" ; // 按分县局统计
			}else if("3".equals(jb)){
				sql = "queryNbdwfatjListPcs" ; // 按派出所统计
			}else if("4".equals(jb)){
				sql = "queryNbdwfatjListJwq" ; // 按警务区统计
			}
			return executor.queryListBeanWithDBName(NbfatjBean.class, CommonConstant.DBNAME_SQJW, sql, query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}


	@Override
	public List<AjtjByDwflBean> queryAjtjByDwfl(QueryBean query)
			throws SQLException {
		return executor.queryListBeanWithDBName(AjtjByDwflBean.class,CommonConstant.DBNAME_SQJW, "queryAjtjByDwfl", query);
	}
}
