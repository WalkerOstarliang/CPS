package com.chinacreator.gzgl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.AfXldxxBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.XunldJLBean;
import com.chinacreator.gzgl.service.XunldJLService;

public class XunldJLAction extends CPSBaseAction{

	private static final long serialVersionUID = -4214798886381760498L;
	
	private XunldJLBean bean;
	private String now;
	private XunldJLService service;
	private List<AfXldxxBean> xldList;
	
	public XunldJLAction(){
		super();
		bean = new XunldJLBean();
		now = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
		service = new XunldJLService();
		xldList = new ArrayList<AfXldxxBean>();
	}

	/**
	 * 跳转到列表页面
	 * @return
	 */
	public String toListPage(){
		//xldList = service.queryXldsByOrgCode(bean.getOrgCode());
		initQueryBean(bean);
		return "toListPage";
	}
	
	/**
	 * 跳转到视图模式（新增、修改、详情）
	 * @return
	 */
	public String toView(){
		if(ValidateHelper.isEmptyString(bean.getOp())){
			return null;
		}else{
			xldList = service.queryXldsByOrgCode(bean.getOrgCode());
			 //新增
			if(CommonConstant.OPERTYPE_ADD.equals(bean.getOp())){     
				bean.setOp(bean.getOp());
			//修改和删除
			}else if(CommonConstant.OPERTYPE_UPDATE.equals(bean.getOp()) ||
						CommonConstant.OPERTYPE_DETAIL.equals(bean.getOp())){
				String op = bean.getOp();
				bean = service.queryXunldJLByPK(bean);
				bean.setOp(op);
			}else{
				return null;
			}
		}
		return "toView";
	}
	
	/**
	 * 保存巡逻队奖励
	 */
	public void save(){
		String tip = "";
		try {
			if(service.save(bean)){
				tip = "操作成功!";
			}else{
				tip = "操作失败!";
			}
		} catch (Exception e) {
			tip = e.getMessage();
		}
		responseWrite(tip);
	}
	
	/**
	 * 批量删除巡逻队奖励
	 */
	public void batchDel(){
		String tip = "";
		if(service.batchDelXunldJL(bean.getBh())){
			tip = "操作成功!";
		}else{
			tip = "操作失败!";
		}
		responseWrite(tip);
	}
	
	/**
	 * 分页查询巡逻队奖励
	 */
	public void queryXunldJL(){
		responseWrite(service.queryXunldJL(bean, getPageInfo()));
	}
	
	public XunldJLBean getBean() {
		return bean;
	}

	public void setBean(XunldJLBean bean) {
		this.bean = bean;
	}

	public String getNow() {
		return now;
	}

	public List<AfXldxxBean> getXldList() {
		return xldList;
	}
}
