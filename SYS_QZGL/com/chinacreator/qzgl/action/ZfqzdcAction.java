package com.chinacreator.qzgl.action;
/**
 * @author zhun.liu
 * 走访群众调查
 */
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.qzgl.bean.ZfqzdjBean;
import com.chinacreator.qzgl.query.ZfqzdjQueryBean;
import com.chinacreator.qzgl.services.ZfqzdjService;

public class ZfqzdcAction extends CPSBaseAction
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 4817692455641243622L;
	private  LoginInfo log;  //登陆信息
	private  String bh;       //编号
	private  ZfqzdjBean bean;     
	private  ZfqzdjService service;
	private ZfqzdjQueryBean queryBean;     //走访群众登记查询bean
	
	public ZfqzdjQueryBean getQueryBean() {
		return queryBean;
	}
	public void setQueryBean(ZfqzdjQueryBean queryBean) {
		this.queryBean = queryBean;
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
	public ZfqzdjBean getBean() {
		return bean;
	}
	public void setBean(ZfqzdjBean bean) {
		this.bean = bean;
	}
	public  ZfqzdcAction(){
		service=new ZfqzdjService();
	}
	//左边菜单栏 跳转
	public String toZfqzdcListPage(){
		if (queryBean == null)
		{
			queryBean = new ZfqzdjQueryBean();
		}
		 log = ActionContextHelper.getLoginInfo();
		return "toZfqzdcListPage";
	}
	/**
	 * 获得登陆用户信息，跳转到走访群众调查界面
	 * @return
	 * @throws Exception
	 */
	
	public  String toZfqzdcxxInfoPage() throws Exception{
		
		log = ActionContextHelper.getLoginInfo();	
		bean = service.queryZfqzdjInfoByBh(bh);
		bean.setDcrxm(log.getRealname());
		bean.setDcrdwdm(log.getOrgcode());
		bean.setDcrdwmc(log.getOrgname());
		bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		
		return "toZfqzdcxxInfoPage";
	}
	
	/**
	 * 修改走访群众登记信息   修改调查状态
	 * @throws Exception
	 */
	public void  updateZfqzdcInfo() throws Exception{
		service.updateZfqzdcInfo(bean);	
	}
}
