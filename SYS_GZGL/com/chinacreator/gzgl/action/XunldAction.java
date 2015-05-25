package com.chinacreator.gzgl.action;
/**
 * 巡逻队任务管理Action
 */

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.AfXldRyxxBean;
import com.chinacreator.afgl.bean.AfXldxxBean;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.gzgl.bean.XunldBean;
import com.chinacreator.gzgl.query.XunldRwQueryBean;
import com.chinacreator.gzgl.service.XunldService;

public class XunldAction extends CPSBaseAction{

	private static final long serialVersionUID = -8150041075665257361L;
	
	private String now = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
	
	private XunldBean bean;
	private List<AfXldxxBean> xldList;
	private XunldService service;
	private XunldRwQueryBean queryBean;
	private List<AfXldRyxxBean> xldy;
	
	
	public XunldAction(){
		super();
		bean = new XunldBean();
		service = new XunldService();
		xldList = new ArrayList<AfXldxxBean>();
		queryBean = new XunldRwQueryBean();
		xldy = new ArrayList<AfXldRyxxBean>();
	}
	
	/**
	 * 保存巡逻队任务
	 */
	public void saveXunldRW(){
		String tip = "";
		try{
			if(service.saveXunldRW(bean)){
				tip = "操作成功!";
			}else{
				tip = "操作失败!";
			}
		}catch (NullPointerException e) {
			tip = e.getMessage();
		}
		responseWrite(tip);
	}
	
	/**
	 * 批量删除巡逻队任务
	 */
	public void batchDelXunldRW(){
		String tip = "";
		if(service.batchDelXunldRW(bean.getBh())){
			tip = "操作成功!";
		}else{
			tip = "操作失败!";
		}
		responseWrite(tip);
	}
	
	/**
	 * 分页查询巡逻队任务
	 */
	public void queryListXunldRW(){
		PageResultInfo<XunldBean> result = service.queryXunldRWForList(getPageInfo(), queryBean);
		responseWrite(result);
	}
	/**
	 * 查找巡逻队
	 */
	public String toXldxxSelectPage(){
		initQueryBean(queryBean);
		return "toXldxxSelectPage";
	}
	/**
	 * 跳转到列表页面
	 * @return
	 */
	public String toListPage(){
		xldList = service.queryXldsByOrgCode(queryBean.getOrgCode());
		initQueryBean(queryBean);
		return "toListPage";
	}
	
	/**
	 * 跳转到视图（新增、修改、详情）
	 * @return
	 */
	public String toView(){
		xldList = service.queryXldsByOrgCode(queryBean.getOrgCode());
		if(CommonConstant.OPERTYPE_ADD.equals(queryBean.getOp())){
			bean.setOp(CommonConstant.OPERTYPE_ADD);
		}else if(CommonConstant.OPERTYPE_UPDATE.equals(queryBean.getOp())){
			bean = service.queryXunldRWByPK(queryBean);
			bean.setOp(CommonConstant.OPERTYPE_UPDATE);
		}else if(CommonConstant.OPERTYPE_DETAIL.equals(queryBean.getOp())){
			bean = service.queryXunldRWByPK(queryBean);
			bean.setOp(CommonConstant.OPERTYPE_DETAIL);
		}
		return "toView";
	}
	
	/**
	 * 根据巡逻队编号查询巡逻队员
	 */
	public void queryXldyByBh(){
		String xldbh = request.getParameter("xldbh");
		xldy = service.queryXldyByBh(xldbh);
		responseWrite(xldy);
	}
	
	/**
	 * 查询巡逻队
	 * @return
	 * @throws Exception 
	 */
	public void queryXldxxList() throws Exception{
		System.out.println(queryBean.getXldlx());
		PageResultInfo<AfXldxxBean> pageResult = service.queryAfxldxxListByQueryBean(getPageInfo(), queryBean);
		responseWrite(pageResult);
	}
	public XunldBean getBean() {
		return bean;
	}

	public void setBean(XunldBean bean) {
		this.bean = bean;
	}

	public List<AfXldxxBean> getXldList() {
		return xldList;
	}

	public XunldRwQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(XunldRwQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public List<AfXldRyxxBean> getXldy() {
		return xldy;
	}

	public String getNow() {
		return now;
	}
}
