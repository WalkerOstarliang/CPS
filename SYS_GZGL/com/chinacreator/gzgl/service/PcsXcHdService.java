package com.chinacreator.gzgl.service;

import java.io.Serializable;
import java.sql.Blob;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.gzgl.bean.PcsXcHdBean;
import com.chinacreator.gzgl.bean.PcsXcHdTjBean;

/**
 * 派出所宣传活动
 */
public interface PcsXcHdService extends Serializable {
	
	/**
	 * 保存派出所宣传活动
	 * @param bean
	 * @return
	 */
	public PcsXcHdBean saveXchd(PcsXcHdBean bean);
	
	/**
	 * 注销派出所宣传活动
	 * @param id
	 */
	public boolean deletePcsXchd(PcsXcHdBean bean);
	
	/**
	 * 根据ID查询派出所宣传活动
	 * @param id
	 * @return
	 */
	public PcsXcHdBean queryPcsXchdById(String id);
	
	/**
	 * 查询派出所宣传活动列表
	 * @param bean
	 * @param pageinfo
	 * @return
	 */
	public PageResultInfo<PcsXcHdBean> queryPcsXchdList(QueryBean bean,PageInfo pageinfo);
	
	/**
	 * 新增宣传活动照片
	 * @param bean
	 * @return
	 */
	public String insertXchdZp(PcsXcHdBean bean); 
	
	/**
	 * 根据照片ID查询活动照片
	 * @param zpid
	 * @return
	 */
	public Blob queryHdZpById(String zpid);

	/**
	 * 根据照片ID删除活动照片
	 * @param zpid
	 */
	public boolean deleteHdZpById(String zpid);
	
	/**
	 * 查询派出所宣传活动统计
	 * @param query
	 * @return
	 */
	public List<PcsXcHdTjBean> queryPcsXcHdTj(QueryBean query);
}
