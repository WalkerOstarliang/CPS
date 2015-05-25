package com.chinacreator.rxgl.dao.impl;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.rxgl.bean.PicBean;
import com.chinacreator.rxgl.dao.RxglDao;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.PreparedDBUtil;

public class RxglDaoImpl implements RxglDao {
	private static final long serialVersionUID = -4466084953991586643L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
					"com/chinacreator/rxgl/dao/impl/rxgl-sql.xml");
	
	public PicBean queryPicByPicid(String pic_id) throws Exception {
		String sql = "select * from t_rxgl_pic where pic_id = '" + pic_id + "'";
		DBUtil db = new DBUtil();
		db.executeSelect(sql);
		
		PicBean bean = null;
		if(db.size() > 0){
			bean = new PicBean();
			//bean.setPic_id(db.getString(0, "pic_id"));
			//bean.setFileName(db.getString(0, "filename"));
			//bean.setPic_b(db.getBlob(0, "pic"));
		}
		return bean;
	}

	public PicBean insertImg(PicBean bean) throws Exception {
		String sql = executor.getSql("insertImg");
		PreparedDBUtil db = new PreparedDBUtil();
		db.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
		//db.setString(0, bean.getPic_id());
		//db.setString(1, bean.getFileName());
		//db.setBlob(2, bean.getPic());
		db.executePrepared();
		return bean;
	}

	public PicBean updateImg(PicBean bean) throws Exception {
		String sql = executor.getSql("updateImg");
		PreparedDBUtil db = new PreparedDBUtil();
		db.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
		//db.setBlob(0, bean.getPic());
		//db.setString(1, bean.getPic_id());
		db.executePrepared();
		return bean;
	}

}
