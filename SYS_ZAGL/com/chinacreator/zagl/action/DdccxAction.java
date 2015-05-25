package com.chinacreator.zagl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.zagl.bean.DdcjjBean;
import com.chinacreator.zagl.bean.DdcjjQueryBean;
import com.chinacreator.zagl.services.DdcjjService;
import com.chinacreator.zagl.services.impl.DdcjjServiceimpl;

public class DdccxAction extends CPSBaseAction{

	/**
	 * 交警采集的电动车查询Action
	 */
	private static final long serialVersionUID = 9206483385848745022L;
	private String v_car_id ;
	/*电动车*/
	private DdcjjBean ddcjjbean;
	/*查询*/
	private DdcjjQueryBean ddcjjquerybean;
	
	private List<DdcjjBean> ddjjcxList;
	
	private DdcjjService service;
	
	public DdccxAction(){
		super();
		ddcjjbean =new DdcjjBean();
		ddcjjquerybean = new DdcjjQueryBean();
		ddjjcxList = new ArrayList<DdcjjBean>();
		service = new DdcjjServiceimpl();
	}
	/*
	 * 跳转到交警采集的电动车查询页面
	 * */
	public String toDdcjjListPage(){
		initQueryBean(ddcjjquerybean);
		return "toDdcjjListPage";
	}
	/**
	 * 通过QueryBean 查询电动车  分页
	 * @return
	 */
	public void queryBeanList(){
		PageResultInfo<DdcjjBean> pageresult = new PageResultInfo<DdcjjBean>();
		pageresult = service.queryDdcjjList(ddcjjquerybean, this.getPageInfo());
		responseWrite(pageresult);
	}
	
	/***
	 * 通过Car_id 查询电动车  跳转到详细信息
	 * @return
	 */
	public String queryByCarid(){
		ddcjjbean = service.queryDdcjjBeanById(ddcjjbean.getCar_id());
		return "queryByCarid";
	}
	
	/**
	 * downloadDdcExcel
	 * 导出
	 * @return
	 */
	public String downloadDdcExcel(){
		ddjjcxList = service.dowloadExcel(ddcjjquerybean);
		return "downloadDdcExcel";
	}
	
	/**
	 * 可以选择几条导出
	 * @return
	 */
	public String downloadDdcxzExcel(){
		ddjjcxList = service.dowloadxzExcel(v_car_id);
		return "downloadDdcExcel";
	}
	
	public DdcjjBean getDdcjjbean() {
		return ddcjjbean;
	}

	public void setDdcjjbean(DdcjjBean ddcjjbean) {
		this.ddcjjbean = ddcjjbean;
	}

	public DdcjjQueryBean getDdcjjquerybean() {
		return ddcjjquerybean;
	}

	public void setDdcjjquerybean(DdcjjQueryBean ddcjjquerybean) {
		this.ddcjjquerybean = ddcjjquerybean;
	}

	public List<DdcjjBean> getDdjjcxList() {
		return ddjjcxList;
	}

	public void setDdjjcxList(List<DdcjjBean> ddjjcxList) {
		this.ddjjcxList = ddjjcxList;
	}

	public DdcjjService getService() {
		return service;
	}

	public void setService(DdcjjService service) {
		this.service = service;
	}
	public String getV_car_id() {
		return v_car_id;
	}
	public void setV_car_id(String v_car_id) {
		this.v_car_id = v_car_id;
	}
}
