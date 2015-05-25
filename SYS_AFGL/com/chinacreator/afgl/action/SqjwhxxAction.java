package com.chinacreator.afgl.action;

import com.chinacreator.afgl.bean.SqjwhxxBean;
import com.chinacreator.afgl.query.SqjwhxxQueryBean;
import com.chinacreator.afgl.services.SqjwhxxService;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;

/**
 * 社区居委会管理
 * @author mingchun.xiong
 *
 */
public class SqjwhxxAction extends CPSBaseAction
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 1043657391311798878L;
	
	private SqjwhxxService service;
	
	private SqjwhxxBean bean;
	
	private SqjwhxxQueryBean queryBean;
	
	private String jwhbh;
	
	private String jwhbhs;
	
	public SqjwhxxAction()
	{
		super();
		service = new SqjwhxxService();
	}

	/**
	 * 社区居委会列表页面
	 * @return
	 */
	public String toSqJwhListPage()
	{
		if (queryBean == null)
		{
			queryBean = new SqjwhxxQueryBean();
		}
		return "toSqJwhListPage";
	}
	
	/**
	 * 选择社区居委会列表页面
	 * @return
	 * 2013-03-18
	 */
	public String toSelectJwhxx()
	{
		if (queryBean == null)
		{
			queryBean = new SqjwhxxQueryBean();
		}
		return "toSelectJwhxx";
	}
	
	public String toSqJwhInfoPage() throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			if (bean == null)
			{
				bean = new SqjwhxxBean();
			}
			bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			bean.setDjdwdm(loginInfo.getOrgcode());
			bean.setDjdwmc(loginInfo.getOrgname());
			bean.setDjrjh(loginInfo.getUsername());
			bean.setDjrxm(loginInfo.getRealname());
		}
		else if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			bean = service.querySqjwhBeanByJwhbh(jwhbh);
		}
		else if (CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			bean = service.querySqjwhBeanByJwhbh(jwhbh);
		}
		return "toSqJwhInfoPage";
	}
	
	/**
	 * 查询居委会列表
	 * @throws Exception
	 */
	public void queryJwhPageResultList() throws Exception
	{
		PageResultInfo<SqjwhxxBean> pageResult = service.querySqJwhPageResultInfoByQueryBean(queryBean, getPageInfo());
		responseWrite(pageResult);
	}
	
	/**
	 * 保存居委会信息
	 * @throws Exception
	 */
	public void saveJwhxxBean() throws Exception
	{
		SqjwhxxBean sqjwhxxBean = service.saveJwhBean(bean, operType);
		responseWrite(sqjwhxxBean);
	}
	
	/**
	 * 删除居委会信息
	 * @throws Exception
	 */
	public void deleteJwhxxBean() throws Exception
	{
		service.batchDeleteJwhBeanByJwhbhs(jwhbhs);
		responseWrite(true);
	}
	
	public SqjwhxxBean getBean() {
		return bean;
	}

	public void setBean(SqjwhxxBean bean) {
		this.bean = bean;
	}

	public SqjwhxxQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(SqjwhxxQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public SqjwhxxService getService() {
		return service;
	}

	public void setService(SqjwhxxService service) {
		this.service = service;
	}

	public String getJwhbh() {
		return jwhbh;
	}

	public void setJwhbh(String jwhbh) {
		this.jwhbh = jwhbh;
	}

	public String getJwhbhs() {
		return jwhbhs;
	}

	public void setJwhbhs(String jwhbhs) {
		this.jwhbhs = jwhbhs;
	}
	
	
}
