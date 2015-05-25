package com.chinacreator.afgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.afgl.bean.AflmpcBean;
import com.chinacreator.afgl.bean.AflmpcZxBean;
import com.chinacreator.afgl.bean.AflmpctxrBean;
import com.chinacreator.afgl.query.LmpcxxQuery;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.PaginationHelper;


import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.util.ListInfo;

public class LmpcDao {
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/afgl/dao/lmpc-sql.xml");

	public static PageResultInfo<AflmpcBean> queryLmpcList(
			LmpcxxQuery queryBean, PageInfo pageInfo) throws SQLException {
		/* 应长沙市特巡警支队要求，第六特警大队 作为检查机构，可以查看所有特巡警支队的数据
		 * 特巡警办公室可以查看特巡警支队数据
		 * 公交分局办公室可以查看公交分局所有数据
		 * 
		 * */
		if(queryBean != null && "430100955200".equals(queryBean.getQuerydwdm())){
			queryBean.setQuerydwdm("430100950000");
		}
		if(queryBean != null && "430100950100".equals(queryBean.getQuerydwdm())){
			queryBean.setQuerydwdm("430100950000");
		}
		if(queryBean != null && "430100951100".equals(queryBean.getQuerydwdm())){
			queryBean.setQuerydwdm("430100950000");
		}
		if(queryBean != null && "430197310000".equals(queryBean.getQuerydwdm())){
			queryBean.setQuerydwdm("430197000000");
		}
		if(queryBean != null && "430197320000".equals(queryBean.getQuerydwdm())){
			queryBean.setQuerydwdm("430197000000");
		}
	    ListInfo listInfo = executor.queryListInfoBeanWithDBName(AflmpcBean.class, CommonConstant.DBNAME_SQJW, "queryLmpcList", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 通过记录编号查询路面盘查信息Bean
	 * @param jlbh
	 * @return
	 * @throws SQLException 
	 */
	public static AflmpcBean queryLmpcBeanByJlbh(String jlbh) throws SQLException {
		return executor.queryObjectWithDBName(AflmpcBean.class, CommonConstant.DBNAME_SQJW, "queryLmpcBeanByJlbh", jlbh);
	}

	public static PageResultInfo<AflmpctxrBean> queryLmpctxrBeanList(String jlbh, PageInfo pageInfo) throws SQLException {
		ListInfo listInfo = executor.queryListInfoWithDBName(AflmpctxrBean.class, CommonConstant.DBNAME_SQJW, "queryLmpctxrBeanList", pageInfo.getOffset(), pageInfo.getPageSize(), jlbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		
	}

	public static void insertLmpcxxBean(AflmpcBean lmpcBean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertLmpcxxBean", lmpcBean);
		
	}

	public static void updateLmpcxxBean(AflmpcBean lmpcBean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateLmpcxxBean", lmpcBean);
		
	}

	public static void batchInsertTxrxx(List<AflmpctxrBean> txrList) throws SQLException {
		executor.insertBeans(CommonConstant.DBNAME_SQJW, "insertTxrxx", txrList);
	}

	public static void deltxrxxById(String id) throws SQLException {
		executor.delete("deltxrxxById", id);
	}
	public static List<AflmpcBean> queryLmpcBeanListDowns(LmpcxxQuery queryBean)  throws SQLException{
		return	executor.queryListBeanWithDBName(AflmpcBean.class, CommonConstant.DBNAME_SQJW, "queryLmpcList", queryBean);

	}
	/*
	 * 选择导出某几列记录
	 */
	public static List<AflmpcBean> queryLmpcBeanListXZDowns(String v_jlbh)  throws SQLException{
		
		v_jlbh = "'" + v_jlbh.replace(",", "','") + "'";
		String sql=null;
		sql = executor.getSql("queryLmpcListByjlbh").replace("#[v_jlbh]", v_jlbh);
		return SQLExecutor.queryListWithDBName(AflmpcBean.class, CommonConstant.DBNAME_SQJW, sql);
		
	}
	
	public static void updateZxLmpcxx(String v_jlbh) throws SQLException{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		AflmpcZxBean  bean = new AflmpcZxBean();
		bean.setId(v_jlbh);
		bean.setZxrjh(loginInfo.getUsername());
		bean.setZxrxm(loginInfo.getRealname());
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZxLmpcxx", bean);
	}
}
