package com.chinacreator.gzgl.util;

import com.chinacreator.common.bean.BaseValue;

/**
 * 工作管理中的状态参数配置  与字典同步
 */

public class GZGLCommonStatuts extends BaseValue {
	private static final long serialVersionUID = -759179822740306891L;
	
	/**
	 * 操作标识
	 */
	public static final String CZBZ_ADD = "1";                 //新增
	public static final String CZBZ_DEL = "0";                 //删除
	public static final String CZBZ_UPDATE = "2";              //修改
	
	/**
	 * 任务反馈状态
	 */
	public static final String FKZT_WFK = "0";                 //未反馈
	public static final String FKZT_YFK = "1";                 //已反馈
	
	/**
	 * 任务完成情况
	 * * 0：未完成
	 * 1：已完成
	 * 2：部分完成
	 * 3：其他
	 */
	public static final String RWWCQK_WWC = "0";               //未完成
	public static final String RWWCQK_YWC = "1";               //已完成
	public static final String RWWCQK_BFWC = "2";              //部分完成
	public static final String RWWCQK_QT = "3";                //已完成
	
	/**
	 * 任务是否签收
	 */
	public static final String SFQS_WQS = "0";                   //未签收
	public static final String SFQS_YQS = "1";                   //已签收

}
