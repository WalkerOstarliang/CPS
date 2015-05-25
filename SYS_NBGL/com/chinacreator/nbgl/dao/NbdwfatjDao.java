package com.chinacreator.nbgl.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.nbgl.bean.AjtjByDwflBean;
import com.chinacreator.nbgl.bean.NbfatjBean;

public interface NbdwfatjDao extends Serializable{

	public List<NbfatjBean> queryNbdwfatjList(QueryBean query);
	
	public List<AjtjByDwflBean> queryAjtjByDwfl(QueryBean query) throws SQLException;
}
