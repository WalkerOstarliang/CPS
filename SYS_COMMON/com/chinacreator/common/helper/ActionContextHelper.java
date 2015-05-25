package com.chinacreator.common.helper;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.beans.FunctionBean;
import com.chinacreator.common.constant.CommonConstant;
import com.opensymphony.xwork2.ActionContext;


public class ActionContextHelper 
{
	
	public static LoginInfo getLoginInfo()
	{
		ActionContext context = ActionContext.getContext();
		if (context != null)
		{
			return (LoginInfo)ActionContext.getContext().getSession().get(CommonConstant.LOGIN_INFO);
		}
		else
		{
			return null;
		}
	}
	
	public static int getInlineNum()
	{
		return (Integer)ActionContext.getContext().getSession().get("inlineNum");
	}
	
	public static void setLoginInfo(LoginInfo loginInfo)
	{
		ActionContext.getContext().getSession().put(CommonConstant.LOGIN_INFO, loginInfo);
	}
	
	public static ServletContext getServletContext()
	{
		return ServletActionContext.getServletContext();
	}
	
	public static void setFunctionToSession(List<FunctionBean> functionBeans)
	{
		ActionContext.getContext().getSession().put(CommonConstant.USER_FUNCTION_DATA, functionBeans);
	}
	
	/**
	 * 获取session中所有的菜单
	 * @return
	 * @date May 21, 2015 2:28:22 PM
	 */
	@SuppressWarnings("unchecked")
	public static List<FunctionBean> getAllFunctionFromSession()
	{
		return (List<FunctionBean>)ActionContext.getContext().getSession().get(CommonConstant.USER_FUNCTION_DATA);
	}
	
	/**
	 * 获取孩子节点
	 * @param parent_id
	 * @return
	 * @date May 21, 2015 2:27:14 PM
	 */
	public static List<FunctionBean> getChildrenFunctionByParentId(String parent_id)
	{
		List<FunctionBean> newfunctionbeans = new ArrayList<FunctionBean>();
		List<FunctionBean> functionBeans = getAllFunctionFromSession();
		if (ValidateHelper.isNotEmptyCollection(functionBeans))
		{
			for (FunctionBean bean : functionBeans)
			{
				if (parent_id.equals(bean.getParent_id()))
				{
					newfunctionbeans.add(bean);
				}
			}
			//重新排序
			Collections.sort(newfunctionbeans, new Comparator<FunctionBean>(){

				@Override
				public int compare(FunctionBean o1, FunctionBean o2)
				{
					if (o1.getFunction_sn().intValue() > o2.getFunction_sn().intValue())
					{
						return 1;
					}
					else if (o1.getFunction_sn().intValue() < o2.getFunction_sn().intValue())
					{
						return -1;
					}
					else
					{
						return 0;
					}
					
				}
			});
			
		}
		return newfunctionbeans;
	}
}
