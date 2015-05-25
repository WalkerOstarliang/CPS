package com.chinacreator.cas.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CasUserQueryIntf
{
	/**
	 * 通过身份证号查询用户对象
	 * @param sfzh
	 * @return
	 * @date 2013-10-10 上午09:46:34
	 */
	public abstract Object getUserObjectBySfzh(HttpServletRequest request, HttpServletResponse response,String sfzh);
	
	/**
	 * 通过用户名查询用户对象
	 * @param username
	 * @return
	 * @date 2013-10-10 上午09:47:22
	 */
	public abstract Object getUserObjectByUserName(HttpServletRequest request, HttpServletResponse response,String username);
	
	/**
	 * 比较用户对象的用户名与身份证是否相等
	 * 如：userObject.getSfzh().equals(sfzh) && userObject.getUsername().equals(username)
	 * @param userObject
	 * @param username
	 * @param sfzh
	 * @return
	 * @date 2014-1-13 下午03:12:15
	 */
	public abstract boolean equals(Object userObject,String username, String sfzh);
}
