package com.chinacreator.gzgl.service;

import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.bean.UserLxfsBean;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.dao.UserLxfsDao;
import com.chinacreator.gzgl.query.UserLxfsQuery;

public class UserLxfsService {

	public PageResultInfo<UserLxfsBean> queryLxfsList(PageInfo pageInfo,
			UserLxfsQuery queryBean) throws SQLException {
		return UserLxfsDao.queryLxfsList(pageInfo,queryBean);
	}

	public UserLxfsBean queryuserLxfsBeanById(String id) throws SQLException {
		return UserLxfsDao.queryuserLxfsBeanById(id);
	}

	public void updateUserLxfs(UserLxfsBean userLxfsBean) throws SQLException {
		UserLxfsDao.updateUserLxfs(userLxfsBean);
		
	}
	
	public void saveUserLxfs(UserLxfsBean userLxfsBean) throws SQLException 
	{
		if (ValidateHelper.isNotEmptyString(userLxfsBean.getId()))
		{
			UserLxfsDao.updateUserLxfs(userLxfsBean);
		}
		else
		{
			UserLxfsDao.insertUserLxfs(userLxfsBean);
		}
	}

	public String getSfncjws(String orgcode)
	{
		return UserLxfsDao.getSfncjws(orgcode);
	}
	
}
