package com.chinacreator.nbgl.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.nbgl.bean.AjtjByDwflBean;
import com.chinacreator.nbgl.bean.NbfatjBean;
import com.chinacreator.nbgl.dao.NbdwfatjDao;
import com.chinacreator.nbgl.dao.impl.NbdwfatjDaoImpl;
import com.chinacreator.nbgl.service.NbdwtjService;

public class NbdwtjServiceImpl implements NbdwtjService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6894157736218411096L;
	private NbdwfatjDao dao = new NbdwfatjDaoImpl();
	public List<NbfatjBean> queryNbdwfatjlist(QueryBean query) {
		return dao.queryNbdwfatjList(query);
	}
	
	@Override
	public List<AjtjByDwflBean> queryAjtjByDwfl(QueryBean query) {
		try {
			return dao.queryAjtjByDwfl(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
