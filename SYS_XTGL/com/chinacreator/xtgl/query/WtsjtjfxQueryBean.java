package com.chinacreator.xtgl.query;

import java.util.Date;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;

public class WtsjtjfxQueryBean extends QueryBean
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2081713083369434784L;

	private String tjrq;
	private String tjqsrq;
	private String tjjzrq;
	private String wtdwdm;
	private String wtdwleve;
	
	private String orgcode;
	private String sjtype;
	private String tjqssj;
	private String tjjzsj;
	
	private String tjlx;
	private boolean usePage = true;
	private boolean export = false;
	
	public String getTjrq()
	{
		return tjrq;
	}
	public void setTjrq(String tjrq)
	{
		this.tjrq = tjrq;
	}
	
	public String getWtdwdm()
	{
		return wtdwdm;
	}
	public void setWtdwdm(String wtdwdm)
	{
		this.wtdwdm = wtdwdm;
	}
	public String getWtdwleve()
	{
		return wtdwleve;
	}
	public void setWtdwleve(String wtdwleve)
	{
		this.wtdwleve = wtdwleve;
	}
	public String getTjqsrq()
	{
		Date d = DateTimeHelper.convertToDate(tjrq, "yyyyMMdd");
		tjqsrq = DateTimeHelper.addDateTimeToStr(d.getTime(), -31, "yyyy-MM-dd");
		return tjqsrq;
	}
	public void setTjqsrq(String tjqsrq)
	{
		this.tjqsrq = tjqsrq;
	}
	public String getTjjzrq()
	{
		if (ValidateHelper.isNotEmptyString(tjrq))
		{
			tjjzrq = DateTimeHelper.conver(DateTimeHelper.convertToDate(tjrq, "yyyyMMdd"), "yyyy-MM-dd");
		}
		return tjjzrq;
	}
	public void setTjjzrq(String tjjzrq)
	{
		this.tjjzrq = tjjzrq;
	}
	public boolean isUsePage()
	{
		return usePage;
	}
	public void setUsePage(boolean usePage)
	{
		this.usePage = usePage;
	}
	public String getOrgcode()
	{
		return orgcode;
	}
	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
	}
	public String getSjtype()
	{
		return sjtype;
	}
	public void setSjtype(String sjtype)
	{
		this.sjtype = sjtype;
	}
	public String getTjqssj()
	{
		return tjqssj;
	}
	public void setTjqssj(String tjqssj)
	{
		this.tjqssj = tjqssj;
	}
	public String getTjjzsj()
	{
		return tjjzsj;
	}
	public void setTjjzsj(String tjjzsj)
	{
		this.tjjzsj = tjjzsj;
	}
	public boolean isExport()
	{
		return export;
	}
	
	public void setExport(boolean export)
	{
		this.export = export;
	}
	public String getTjlx()
	{
		return tjlx;
	}
	public void setTjlx(String tjlx)
	{
		this.tjlx = tjlx;
	}
	
}
