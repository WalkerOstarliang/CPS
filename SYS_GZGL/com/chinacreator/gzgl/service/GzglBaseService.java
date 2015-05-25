package com.chinacreator.gzgl.service;

/**
 * 工作管理公共Service
 * @author royee
 *
 */
public class GzglBaseService
{
	public static final String OP_ADD = "_insert";
	
	public static final String OP_DEL = "_delete";
	
	public static final String OP_UPDATE = "_update";
	
	public static final String OP_DEFAULT = "_default";
	
	//工作日志的seq
	protected static final String SEQ_GZRZ_NAME = "SEQ_GZGL_GZRZ";
	
	//工作总结的7位长seq
	protected static final String SEQ_GZZJ_NAME = "SEQ_GZGL_GZZJ";
}
