package com.chinacreator.nbgl.service;

import java.io.Serializable;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.nbgl.bean.GjcBean;

public interface GjcService extends Serializable {
	
	/**
	 * 保存关键词
	 * @param bean
	 * @return
	 */
	public GjcBean saveGjc(GjcBean bean);
	
	/**
	 * 删除关键词
	 * @param gjcId
	 */
	public boolean deleteGjc(String gjcId);
	
	/**
	 * 查询关键词列表
	 * @param query
	 * @param pageinfo
	 * @return
	 */
	public PageResultInfo<GjcBean> queryGjcList(QueryBean query,PageInfo pageinfo);
	
	/**
	 * 检查关键词是否存在
	 * @param gjc
	 * @return
	 */
	public boolean checkGjcIsExists(String gjc);
}
