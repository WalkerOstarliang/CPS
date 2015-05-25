package com.chinacreator.common.helper;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.chinacreator.common.annotation.Excel;
import com.chinacreator.common.bean.ExcelImportBean;
import com.chinacreator.common.bean.ImportxlsConfigBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.exception.CPSException;
import com.chinacreator.sydw.bean.CyryImportBean;
import com.frameworkset.common.poolman.SQLExecutor;

public class ExcelImportHelper
{
	
	/**
	 * 解析excel通过对象类的注解方式读取
	 * @param <T>
	 * @param clazz
	 * @param is
	 * @return
	 * @throws Exception
	 * @date Jan 14, 2015 11:27:16 AM
	 */
	public static <T extends ExcelImportBean> List<T> readExcelFromClass(Class<T> clazz, InputStream is) throws Exception
	{
		List<T> beans = new ArrayList<T>();
		try
		{
			HSSFWorkbook workbook = new HSSFWorkbook(is);
			HSSFSheet sheet = workbook.getSheetAt(0);
			String headerStr = getExcelHeader(sheet);
			Excel excel = clazz.getAnnotation(Excel.class);
			if (excel == null)
			{
				throw new CPSException(clazz.getSimpleName() +"对象没有对应的注解Excel");
			}
			String prokey = clazz.getSimpleName().toLowerCase() + ".xls.field.config";
			String requiredFields = excel.requiredfields();
			String zwfields = excel.zwfields();
			String ywfields = excel.ywfields();
			ImportxlsConfigBean configBean = new ImportxlsConfigBean();
			configBean.setProkey(prokey);
			configBean.setRequiredfields(requiredFields);
			configBean.setZwfields(zwfields);
			configBean.setYwfields(ywfields);
			if (headerStr.equalsIgnoreCase(zwfields))
			{
				List<Map<String, String>> rowList = getExcelRowValues(sheet,configBean);
				List<String> requiredFieldsList = StringArrayListHelper.converStringArrayToList(requiredFields.split(","));
				List<String> ywfieldsList = StringArrayListHelper.converStringArrayToList(configBean.getYwfields().split(","));
				List<String> zwfieldsList = StringArrayListHelper.converStringArrayToList(configBean.getZwfields().split(","));
				if (ValidateHelper.isNotEmptyCollection(rowList))
				{
					for (int i=0; i<rowList.size();i++)
					{
						Map<String, String> rowMap = rowList.get(i);
						T bean = clazz.newInstance();
						bean.setNum(String.valueOf(i+1));
						for (Map.Entry<String, String> entry : rowMap.entrySet())
						{
							if (requiredFieldsList.indexOf(entry.getKey()) >= 0 && ValidateHelper.isEmptyString(entry.getValue()))
							{
								int index = ywfieldsList.indexOf(entry.getKey());
								String zwfieldsName = zwfieldsList.get(index);
								if (ValidateHelper.isNotEmptyString(bean.getErrorInfo()))
								{
									bean.setErrorInfo(bean.getErrorInfo() + ";" + zwfieldsName + "不能为空");
								}
								else
								{
									bean.setErrorInfo(zwfieldsName + "不能为空");
								}
							}
							PropertyUtils.setProperty(bean, entry.getKey(), entry.getValue());
						}
						beans.add(bean);
					}
				}
			}
			else
			{
				throw new CPSException("使用的Excel模板的版本与服务器版本不一致，请下载最新的模板");
			}
		}
		catch(IOException e)
		{
			e.printStackTrace();
			throw new CPSException("无法解析Excel模板文件，请检查模板是否最新。");
		}
		return beans;
	}
	
	/**
	 * 解析excel通过数据库配置的方式读取
	 * 比较方法建议使用 readExcelFromClass 方法读取
	 * @param <T>
	 * @param clazz
	 * @param is
	 * @return
	 * @throws Exception
	 * @date Jan 14, 2015 11:27:55 AM
	 */
	@Deprecated
	public static <T extends ExcelImportBean> List<T> readExcelFromDBConfig(Class<T> clazz, InputStream is) throws Exception
	{
		List<T> beans = new ArrayList<T>();
		try
		{
			HSSFWorkbook workbook = new HSSFWorkbook(is);
			HSSFSheet sheet = workbook.getSheetAt(0);
			String headerStr = getExcelHeader(sheet);
			ImportxlsConfigBean configBean = getXlsHeaderConfigBean(clazz.getSimpleName());
			String requiredFields = configBean.getRequiredfields();
			if (headerStr.equalsIgnoreCase(configBean.getZwfields()))
			{
				List<Map<String, String>> rowList = getExcelRowValues(sheet,configBean);
				List<String> requiredFieldsList = StringArrayListHelper.converStringArrayToList(requiredFields.split(","));
				List<String> ywfieldsList = StringArrayListHelper.converStringArrayToList(configBean.getYwfields().split(","));
				List<String> zwfieldsList = StringArrayListHelper.converStringArrayToList(configBean.getZwfields().split(","));
				if (ValidateHelper.isNotEmptyCollection(rowList))
				{
					for (int i=0; i<rowList.size();i++)
					{
						Map<String, String> rowMap = rowList.get(i);
						T bean = clazz.newInstance();
						bean.setNum(String.valueOf(i+1));
						for (Map.Entry<String, String> entry : rowMap.entrySet())
						{
							if (requiredFieldsList.indexOf(entry.getKey()) >= 0 && ValidateHelper.isEmptyString(entry.getValue()))
							{
								int index = ywfieldsList.indexOf(entry.getKey());
								String zwfieldsName = zwfieldsList.get(index);
								if (ValidateHelper.isNotEmptyString(bean.getErrorInfo()))
								{
									bean.setErrorInfo(bean.getErrorInfo() + ";" + zwfieldsName + "不能为空");
								}
								else
								{
									bean.setErrorInfo(zwfieldsName + "不能为空");
								}
							}
							PropertyUtils.setProperty(bean, entry.getKey(), entry.getValue());
						}
						beans.add(bean);
					}
				}
			}
			else
			{
				throw new CPSException("使用的Excel模板的版本与服务器版本不一致，请下载最新的模板");
			}
		}
		catch(IOException e)
		{
			e.printStackTrace();
			throw new CPSException("无法解析Excel模板文件，请检查模板是否最新。");
		}
		return beans;
	}
	
