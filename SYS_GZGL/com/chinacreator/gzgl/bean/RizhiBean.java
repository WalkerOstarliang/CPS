package com.chinacreator.gzgl.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 日志原子值对象
 * @author royee
 *
 */
public class RizhiBean extends BaseValue
{
	public static final String DATE_SHORT_FMT = "yyyy-MM-dd";
	
	public static final String DATE_LONG_FMT = "yyyy-MM-dd HH:mm:ss";
	
	protected static String dateFmt = DATE_SHORT_FMT;
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -9181720335118817206L;

	/**
	 * 日志编码 
	 */
	private String rzbh;
	
	/**
	 * 标题
	 */
	private String rzbt;
	
	/**
	 * 工作民警姓名
	 */
	private String gzmjxm;
	
	/**
	 * 工作民警身份证号
	 */
	private String gzmjsfzh;
	
	/**
	 * 工作民警警号
	 */
	private String gzmjjh;
	
	/**
	 * 工作民警单位代码
	 */
	private String gzmjdwdm;

	/**
	 * 工作民警单位名称
	 */
	private String gzmjdwmc;
	
	/**
	 * 工作日期
	 */
	private String gzrq;
	
	/**
	 * 工作内容描述
	 */
	private String gznrms;
	
	/**
	 * 处理结果描述
	 */
	private String cljgms;
	
	/**
	 * 登记人姓名
	 */
	private String djrxm;
	
	/**
	 * 登记时间
	 */
	private String djsj;
	
	/**
	 * 登记单位代码
	 */
	private String djdwdm;
	
	/**
	 * 登记单位名称
	 */
	private String djdwmc;

	/**
	 * 登记民警警号
	 */
	private String djmjjh;
	
	/**
	 * 更新时间
	 */
	private String gxsj;
	
	/**
	 * 操作标识
	 */
	private String czbz;
	
	/**
	 * isCheckBox
	 */
	private String isCheckBox;
	
	/**
	 * 星期
	 */
	private String week;
	
	/**
	 * 是否系统生产
	 */
	private String sfxtcs;
	
	private String op;
	private String cz;
	
	private String djrsfzh;
	
	public String getDjrsfzh() {
		return djrsfzh;
	}

	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}

	public RizhiBean(String dateFmt)
	{
		RizhiBean.dateFmt = dateFmt;
	}
	
	public RizhiBean()
	{
	}
	
	public String getRzbh()
	{
		return rzbh;
	}

	public void setRzbh(String rzbh)
	{
		this.rzbh = rzbh;
	}

	public String getRzbt()
	{
		return rzbt;
	}

	public void setRzbt(String rzbt)
	{
		this.rzbt = rzbt;
	}

	public String getGzmjxm()
	{
		return gzmjxm;
	}

	public void setGzmjxm(String gzmjxm)
	{
		this.gzmjxm = gzmjxm;
	}

	public String getGzmjsfzh()
	{
		return gzmjsfzh;
	}

	public void setGzmjsfzh(String gzmjsfzh)
	{
		this.gzmjsfzh = gzmjsfzh;
	}

	public String getGzmjjh()
	{
		return gzmjjh;
	}

	public void setGzmjjh(String gzmjjh)
	{
		this.gzmjjh = gzmjjh;
	}

	public String getGzmjdwdm()
	{
		return gzmjdwdm;
	}

	public void setGzmjdwdm(String gzmjdwdm)
	{
		this.gzmjdwdm = gzmjdwdm;
	}

	public String getGzmjdwmc()
	{
		return gzmjdwmc;
	}

	public void setGzmjdwmc(String gzmjdwmc)
	{
		this.gzmjdwmc = gzmjdwmc;
	}

	public String getGzrq()
	{
		return transDate(gzrq);
	}

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
		RizhiBean.dateFmt = dateFmt;
	}

	public void setGzrq(String gzrq)
	{
		
		this.gzrq = gzrq;
	}

	public String getDjsj()
	{
		return transDate(djsj);
	}

	public void setDjsj(String djsj)
	{
		this.djsj = djsj;
	}

	public String getGznrms()
	{
		return gznrms;
	}

	public void setGznrms(String gznrms)
	{
		this.gznrms = gznrms;
	}

	public String getCljgms()
	{
		return cljgms;
	}

	public void setCljgms(String cljgms)
	{
		this.cljgms = cljgms;
	}

	public String getDjrxm()
	{
		return djrxm;
	}

	public void setDjrxm(String djrxm)
	{
		this.djrxm = djrxm;
	}

	public String getDjdwdm()
	{
		return djdwdm;
	}

	public void setDjdwdm(String djdwdm)
	{
		this.djdwdm = djdwdm;
	}

	public String getDjdwmc()
	{
		return djdwmc;
	}

	public void setDjdwmc(String djdwmc)
	{
		this.djdwmc = djdwmc;
	}

	public String getIsCheckBox()
	{
		return isCheckBox;
	}

	public void setIsCheckBox(String isCheckBox)
	{
		this.isCheckBox = isCheckBox;
	}

	public String getOp()
	{
		return op;
	}

	public void setOp(String op)
	{
		this.op = op;
	}

	public String getDjmjjh()
	{
		return djmjjh;
	}

	public void setDjmjjh(String djmjjh)
	{
		this.djmjjh = djmjjh;
	}

	public String getGxsj() {
		return gxsj;
	}

	public void setGxsj(String gxsj) {
		this.gxsj = gxsj;
	}

	public String getCzbz() {
		return czbz;
	}

	public void setCzbz(String czbz) {
		this.czbz = czbz;
	}

	public String getCz() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		StringBuffer sb = new StringBuffer();
		if(cz==null || cz.trim().equals(""))
		{
			
			if (loginInfo.getUsername().equals(djmjjh) && loginInfo.getUsername().equals(gzmjjh))
			{
				sb.append("<span onclick=\"openEditRizhi('").append(rzbh).append("')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
			}
			sb.append("<span onclick=\"openDetailRizhi('").append(rzbh).append("')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
			cz=sb.toString();
		}
		return cz;
		
	}
	 
	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getWeek() {
		if(ValidateHelper.isNotEmptyString(gzrq)){
			Calendar date = Calendar.getInstance();
			date.set(Calendar.YEAR,Integer.parseInt(gzrq.substring(0,4)));
			date.set(Calendar.MONTH, Integer.parseInt(gzrq.substring(5,7)) - 1);
			date.set(Calendar.DATE, Integer.parseInt(gzrq.substring(8,10)));
			
			int day = date.get(Calendar.DAY_OF_WEEK);
			
			switch (day) {
			case 1:
				week = "星期日";
				break;
			case 2:
				week = "星期一";
				break;
			case 3:
				week = "星期二";
				break;
			case 4:
				week = "星期三";
				break;
			case 5:
				week = "星期四";
				break;
			case 6:
				week = "星期五";
				break;
			case 7:
				week = "星期六";
				break;	
			default:
				week = "";
				break;
			}
			
		}
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getSfxtcs() {
		return sfxtcs;
	}

	public void setSfxtcs(String sfxtcs) {
		this.sfxtcs = sfxtcs;
	}
}
