package com.chinacreator.zagl.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.zagl.bean.nbtj.AjxxBean;
import com.chinacreator.zagl.bean.nbtj.NbdwFaTj;
import com.chinacreator.zagl.bean.nbtj.WyxqFaTj;
import com.chinacreator.zagl.bean.nbtj.Wyxqtb;
import com.chinacreator.zagl.bean.nbtj.ZddwFa;

public interface NbTjDao extends Serializable{

	/**
	 * 查询物业小区通报
	 * @param query
	 * @return
	 * @throws SQLException
	 */
	public List<Wyxqtb> queryWyxqTb(QueryBean query) throws SQLException;
	
	/**
	 * 查询物业小区发案
	 * @param query
	 * @return
	 * @throws SQLException
	 */
	public List<WyxqFaTj> queryWyxqFatj(QueryBean query) throws SQLException;
	
	/**
	 * 查询内保单位发案统计
	 * @param query
	 * @return
	 * @throws SQLException
	 */
	public List<NbdwFaTj> queryNbdwFa(QueryBean query) throws SQLException;
	
	/**
	 * 查询重点单位发案
	 * @param query
	 * @return
	 */
	public List<ZddwFa> queryZddwFa(QueryBean query) throws SQLException;
	
	
	/**
	 * 根据发案地点代码查询案件
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<AjxxBean> queryAjxxByFadddm(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	public List<AjxxBean> queryAjxxListByFadddm(QueryBean query) throws SQLException;
	
	/**
	 * 查询物业小区案件
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<AjxxBean> queryAjxxWithWyxq(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	public List<AjxxBean> queryAjxxListWithWyxq(QueryBean query) throws SQLException;
	
	/**
	 * 查询内保单位案件
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<AjxxBean> queryAjxxWithNbdw(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	public List<AjxxBean> queryAjxxListWithNbdw(QueryBean query) throws SQLException;
	
}
