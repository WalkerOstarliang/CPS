package com.chinacreator.common.bean;

public class ExcelImportBean
{
	//序号
	private String num;

	//错误信息
	private String errorInfo = "";
	
	public String getNum()
	{
		return num;
	}

	public void setNum(String num)
	{
		this.num = num;
	}

	public String getErrorInfo()
	{
		return errorInfo;
	}

	public void setErrorInfo(String errorInfo)
	{
		this.errorInfo = errorInfo;
	}
	
	
}
