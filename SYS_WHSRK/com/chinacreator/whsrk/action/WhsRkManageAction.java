package com.chinacreator.whsrk.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.whsrk.bean.WhsRkBean;
import com.chinacreator.whsrk.bean.WhsRkFkBean;
import com.chinacreator.whsrk.bean.WhsRkPfBean;
import com.chinacreator.whsrk.bean.WhsRkThBean;
import com.chinacreator.whsrk.query.WhsRkQueryBean;
import com.chinacreator.whsrk.service.WhsRkService;
import com.chinacreator.whsrk.service.impl.WhsRkServiceImpl;
/**
 * 未核实人口管理
 */
public class WhsRkManageAction extends CPSBaseAction {

	private static final long serialVersionUID = -910308699957500199L;
	
	private WhsRkBean whrk;
	private WhsRkPfBean whsrkpf;
	private WhsRkThBean whsrkth;
	private WhsRkFkBean whsrkfk;
	
	private List<WhsRkBean> rkList;
	
	private WhsRkQueryBean query;
	
	private WhsRkService service;
	public WhsRkManageAction(){
		super();
		whrk = new WhsRkBean();
		whsrkfk = new WhsRkFkBean();
		whsrkpf = new WhsRkPfBean();
		whsrkth = new WhsRkThBean();
		query = new WhsRkQueryBean();
		rkList = new ArrayList<WhsRkBean>();
		
		service = new WhsRkServiceImpl();
	}
	
	/**
	 * 跳转到位核实人口派发列表页面
	 */
	public String toWhsRkListPage(){
		initQueryBean(query);
		return "toWhsRkListPage";
	}
	
	/**
	 * 导出未核实人口
	 * @return
	 */
	public String expWhsRk(){
		rkList = service.queryWhsRkList(query);
		return "expWhsRk";
	}
	
	/**
	 * 未核实人口派发
	 */
	public void whsRkPf(){
		responseWrite(service.whsRkPf(whsrkpf));
	}
	
	/**
	 * 未核实人口退回
	 */
	public void whsRkTh(){
		responseWrite(service.whsRkTh(whsrkth));
	}
	
	/**
	 * 未核实人口反馈
	 */
	public void whsRkFk(){
		responseWrite(service.whsRkFk(whsrkfk));
	}
	
	/**
	 * 查询未核实人口列表
	 */
	public void queryWhsRkList(){
		responseWrite(service.queryWhsRkList(query, getPageInfo()));
	}

	public WhsRkBean getWhrk() {
		return whrk;
	}

	public void setWhrk(WhsRkBean whrk) {
		this.whrk = whrk;
	}

	public WhsRkPfBean getWhsrkpf() {
		return whsrkpf;
	}

	public void setWhsrkpf(WhsRkPfBean whsrkpf) {
		this.whsrkpf = whsrkpf;
	}

	public WhsRkThBean getWhsrkth() {
		return whsrkth;
	}

	public void setWhsrkth(WhsRkThBean whsrkth) {
		this.whsrkth = whsrkth;
	}

	public WhsRkFkBean getWhsrkfk() {
		return whsrkfk;
	}

	public void setWhsrkfk(WhsRkFkBean whsrkfk) {
		this.whsrkfk = whsrkfk;
	}

	public WhsRkQueryBean getQuery() {
		return query;
	}

	public void setQuery(WhsRkQueryBean query) {
		this.query = query;
	}

	public WhsRkService getService() {
		return service;
	}

	public void setService(WhsRkService service) {
		this.service = service;
	}

	public List<WhsRkBean> getRkList() {
		return rkList;
	}

	public void setRkList(List<WhsRkBean> rkList) {
		this.rkList = rkList;
	}
}
