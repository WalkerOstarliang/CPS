package com.chinacreator.lsgl.services;

import java.io.Serializable;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.bean.DzxxBean;
import com.chinacreator.lsgl.query.DzQueryBean;

public interface LsglDzService extends Serializable{

	/**
	 * 保存地址信息
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	public DzxxBean saveDzxx(DzxxBean bean) throws Exception;
	
	/**
	 * 分页查询地址信息
	 * @param bean 查询条件
	 * @param pageinfo 分页
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<DzxxBean> queryDzxxWithPageResultInfo(DzQueryBean bean,PageInfo pageinfo) throws Exception;
	
	/**
	 * 根据地址ID查询地址信息
	 * @param dzid 地址ID
	 * @return
	 * @throws Exception
	 */
	public DzxxBean queryDzxxByDzid(String dzid) throws Exception;
	
}
