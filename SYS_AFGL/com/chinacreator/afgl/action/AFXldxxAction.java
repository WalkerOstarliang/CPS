package com.chinacreator.afgl.action;

import java.sql.SQLException;

import com.chinacreator.afgl.bean.AfXldRyxxBean;
import com.chinacreator.afgl.bean.AfXldxxBean;
import com.chinacreator.afgl.query.AfxldQueryBean;
import com.chinacreator.afgl.services.AFXldService;
import com.chinacreator.afgl.services.AfxfryService;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.OrgFjBean;

public class AFXldxxAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 5712909268505052294L;
	private AFXldService xldService;
	private AfxfryService xfryService;
	private AfxldQueryBean queryBean;
	
	private AfXldxxBean xldBean;
	
	private AfXldRyxxBean xldRyxxBean;
	
	private String xldbhs;
	
	private String xldrybhs;
	
	private String xldbh;
	private String sfzh;
	private String xfybh;
	
	public String getXfybh() {
		return xfybh;
	}

	public void setXfybh(String xfybh) {
		this.xfybh = xfybh;
	}

	public AFXldxxAction()
	{
		xldService = new AFXldService();
		xfryService = new AfxfryService();
		queryBean = new AfxldQueryBean();
	}
	
	public String toXldxxPage()
	{
		initQueryBean(queryBean);
		return "toXldxxPage"; 
	}
	 
	/**
	 * 巡防队员跳转方法
	 * @return
	 */
	public String toXfdyxxPage()
	{
		initQueryBean(queryBean);
		return "toXfdyxxPage"; 
	}
	
	public String toXldxxSelectPage()
	{
		initQueryBean(queryBean);
		return "toXldxxSelectPage";
	}
	
	/**
	 * 
	 */
	public String toXldyxxSelectPage(){
		initQueryBean(queryBean);
		return "toXldyxxSelectPage";
	}
	/**
	 * 调整至巡逻队员列表界面
	 * @return
	 */
	public String toXldrxxPage()
	{
		initQueryBean(queryBean);
		return "toXldrxxPage";
	}
	
	/**
	 * 跳转到高级查询窗口
	 * @return
	 */
	public String toXldxxGjQueryPage()
	{
		return "toXldxxGjQueryPage";
	}
	
	/**
	 * 跳转巡逻队员高级查询页面
	 * @return
	 */
	public String toXldryGjQueryPage()
	{
		return "toXldryGjQueryPage";
	}
	
	/**
	 * 调整info页面
	 * @return
	 */
	public String toXldInfoPage() throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			if (xldRyxxBean == null)
			{
				xldRyxxBean = new AfXldRyxxBean();
			}
			
			xldRyxxBean.setDjrxm(loginInfo.getRealname());
			xldRyxxBean.setDjrjh(loginInfo.getUsername());
			xldRyxxBean.setDjdwdm(loginInfo.getOrgcode());
			xldRyxxBean.setDjdwmc(loginInfo.getOrgname());
			xldRyxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
			xldBean = new AfXldxxBean();
			
			xldBean.setDjrxm(loginInfo.getRealname());
			xldBean.setDjrjh(loginInfo.getUsername());
			xldBean.setDjdwdm(loginInfo.getOrgcode());
			xldBean.setDjdwmc(loginInfo.getOrgname());
			xldBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			xldBean.setSsdwdm(loginInfo.getOrgcode());
			xldBean.setSsdwmc(loginInfo.getOrgname());
		}
		else
		{
			xldBean = xldService.queryAfxldxxBeanByXldbh(xldbh);
		}
		return "toXldInfoPage";
	}
	public String toXfryxxInfoPage() throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			if (xldRyxxBean == null)
			{
				xldRyxxBean = new AfXldRyxxBean();
			}
			
			xldRyxxBean.setDjrxm(loginInfo.getRealname());
			xldRyxxBean.setDjrjh(loginInfo.getUsername());
			xldRyxxBean.setDjdwdm(loginInfo.getOrgcode());
			xldRyxxBean.setDjdwmc(loginInfo.getOrgname());
			xldRyxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		else
		{
			xldRyxxBean = xfryService.queryAfxldxxBeanByXfrybh(xldRyxxBean.getXldybh());
		}
		return "toXfryxxInfoPage";
	}
	
	public String toXfryInfoPage() throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			if (xldRyxxBean == null)
			{
				xldRyxxBean = new AfXldRyxxBean();
			}
			xldRyxxBean.setDjrxm(loginInfo.getRealname());
			xldRyxxBean.setDjdwdm(loginInfo.getOrgcode());
			xldRyxxBean.setDjdwmc(loginInfo.getOrgname());
			xldRyxxBean.setZgzt("1");
			xldRyxxBean.setSgrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			xldRyxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		else
		{
			xldRyxxBean = xfryService.queryAfxldxxBeanByXfrybh(xldRyxxBean.getXldybh());
			xldRyxxBean.setGxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		return "toXfryInfoPage";
	}
	
	/**
	 * 跳转到巡逻队人员信息页面
	 * @return
	 * @throws Exception
	 */
	public String toXldryInfoPage() throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			
			//当巡逻队编号不为空的时候表示重巡逻队类别中点击添加队员
			if (ValidateHelper.isNotEmptyString(xldbh))
			{
				xldBean = xldService.queryAfxldxxBeanByXldbh(xldbh);
			}
			//人口登记时需要身份证验证
			xldRyxxBean = xldService.queryAfxldyxxBeanBySfzh(sfzh);
			if (xldRyxxBean == null)
			{
				xldRyxxBean = new AfXldRyxxBean();
				xldRyxxBean.setXldysfzh(sfzh);
				xldRyxxBean.setDjrjh(loginInfo.getUsername());
				xldRyxxBean.setDjrxm(loginInfo.getRealname());
				xldRyxxBean.setDjdwdm(loginInfo.getOrgcode());
				xldRyxxBean.setDjdwmc(loginInfo.getOrgname());
				xldRyxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				xldRyxxBean.setZgzt("1"); //在岗
			}else{
				if (ValidateHelper.isNotEmptyString(xldRyxxBean.getXldbh()))
				{
					xldBean = xldService.queryAfxldxxBeanByXldbh(xldRyxxBean.getXldbh());
				}
			}
		}
		else 
		{
			xldRyxxBean = xldService.queryAfxldyxxBeanByXldybh(xldRyxxBean.getXldybh());
			xldBean = xldService.queryAfxldxxBeanByXldbh(xldRyxxBean.getXldbh());
		}
		
		return "toXldryInfoPage";
	}
	
	/**
	 * 查询巡逻队信息
	 * @throws Exception
	 */
	public void queryXldxxList() throws Exception
	{
		PageResultInfo<AfXldxxBean> pageResult = xldService.queryAfxldxxListByQueryBean(getPageInfo(), queryBean);
		responseWrite(pageResult);
	}
	
	/**
	 * 通过巡逻队编号查询队员信息
	 * @throws Exception
	 */
	public void queryXldryListByXldbh() throws Exception
	{
		if(xldBean!=null)
		{
			xldbh = xldBean.getXldbh();
		}
		PageResultInfo<OrgFjBean> pageResult = null;
		if (ValidateHelper.isNotEmptyString(xldbh))
		{
			pageResult = xldService.queryXldryBeanListByXldbh(getPageInfo(),xldbh);
		}
		else
		{
			pageResult = new PageResultInfo<OrgFjBean>();
		}
		responseWrite(pageResult);
	}
	
	public void queryXldryByXldbh() throws Exception
	{
		PageResultInfo<OrgFjBean> pageResult = xldService.queryXldryBeanListByXldbh(getPageInfo(),xldBean.getXldbh());
		responseWrite(pageResult);
	}
	/**
	 * 通过巡防员编号查询巡防员信息
	 * @throws Exception 
	 */
	public void queryXfryListByrybh() throws Exception{
		if(xldRyxxBean!=null){
			xfybh = xldRyxxBean.getXldybh();
		}
		PageResultInfo<OrgFjBean> pageResult = xldService.queryXldryBeanListByXldbh(getPageInfo(),xfybh);
		responseWrite(pageResult);
	}
	/**
	 * 查询巡逻队员管理信息
	 * @throws Exception
	 */
	public void queryXldryxxList() throws Exception
	{
		PageResultInfo<AfXldRyxxBean> pageResult = xldService.queryAfxldRyxxBeanListByQueryBean(getPageInfo(), queryBean);
		responseWrite(pageResult);
	}
	/**
	 * 查询巡防队员信息  xiao long
	 * @throws SQLException
	 */
	public void queryXfdyxxList() throws SQLException{
		
		PageResultInfo<AfXldRyxxBean> pageResult = xldService.queryAfxfdyxxBeanByqueryBean(getPageInfo(), queryBean);
		responseWrite(pageResult);
	}
	/**
	 * 保存巡逻队信息
	 * @throws Exception
	 */
	public void saveXldxx() throws Exception
	{
		try
		{
			String xdlbh = xldService.saveXldxxBean(xldBean, operType);
			responseWrite(xdlbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite("");
		}
		
	}
	
	/**
	 * 保存巡逻队员信息
	 * @throws Exception
	 */
	public void saveXldyxx() throws Exception
	{
		//xldRyxxBean.setXldbh(xldbh);
		xldService.saveAfxldyxxBean(xldRyxxBean, operType);
	}
	/**
	 * 保存巡防人员信息
	 * @throws SQLException 
	 */
	public void saveXfryxx() {
		try {
			xldService.saveAfryxxBean(xldRyxxBean);
			responseWrite(true);
		} catch (SQLException e) {
			responseWrite(false);
			e.printStackTrace();
		}
		
	}
	/**
	 * 查询巡防人员通过身份证
	 * @throws SQLException 
	 */
	public void selectXfryxxBySfzh() throws SQLException{
		boolean isboolean= xldService.selectXfryxxBysfzh(xldRyxxBean);
		responseWrite(isboolean);
	}
	
	/**
	 * 删除巡防人员信息
	 * @throws SQLException 
	 */
	
	public void deleteXfryxxByrybh() throws SQLException{
		xfryService.deleteAfryxxByrybh(xldRyxxBean.getXldybh());
		responseWrite(true);
	}
	
	/**
	 * 注销序列对信息
	 * @throws Exception
	 */
	public void deleteXldxx() throws Exception
	{
		xldService.deleteXldxxBeansByXldbhs(xldbhs);
	}
	
	/**
	 * 批量删除巡逻队员信息
	 * @throws Exception
	 */
	public void deleteXldyxx() throws Exception
	{
		xldService.batchDeleteXldryxx(xldrybhs);
	}
	
	public AfxldQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(AfxldQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public AfXldxxBean getXldBean() {
		return xldBean;
	}

	public void setXldBean(AfXldxxBean xldBean) {
		this.xldBean = xldBean;
	}

	public String getXldbhs() {
		return xldbhs;
	}

	public void setXldbhs(String xldbhs) {
		this.xldbhs = xldbhs;
	}

	public AfXldRyxxBean getXldRyxxBean() {
		return xldRyxxBean;
	}

	public void setXldRyxxBean(AfXldRyxxBean xldRyxxBean) {
		this.xldRyxxBean = xldRyxxBean;
	}

	public String getXldbh() {
		return xldbh;
	}

	public void setXldbh(String xldbh) {
		this.xldbh = xldbh;
	}

	public String getXldrybhs() {
		return xldrybhs;
	}

	public void setXldrybhs(String xldrybhs) {
		this.xldrybhs = xldrybhs;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	
	
}
