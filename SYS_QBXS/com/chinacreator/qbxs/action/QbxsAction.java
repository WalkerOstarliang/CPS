package com.chinacreator.qbxs.action;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.qbxs.bean.QbxsGgxxBean;
import com.chinacreator.qbxs.bean.QbxsSjxxBean;
import com.chinacreator.qbxs.query.QbxsQueryBean;
import com.chinacreator.qbxs.services.QbxsService;

public class QbxsAction extends CPSBaseAction{
	private static final long serialVersionUID = 5288665383143770044L;
	private QbxsSjxxBean qbxs;
	private QbxsQueryBean queryBean;
	private QbxsGgxxBean ggxxBean;
	private QbxsService service;
	
	private LoginInfo loginInfo;
	
	public QbxsAction(){
		super();
		qbxs = new QbxsSjxxBean();
		ggxxBean = new QbxsGgxxBean();
		queryBean =  new QbxsQueryBean();
		service = new QbxsService();
		loginInfo = ActionContextHelper.getLoginInfo();
	}
	
	/**
	 * 跳转到情报线索信息
	 * @return
	 */
	public String toQbxsxx(){
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			qbxs.setTbr(loginInfo.getRealname());
			qbxs.setTbdw(loginInfo.getOrgname());
			qbxs.setTbdwjgdm(loginInfo.getOrgcode());
			qbxs.setBssj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
			qbxs.setCjdw(loginInfo.getOrgname());
			qbxs.setCjdwjgdm(loginInfo.getOrgcode());
			qbxs.setCjr(loginInfo.getRealname());
			qbxs.setCjrid(loginInfo.getUserid());
			qbxs.setCjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			qbxs.setSasfsdsxq(loginInfo.getOrgcode().substring(0,6));
			qbxs.setSasfsdsxqmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(loginInfo.getOrgcode().substring(0,6) + "000000"));
			if(ValidateHelper.isEmptyString(qbxs.getBgcx())){
				qbxs.setBgcx("0");
			}
		}else{
			try {
				qbxs = service.querySjxxBeanById(qbxs.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "toQbxsxx";
	}
	
	/**
	 * 跳转到情报线索骨干信息
	 * @throws Exception 
	 */
	public String toQbxxGgxxPage() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			
		}else{
			ggxxBean = service.queryGgxxBeanById(ggxxBean.getId());
		}
		return "toQbxxGgxxPage";
	}
	
	
	/**
	 * 
	 * 保存情报线索信息
	 */
	public void saveQbxsxx(){
		responseWrite(service.saveQbxs(qbxs));
	}
	
	/**
	 * 保存情报线索骨干信息
	 */
	public void saveQbxsGgxxBean(){
		try {
			service.saveQbxsGgxx(ggxxBean);
			responseWrite(true);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除情报线索骨干信息
	 * 
	 * 
	 */
	public void deleteQbxsGgxxBean(){
		try {
			service.deleteQbxsGgxx(ggxxBean.getId());
			responseWrite(true);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	/**
	 * 跳转到情报线索列表
	 * @return
	 */
	public String toQbxsSjxxListPage(){
		super.initQueryBean(queryBean);
		return "toQbxsSjxxListPage";
	}
	
	/**
	 * 查询情报线索listbean
	 * @throws Exception 
	 */
	public void queryQbxxSjxxListPage() throws Exception{
		PageResultInfo<QbxsSjxxBean> list = service.queryQbxsSjxxPageInfo(queryBean, getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 查询情报线索骨干信息
	 */
	public void queryQbxxGgxxListPage() throws Exception{
		PageResultInfo<QbxsGgxxBean> list = service.queryQbxsGgxxPageInfo(queryBean, getPageInfo());
		responseWrite(list);
	}
	
	
	
	
	/** getter  setter */
	public QbxsQueryBean getQueryBean() {
		return queryBean;
	}
	
	public void setQueryBean(QbxsQueryBean queryBean) {
		this.queryBean = queryBean;
	}
	
	public QbxsGgxxBean getGgxxBean() {
		return ggxxBean;
	}
	
	public void setGgxxBean(QbxsGgxxBean ggxxBean) {
		this.ggxxBean = ggxxBean;
	}
	
	public QbxsSjxxBean getQbxs() {
		return qbxs;
	}

	public void setQbxs(QbxsSjxxBean qbxs) {
		this.qbxs = qbxs;
	}
}
