package com.chinacreator.nbgl.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.nbgl.bean.AjxxBean;
import com.chinacreator.zagl.bean.OperateBean;

public interface ZddwAjHsDao extends Serializable {
	
	/**
	 * 更新案件是否核实
	 * @param ajbh 案件编号
	 * @param sfhs 是否核实
	 * @throws SQLException
	 */
	public void updateAJxxSfhs(String ajbh,String sfhs) throws SQLException;
	
	/**
	 * 更新案件信息是否重点单位发案
	 * @param ajbh 案件编号
	 * @param sfzddwfa 是否重点单位发案
	 * @throws SQLException
	 */
	public void updateAjxxSfZddwFa(String ajbh,String sfzddwfa) throws SQLException;
	
	/**
	 * 更新案件信息重点单位发案
	 * @param ajbh 案件编号
	 * @param zddwdm 重点单位机构编号
	 * @throws SQLException
	 */
	public void updateAjxxZddwdm(String ajbh,String zddwdm) throws SQLException;
	
	/**
	 * 分页查询案件信息列表
	 * @param query 查询条件
	 * @param pageinfo 分页信息
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<AjxxBean> queryAjxxList(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	public List<AjxxBean> queryAjxxList(QueryBean query) throws SQLException;
	
	/**
	 * 根据案件编号查询案件信息
	 * @param ajbh
	 * @return
	 * @throws SQLException
	 */
	public AjxxBean queryAjxxInfoByAjbh(String ajbh) throws SQLException;
	
	/**
	 * 更新操作信息
	 * @param oper
	 * @throws SQLException
	 */
	public void updateCzxx(OperateBean oper) throws SQLException;
	
	/**
	 * 加载案件类别字典
	 * @return
	 * @throws SQLException
	 */
	public List<SystemDictionaryBean> loadAjlbDic() throws SQLException;
}
