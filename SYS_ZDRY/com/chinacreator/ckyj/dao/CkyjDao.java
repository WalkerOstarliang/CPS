package com.chinacreator.ckyj.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.ckyj.bean.CkyjxxBean;
import com.chinacreator.ckyj.bean.YjfkBean;
import com.chinacreator.ckyj.bean.YjqsBean;
import com.chinacreator.ckyj.query.CkyjQueryBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;

public interface CkyjDao extends Serializable{
	
	/**
	 * 更新反馈状态
	 * @param id
	 * @param fkzt
	 * @throws SQLException
	 */
	public void updateCkyjFkzt(String id, String fkzt) throws SQLException;
	
	/**
	 * 更新常控预警签收状态
	 * @param id 预警信息编号
	 * @param qszt 签收状态
	 * @throws SQLException
	 */
	public void updateCkyjQszt(String id, String qszt) throws SQLException;
	
	/**
	 * 新增预警签收信息
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public YjqsBean insertCkyjQsxx(YjqsBean bean) throws SQLException;
	
	
	/**
	 * 新增预警反馈信息
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public YjfkBean insertCkyjFkxx(YjfkBean bean) throws SQLException;
	
	/**
	 * 修改预警反馈信息
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public YjfkBean updateCkyjFkxx(YjfkBean bean) throws SQLException; 
	
	/**
	 * 分页查询常控预警
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<CkyjxxBean> queryCkyjxxPageResultInfo(CkyjQueryBean bean,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 根据预警信息编号查询常控预警信息
	 * @param yjxxbh
	 * @return
	 */
	public CkyjxxBean queryCkyjxxByYjxxbh(String yjxxbh) throws SQLException;
	
	/**
	 * 分页查询常控预警签收信息
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<YjqsBean> queryCkyjQsxxPageResultInfo(CkyjQueryBean bean,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 根据id查询常控预警签收信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public YjqsBean queryCkYjqsxxById(String id) throws SQLException;
	
	/**
	 * 根据预警信息编号查询常控预警签收信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public YjqsBean queryCkYjqsxxByYjxxbh(String yjxxbh) throws SQLException;
	
	/**
	 * 根据预警信息编号查询预警反馈信息
	 * @param yjxxbh
	 * @return
	 * @throws SQLException
	 */
	public List<YjfkBean> queryCkyjFkListByYjxxbh(String yjxxbh) throws SQLException;
	
	/**
	 * 根据ID查询常控预警反馈信息
	 * @param id
	 * @return
	 */
	public YjfkBean queryCkYjfkBeanById(String id) throws SQLException;
}
