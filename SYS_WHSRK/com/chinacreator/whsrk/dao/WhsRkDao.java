package com.chinacreator.whsrk.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.whsrk.bean.WhsRkBean;
import com.chinacreator.whsrk.bean.WhsRkFkBean;
import com.chinacreator.whsrk.bean.WhsRkPfBean;
import com.chinacreator.whsrk.bean.WhsRkThBean;

public interface WhsRkDao extends Serializable {
	
	/**
	 * 新增未核实人口派发信息
	 * @param bean
	 */
	public void insertWhsRkPf(WhsRkPfBean bean) throws SQLException;
	
	/**
	 * 新增未核实人口退回信息
	 * @param bean
	 * @throws SQLException
	 */
	public void insertWhsRkTh(WhsRkThBean bean) throws SQLException;
	
	/**
	 * 新增未核实人口反馈信息
	 * @param bean
	 * @throws SQLException
	 */
	public void insertWhsRkFk(WhsRkFkBean bean) throws SQLException;
	
	/**
	 * 更新实有人口操作状态
	 * @throws SQLException
	 */
	public void updateWhrkCzzt(WhsRkBean bean) throws SQLException;
	
	/**
	 * 更新实有人口反馈状态
	 * @throws SQLException
	 */
	public void updateWhrkFkzt(WhsRkBean bean) throws SQLException;
	
	/**
	 * 分页查询未核实人口列表
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<WhsRkBean> queryWhsRkList(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	public List<WhsRkBean> queryWhsRkList(QueryBean query) throws SQLException;
	/**
	 * 未核实人口派发
	 * @param bean
	 */
	public void updateWhsRkPfxx(WhsRkBean bean) throws SQLException;
}
