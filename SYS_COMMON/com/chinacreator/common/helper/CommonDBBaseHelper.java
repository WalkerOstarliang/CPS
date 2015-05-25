package com.chinacreator.common.helper;

import com.chinacreator.common.constant.CommonConstant;
import com.frameworkset.common.poolman.SQLExecutor;

public class CommonDBBaseHelper
{
	/**
	 * 获取序列
	 * @param dbName
	 * @param seqName
	 * @return
	 */
	public static String getSequence(String dbName,String seqName)
	{
		String sql = "select "+seqName+".nextval as result from dual";
		String result = "";
		try
		{
			result = SQLExecutor.queryFieldWithDBName(dbName, sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 
	 * @param dbName 数据源
	 * @param seqName sequence 名称
	 * @param method  是左填充还是右填充，只有两种方式 left ，right
	 * @param len  生成字符串长度
	 * @param replaceStr  填充字符
	 * @return
	 */
	public static String getSequence(String dbName, String seqName,String method,int len,String replaceStr)
	{
		String sql = "";
		if ("left".equals(method))
		{
			sql += "select lpad("+seqName+".nextval,"+len+",'"+replaceStr+"') from dual ";
		}
		else
		{
			sql += "select rpad("+seqName+".nextval,"+len+",'"+replaceStr+"') from dual ";
		}
		String result = "";
		try
		{
			result = SQLExecutor.queryFieldWithDBName(dbName, sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 获取公共Sequence
	 * @return
	 */
	public static String getCommonSequence()
	{
		return getSequence(CommonConstant.DBNAME_SQJW, "seq_common");
	}
	
	/**
	 * 获取机构级别
	 * @param orgcode
	 * @return
	 */
	public static int getOrgLeve(String orgcode){
		String sql = "select f_get_dwleve('" + orgcode + "') from dual";
		int leve = -1;
		try
		{
			String leveStr = SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql);
			if(ValidateHelper.isNotEmptyString(leveStr)){
				leveStr = leveStr.trim();
				leve = Integer.parseInt(leveStr);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return leve;
	}
	
	
}
