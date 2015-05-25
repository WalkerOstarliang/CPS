package com.chinacreator.nbgl.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.nbgl.bean.GjcBean;

public interface GjcDao extends Serializable{
	
	/**
	 * 新增关键词
	 * @param bean
	 * @throws SQLException
	 */
	public void insertGjc(GjcBean bean) throws SQLException;
	
	/**
	 * 修改关键词
	 * @param bean
	 * @throws SQLException
	 */
	public void updateGjc(GjcBean bean) throws SQLException;
	
	/**
	 * 删除关键词
	 * @param bean
	 * @throws SQLException
	 */
	public void deleteGjc(GjcBean bean) throws SQLException;
	
	/**
	 * 分页查询关键词列表
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<GjcBean> queryGjcList(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	/**
	 * 根据关键词查关键词
	 * @param gjc
	 * @return
	 * @throws SQLException
	 */
	public List<GjcBean> queryGjcListByGjc(String gjc) throws SQLException;
	
	/**
	 * 新增关键词日志
	 * @param bean
	 * @throws SQLException
	 */
	public void insertGjcLog(GjcBean bean) throws SQLException;
	
	/**
	 * 根据id查询关键词
	 * @param gjcId
	 * @return
	 * @throws SQLException
	 */
	public GjcBean queryGjcById(String gjcId) throws SQLException;
	
	/**
	 * 获取案件类别字典
	 * @return
	 * @throws SQLException
	 */
	public List<SystemDictionaryBean> getAjlbDic() throws SQLException;
}
