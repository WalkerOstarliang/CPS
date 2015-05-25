package com.chinacreator.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinacreator.cas.interceptor.AbstractCasUserInterceptor;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.business.Logininfobusiness;

public class CheckLoginInterceptor extends AbstractCasUserInterceptor {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -950025376057418035L;
	 
	@Override
	public void afterInterceptor(Object userObject)
	{
	}


	public Object getUserObjectBySfzh(HttpServletRequest request,
			HttpServletResponse response, String sfzh)
	{
		Logininfobusiness business = new Logininfobusiness();
		return business.getLoginUserInfoBySfzh(sfzh);
	}


	public Object getUserObjectByUserName(HttpServletRequest request,
			HttpServletResponse response, String username)
	{
		Logininfobusiness business = new Logininfobusiness();
		return business.getLoginUserInfoByUserName(username);
	}

	/**
	 * 判断是否相同对象
	 */
	public boolean equals(Object userObject, String username, String sfzh)
	{
		LoginInfo loginInfo = (LoginInfo)userObject;
		return loginInfo.getSfzh().equals(sfzh) && loginInfo.getUsername().equals(username);
	}

}
