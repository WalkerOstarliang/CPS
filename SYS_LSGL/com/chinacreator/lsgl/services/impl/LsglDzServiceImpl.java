package com.chinacreator.lsgl.services.impl;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.bean.DzxxBean;
import com.chinacreator.common.cps.dao.CommonDzxxDao;
import com.chinacreator.common.cps.dao.impl.CommonDzxxDaoImpl;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.query.DzQueryBean;
import com.chinacreator.lsgl.services.LsglDzService;

public class LsglDzServiceImpl implements LsglDzService {

	private static final long serialVersionUID = 5150396245690180718L;
	
	private CommonDzxxDao dao;
	
	public LsglDzServiceImpl(){
		dao =  new CommonDzxxDaoImpl();
	}

	public DzxxBean queryDzxxByDzid(String dzid) throws Exception {
		if(ValidateHelper.isEmptyString(dzid)){
			throw new Exception("地址编码为空，查询失败!");
		}else{
			return dao.queryDzxxBeanByDzId(dzid);
		}
	}

	public PageResultInfo<DzxxBean> queryDzxxWithPageResultInfo(DzQueryBean bean,PageInfo pageInfo)
			throws Exception {
		return dao.queryDzxxPageResultInfo(bean, pageInfo);
	}

	public DzxxBean saveDzxx(DzxxBean bean) throws Exception {		
		if(bean == null){
			throw new Exception("地址信息为空,不能保存!");
		}else{
			if(ValidateHelper.isEmptyString(bean.getDzid())){
				bean = dao.insertDzxxBean(bean);
			}else{
				bean = dao.updateDzxxBean(bean);
			}
		}
		return bean;
	}

}
