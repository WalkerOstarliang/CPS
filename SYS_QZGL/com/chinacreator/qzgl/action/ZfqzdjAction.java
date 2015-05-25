package com.chinacreator.qzgl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.qzgl.bean.ZfqzdjBean;
import com.chinacreator.qzgl.query.ZfqzdjQueryBean;
import com.chinacreator.qzgl.services.ZfqzdjService;

/**
 * @author zhun.liu
 * 走访群众登记Action
 * 
 *
 */
public class ZfqzdjAction extends CPSBaseAction
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 7865160432801000113L;
	private ZfqzdjBean bean;               //走访群众登记Bean
	private ZfqzdjQueryBean queryBean;     //走访群众登记查询bean
	private String bh;                     //走访群众登记表的编号
	private ZfqzdjService service;         //服务层
	private ZfqzdjBean ZfqzInfo;
	private LoginInfo log;
	
	public LoginInfo getLog() {
		return log;
	}

	public void setLog(LoginInfo log) {
		this.log = log;
	}

	public ZfqzdjAction(){
		ZfqzInfo=new ZfqzdjBean();
		service=new ZfqzdjService();
	}
	
	public ZfqzdjBean getZfqzInfo() {
		return ZfqzInfo;
	}

	public void setZfqzInfo(ZfqzdjBean zfqzInfo) {
		ZfqzInfo = zfqzInfo;
	}

	public ZfqzdjBean getBean() {
		return bean;
	}
	public void setBean(ZfqzdjBean bean) {
		this.bean = bean;
	}
	public ZfqzdjQueryBean getQueryBean() {
		return queryBean;
	}
	public void setQueryBean(ZfqzdjQueryBean queryBean) {
		this.queryBean = queryBean;
	}
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public ZfqzdjService getService() {
		return service;
	}
	public void setService(ZfqzdjService service) {
		this.service = service;
	}
	//左边菜单栏跳转
	public String toZfqzdjPage(){
		if (queryBean == null)
		{
			queryBean = new ZfqzdjQueryBean();
		}
		 log = ActionContextHelper.getLoginInfo();
		return "toZfqzdjPage";
	}
	//走访单位登记列表查询
	public void queryZfqzdjListinfo() throws Exception{
		PageResultInfo<ZfqzdjBean> list = service.queryZfqzdjListInfo(queryBean, getPageInfo());
		responseWrite(list);
	}
	
	//走访群众登记新增/修改/详情/界面跳转
	public  String toZfqzdjxxInfoPage() throws Exception{
		 log = ActionContextHelper.getLoginInfo();
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			if(bean == null){
				bean = new ZfqzdjBean();
			}
			bean.setDjrxm(log.getRealname());
			bean.setDjdwdm(log.getOrgcode());
			bean.setDjdwmc(log.getOrgname());
			bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		}
		else{
			//通过编号得到走访单位登记信息
			bean = service.queryZfqzdjInfoByBh(bh);
		}
		
		return "toZfqzdjxxInfoPage";
	} 
	/**
	 * 保存走访群众登记信息
	 * @throws Exception
	 */
	public void insertZfqzdjInfo() throws Exception{
		service.insertZfdwdjInfo(bean);
	}
	/**
	 * 修改走访群众登记信息
	 * @throws Exception
	 */
	public void updateZfqzdjInfo() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			insertZfqzdjInfo();
		}else{
			service.updateZfqzdjInfo(bean);
		}
	}
	/**
	 * 删除走访群众登记信息
	 * @throws Exception
	 */
	public void deleteZfqzdjInfo() throws Exception{
		service.deleteZfdwdjInfo(bh);
		responseWrite(true);
	}
	
	/**
	 * 批量删除 走访单位登记信息
	 * @throws Exception
	 */
	public void batchDeleteZfqzdjInfo() throws Exception{
		List<String> bhList = new ArrayList<String>();
		String bhs=getZfqzInfo().getBh();
		if(bhs!=null){
			String [] bhArray=bhs.split(",");
			for (String bh : bhArray) {
				bhList.add(bh);
			}
		}
		String tip = "";
		if(service.batchDeleteZfqzdjInfo(bhList)){
			tip = "删除成功!";
		}else{
			tip = "删除失败!";
		}
		responseWrite(tip);
	}
	
}
