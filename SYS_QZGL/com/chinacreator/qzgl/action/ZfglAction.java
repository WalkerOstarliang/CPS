package com.chinacreator.qzgl.action;
/**
 * @author zhun.liu
 */
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.qzgl.bean.ZfdwdjBean;
import com.chinacreator.qzgl.query.ZfdwdjQueryBean;
import com.chinacreator.qzgl.services.ZfdjService;

public class ZfglAction extends CPSBaseAction 
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 7896287848416364095L;
	private ZfdwdjBean bean;      //走访单位登记bean
	private LoginInfo log;
	private ZfdwdjQueryBean queryBean;  //走访单位登记--查询bean
	private String bh;                  //走访单位登记编号
	private ZfdjService zfdjService;
	private ZfdwdjBean ZfdwInfo;             //
	
	
	public ZfdwdjBean getZfdwInfo() {
		return ZfdwInfo;
	}
	public void setZfdwInfo(ZfdwdjBean zfdwInfo) {
		ZfdwInfo = zfdwInfo;
	}
	public LoginInfo getLog() {
		return log;
	}
	public void setLog(LoginInfo log) {
		this.log = log;
	}
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public ZfdwdjQueryBean getQueryBean() {
		return queryBean;
	}
	public void setQueryBean(ZfdwdjQueryBean queryBean) {
		this.queryBean = queryBean;
	}
	
	public ZfglAction(){
		if(zfdjService==null)
			ZfdwInfo=new ZfdwdjBean();
		zfdjService=new ZfdjService();
	}
	//走访管理左边导航栏中的跳转。
	public String toZfdwdjPage(){
		if (queryBean == null)
		{
			queryBean = new ZfdwdjQueryBean();
		}
		 log = ActionContextHelper.getLoginInfo();
		return "toSqJbxxPage";
	}
	
	//走访单位登记列表查询
	public void queryZfdwdjBeanList() throws Exception
	{
		PageResultInfo<ZfdwdjBean> list = zfdjService.queryZfdwdjxxList(queryBean, getPageInfo());
		responseWrite(list);
	}
	
	//走访单位登记新增/修改/详情/界面跳转
	public  String toZfdwdjxxInfoPage() throws Exception{
		 log = ActionContextHelper.getLoginInfo();
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			if(bean == null){
				bean = new ZfdwdjBean();
			}
			bean.setDjrxm(log.getRealname());
			bean.setDjdwdm(log.getOrgcode());
			bean.setDjdwmc(log.getOrgname());
			bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		}
		else{
			//通过编号得到走访单位登记信息
			bean = zfdjService.getZfdwdjInfoByBh(bh);
		}
		
		return "toZfdwdjxxInfoPage";
	}
	/**
	 * 保存走访单位登记信息
	 * @throws Exception 
	 */
	public void  savaZfdwdjInfo() throws Exception{
		zfdjService.insertZfdwdjInfo(bean);
		
	}
	/**
	 * 修改走访单位登记信息
	 * @throws Exception
	 */
	public void  updateZfdwdjInfo() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			savaZfdwdjInfo();
		}
		zfdjService.updateZfdwdjInfo(bean);	
	}
	
	
	/**
	 * 删除 走访单位登记信息
	 * @throws Exception
	 */
	public void deleteZfdwdjInfo() throws Exception {
		zfdjService.deleteZfdwdjInfo(bh);
		responseWrite(true);
	}
	
	/**
	 * 批量删除 走访单位登记信息
	 * @throws Exception
	 */
	public void batchDeleteZfdwdjInfo() throws Exception{
		List<String> bhList = new ArrayList<String>();
		String bhs=getZfdwInfo().getBh();
		if(bhs!=null){
			String [] bhArray=bhs.split(",");
			for (String bh : bhArray) {
				bhList.add(bh);
			}
		}
		String tip = "";
		if(zfdjService.batchDeleteZfdwdjInfo(bhList)){
			tip = "删除成功!";
		}else{
			tip = "删除失败!";
		}
		responseWrite(tip);
	}
	
	public ZfdwdjBean getBean() {
		return bean;
	}
	public void setBean(ZfdwdjBean bean) {
		this.bean = bean;
	}
	
}