	/**
	 * 获取Excel头
	 * @param sheet
	 * @return
	 * @date Jan 4, 2015 10:42:22 AM
	 */
	private static String getExcelHeader(HSSFSheet sheet)
	{
		List<String> headerList = new ArrayList<String>();
		HSSFRow hssfrow = sheet.getRow(0);
		for (int cellnum=0;cellnum<hssfrow.getLastCellNum();cellnum++)
		{
			HSSFCell hssfcell = hssfrow.getCell(cellnum);
			if (hssfcell != null)
			{
				String cellvalue = getCellValue(hssfcell);
				if (ValidateHelper.isNotEmptyString(cellvalue))
				{
					headerList.add(cellvalue.trim());
				}
			}
		}
		return StringArrayListHelper.converListToString(headerList,",");
	}
	
	/**
	 * 获取Excel的行
	 * @param sheet
	 * @return
	 * @date Jan 4, 2015 10:42:08 AM
	 */
	private static List<Map<String, String>> getExcelRowValues(HSSFSheet sheet,ImportxlsConfigBean configBean)
	{
		List<Map<String, String>> values = new ArrayList<Map<String, String>>();
		String ywfields = configBean.getYwfields();
		for (int rownum=1;rownum<=sheet.getPhysicalNumberOfRows();rownum++)
		{
			HSSFRow hssfrow = sheet.getRow(rownum);
			if (hssfrow != null)
			{
				Map<String, String> cellLlist = new LinkedHashMap<String, String>();
				String[] ywfieldArr = ywfields.split(",");
				boolean isBlank = true;
				for (int cellnum=0;cellnum<hssfrow.getLastCellNum();cellnum++)
				{
					HSSFCell hssfcell = hssfrow.getCell(cellnum);
					if (hssfcell != null)
					{
						String cellvalue = getCellValue(hssfcell);
						if (ValidateHelper.isNotEmptyString(cellvalue))
						{
							cellLlist.put(ywfieldArr[cellnum], cellvalue.trim());
							isBlank = false;
						}
						else
						{
							cellLlist.put(ywfieldArr[cellnum], "");
						}
					}
				}
				if (!isBlank)
				{
					values.add(cellLlist);
				}
			}
		}
		return values;
	}
	
	private static String getCellValue(HSSFCell cell)
	{
		switch(cell.getCellType())
		{
			case HSSFCell.CELL_TYPE_BOOLEAN :
				return String.valueOf(cell.getBooleanCellValue());
			case HSSFCell.CELL_TYPE_NUMERIC :
				if (HSSFDateUtil.isCellDateFormatted(cell))
				{
					Date date = cell.getDateCellValue();
					String dateStr = DateTimeHelper.conver(date, "yyyy-MM-dd");
					return dateStr;
				}
				else
				{
					DecimalFormat df = new DecimalFormat("0");
					return String.valueOf(df.format(cell.getNumericCellValue()));
				}
			case HSSFCell.CELL_TYPE_FORMULA :
				return String.valueOf(cell.getCellFormula());
				
			case HSSFCell.CELL_TYPE_BLANK :
				return "";
			
			case HSSFCell.CELL_TYPE_ERROR : 
				return "";
			
			default :
				return String.valueOf(cell.getStringCellValue());
				
		}
	}
	
	/**
	 * 获取
	 * @param classsimplename
	 * @return
	 * @date Jan 4, 2015 1:02:13 PM
	 */
	public static ImportxlsConfigBean getXlsHeaderConfigBean(String classsimplename)
	{
		ImportxlsConfigBean configBean = null;
		try
		{
			if (ValidateHelper.isNotEmptyString(classsimplename))
			{
				String prokey = classsimplename.toLowerCase() + ".xls.field.config";
				String querysql = "select prokey,zwfields,ywfields,requiredfields from t_common_importxls_config t where prokey=?";
				configBean = SQLExecutor.queryObjectWithDBName(ImportxlsConfigBean.class, CommonConstant.DBNAME_SQJW, querysql, prokey);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return configBean;
	}
	
	public static void main(String[] args)
	{
		try
		{
			InputStream is = new FileInputStream("F:\\从业人员批量采集表格.xls");
			List<CyryImportBean> list = readExcelFromClass(CyryImportBean.class, is);
			for (CyryImportBean bean : list)
			{
				System.out.println(bean.getNum() + ","+ bean.getXm() + "," + bean.getSfzh() + ",");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
