package com.chinacreator.xqgk.utils;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


@SuppressWarnings("all")
public class DateUtils {
	protected static Log log = LogFactory.getLog(DateUtils.class);
	/**
	 * 日期格式包含年、月、日、小时、分钟、秒,如：2003-10-01 10:20:15
	 */
	public final static String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

	private static String defaultDatePattern = null;
	private static String timePattern = "HH:mm";
	public static final String TS_FORMAT = getDatePattern() + " HH:mm:ss.S";
	private static Calendar cale = Calendar.getInstance();
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
	private static SimpleDateFormat sdf2 = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	/**
	 * 获取当前日期时间(yyyy-MM-dd HH:mm:ss)
	 * @return
	 */
	public static String getDateTime() {
		try {
			return sdf2.format(cale.getTime());
		} catch (Exception e) {
			log.debug("DateUtil.getDateTime():" + e.getMessage());
		}
		return "";
	}
	/**
	 * 获取当前日期(yyyy-MM-dd)
	 * @return
	 */
	public static String getDate() {
		try {
			return sdf.format(cale.getTime());
		} catch (Exception e) {
			log.debug("DateUtil.getDate():" + e.getMessage());
		}
		return "";
	}
	/**
	 * 获取当前时间(HH:mm:ss)
	 * @return
	 */
	public static String getTime() {
		String temp = " ";
		try {
			temp = temp + sdf1.format(cale.getTime());
			return temp;
		} catch (Exception e) {
			log.debug("DateUtil.getTime():" + e.getMessage());
		}
		return "";
	}
	/**
	 * 获取当前年份的第一天(yyyy-MM-dd)
	 * @return
	 */
	public static String getStartDate() {
		try {
			return getYear() + "-01-01";
		} catch (Exception e) {
			log.debug("DateUtil.getStartDate():" + e.getMessage());
		}
		return "";
	}
	/**
	 * 获取今天(yyyy-MM-dd)
	 * @return
	 */
	public static String getEndDate() {
		try {
			return getDate();
		} catch (Exception e) {
			log.debug("DateUtil.getEndDate():" + e.getMessage());
		}
		return "";
	}
	/**
	 * 获取年份
	 * @return
	 */
	public static String getYear() {
		try {
			return String.valueOf(cale.get(1));
		} catch (Exception e) {
			log.debug("DateUtil.getYear():" + e.getMessage());
		}
		return "";
	}
	/**
	 * 获取月份
	 * @return
	 */
	public static String getMonth() {
		try {
			DecimalFormat df = new DecimalFormat();
			df.applyPattern("00;00");
			return df.format(cale.get(2) + 1);
		} catch (Exception e) {
			log.debug("DateUtil.getMonth():" + e.getMessage());
		}
		return "";
	}
	/**
	 * 获取日期
	 * @return
	 */
	public static String getDay() {
		try {
			return String.valueOf(cale.get(5));
		} catch (Exception e) {
			log.debug("DateUtil.getDay():" + e.getMessage());
		}
		return "";
	}
	/**
	 * 获取时间1与时间2相差天数 整数
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static int getMargin(String date1, String date2) {
		try {
			ParsePosition pos = new ParsePosition(0);
			ParsePosition pos1 = new ParsePosition(0);
			Date dt1 = sdf.parse(date1, pos);
			Date dt2 = sdf.parse(date2, pos1);
			long l = dt1.getTime() - dt2.getTime();
			int margin = (int) (l / 86400000L);
			return margin;
		} catch (Exception e) {
			log.debug("DateUtil.getMargin():" + e.toString());
		}
		return 0;
	}
	/**
	 * 获取时间1与时间2相差天数 小数
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static double getDoubleMargin(String date1, String date2) {
		try {
			ParsePosition pos = new ParsePosition(0);
			ParsePosition pos1 = new ParsePosition(0);
			Date dt1 = sdf2.parse(date1, pos);
			Date dt2 = sdf2.parse(date2, pos1);
			long l = dt1.getTime() - dt2.getTime();
			double margin = l / 86400000.0D;
			return margin;
		} catch (Exception e) {
			log.debug("DateUtil.getMargin():" + e.toString());
		}
		return 0.0D;
	}
	/**
	 * 获取时间1与时间2相差月份 整数
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static int getMonthMargin(String date1, String date2) {
		try {
			int margin = (Integer.parseInt(date2.substring(0, 4)) - Integer
					.parseInt(date1.substring(0, 4))) * 12;
			margin += Integer.parseInt(date2.substring(4, 7).replaceAll("-0",
					"-"))
					- Integer.parseInt(date1.substring(4, 7).replaceAll("-0",
							"-"));
			return margin;
		} catch (Exception e) {
			log.debug("DateUtil.getMargin():" + e.toString());
		}
		return 0;
	}
	/**
	 * 日期加天
	 * @param date
	 * @param i
	 * @return
	 */
	public static String addDay(String date, int i) {
		try {
			GregorianCalendar gCal = new GregorianCalendar(Integer
					.parseInt(date.substring(0, 4)), Integer.parseInt(date
					.substring(5, 7)) - 1, Integer.parseInt(date.substring(8,
					10)));
			gCal.add(5, i);
			return sdf.format(gCal.getTime());
		} catch (Exception e) {
			log.debug("DateUtil.addDay():" + e.toString());
		}
		return getDate();
	}
	/**
	 * 日期加月
	 * @param date
	 * @param i
	 * @return
	 */
	public static String addMonth(String date, int i) {
		try {
			GregorianCalendar gCal = new GregorianCalendar(Integer
					.parseInt(date.substring(0, 4)), Integer.parseInt(date
					.substring(5, 7)) - 1, Integer.parseInt(date.substring(8,
					10)));
			gCal.add(2, i);
			return sdf.format(gCal.getTime());
		} catch (Exception e) {
			log.debug("DateUtil.addMonth():" + e.toString());
		}
		return getDate();
	}
	/**
	 * 日期加年
	 * @param date
	 * @param i
	 * @return
	 */
	public static String addYear(String date, int i) {
		try {
			GregorianCalendar gCal = new GregorianCalendar(Integer
					.parseInt(date.substring(0, 4)), Integer.parseInt(date
					.substring(5, 7)) - 1, Integer.parseInt(date.substring(8,
					10)));
			gCal.add(1, i);
			return sdf.format(gCal.getTime());
		} catch (Exception e) {
			log.debug("DateUtil.addYear():" + e.toString());
		}
		return "";
	}

