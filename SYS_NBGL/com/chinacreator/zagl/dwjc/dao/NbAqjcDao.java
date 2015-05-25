package com.chinacreator.zagl.dwjc.dao;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.zagl.dwjc.bean.NbAqJcZpBean;
import com.chinacreator.zagl.dwjc.bean.NbaqjcBean;

public interface NbAqjcDao extends Serializable {
	
	/**
	 * 新增安全检查
	 * @param bean
	 * @throws SQLException
	 */
	public void insertNbAqjc(NbaqjcBean bean) throws SQLException;
	
	/**
	 * 修改安全检查
	 * @param bean
	 * @throws SQLException
	 */
	public void updateNbaqjc(NbaqjcBean bean) throws SQLException;
	
	/**
	 * 根据机构编号查询单位安全检查
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<NbaqjcBean> queryNbAqjcByJgbh(String jgbh,PageInfo pageinfo) throws SQLException;
	
	/**
	 * 根据ID查询安全检查
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public NbaqjcBean queryNbAqjcById(String id) throws SQLException;
	
	/**
	 * 上传安全检查隐患照片
	 */
	public void insertAqJcZp(List<NbAqJcZpBean> nbaqjczplist) throws SQLException;

	/**
	 * 根据安全检查照片id查询照片
	 */
	public Blob getAjxxzpStream(String zpid) throws SQLException;

	/**
	 * 根据安全检查照片id删除照片
	 * 
	 * @param zpid
	 */
	public void deleteNbajZpxxByZpid(String zpid) throws SQLException;
	
	/**
	 * 根据安全检查id和安全隐患yydd查询照片list
	 */
	public List<NbAqJcZpBean> queryNbAqjczpxxListbyaqid(String aqjcid,String yydd) throws SQLException;
	/**
	 * 撤销内保单位核签-- 单位基本信息更新
	 */
	public void updatenbhqDWjgb(String jgbh) throws Exception;
	/**
	 * 撤销内保单位核签-- 核签表更新
	 * 
	 */
	public void updatenbhqhqb(String jgbh) throws Exception;
	
	/**
	 * 查询单位的最后一次安全检查
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public NbaqjcBean queryLastCheckByJgbh(String jgbh) throws SQLException;
}
