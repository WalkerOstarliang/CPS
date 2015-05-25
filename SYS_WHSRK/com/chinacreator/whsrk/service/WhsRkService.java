package com.chinacreator.whsrk.service;

import java.io.Serializable;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.whsrk.bean.WhsRkBean;
import com.chinacreator.whsrk.bean.WhsRkFkBean;
import com.chinacreator.whsrk.bean.WhsRkPfBean;
import com.chinacreator.whsrk.bean.WhsRkThBean;

public interface WhsRkService extends Serializable {
	
	/**
	 * 未核实人口派发
	 * @param bean
	 * @return
	 */
	public boolean whsRkPf(WhsRkPfBean bean);
	
	/**
	 * 未核实人口退回
	 * @param bena
	 * @return
	 */
	public boolean whsRkTh(WhsRkThBean bean);
	/**
	 * 未核实人口反馈
	 * @param bean
	 * @return
	 */
	public boolean whsRkFk(WhsRkFkBean bean);
	/**
	 * 查询未核实人口信息列表
	 * @param query
	 * @param pageInfo
	 * @return
	 */
	public PageResultInfo<WhsRkBean> queryWhsRkList(QueryBean query,PageInfo pageInfo);
	
	public List<WhsRkBean> queryWhsRkList(QueryBean query);

}
