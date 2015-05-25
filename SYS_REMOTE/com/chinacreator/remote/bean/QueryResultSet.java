package com.chinacreator.remote.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * 分布式查询返回的结果集对象
 * 
 * @author mingchun.xiong
 *
 * @param <T>
 */
public class QueryResultSet<T> extends RequestErrorInfoBean
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 5689365949983818850L;

	/**
	 * 请求任务ID
	 */
	private String taskId;
	
	/**
	 * 服务方返回码
	 */
	private String serviceResultCode;
	
	/**
	 * 返回的结果总数
	 */
	private String totalCount;
	/**
	 * 返回的结果对象
	 */
	private List<T> datas = new ArrayList<T>();

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getServiceResultCode() {
		return serviceResultCode;
	}

	public void setServiceResultCode(String serviceResultCode) {
		this.serviceResultCode = serviceResultCode;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
	
	
}
