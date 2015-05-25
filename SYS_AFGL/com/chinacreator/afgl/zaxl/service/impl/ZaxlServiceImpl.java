package com.chinacreator.afgl.zaxl.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.afgl.zaxl.bean.XldyxxBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlPcdxBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlQueryBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlRyBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlSqgbBean;
import com.chinacreator.afgl.zaxl.dao.ZaxlDao;
import com.chinacreator.afgl.zaxl.dao.imol.ZaxlDaoImpl;
import com.chinacreator.afgl.zaxl.service.ZaxlService;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;

public class ZaxlServiceImpl implements ZaxlService {

	private static final long serialVersionUID = -4911209390167811927L;
	private ZaxlDao dao = new ZaxlDaoImpl();
	
	@Override
	public ZaxlBean queryZaxlBeanById(String id) {
		try {
			return dao.queryZaxlById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<ZaxlBean> queryZaxlList(QueryBean query,
			PageInfo pageInfo) {
		try {
			return dao.queryZaxlList(query, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ZaxlBean saveZaxl(ZaxlBean bean, String opertype) {
		try{
			if(ValidateHelper.isEmptyString(bean.getId())){
				String id = ActionContextHelper.getLoginInfo().getOrgcode().substring(0,6) + 
					DateTimeHelper.getNowDateStr("yyyyMMddHHmmss") + 
					CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZALXID");
				bean.setId(id);
				bean.setCzbs(CommonConstant.CZBZ_ADD);
				bean.initDjxx();
				bean.initCzxx();
				dao.insertZaxl(bean);
			}else{
				bean.initCzxx();
				if(CommonConstant.OPERTYPE_UPDATE.equals(opertype)){
					bean.setCzbs(CommonConstant.CZBZ_UPDATE);
					dao.updateZaxl(bean);
				}else if(CommonConstant.OPERTYPE_DELETE.equals(opertype)){
					bean.setCzbs(CommonConstant.CZBZ_ZX);
					dao.cancelZaxl(bean);
				}
			}
		}catch (Exception e) {
			bean = null;
			e.printStackTrace();
		}
		return bean;
	}
	
	public PageResultInfo<ZaxlRyBean> queryZaxlryList(QueryBean query,
			PageInfo pageInfo) {
		try {
			return dao.queryZaxlryList(query, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public void saveZaxlryMjlist(List<ZaxlRyBean> zaxlrymjlist) {
		try {
			dao.saveZaxlryMjlist(zaxlrymjlist);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void cancelZaxlryById(ZaxlQueryBean query) {
		dao.cancelZaxlryById(query);
	}

	public PageResultInfo<XldyxxBean> queryXlmjlList(QueryBean query,
			PageInfo pageInfo) {
		try {
			return dao.queryXlmjlList(query, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public PageResultInfo<ZaxlSqgbBean> querySqgblList(QueryBean query,
			PageInfo pageInfo) {
		try {
			return dao.querySqgblList(query, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public PageResultInfo<ZaxlPcdxBean> queryZaxlpcryList(QueryBean query,
			PageInfo pageInfo) {
		try {
			return dao.queryZaxlpcryList(query, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public void saveXlpcryxxInfoBean(ZaxlPcdxBean bean) {
		dao.saveXlpcryxxInfoBean(bean);
		
	}

	public void cancelZaxlrpcryById(ZaxlQueryBean query) {
		try {
			dao.cancelZaxlrpcryById(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
