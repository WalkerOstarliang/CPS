package com.chinacreator.cs.business;

import java.util.List;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.cs.bean.MenuFunctionBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;

public class MenuQueryBusiness
{
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/cs/business/menu-query.xml");
	
	/**
	 * 
	 * @param menuid 父类菜单ID
	 * @param userid 用户ID
	 * @param isrecur 是否递归查找用户菜单 true ：递归查找 ，false 不递归查找
	 * @return
	 * @date May 21, 2015 3:27:06 PM
	 */
	public static List<MenuFunctionBean> queryMenuFunctionBeanByMenuid(String menuid,String userid, boolean isrecur)
	{
		List<MenuFunctionBean> menubeans = null;
		try
		{
			menubeans = executor.queryListWithDBName(MenuFunctionBean.class, CommonConstant.DBNAME_SQJW, "queryMenuFunctionBeanByMenuid", menuid,userid);
			if (ValidateHelper.isNotEmptyCollection(menubeans))
			{
				for (MenuFunctionBean functionBean : menubeans)
				{
					List<MenuFunctionBean> twomenubeans = executor.queryListWithDBName(MenuFunctionBean.class, CommonConstant.DBNAME_SQJW, "queryMenuFunctionBeanByMenuid", functionBean.getFunctionid(),userid);
					if (ValidateHelper.isNotEmptyCollection(twomenubeans))
					{
						functionBean.setChildMenuBeans(twomenubeans);
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return menubeans;
	}
}
