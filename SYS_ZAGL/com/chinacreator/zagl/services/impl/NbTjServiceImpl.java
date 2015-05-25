package com.chinacreator.zagl.services.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.nbtj.AjxxBean;
import com.chinacreator.zagl.bean.nbtj.NbdwFaTj;
import com.chinacreator.zagl.bean.nbtj.NbtjQuery;
import com.chinacreator.zagl.bean.nbtj.WyxqFaTj;
import com.chinacreator.zagl.bean.nbtj.Wyxqtb;
import com.chinacreator.zagl.bean.nbtj.ZddwFa;
import com.chinacreator.zagl.dao.NbTjDao;
import com.chinacreator.zagl.dao.impl.NbTjDaoImpl;
import com.chinacreator.zagl.services.NbTjService;

public class NbTjServiceImpl implements NbTjService {

	private static final long serialVersionUID = 6145637460113223668L;
	
	NbTjDao dao = new NbTjDaoImpl();
	
	@Override
	public List<Wyxqtb> queryWyxqTb(QueryBean query) {
		try {
			return dao.queryWyxqTb(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<WyxqFaTj> queryWyxqFa(QueryBean query) {
		try {
			return dao.queryWyxqFatj(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<NbdwFaTj> queryNbdwFa(QueryBean query) {
		try {
			return dao.queryNbdwFa(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ZddwFa> queryZddwFa(QueryBean query) {
		try {
			return dao.queryZddwFa(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<AjxxBean> queryAjxx(NbtjQuery query, PageInfo pageinfo) {
		PageResultInfo<AjxxBean> result = null;
		if(ValidateHelper.isNotEmptyString(query.getOrgcode())){
			query.setOrgLeve(CommonDBBaseHelper.getOrgLeve(query.getOrgcode()) + "");
		}
		try {
			if(ValidateHelper.isNotEmptyString(query.getId())){
				result = dao.queryAjxxByFadddm(query, pageinfo);
			}else{
				if("wyxq".equals(query.getLx())){
					result = dao.queryAjxxWithWyxq(query, pageinfo);
				}else if("nbdw".equals(query.getLx())){
					result = dao.queryAjxxWithNbdw(query, pageinfo);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			result = null;
		}
		return result;
	}

	@Override
	public List<AjxxBean> queryAjxxList(NbtjQuery query) {
		List<AjxxBean> result = null;
		if(ValidateHelper.isNotEmptyString(query.getOrgcode())){
			query.setOrgLeve(CommonDBBaseHelper.getOrgLeve(query.getOrgcode()) + "");
		}
		try {
			if(ValidateHelper.isNotEmptyString(query.getId())){
				result = dao.queryAjxxListByFadddm(query);
			}else{
				if("wyxq".equals(query.getLx())){
					result = dao.queryAjxxListWithWyxq(query);
				}else if("nbdw".equals(query.getLx())){
					result = dao.queryAjxxListWithNbdw(query);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			result = null;
		}
		return result;
	}
	
}
