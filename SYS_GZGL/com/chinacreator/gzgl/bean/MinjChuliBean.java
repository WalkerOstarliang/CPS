package com.chinacreator.gzgl.bean;

/**
 * 民警处理任务结果bean
 * @author royee
 *
 */
public class MinjChuliBean extends GzglBaseBean
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2138890510029015031L;

	private String id;
	private String rwbh;
	private String cljg;
	private String wcsj;
	private String clmjid;
	private String wcqkms;
	private String cldjrxm;
	private String cldjsj;
	private String cldjrjh;
	private String cldjdwdm;
	private String cldjdwmc;
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getRwbh()
	{
		return rwbh;
	}
	public void setRwbh(String rwbh)
	{
		this.rwbh = rwbh;
	}
	public String getCljg()
	{
		return cljg;
	}
	public void setCljg(String cljg)
	{
		this.cljg = cljg;
	}
	public String getWcsj()
	{
		return transDate(wcsj);
	}
	public void setWcsj(String wcsj)
	{
		this.wcsj = wcsj;
	}
	public String getClmjid()
	{
		return clmjid;
	}
	public void setClmjid(String clmjid)
	{
		this.clmjid = clmjid;
	}
	public String getWcqkms()
	{
		return wcqkms;
	}
	public void setWcqkms(String wcqkms)
	{
		this.wcqkms = wcqkms;
	}
	public String getCldjrxm()
	{
		return cldjrxm;
	}
	public void setCldjrxm(String cldjrxm)
	{
		this.cldjrxm = cldjrxm;
	}
	public String getCldjsj()
	{
		return transDate(cldjsj);
	}
	public void setCldjsj(String cldjsj)
	{
		this.cldjsj = cldjsj;
	}
	public String getCldjrjh()
	{
		return cldjrjh;
	}
	public void setCldjrjh(String cldjrjh)
	{
		this.cldjrjh = cldjrjh;
	}
	public String getCldjdwdm()
	{
		return cldjdwdm;
	}
	public void setCldjdwdm(String cldjdwdm)
	{
		this.cldjdwdm = cldjdwdm;
	}
	public String getCldjdwmc()
	{
		return cldjdwmc;
	}
	public void setCldjdwmc(String cldjdwmc)
	{
		this.cldjdwmc = cldjdwmc;
	}
}
