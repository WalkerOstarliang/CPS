package com.chinacreator.remote.business;

import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.remote.bean.CzrkInfoBean;
import com.chinacreator.remote.bean.QueryResultSet;
import com.chinacreator.remote.util.ResultSetXmlUtil;
import com.dragonsoft.pci.api.impl.TaskInvokeAdapter;
import com.dragonsoft.pci.task.SubTask;

/**
 * 远程服务请求
 * @author mingchun.xiong
 *
 */
public class RemoteServiceRequest implements java.io.Serializable
{
	
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 7814149782048858891L;
	private final static String VERSION = "02";		 //版本号
	private final static int MAXCOUNT = 6;			 //请求服务最大请求次数
	/**
	 * 分布式查询调用获取常住人口信息
	 * @param sfzh
	 * @param condition
	 * @param resultFields
	 * @return
	 */
	public List<CzrkInfoBean> queryHNCzrkInfo(String condition, String resultFields) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String hnStrServiceID = DictionaryCacheHellper.getSystemParamenterValueByKey("serviceId.hn");
		String strDataObjectCode = "A901";
		String taskId = sendTask(hnStrServiceID, strDataObjectCode, condition, resultFields, loginInfo.getSfzh(), loginInfo.getRealname(), loginInfo.getOrgcode());
		String hnxmlStr = receiveTask(taskId);
		// 把返回的结果进行包装
		QueryResultSet<CzrkInfoBean> hnqueryResultSet = ResultSetXmlUtil.parseQueryResultSetXml(hnxmlStr, resultFields, CzrkInfoBean.class);
		if (hnqueryResultSet != null)
		{
			return hnqueryResultSet.getDatas();
		}
		else
		{
			return null;
		}
	}
	
	
	/**
	 * 分布式查询调用获取常住人口信息
	 * @param sfzh
	 * @param condition
	 * @param resultFields
	 * @return
	 */
	public List<CzrkInfoBean> queryQGCzrkInfo(String condition, String resultFields) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String gabStrServiceID = DictionaryCacheHellper.getSystemParamenterValueByKey("serviceId.gab");
		String strDataObjectCode = "A901";
		
		String taskId = sendTask(gabStrServiceID, strDataObjectCode, condition, resultFields, loginInfo.getSfzh(), loginInfo.getRealname(), loginInfo.getOrgcode());
		String gabxmlStr = receiveTask(taskId);
		// 包装返回结果
		QueryResultSet<CzrkInfoBean> gabqueryResultSet = ResultSetXmlUtil.parseQueryResultSetXml(gabxmlStr, resultFields, CzrkInfoBean.class);
		if (gabqueryResultSet != null)
		{
			return gabqueryResultSet.getDatas();
		}
		else
		{
			return null;
		}
	}
	
	/**
	 * 通过用户信息查询全国公安部服务
	 * @param condition
	 * @param resultFields
	 * @param sfzh
	 * @param realname
	 * @param orgcode
	 * @return
	 * @throws Exception
	 * @date Jan 10, 2015 12:21:21 PM
	 */
	public List<CzrkInfoBean> queryQGCzrkInfoByUserInfo(String condition, String resultFields, String usersfzh, String realname, String orgcode) throws Exception
	{
		String gabStrServiceID = DictionaryCacheHellper.getSystemParamenterValueByKey("serviceId.gab");
		String strDataObjectCode = "A901";
		
		String taskId = sendTask(gabStrServiceID, strDataObjectCode, condition, resultFields, usersfzh, realname, orgcode);
		String gabxmlStr = receiveTask(taskId);
		//System.out.println(gabxmlStr);
		//包装返回结果
		QueryResultSet<CzrkInfoBean> gabqueryResultSet = ResultSetXmlUtil.parseQueryResultSetXml(gabxmlStr, resultFields, CzrkInfoBean.class);
		if (gabqueryResultSet != null)
		{
			return gabqueryResultSet.getDatas();
		}
		else
		{
			return null;
		}
	}
	
	public String sendTask(String serviceID, String dataCode,String condition, String resultFields,String userCardId, String userName, String userDept)
	{
		try
		{
			String senderId = DictionaryCacheHellper.getSystemParamenterValueByKey("request.senderId");
			String requestIp = DictionaryCacheHellper.getSystemParamenterValueByKey("request.ip");
			String strPort = DictionaryCacheHellper.getSystemParamenterValueByKey("request.port");
			String taskId = null;// 任务编号
			SubTask subTask = new SubTask();// 任务对象
			byte[] sendMsg = ResultSetXmlUtil.createXml(senderId, serviceID, dataCode, condition, resultFields, "0", VERSION, userCardId, userName, userDept, "");
			subTask.setSenderID(senderId); // 向任务对象赋予发送方ID
			subTask.setReceiverID(serviceID);// 向任务对象赋予接收方ID
			subTask.setTaskName("sendQuery"); // 向任务对象赋予任务名称
			subTask.setTaskBody(sendMsg); // 向任务对象赋予任务体
			taskId = TaskInvokeAdapter.sendTask(subTask, requestIp, strPort);
			return taskId;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	private String receiveTask(String srcTaskId)
	{
		String senderId = DictionaryCacheHellper.getSystemParamenterValueByKey("request.senderId");
		String requestIp = DictionaryCacheHellper.getSystemParamenterValueByKey("request.ip");
		String strPort = DictionaryCacheHellper.getSystemParamenterValueByKey("request.port");
		String responseMsg = null;//返回结果报文
		SubTask subTask = new SubTask();
		subTask.setSenderID(senderId);
		subTask.setSrcTaskID(srcTaskId);
		try 
		{
			int i=0;
			while(true)
			{
				Thread.sleep(800L);
				System.out.println("请求服务第" + (i+1) + "次获取.");
				responseMsg = TaskInvokeAdapter.receiveTask(subTask, requestIp, strPort);
				if (i>=MAXCOUNT || responseMsg != null)
				{
					break;
				}
				i++;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return responseMsg;
	}
}