	public static synchronized String getDatePattern() {
		defaultDatePattern = "yyyy-MM-dd";
		return defaultDatePattern;
	}
	/**
	 * 时间格式化 默认格式(yyyy-MM-dd)
	 * @param aDate
	 * @return
	 */
	public static final String getDate(Date aDate) {
		return getDateTime(getDatePattern(), aDate);
	}
	
	/**
	 * 时间格式化(HH:mm)
	 * @param theTime
	 * @return
	 */
	public static String getTimeNow(Date theTime) {
		return getDateTime(timePattern, theTime);
	}

	/**
	 * 根据指定格式格式化日期
	 * @param aMask
	 * @param aDate
	 * @return
	 */
	public static final String getDateTime(String aMask, Date aDate) {
		SimpleDateFormat df = null;
		String returnValue = "";

		if (aDate == null) {
			log.error("aDate is null!");
		} else {
			df = new SimpleDateFormat(aMask);
			returnValue = df.format(aDate);
		}
		return returnValue;
	}
	
	/**
	 * 将指定类型String型日期转换成Date类型
	 * @param aMask  日期类型
	 * @param strDate日期
	 * @return
	 * @throws ParseException
	 */
	public static final Date convertStringToDate(String aMask, String strDate)
			throws ParseException {
		SimpleDateFormat df = null;
		Date date = null;
		df = new SimpleDateFormat(aMask);

		if (log.isDebugEnabled())
			log.debug("converting '" + strDate + "' to date with mask '"
					+ aMask + "'");
		try {
			date = df.parse(strDate);
		} catch (ParseException pe) {
			log.error("ParseException: " + pe);
			throw pe;
		}
		return date;
	}
	
	/**
	 * 获取当前日期紫环传
	 * @return
	 */
	public static String getSimpleDateFormat() {
		SimpleDateFormat formatter = new SimpleDateFormat();
		String NDateTime = formatter.format(new Date());
		return NDateTime;
	}
	/**
	 * 判断date1是否在在date2之后 相同为假时间格式为(yyyy-MM-dd HH:mm:ss)
	 * @param last
	 * @param now
	 * @return
	 */
	public static boolean compareTo(String date1, String date2) {
		try {
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			Date temp1 = formatter.parse(date1);
			Date temp2 = formatter.parse(date2);
			if (temp1.after(temp2))
				return false;
			if (temp1.before(temp2))
				return true;
		} catch (ParseException e) {
			log.debug(e.getMessage());
		}
		return false;
	}
	
	protected Object convertToDate(Class type, Object value) {
		DateFormat df = new SimpleDateFormat(TS_FORMAT);
		if (value instanceof String) {
			try {
				if (StringUtils.isEmpty(value.toString())) {
					return null;
				}
				return df.parse((String) value);
			} catch (Exception pe) {
				throw new ConversionException(
						"Error converting String to Timestamp");
			}
		}

		throw new ConversionException("Could not convert "
				+ value.getClass().getName() + " to " + type.getName());
	}

