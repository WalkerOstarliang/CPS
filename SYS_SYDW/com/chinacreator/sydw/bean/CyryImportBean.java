package com.chinacreator.sydw.bean;

import com.chinacreator.common.annotation.Excel;
import com.chinacreator.common.bean.ExcelImportBean;

/**
 * 从业人员导入对象
 * 
 * @filename CyryImportBean.java
 * @author mingchun.xiong
 * @date Jan 5, 2015
 *
 */
@Excel(
		zwfields="姓名*,身份证号码*,电话号码*,职务*,入职时间*,离职时间,居住地派出所*,居住地址*,备注",
		ywfields="xm,sfzh,lxdh,zw,rzsj,lzsj,jzdpcs,jzdz,bz",
		requiredfields="xm,sfzh,lxdh,zw,rzsj,jzdpcs,jzdz"
)
public class CyryImportBean extends ExcelImportBean
{
	
	private String bh;
	private String jgbh;
	private String dwmc;
	
	private String xm;
	private String sfzh;
	private String mz;
	private String lxdh;
	private String zw;
	private String zwdm;
	
	//yyyy-mm-dd
	private String rzsj; 
	
	//yyyy-mm-dd
	private String lzsj;
	private String jzdpcs;
	
	private String jzdpcsdm;
	private String jzdpcsmc;
	
	private String jzdz;
	private String bz;
	
	private String drsj;
	private String djdwdm;
	private String djdwmc;
	private String djrxm;
	private String djrsfzh;
	private String djrjh;
	
	private String errorbs = "0";
	private String errorInfo = "";
	private String execbs;
	
	private String zdrylbms = "";
	
	private String batchno;
	
	private String drsjstart;
	private String drsjend;
	
	private String wwusername;
	private String wwusersfzh;
	
	public String getXm()
	{
		return xm;
	}
	public void setXm(String xm)
	{
		this.xm = xm;
	}
	public String getSfzh()
	{
		return sfzh;
	}
	public void setSfzh(String sfzh)
	{
		this.sfzh = sfzh;
	}
	public String getMz()
	{
		return mz;
	}
	public void setMz(String mz)
	{
		this.mz = mz;
	}
	public String getLxdh()
	{
		return lxdh;
	}
	public void setLxdh(String lxdh)
	{
		this.lxdh = lxdh;
	}
	
	public String getZw()
	{
		return zw;
	}
	public void setZw(String zw)
	{
		this.zw = zw;
	}
	public String getRzsj()
	{
		return rzsj;
	}
	public void setRzsj(String rzsj)
	{
		this.rzsj = rzsj;
	}
	public String getLzsj()
	{
		return lzsj;
	}
	public void setLzsj(String lzsj)
	{
		this.lzsj = lzsj;
	}
	public String getJzdz()
	{
		return jzdz;
	}
	public void setJzdz(String jzdz)
	{
		this.jzdz = jzdz;
	}
	public String getBz()
	{
		return bz;
	}
	public void setBz(String bz)
	{
		this.bz = bz;
	}
	public String getBh()
	{
		return bh;
	}
	public void setBh(String bh)
	{
		this.bh = bh;
	}
	public String getJgbh()
	{
		return jgbh;
	}
	public void setJgbh(String jgbh)
	{
		this.jgbh = jgbh;
	}
	public String getDrsj()
	{
		return drsj;
	}
	public void setDrsj(String drsj)
	{
		this.drsj = drsj;
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
	public String getDjrxm()
	{
		return djrxm;
	}
	public void setDjrxm(String djrxm)
	{
		this.djrxm = djrxm;
	}
	public String getDjrsfzh()
	{
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh)
	{
		this.djrsfzh = djrsfzh;
	}
	public String getDjrjh()
	{
		return djrjh;
	}
	public void setDjrjh(String djrjh)
	{
		this.djrjh = djrjh;
	}
	public String getErrorbs()
	{
		return errorbs;
	}
	public void setErrorbs(String errorbs)
	{
		this.errorbs = errorbs;
	}
	public String getExecbs()
	{
		return execbs;
	}
	public void setExecbs(String execbs)
	{
		this.execbs = execbs;
	}
	public String getErrorInfo()
	{
		return errorInfo;
	}
	public void setErrorInfo(String errorInfo)
	{
		this.errorInfo = errorInfo;
	}
	public String getJzdpcs()
	{
		return jzdpcs;
	}
	public void setJzdpcs(String jzdpcs)
	{
		this.jzdpcs = jzdpcs;
	}
	public String getZdrylbms()
	{
		return zdrylbms;
	}
	public void setZdrylbms(String zdrylbms)
	{
		this.zdrylbms = zdrylbms;
	}
	public String getBatchno()
	{
		return batchno;
	}
	public void setBatchno(String batchno)
	{
		this.batchno = batchno;
	}
	public String getDwmc()
	{
		return dwmc;
	}
	public void setDwmc(String dwmc)
	{
		this.dwmc = dwmc;
	}
	public String getDrsjstart()
	{
		return drsjstart;
	}
	public void setDrsjstart(String drsjstart)
	{
		this.drsjstart = drsjstart;
	}
	public String getDrsjend()
	{
		return drsjend;
	}
	public void setDrsjend(String drsjend)
	{
		this.drsjend = drsjend;
	}
	public String getZwdm()
	{
		return zwdm;
	}
	public void setZwdm(String zwdm)
	{
		this.zwdm = zwdm;
	}
	public String getJzdpcsdm()
	{
		return jzdpcsdm;
	}
	public void setJzdpcsdm(String jzdpcsdm)
	{
		this.jzdpcsdm = jzdpcsdm;
	}
	public String getJzdpcsmc()
	{
		return jzdpcsmc;
	}
	public void setJzdpcsmc(String jzdpcsmc)
	{
		this.jzdpcsmc = jzdpcsmc;
	}
	public String getWwusername()
	{
		return wwusername;
	}
	public void setWwusername(String wwusername)
	{
		this.wwusername = wwusername;
	}
	public String getWwusersfzh()
	{
		return wwusersfzh;
	}
	public void setWwusersfzh(String wwusersfzh)
	{
		this.wwusersfzh = wwusersfzh;
	}
	
}
