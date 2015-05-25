package com.chinacreator.qzgl.action;
/**
 * @author zhun.liu
 * 走访单位调查
 */
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.qzgl.bean.ZfdwdjBean;
import com.chinacreator.qzgl.query.ZfdwdjQueryBean;
import com.chinacreator.qzgl.services.ZfdjService;

public class ZfdwdcAction  extends CPSBaseAction
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 5761279041000864115L;
	private ZfdwdjQueryBean queryBean;  //走访单位登记--查询bean
	private  LoginInfo log;
	private  String bh;
	private  ZfdwdjBean bean;
	private  ZfdjService service;
	
	public ZfdwdjQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(ZfdwdjQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public ZfdjService getService() {
		return service;
	}

	public void setService(ZfdjService service) {
		this.service = service;
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

	public ZfdwdjBean getBean() {
		return bean;
	}

	public void setBean(ZfdwdjBean bean) {
		this.bean = bean;
	}
	/**
	 * 跳转
	 * @return
	 */
	public String toZfdwdcListPage(){
		if (queryBean == null)
		{
			queryBean = new ZfdwdjQueryBean();
		}
		 log = ActionContextHelper.getLoginInfo();
		return "toZfdwdcListPage";
	}
	/**
	 * 构造
	 */
	public ZfdwdcAction(){
		service=new ZfdjService();
	}
	/**
	 * 获得 登陆用户的基本信息，跳转到 走访单位调查界面。
	 * @return
	 * @throws Exception
	 */
	public  String toZfdwdcxxInfoPage() throws Exception{
		log = ActionContextHelper.getLoginInfo();	
		bean = service.getZfdwdjInfoByBh(bh);
		bean.setDcrxm(log.getRealname());
		bean.setDcrdwdm(log.getOrgcode());
		bean.setDcrdwmc(log.getOrgname());
		bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toZfdwdcxxInfoPage";
	}
	/**
	 * 修改走访单位登记信息   修改调查状态
	 * @throws Exception
	 */
	public void  updateZfdwdcInfo() throws Exception{
		service.updateZfdwdcInfo(bean);	
	}
}
