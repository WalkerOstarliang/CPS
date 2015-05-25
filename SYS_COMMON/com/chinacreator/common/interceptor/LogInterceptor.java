package com.chinacreator.common.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LogInterceptor implements Interceptor
{
	
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 6312035155079982542L;
	
	public void destroy() {
	}
	
	public void init() {
	}
	
	public String intercept(ActionInvocation invocation) throws Exception 
	{
		/*String operType = null;
		String modename = null;
		StringBuffer parameter = new StringBuffer();
		Enumeration e = ServletActionContext.getRequest().getParameterNames();
		while(e.hasMoreElements())
		{
			String key = (String)e.nextElement();
		    String value = ServletActionContext.getRequest().getParameter(key);
		    if ("operType".equals(key))
			{
				operType = value;
			}
			else if ("modename".equals(key))
			{
				modename = value;
			}
			else
			{
				parameter.append(key + "=" + value + "\n");
			}
		}
		if (ValidateHelper.isNotEmptyString(operType) && ValidateHelper.isNotEmptyString(modename))
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			if (loginInfo != null)
			{
				CommonLogBean logBean = new CommonLogBean();
				logBean.setCzdwdm(loginInfo.getOrgcode());
				logBean.setCzdwmc(loginInfo.getOrgname());
				logBean.setCzrjh(loginInfo.getUsername());
				logBean.setCzrxm(loginInfo.getRealname());
				logBean.setModename(modename);
				logBean.setOpertype(operType);
				logBean.setParameter(parameter.toString());
				LogBusiness.insertLogBean(logBean);
			}
		}*/
		invocation.invoke();
		return null;
	}
	
}
