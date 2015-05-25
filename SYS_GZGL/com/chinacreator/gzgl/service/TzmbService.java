package com.chinacreator.gzgl.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.gzgl.bean.TzmbBean;
import com.chinacreator.gzgl.dao.TzmbDao;
import com.chinacreator.gzgl.query.TzmbQuery;

public class TzmbService {
	public List<TzmbBean> queryTzmbxx() {
		// TODO Auto-generated method stub
		return TzmbDao.queryTzmbxx();
	}

	public void saveTzmbxxBean(TzmbBean tzmbBean, String[] tzmbFilenames, File[] tzmbUploads) throws SQLException {
		for(int i=0;i<tzmbUploads.length;i++){
			String tzid = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_TZMBBH");
			tzmbBean.setId(tzid);
			tzmbBean.setTzmb(tzmbUploads[i]);
			tzmbBean.setTzmc(tzmbFilenames[i]);
			TzmbDao.saveTzmbxxBean(tzmbBean);
		}
	}

	public PageResultInfo<TzmbBean> getTzmbxx(TzmbQuery queryBean,
			PageInfo pageInfo){
		PageResultInfo<TzmbBean> pageResultInfo = null;
		try {
			pageResultInfo = TzmbDao.getTzmbxx(pageInfo,queryBean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pageResultInfo;
	}

	public TzmbBean getTzmbxxBeanbyId(String id) throws SQLException {
		return TzmbDao.getTzmbxxBeanbyId(id);
	}

	public void deleteTzmbxxbyId(String id) throws SQLException {
		TzmbDao.deleteTzmbxxbyId(id);
		
	}


}
