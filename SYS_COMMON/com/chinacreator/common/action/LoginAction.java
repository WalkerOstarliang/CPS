package com.chinacreator.common.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PtglMenuBean;
import com.chinacreator.common.business.Logininfobusiness;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.EncodePasswordHepler;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.cs.bean.MenuFunctionBean;
import com.chinacreator.cs.business.MenuQueryBusiness;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction extends BaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2849331222056888960L;
	
	private List<MenuFunctionBean> menubeans;
	
	Map<PtglMenuBean,List<PtglMenuBean>> menuBeansMap;
	
	private Logininfobusiness business;
	
	private String username;
	
	private String sfzh;
	
	private String password;
	
	private String newPassword;
	
	private String modename;
	
	private String menuid;
	private String callback;
	private String showindex = "1";

	public LoginAction()
	{
		super();
		business = new Logininfobusiness();
	}
	
	
	/**
	 * 系统登录
	 * @return
	 */
	public String login() throws Exception
	{
		if (ValidateHelper.isNotEmptyString(modename))
		{
			
			Logininfobusiness business = new Logininfobusiness();
			LoginInfo logininfo = null;
			if (ValidateHelper.isNotEmptyString(username))
			{
				logininfo = business.getLoginUserInfoByUserName(username);
			}
			else if (ValidateHelper.isNotEmptyString(sfzh))
			{
				logininfo = business.getLoginUserInfoBySfzh(sfzh);
			}
			if(logininfo != null)
			{
				ActionContext.getContext().getSession().put(CommonConstant.LOGIN_INFO, logininfo);
				request.getSession().setAttribute(CommonConstant.LOGIN_INFO,logininfo);
				return modename;
		 	}
			else
			{
				return "loginfailure";
			}
			
		}
		else
		{
			return "notfound";
		}
	}
	
	/**
	 * 登录
	 * @date 2013-9-3 下午05:29:16
	 */
	public void cpsLogin()
	{
		Logininfobusiness business = new Logininfobusiness();
		LoginInfo loginInfo = business.getLoginUserInfoByUserName(username, password);
		if (loginInfo != null)
		{
			ActionContext.getContext().getSession().put(CommonConstant.LOGIN_INFO, loginInfo);
			request.getSession().setAttribute(CommonConstant.LOGIN_INFO,loginInfo);
		}
		responseWrite(loginInfo);
	}
	
	public String toUpdatePasswordPage()
	{
		return "toUpdatePasswordPage";
	}
	
	public void updateUserPassword()
	{
		try
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String oldPassword = EncodePasswordHepler.decodePassword(loginInfo.getPassword());
			Logininfobusiness business = new Logininfobusiness();
			if (oldPassword.equals(password))
			{
				//更新密码
				business.updateUserPassword(loginInfo.getUserid(), newPassword);
				loginInfo.setPassword(EncodePasswordHepler.getEncodePassword(newPassword));
				//成功代码 0
				responseWrite("0");
			}
			else
			{
				responseWrite("1");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite("2");
		}
	}
	
	public String index()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		menubeans = MenuQueryBusiness.queryMenuFunctionBeanByMenuid(CommonConstant.ST_SQJW_ROOT_MENU_ID,loginInfo.getUserid(),false);
		if (ValidateHelper.isNotEmptyCollection(menubeans))
		{
			return "autoIndex";
		}
		else
		{
			return "index";
		}
	}
	
	public String toContentPage()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		menubeans = MenuQueryBusiness.queryMenuFunctionBeanByMenuid(menuid,loginInfo.getUserid(),true);
		return "toContentPage";
	}
	
	public String leftIndex()
	{
		menuBeansMap = business.queryMenuBeans(menuid);
		return "leftIndex";
	}
	
	public String topIndex()
	{
		return "topIndex";
	}
	
	public String mainIndex()
	{
		return "mainIndex";
	}
	
	/**
	 * 退出登录
	 */
	public void logout()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (session != null)
		{
			session.removeAttribute(CommonConstant.LOGIN_INFO);
			System.out.println("(" + loginInfo.getUsername() + ":" + loginInfo.getRealname()+")用户退出登录.");
			session.invalidate();
		}
	}
	
	public void jsonpLogout()
	{
		try
		{
			HttpSession session = ServletActionContext.getRequest().getSession();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			if (session != null)
			{
				session.removeAttribute(CommonConstant.LOGIN_INFO);
				System.out.println("(" + loginInfo.getUsername() + ":" + loginInfo.getRealname()+")用户退出登录.");
				session.invalidate();
			}
			String result = callback + "({'result':'" + true + "'})";
			response.setContentType("text/javascript");
			response.getWriter().print(result);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getModename() {
		return modename;
	}

	public void setModename(String modename) {
		this.modename = modename;
	}


	public String getMenuid()
	{
		return menuid;
	}


	public void setMenuid(String menuid)
	{
		this.menuid = menuid;
	}


	public Map<PtglMenuBean, List<PtglMenuBean>> getMenuBeansMap()
	{
		return menuBeansMap;
	}


	public void setMenuBeansMap(Map<PtglMenuBean, List<PtglMenuBean>> menuBeansMap)
	{
		this.menuBeansMap = menuBeansMap;
	}


	public String getCallback()
	{
		return callback;
	}


	public void setCallback(String callback)
	{
		this.callback = callback;
	}


	public String getNewPassword()
	{
		return newPassword;
	}


	public void setNewPassword(String newPassword)
	{
		this.newPassword = newPassword;
	}


	public List<MenuFunctionBean> getMenubeans()
	{
		return menubeans;
	}


	public void setMenubeans(List<MenuFunctionBean> menubeans)
	{
		this.menubeans = menubeans;
	}


	public String getShowindex()
	{
		return showindex;
	}

	public void setShowindex(String showindex)
	{
		this.showindex = showindex;
	}
	
}
