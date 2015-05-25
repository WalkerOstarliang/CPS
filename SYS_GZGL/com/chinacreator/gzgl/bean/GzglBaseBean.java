package com.chinacreator.gzgl.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 工作管理公共bean
 * @author royee
 *
 */
public class GzglBaseBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3980489272928125835L;

	public static final String DATE_SHORT_FMT = "yyyy-MM-dd";
	
	public static final String DATE_LONG_FMT = "yyyy-MM-dd HH:mm:ss";
	
	public static final String EDIT = "edit";
	
	public static final String NEW = "new";
	
	public static final String DEL = "del";
	
	public static final String VIEW = "view";
	
	protected static String dateFmt = DATE_SHORT_FMT;
	
	private String op;
	
	protected String transDate(String dateStr)
	{
		if (ValidateHelper.isEmptyString(dateStr))
		{
			return dateStr;
		}
		try
		{
			String fmt = DATE_SHORT_FMT;
			if (dateStr.length() > 10)
			{
				fmt = DATE_LONG_FMT;
			}
			SimpleDateFormat dateFormat = new SimpleDateFormat(fmt);
			Date midDate = dateFormat.parse(dateStr);
			dateFormat = new SimpleDateFormat(dateFmt);
			return dateFormat.format(midDate);
		}
		catch (ParseException e)
		{
			e.printStackTrace();
		}
		return dateStr;
	}

	public static String getDateFmt()
	{
		return dateFmt;
	}

	public static void setDateFmt(String dateFmt)
	{
		GzglBaseBean.dateFmt = dateFmt;
	}

	public String getOp()
	{
		return op;
	}

	public void setOp(String op)
	{
		this.op = op;
	}
	
}
