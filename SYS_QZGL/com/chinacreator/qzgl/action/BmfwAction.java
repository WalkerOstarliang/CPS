package com.chinacreator.qzgl.action;

import java.sql.SQLException;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.qzgl.bean.BmfwxxBean;
import com.chinacreator.qzgl.query.BmfwQueryBean;
import com.chinacreator.qzgl.services.BmfwService;

public class BmfwAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -941467534505065901L;
	private BmfwxxBean bmfwxxBean;
	private BmfwService service;
	private BmfwQueryBean queryBean;
	private String operType;
	private String bh;
	private String bhs;
	
	public BmfwAction(){
		super();
		service = new BmfwService();
		queryBean = new BmfwQueryBean();
		bmfwxxBean = new BmfwxxBean();
	}

	public String toBmfwList(){
		initQueryBean(queryBean);
		 return "toBmfwList";
	}
	public void queryList() throws SQLException{
		PageResultInfo<BmfwxxBean> list = service.getBmfwxx(queryBean,getPageInfo());
		responseWrite(list);
	}
	
	public String toAddBmfw() throws SQLException{
		LoginInfo log = ActionContextHelper.getLoginInfo();
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			bmfwxxBean.setDjrjh(log.getUsername());
			bmfwxxBean.setDjrxm(log.getRealname());
			bmfwxxBean.setDjdwdm(log.getOrgcode());
			bmfwxxBean.setDjdwmc(log.getOrgname());
			bmfwxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd hh:mm:ss"));
		}
		else {
			bmfwxxBean = service.getBmfwByBh(bh);
		}
		return "toAddBmfw";
	}
	
	public void updateBmfw() throws SQLException{
		service.updateBmfw(bmfwxxBean,operType);
		responseWrite(true);
	}
	
	public void deleteBmfw() throws SQLException{
		service.deleteBmfw(bh);
		responseWrite(true);
	}
	
	public void deleteBmfwxx() throws SQLException{
		service.deleteBmfwxx(bhs);
		responseWrite(true);
		
	}
	public BmfwxxBean getBmfwxxBean() {
		return bmfwxxBean;
	}

	public void setBmfwxxBean(BmfwxxBean bmfwxxBean) {
		this.bmfwxxBean = bmfwxxBean;
	}

	public BmfwQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(BmfwQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getBhs() {
		return bhs;
	}

	public void setBhs(String bhs) {
		this.bhs = bhs;
	}
	

}
