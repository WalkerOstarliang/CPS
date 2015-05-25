package com.chinacreator.afgl.services;

import java.sql.SQLException;

import com.chinacreator.afgl.bean.AfXldRyxxBean;
import com.chinacreator.afgl.dao.AFxfryDao;
import com.chinacreator.afgl.query.AfxldQueryBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;

public class AfxfryService {
	public PageResultInfo<AfXldRyxxBean> queryAfxldxxListByQueryBean(PageInfo pageInfo, AfxldQueryBean queryBean) throws Exception
	{
		return AFxfryDao.queryAfxldxxListByQueryBean(pageInfo, queryBean);
	}
	/*
	 * 通过巡防员编号查询
	 * */
	public AfXldRyxxBean queryAfxldxxBeanByXfrybh(String xfybh) throws Exception
	{
		return AFxfryDao.queryAfxldxxBeanByXfyrybh(xfybh);
	}
	/*删除巡防人员信息
	 * */
	public void deleteAfryxxByrybh(String xfybh) throws SQLException{
		AFxfryDao.deleteAfryxxByrybh(xfybh);
	}
}
