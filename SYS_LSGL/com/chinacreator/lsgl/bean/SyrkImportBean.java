package com.chinacreator.lsgl.bean;

import com.chinacreator.common.annotation.Excel;
import com.chinacreator.common.bean.ExcelImportBean;

/**
 * 实有人口导入对象
 * 
 * @filename SyrkImportBean.java
 * @author mingchun.xiong
 * @date Jan 5, 2015
 *
 */
@Excel(
	zwfields="姓名*,身份证号码*,电话号码*,居住时间*,居住事由*,居住处所*,与户主关系*,拟居住期限*,备注",
	ywfields="xm,sfzh,lxdh,jzsj,jzsy,jzcs,yhzgx,njzqx,bz",
	requiredfields="xm,sfzh,lxdh,jzsj,jzsy,jzcs,yhzgx,njzqx"
)
public class SyrkImportBean extends ExcelImportBean
{
	private String bh;
	private String fwid;
	private String dzmc;
	private String rylb;
	
	private String xm;
	private String sfzh;
	private String mz;
	private String lxdh;
	
	private String jzsj;
	private String jzsy;
	
	private String jzsydm;
	
	private String jzcs;
	private String jzcsdm;
	
	private String yhzgx;
	private String yhzgxdm;
	
	private String njzqx;
	private String njzqxdm;
	
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
	private String zdrylbms;
	private String batchno;
	
	private String drsjstart;
	private String drsjend;
	
	private String wwusername;
	private String wwusersfzh;
	
	
	public String getBh()
	{
		return bh;
	}
	public void setBh(String bh)
	{
		this.bh = bh;
	}
	public String getFwid()
	{
		return fwid;
	}
	public void setFwid(String fwid)
	{
		this.fwid = fwid;
	}
	public String getRylb()
	{
		return rylb;
	}
	public void setRylb(String rylb)
	{
		this.rylb = rylb;
	}
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
	public String getJzsj()
	{
		return jzsj;
	}
	public void setJzsj(String jzsj)
	{
		this.jzsj = jzsj;
	}
	public String getJzsy()
	{
		return jzsy;
	}
	public void setJzsy(String jzsy)
	{
		this.jzsy = jzsy;
	}
	public String getJzcs()
	{
		return jzcs;
	}
	public void setJzcs(String jzcs)
	{
		this.jzcs = jzcs;
	}
	public String getYhzgx()
	{
		return yhzgx;
	}
	public void setYhzgx(String yhzgx)
	{
		this.yhzgx = yhzgx;
	}
	public String getNjzqx()
	{
		return njzqx;
	}
	public void setNjzqx(String njzqx)
	{
		this.njzqx = njzqx;
	}
	public String getBz()
	{
		return bz;
	}
	public void setBz(String bz)
	{
		this.bz = bz;
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
	public String getErrorInfo()
	{
		return errorInfo;
	}
	public void setErrorInfo(String errorInfo)
	{
		this.errorInfo = errorInfo;
	}
	public String getExecbs()
	{
		return execbs;
	}
	public void setExecbs(String execbs)
	{
		this.execbs = execbs;
	}
	public String getBatchno()
	{
		return batchno;
	}
	public void setBatchno(String batchno)
	{
		this.batchno = batchno;
	}
	public String getZdrylbms()
	{
		return zdrylbms;
	}
	public void setZdrylbms(String zdrylbms)
	{
		this.zdrylbms = zdrylbms;
	}
	public String getDzmc()
	{
		return dzmc;
	}
	public void setDzmc(String dzmc)
	{
		this.dzmc = dzmc;
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
	public String getJzsydm()
	{
		return jzsydm;
	}
	public void setJzsydm(String jzsydm)
	{
		this.jzsydm = jzsydm;
	}
	public String getJzcsdm()
	{
		return jzcsdm;
	}
	public void setJzcsdm(String jzcsdm)
	{
		this.jzcsdm = jzcsdm;
	}
	public String getYhzgxdm()
	{
		return yhzgxdm;
	}
	public void setYhzgxdm(String yhzgxdm)
	{
		this.yhzgxdm = yhzgxdm;
	}
	public String getNjzqxdm()
	{
		return njzqxdm;
	}
	public void setNjzqxdm(String njzqxdm)
	{
		this.njzqxdm = njzqxdm;
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
