package com.chinacreator.lsgl.services;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.lsgl.bean.CzfwCzxxBean;
import com.chinacreator.lsgl.bean.CzrxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;

public interface LsglCzfwCzxxService {	
	/**
	 * 新增
	 * @param czxxBean
	 * @throws Exception
	 */
	public void insertCzxxBean(CzfwCzxxBean czxxBean,FwJbxxBean fwBean) throws Exception;
	
	/**
	 * 分页查询承租信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<CzfwCzxxBean> queryCzxxPageInfo(String czfwbh,PageInfo pageInfo) throws Exception;
	
	/**
	 * 根据承租信息编号 查询
	 * @param czxxbh
	 * @return
	 * @throws Exception
	 */
	public CzfwCzxxBean queryCzxxPageInfobyCzxxbh(String czxxbh) throws Exception;
	
	/**
	 * 修改
	 * @param czxxBean
	 * @throws Exception
	 */
	public void updateCzxxBean(CzfwCzxxBean czxxBean,FwJbxxBean fwBean) throws Exception;
	
	/**
	 * 判断身份证是否存在
	 */
	public boolean isExistSfzh(String sfzh,String czfwbh) throws Exception;
	
	
	
/////////////////////////////////////////////////////////////////
	/**
	 * new   插入承租人信息
	 * 二〇一四年五月十六日 16:19:12
	 */
	public void insertCzrBean(CzrxxBean czrBean) throws Exception; 

	
	/**
	 * 根据出租房bh查询承租分页list
	 * @param czfwbh
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<CzrxxBean> queryCzrPageInfoByCzfwbh(String czfwbh,PageInfo pageInfo) throws Exception;  
	
	
	/**
	 * 修改承租人信息
	 * @param czrBean
	 * @throws Exception
	 */
	public void updateCzrxxBean(CzrxxBean czrBean) throws Exception;

	/**
	 * 注销承租人信息
	 * @param czrBean
	 * @throws Exception
	 */
	public void logoutCzrxxBean(CzrxxBean czrBean) throws Exception;
	
	/**
	 * 根据身份证号码查询
	 * 判断是否重复录入
	 * @param sfzh
	 * @return
	 * @throws Exception
	 */
	public boolean queryCzrxxBeanBySfzh(String sfzh,String fwid) throws Exception;
	
	public CzrxxBean queryCzrxxBeanById(String id) throws Exception;


}
