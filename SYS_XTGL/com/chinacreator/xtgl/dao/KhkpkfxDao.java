package com.chinacreator.xtgl.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.xtgl.bean.KfpzBean;
import com.chinacreator.xtgl.bean.PageTableBean;
import com.chinacreator.xtgl.bean.PageTableHeadBean;

public interface KhkpkfxDao extends Serializable{
	
	/**
	 * 根据考核类型查询考核配置
	 * @param khlx
	 * @return
	 * @throws SQLException
	 */
	public KfpzBean queryKfpzByKhlx(String khlx,int leve) throws SQLException;
	
	/**
	 * 根据考核类型查询页面表格
	 * @param khlx
	 * @return
	 */
	public List<PageTableBean> queryTableByKhlx(String khlx,int leve) throws SQLException;
	
	/**
	 * 根据tablename查询表头信息
	 * @param tablename
	 * @return
	 * @throws SQLException
	 */
	public List<PageTableHeadBean> queryPageTableHeadByTablename(String tablename) throws SQLException;
}
