package com.chinacreator.common.exception;

public class CPSException extends Exception
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -830178666551443465L;
	
	private String errorCode;
	
	public CPSException()
	{
		super();
	}

	public CPSException(String message, Throwable cause)
	{
		super(message, cause);
	}

	public CPSException(String message)
	{
		super(message);
	}
	
	public CPSException(String errorCode, String message)
	{
		super(message);
		this.errorCode = errorCode;
	}

	public String getErrorCode()
	{
		return errorCode;
	}

	public void setErrorCode(String errorCode)
	{
		this.errorCode = errorCode;
	}
	
}
