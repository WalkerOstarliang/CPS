package com.chinacreator.xtgl.action;

import java.util.Date;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.xtgl.bean.FwjcpzBean;
import com.chinacreator.xtgl.query.FwjcpzQueryBean;
import com.chinacreator.xtgl.service.FwjcpzService;

public class FwjcpzAction extends CPSBaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FwjcpzBean fwjcpzBean;
	private FwjcpzQueryBean queryBean;
	private FwjcpzService service;
	
	private String operType;
	
	public FwjcpzAction(){
		fwjcpzBean=new FwjcpzBean();
		queryBean=new FwjcpzQueryBean();
		service=new FwjcpzService();
	}
	
	/**
	 * 跳转得到房屋检查配置列表
	 * @return
	 */
	public String toFwjcpzList(){
		return "toFwjcpzList";
	}
	
	/**
	 * 跳转到 新增 、修改 、详情等界面
	 * @return
	 * @throws Exception 
	 */
	public String toFwjcpzInfo() throws Exception{
		LoginInfo loginInfo=ActionContextHelper.getLoginInfo();
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			if(ValidateHelper.isEmptyString(fwjcpzBean.getDjrxm())){
				fwjcpzBean.setDjrxm(loginInfo.getRealname());
			}
			if(ValidateHelper.isEmptyString(fwjcpzBean.getDjdwdm())){
				fwjcpzBean.setDjdwdm(loginInfo.getOrgcode());
			}
			if(ValidateHelper.isEmptyString(fwjcpzBean.getDjdwmc())){
				fwjcpzBean.setDjdwmc(loginInfo.getOrgname());
			}
			if(ValidateHelper.isEmptyString(fwjcpzBean.getDjrq())){
				fwjcpzBean.setDjrq(DateTimeHelper.conver(new Date(), "yyyy-MM-dd HH:mm:ss"));
			}
		}else{
			fwjcpzBean=service.queryFwjcpzBeanById(fwjcpzBean.getId());
		}
		return "toFwjcpzInfo";
	}
	
	/**
	 * 分页列表查询
	 */
	public  void  queryFwjcpzListPageInfo(){
		try {
			PageResultInfo<FwjcpzBean> list = service.queryFwjcpzBeanPageInfo(queryBean, getPageInfo());
			responseWrite(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存
	 */
	public void saveFwjcpzBean(){
		try {
			if(ValidateHelper.isEmptyString(fwjcpzBean.getId())){
				service.insertFwjcpzBean(fwjcpzBean);
			}else{
				service.updateFwjcpzBean(fwjcpzBean);
			}
			responseWrite(true);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}

	
	/**
	 * 批量查询
	 * @return
	 */
	public void batchDelFwjcpzBean(){
		try {
			service.batchDelFwjcpzBean(fwjcpzBean.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void isExistPzdm() throws Exception{
		boolean flag=service.isExistPzdm(fwjcpzBean.getFwzdlb());
		responseWrite(flag);
	}
	public FwjcpzBean getFwjcpzBean() {
		return fwjcpzBean;
	}

	public void setFwjcpzBean(FwjcpzBean fwjcpzBean) {
		this.fwjcpzBean = fwjcpzBean;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public FwjcpzQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(FwjcpzQueryBean queryBean) {
		this.queryBean = queryBean;
	}
	
	
}
