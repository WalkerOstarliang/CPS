package com.chinacreator.lsgl.dao;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.lsgl.bean.TzryBean;

public interface LsglRyglDao {
	
	
	/**
	 * 同户人员
	 * @param rybh
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<CzrkxxBean>  queryThryByRybh(String rybh,PageInfo pageInfo) throws Exception;
	
	/**
	 * 同址人员
	 */
	
	public PageResultInfo<TzryBean> queryTzryPageInfoByRybh(String rybh,PageInfo pageInfo) throws Exception;

	
	/**
	 * 居住人员
	 */
	public PageResultInfo<TzryBean> queryTzryPageInfoByFwid(String fwid,String zxbs,PageInfo pageInfo) throws Exception;

	public PageResultInfo<RkfwglBean> queryXtzryPageInfoByFwid(String fwid,
			String zxbs, PageInfo pageInfo) throws Exception;

}
