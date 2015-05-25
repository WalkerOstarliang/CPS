package com.chinacreator.nbgl.service;

import java.io.Serializable;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.nbgl.bean.AjxxBean;

public interface ZddwAjHsService extends Serializable {
	
	/**
	 * 案件信息核实
	 * @param ajxx
	 */
	public boolean ajhs(AjxxBean ajxx);
	
	/**
	 * 查询案件列表
	 * @param query
	 * @param pageinfo
	 * @return
	 */
	public PageResultInfo<AjxxBean> queryAjxxList(QueryBean query,PageInfo pageinfo);
	
	public List<AjxxBean> queryAjxxList(QueryBean query);
	
	/**
	 * 根据案件编号查询案件详细信息
	 * @param ajbh
	 * @return
	 */
	public AjxxBean queryAjxxInfoByAjbh(String ajbh);
	
	/**
	 * 获取案件类别字典
	 * @return
	 */
	public List<SystemDictionaryBean> getAjlbDic();
	

}
