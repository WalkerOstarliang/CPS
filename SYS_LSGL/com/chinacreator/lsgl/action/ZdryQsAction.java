package com.chinacreator.lsgl.action;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.lsgl.bean.ZdryBean;
import com.chinacreator.lsgl.bean.ZdryQsBean;
import com.chinacreator.lsgl.query.ZdryQsQueryBean;
import com.chinacreator.lsgl.services.ZdryQsService;
import com.chinacreator.lsgl.services.impl.ZdryQsServiceImlp;

/**
 * 重点人员签收
 */
public class ZdryQsAction extends CPSBaseAction {

	private static final long serialVersionUID = 5016325375072397092L;

	private ZdryQsService service;
	
	/**
	 * 重点人员
	 */
	private ZdryBean zdry;
	
	/**
	 * 重点人员查询
	 */
	private ZdryQsQueryBean query;
	
	/**
	 * 重点人员签收
	 */
	private ZdryQsBean zdryqs;
	
	public ZdryQsAction(){
		service = new ZdryQsServiceImlp();
		zdry = new ZdryBean();
		query = new ZdryQsQueryBean();
		zdryqs = new ZdryQsBean();
	}
	
	/**
	 * 跳转到重点人员签收页面
	 * @return
	 */
	public String toZdryqsListPage(){
		initQueryBean(query);
		return "toZdryqsListPage";
	}
	
	/**
	 * 查询重点人员签收列表
	 */
	public void queryZdryqsList(){
		responseWrite(service.queryZdryJsList(query, getPageInfo()));
	}
	
	/**
	 * 跳转到重点人员签收页面(重点人员详情页面)
	 * @return
	 */
	public String toZdryQsPage(){
		zdry = service.queryZdryxxByRybh(zdry.getJbxx().getRenyuanbianhao());
		return "toZdryQsPage";
	}
	
	/**
	 * 签收重点人员
	 */
	public void zdryQs(){
		responseWrite(service.ZdryQs(zdryqs));
	}
	
	
/*******************************GetAndSet************************************/
	public ZdryBean getZdry() {
		return zdry;
	}

	public void setZdry(ZdryBean zdry) {
		this.zdry = zdry;
	}

	public ZdryQsQueryBean getQuery() {
		return query;
	}

	public void setQuery(ZdryQsQueryBean query) {
		this.query = query;
	}

	public ZdryQsBean getZdryqs() {
		return zdryqs;
	}

	public void setZdryqs(ZdryQsBean zdryqs) {
		this.zdryqs = zdryqs;
	}
}
