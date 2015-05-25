package com.chinacreator.zagl.services.impl;

import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.zagl.bean.DdcjjBean;
import com.chinacreator.zagl.bean.DdcjjQueryBean;
import com.chinacreator.zagl.dao.DdcjjDaointerf;
import com.chinacreator.zagl.dao.impl.DdcjjDaointerfimpl;
import com.chinacreator.zagl.services.DdcjjService;

public class DdcjjServiceimpl implements DdcjjService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8276898146361338420L;
	
	private DdcjjDaointerf dao = new DdcjjDaointerfimpl();

	@Override
	public List<DdcjjBean> dowloadExcel(DdcjjQueryBean query) {
		// TODO Auto-generated method stub
		return dao.dowloadExcel(query);
	}

	@Override
	public DdcjjBean queryDdcjjBeanById(String id) {
		return dao.queryDdcjjBeanById(id);
	}

	@Override
	public PageResultInfo<DdcjjBean> queryDdcjjList(DdcjjQueryBean ddcjjquerybean,
			PageInfo pageInfo) {
		
		return dao.queryDdcjjList(ddcjjquerybean, pageInfo);
	}

	@Override
	public List<DdcjjBean> dowloadxzExcel(String v_car_id) {
		
		return dao.queryDdcjjListByCar_id(v_car_id);
	}

}
