package com.chinacreator.remote.bean;

import com.chinacreator.common.bean.BaseValue;

public class RequestErrorInfoBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= -6457928309876781543L;
	private String taskId;
	private String errorCode;
	private String errorMessage;
	
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
	
}
