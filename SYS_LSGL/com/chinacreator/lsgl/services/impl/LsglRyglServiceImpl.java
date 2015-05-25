package com.chinacreator.lsgl.services.impl;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.lsgl.bean.TzryBean;
import com.chinacreator.lsgl.dao.LsglRyglDao;
import com.chinacreator.lsgl.dao.impl.LsglRyglDaoImpl;
import com.chinacreator.lsgl.services.LsglRyglService;

public class LsglRyglServiceImpl implements LsglRyglService{
	
	private LsglRyglDao ryglDao;
	public LsglRyglServiceImpl(){
		ryglDao = new LsglRyglDaoImpl();
	}
	public PageResultInfo<CzrkxxBean> queryThryByRybh(String rybh,
			PageInfo pageInfo) throws Exception {
		return ryglDao.queryThryByRybh(rybh, pageInfo);
	}

	public PageResultInfo<TzryBean> queryTzryPageInfoByRybh(String rybh,
			PageInfo pageInfo) throws Exception {
		return ryglDao.queryTzryPageInfoByRybh(rybh, pageInfo);
	}
	public PageResultInfo<TzryBean> queryTzryPageInfoByFwid(String fwid,
			String zxbs, PageInfo pageInfo) throws Exception {
		return ryglDao.queryTzryPageInfoByFwid(fwid, zxbs, pageInfo);
	}
	@Override
	public PageResultInfo<RkfwglBean> queryXtzryPageInfoByFwid(String fwid,
			String zxbs, PageInfo pageInfo) throws Exception {
		return ryglDao.queryXtzryPageInfoByFwid(fwid,zxbs,pageInfo);
	}
}
