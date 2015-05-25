package com.chinacreator.lsgl.dao;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.lsgl.bean.CzfwJbxxBean;
import com.chinacreator.lsgl.query.FwQueryBean;

public interface LsglCzfwJbxxDao {
	/**
	 * 插入出租房屋信息
	 * @param czfwBean
	 * @throws Exception
	 */
	public void insertCzfwJbxxBean(CzfwJbxxBean czfwBean) throws Exception;
	
	/**
	 * 分页查询出租房屋信息
	 * @param queryBean
	 * @param pageInfo
	 * @throws Exception
	 */
	public PageResultInfo<CzfwJbxxBean> queryCzfwBeanPageInfo(FwQueryBean queryBean,PageInfo pageInfo) throws Exception; 

	/**
	 * 修改出租房屋信息
	 */
	public void updateCzfwJbxxBean(CzfwJbxxBean czfwBean) throws Exception;
	
	/**
	 * 根据出租屋编号查询出租屋信息
	 */
	
	public CzfwJbxxBean queryCzfwBeanByCzfwbh(String czfwbh) throws Exception;
	
	public CzfwJbxxBean queryCzfwBeanByfwid(String fwid) throws Exception;
	
	public PageResultInfo<CzfwJbxxBean> queryCzfwListPageByFwid(String fwid,PageInfo pageInfo) throws Exception;
	
}
