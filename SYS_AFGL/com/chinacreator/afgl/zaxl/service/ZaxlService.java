package com.chinacreator.afgl.zaxl.service;

import java.io.Serializable;
import java.util.List;

import com.chinacreator.afgl.zaxl.bean.XldyxxBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlPcdxBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlQueryBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlRyBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlSqgbBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;

/**
 * 治安巡逻Service
 */
public interface ZaxlService extends Serializable{
	
	/**
	 * 保存治安巡逻
	 * @param bean
	 * @param opertype 操作类型
	 * @return
	 */
	public ZaxlBean saveZaxl(ZaxlBean bean,String opertype);
	
	/**
	 * 保存治安巡逻民警list
	 * @param zaxlrymjlist
	 */
	public void saveZaxlryMjlist(List<ZaxlRyBean> zaxlrymjlist);
	
	/**
	 * 保存治安巡逻 -- 盘查人员
	 * @param bean
	 */
	public void saveXlpcryxxInfoBean(ZaxlPcdxBean bean);
	
	/**
	 * 根据ID查询治安巡逻
	 * @param id
	 * @return
	 */
	public ZaxlBean queryZaxlBeanById(String id);
	
	/**
	 * 根据ID注销治安巡逻-巡逻人员信息
	 * @param query
	 */
	public void cancelZaxlryById(ZaxlQueryBean query);
	
	/**
	 * 根据ID注销治安巡逻-盘查人员
	 * @param query
	 */
	public void cancelZaxlrpcryById(ZaxlQueryBean query);
	
	/**
	 * 分页查询治安巡逻
	 * @param query
	 * @param pageInfo
	 * @return
	 */
	public PageResultInfo<ZaxlBean> queryZaxlList(QueryBean query,PageInfo pageInfo);
	
	public PageResultInfo<XldyxxBean> queryXlmjlList(QueryBean query,PageInfo pageInfo);  
	
	/**
	 * 分页查询治安巡逻人员
	 * @param query
	 * @param pageInfo
	 * @return
	 */
	public  PageResultInfo<ZaxlRyBean> queryZaxlryList(QueryBean query,PageInfo pageInfo); 
	
	/**
	 * 分页查询治安巡逻--盘查人员
	 * @param query
	 * @param pageInfo
	 * @return
	 */
	public  PageResultInfo<ZaxlPcdxBean> queryZaxlpcryList(QueryBean query,PageInfo pageInfo); 
	
	
	/**
	 * 分页查询社区干部
	 * @param query
	 * @param pageInfo
	 * @return
	 */
	public  PageResultInfo<ZaxlSqgbBean> querySqgblList(QueryBean query,PageInfo pageInfo); 
	
}
