package com.chinacreator.common.bean;

import com.chinacreator.common.helper.ActionContextHelper;

public abstract class BaseValue implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5884453647063034526L;
	
	private String currentOrgCode;
	
	private String currentOrgName;
	
	private String currentUserName;
	
	private String currentRealName;
	
	private String currentUserSfzh;

	public String getCurrentOrgCode()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo != null)
		{
			currentOrgCode = loginInfo.getOrgcode();
		}
		return currentOrgCode;
	}

	public void setCurrentOrgCode(String currentOrgCode)
	{
		this.currentOrgCode = currentOrgCode;
	}

	public String getCurrentOrgName()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo != null)
		{
			currentOrgName = loginInfo.getOrgname();
		}
		return currentOrgName;
	}

	public void setCurrentOrgName(String currentOrgName)
	{
		this.currentOrgName = currentOrgName;
	}

	public String getCurrentUserName()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo != null)
		{
			currentUserName = loginInfo.getUsername();
		}
		return currentUserName;
	}

	public void setCurrentUserName(String currentUserName)
	{
		this.currentUserName = currentUserName;
	}

	public String getCurrentRealName()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo != null)
		{
			currentRealName = loginInfo.getRealname();
		}
		return currentRealName;
	}

	public void setCurrentRealName(String currentRealName)
	{
		this.currentRealName = currentRealName;
	}

	public String getCurrentUserSfzh()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo != null)
		{
			currentUserSfzh = loginInfo.getSfzh();
		}
		return currentUserSfzh;
	}

	public void setCurrentUserSfzh(String currentUserSfzh)
	{
		this.currentUserSfzh = currentUserSfzh;
	}
	
	
}
