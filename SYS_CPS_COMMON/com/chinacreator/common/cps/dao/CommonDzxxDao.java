package com.chinacreator.common.cps.dao;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.bean.CommonDZJlx;
import com.chinacreator.common.cps.bean.DzxxBean;
import com.chinacreator.common.cps.bean.XqzBean;
import com.chinacreator.lsgl.query.DzQueryBean;

/**
 * 公共地址信息操作
 * 
 * @filename CommonDzxxDao.java
 * @author mingchun.xiong
 * @date 2013-8-13
 *
 */
public interface CommonDzxxDao
{
	/**
	 * 查询地址信息
	 * @param dzId 地址ID
	 * @return
	 * @throws Exception
	 * @date 2013-8-13 下午03:18:30
	 */
	public DzxxBean queryDzxxBeanByDzId(String dzId) throws Exception;
	
	/**
	 * 插入地址信息
	 * @param dzxxBean 地址对象
	 * @return dzid
	 * @throws Exception
	 * @date 2013-8-13 下午03:19:19
	 */
	public DzxxBean insertDzxxBean(DzxxBean dzxxBean) throws Exception;
	
	/**
	 * 更新地址信息
	 * @param dzxxBean
	 * @throws Exception
	 * @date 2013-8-13 下午03:19:52
	 */
	public DzxxBean updateDzxxBean(DzxxBean dzxxBean) throws Exception;
	
	/**
	 * 分页查询街路巷信息
	 */
	public PageResultInfo<CommonDZJlx> queryCommonDZJlxPageResult(CommonDZJlx bean,PageInfo pageInfo) throws Exception;

	/**
	 * 插入街路巷信息
	 */
	public void insertCommonDZJlx(CommonDZJlx jlxBean) throws Exception;
	
	/**
	 * 判断名称是否存在
	 */
	public  boolean isExistJlxMc(String mc,String ssxzqh) throws Exception;
	
	/**
	 * 分页查询地址
	 */
	public PageResultInfo<DzxxBean> queryDzxxPageResultInfo(DzQueryBean bean,PageInfo pageInfo) throws Exception;

	/**
	 * 修改街路巷信息
	 */
	public void updateCommonDzjlx(CommonDZJlx jlxBean) throws Exception;
	
	/**
	 * 根据ID查询街路巷
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public CommonDZJlx queryDzJlxInfoById(String id) throws Exception;
	
	/**
	 * 注销
	 * @param jlxBean
	 * @throws Exception
	 */
	public  void deleteCommonDzjlx(CommonDZJlx jlxBean) throws Exception;
	
	/**
	 * 分页查询街路巷（列表只查询在实体采集过的）
	 */
	public  PageResultInfo<CommonDZJlx> queryDzjlxInfoInStxx(CommonDZJlx jlxBean,PageInfo pageInfo) throws Exception;
	
	public PageResultInfo<XqzBean> queryXzqBeanPageResult(XqzBean queryBean, PageInfo pageInfo) throws Exception;
}
