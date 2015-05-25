package com.chinacreator.zagl.dao;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.zagl.bean.NbdwaqjcBean;

public interface DwAqjcDao {
	
	/**
	 * 插入 安全检查信息
	 * @param aqjcBean
	 */
	public void insertAqjcBean(NbdwaqjcBean aqjcBean);
	
	/**
	 *  更新安全检查信息
	 */
	public void updateAqjcBean(NbdwaqjcBean aqjcBean);
	
	/**
	 * 根据jcdwdm分页查询安全检查信息
	 */
	public PageResultInfo<NbdwaqjcBean> queryNbAqjcPageInfoByJcdwdm(String jcdwdm,PageInfo pageInfo);
	
}
