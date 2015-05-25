package com.chinacreator.rhzf.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.rhzf.bean.ExpRhzfBean;
import com.chinacreator.rhzf.bean.RhzfBean;
import com.chinacreator.rhzf.bean.ZfryBean;

public interface RhzfDao extends Serializable {

	/**
	 * 新增入户走访
	 * @param bean
	 * @throws SQLException
	 */
	public void insertRhzf(RhzfBean bean) throws SQLException;
	
	/**
	 * 修改入户走访
	 * @param bean
	 * @throws SQLException
	 */
	public void updateRhzf(RhzfBean bean) throws SQLException;
	
	/**
	 * 注销入户走访
	 * @param bean
	 * @throws SQLException
	 */
	public void cancelRhzf(RhzfBean bean) throws SQLException;
	
	/**
	 * 根据地址ID查询走访人员
	 * @param dzid
	 * @return
	 * @throws SQLException
	 */
	public List<ZfryBean> queryZfryByDzid(String dzid) throws SQLException; 
	
	/**
	 * 根据走访ID查询走访人员
	 * @param zfid
	 * @return
	 * @throws SQLException
	 */
	public List<ZfryBean> queryZfryByZfid(String zfid) throws SQLException;
	
	/**
	 * 新增走访人员
	 * @param zfid
	 * @param rkid
	 * @throws SQLException
	 */
	public void insertZfry(String zfid,String rkid) throws SQLException;
	
	/**
	 * 删除走访人员
	 * @param zfid
	 * @param rkid
	 * @throws SQLException
	 */
	public void deleteZfry(String zfid) throws SQLException; 
	
	/**
	 * 根据走访id查询入户走访
	 * @param zfid
	 * @return
	 * @throws SQLException
	 */
	public RhzfBean queryRhzfByZfid(String zfid) throws SQLException;
	
	/**
	 * 分页查询入户走访
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<RhzfBean> queryRhzfList(QueryBean query,PageInfo pageinfo) throws SQLException;
	
	/**
	 * 导出入户走访
	 * @param query
	 * @return
	 * @throws SQLException
	 */
	public List<ExpRhzfBean> expRhzf(QueryBean query) throws SQLException;
 }