	public static Date addStartTime(Date param) {
		Date date = param;
		try {
			date.setHours(0);
			date.setMinutes(0);
			date.setSeconds(0);
			return date;
		} catch (Exception ex) {
		}
		return date;
	}

	public static Date addEndTime(Date param) {
		Date date = param;
		try {
			date.setHours(23);
			date.setMinutes(59);
			date.setSeconds(0);
			return date;
		} catch (Exception ex) {
		}
		return date;
	}

	/**
	 * 获取时间撮 201203051212
	 * @return
	 */
	public static String getTimestamp() {
		Date date = new Date();

		String timestamp = (date.getYear() + 1900) + date.getMonth()
				+ date.getDate() + date.getMinutes() + date.getSeconds()
				+ date.getTime() + "";
		return timestamp;
	}
	/**
	 * 获取时间撮 201203051212
	 * @return
	 */
	public static String getTimestamp(Date date) {
		String timestamp = (date.getYear() + 1900) + date.getMonth()
				+ date.getDate() + date.getMinutes() + date.getSeconds()
				+ date.getTime() + "";
		return timestamp;
	}

	/**
	 * 将字符型数字转为Date类型
	 * @param value 要转换的字符
	 * @return Date类型的日期
	 * @throws ParseException 
	 */
	public static java.util.Date stringToDate(String dateString)
			throws ParseException {
		return stringToDate(dateString, YYYY_MM_DD_HH_MM_SS);
	}

	/**
	 * 将字符型数字转为Date类型
	 * @param value 要转换的字符
	 * @return Date类型的日期
	 * @throws ParseException 
	 */
	public static java.util.Date stringToDate(String dateString,
			String dateFormat) {
		if (dateString != null && dateString.trim().length() > 0) {
			SimpleDateFormat sdf = new SimpleDateFormat(dateFormat, Locale
					.getDefault());
			try {
				Date date = sdf.parse(dateString);
				return date;
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 将字符型数字转为Date类型
	 * @param value 日期格式
	 * @throws ParseException 
	 */
	public static String getCurServceDate(String dateFormat) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat, Locale
				.getDefault());
		Calendar c = Calendar.getInstance();
		return sdf.format(c.getTime());
	}
	
	/**
	 * 获取当月1日的起始时间（00:00:00）
	 * @param Date
	 * @return
	 */
	public static Date getFirstDateOfMonth(){
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	/**
	 * 获取当月最后一天的截至时间（00:00:00）
	 * @param Date
	 * @return
	 */
	public static Date getLastDateOfMonth(){
		Calendar cal = Calendar.getInstance();
		int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, maxDay);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
	/**
	 * 从当天开始，获取30天前的起始时间（00:00:00）
	 * @return
	 */
	public static Date getFirst30DayBefore(){
		return getFirstTimeOfDayNumBeforeToday(30);
	}
	
	/**
	 * 获取当天的截至时间23:59:59
	 * @param num
	 * @return
	 */
	public static Date getLastTimeOfToday(){
		return getLastTimeBeforeToday(0);
	}
	
	/**
	 * 从当天开始，获取n天前的起始时间（00:00:00）
	 * @param num
	 * @return
	 */
	public static Date getFirstTimeOfDayNumBeforeToday(int num){
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		
		cal.add(Calendar.DATE, num);
		return cal.getTime();
	}
	
	/**
	 * 从当天开始，获取n天前的截至时间23:59:59
	 * @param num
	 * @return
	 */
	public static Date getLastTimeBeforeToday(int num){
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		
		cal.add(Calendar.DATE, num);
		return cal.getTime();
	}
	
	/**
	 * 获取去年的总天数
	 * @return
	 */
	public static int getDayNumOfLastYear(){
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.YEAR, -1);
		return cal.getActualMaximum(Calendar.DAY_OF_YEAR);
	}
	
	/**
	 * 获取截至当日，本年的总天数
	 * @return
	 */
	public static int getToDayNumOfYear(int amount){
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, amount);
		return cal.get(Calendar.DAY_OF_YEAR);
	}	
	
	/**
	 * 从当天开始，获取n年前的起始时间（00:00:00）
	 * @param amout
	 * @return
	 */
	public static Date getFirstTimeYear(int amout){
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.YEAR, amout);
		cal.set(Calendar.MONTH, Calendar.JANUARY);
		cal.set(Calendar.DATE, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	/**
	 * 从当天开始，获取n年前的截至时间（00:00:00）
	 * @param amout
	 * @return
	 */
	public static Date getLastTimeOfLastYear(int amount){
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.YEAR, amount);
		cal.set(Calendar.MONTH, Calendar.DECEMBER);
		cal.set(Calendar.DATE, 31);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
}
