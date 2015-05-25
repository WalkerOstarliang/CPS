package com.chinacreator.zdry.action;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.cps.action.CPSBaseAction;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(跳转转发Action)
 * @date Mar 6, 2013 10:50:12 AM
 */
public class ForwardAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5596145322554160943L;
	
	/**
	 * 打开页面
	 * @return
	 */
	public String openForwardPage(){
		String method = this.getRequest().getParameter("method");
		if(StringUtils.isBlank(method)){
			method = "toIndexPage";
		}
		return method;
	}
}
