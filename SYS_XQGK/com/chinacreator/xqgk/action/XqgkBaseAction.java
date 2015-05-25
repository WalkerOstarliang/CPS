package com.chinacreator.xqgk.action;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.chinacreator.common.action.PaginationAction;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.xqgk.utils.JsonUtils;

@SuppressWarnings("unchecked")
public class XqgkBaseAction extends PaginationAction {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 3697637796321836416L;
	private static final Logger log = LoggerFactory.getLogger(XqgkBaseAction.class);
	
	public LoginInfo getLoginUser(){
		Object obj = request.getSession().getAttribute(CommonConstant.LOGIN_INFO);
		return (LoginInfo)obj;
	}
	
	/**
	 * 输出错误信息(json格式)
	 * @param object
	 * @return
	 */
	protected void responseErrorInfo(Map<String, String> errorInfo, String message){
		errorInfo.put("status", "error");
		errorInfo.put("msg", message);
		responseMap(errorInfo);
	}
	
	protected void responseSuccessInfo(Map<String, Object> successInfo, String message){
		successInfo.put("status", "ok");
		successInfo.put("msg", message);
		responseMap(successInfo);
	}
	
	protected void responseMap(Map map){
		returnValue(JsonUtils.map2json(map));
	}
	
	protected void responseArray(Object[] array){
		returnValue(JsonUtils.array2json(array));
	}
	
	protected void responseBean(Object bean){
		returnValue(JsonUtils.bean2json(bean));
	}
	
	protected void responseObject(Object obj){
		returnValue(JsonUtils.object2json(obj));
	}
	
	protected void responseString(String s){
		returnValue(JsonUtils.string2json(s));
	}
	
	protected void responseSet(Set set){
		returnValue(JsonUtils.set2json(set));
	}
	
	protected void responseList(List list){
		returnValue(JsonUtils.list2json(list));
	}
	
	protected void returnValue(String resStr){
		Object obj = getSession().getServletContext().getAttribute("encoding"); 
		String encoding = obj != null ? obj.toString() : "UTF-8";
		returnValue(resStr, encoding);
	}
	
	protected void returnValue(String resStr,String encoding){
		try{
			response.setCharacterEncoding(encoding);
			response.setContentType("text/plain;Charset=" + encoding);
			response.setHeader("Cache-Control", "no-cache");
			
			response.flushBuffer();
			response.getWriter().write(resStr);
		}catch(Exception e){
			log.error(e.getMessage(), e);
		}
	}
}
