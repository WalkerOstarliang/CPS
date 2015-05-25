package com.chinacreator.tjbb.bean;

import com.chinacreator.common.helper.ValidateHelper;

public class GabzzrkTjbbBean
{
	private String orgcode;
	private String orgname;
	private String leve;
	private String tjyf;
	private String hj;
	private String jzsydm;
	private String jzsymc;
	private String xbmnum; 
	private String xbwnum; 
	private String njzqxbnyxnum; 
	private String njzqxbnzwnnum; 
    private String njzqxwnys; 
    private String hjdlxsns; 
    private String hjdlxsnx; 
    private String hjdlxsws; 
    private String hjdlxswx; 
    private String hjdlxgat; 
    private String hjdlxgw; 
    private String hjdlxqt; 
    private String zzcslj; 
    private String zzcsjmjz; 
    private String zzcsdwnb; 
    private String zzcsgdxc; 
    private String zzcszlfw; 
    private String zzcsqt;
	public String getOrgcode()
	{
		return orgcode;
	}
	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
	}
	public String getOrgname()
	{
		return orgname;
	}
	public void setOrgname(String orgname)
	{
		this.orgname = orgname;
	}
	public String getTjyf()
	{
		return tjyf;
	}
	public void setTjyf(String tjyf)
	{
		this.tjyf = tjyf;
	}
	public String getHj()
	{
		if (ValidateHelper.isEmptyString(xbmnum) || ValidateHelper.isEmptyString(xbwnum))
		{
			hj = "0";
		}
		else
		{
			long hjnum = Long.parseLong(xbmnum) + Long.parseLong(xbwnum);
			hj = String.valueOf(hjnum);
		}
		return hj;
	}
	public void setHj(String hj)
	{
		this.hj = hj;
	}
	public String getJzsydm()
	{
		return jzsydm;
	}
	public void setJzsydm(String jzsydm)
	{
		this.jzsydm = jzsydm;
	}
	public String getJzsymc()
	{
		return jzsymc;
	}
	public void setJzsymc(String jzsymc)
	{
		this.jzsymc = jzsymc;
	}
	public String getXbmnum()
	{
		return xbmnum;
	}
	public void setXbmnum(String xbmnum)
	{
		this.xbmnum = xbmnum;
	}
	public String getXbwnum()
	{
		return xbwnum;
	}
	public void setXbwnum(String xbwnum)
	{
		this.xbwnum = xbwnum;
	}
	public String getNjzqxbnyxnum()
	{
		return njzqxbnyxnum;
	}
	public void setNjzqxbnyxnum(String njzqxbnyxnum)
	{
		this.njzqxbnyxnum = njzqxbnyxnum;
	}
	public String getNjzqxbnzwnnum()
	{
		return njzqxbnzwnnum;
	}
	public void setNjzqxbnzwnnum(String njzqxbnzwnnum)
	{
		this.njzqxbnzwnnum = njzqxbnzwnnum;
	}
	public String getNjzqxwnys()
	{
		return njzqxwnys;
	}
	public void setNjzqxwnys(String njzqxwnys)
	{
		this.njzqxwnys = njzqxwnys;
	}
	public String getHjdlxsns()
	{
		return hjdlxsns;
	}
	public void setHjdlxsns(String hjdlxsns)
	{
		this.hjdlxsns = hjdlxsns;
	}
	public String getHjdlxsnx()
	{
		return hjdlxsnx;
	}
	public void setHjdlxsnx(String hjdlxsnx)
	{
		this.hjdlxsnx = hjdlxsnx;
	}
	public String getHjdlxsws()
	{
		return hjdlxsws;
	}
	public void setHjdlxsws(String hjdlxsws)
	{
		this.hjdlxsws = hjdlxsws;
	}
	public String getHjdlxswx()
	{
		return hjdlxswx;
	}
	public void setHjdlxswx(String hjdlxswx)
	{
		this.hjdlxswx = hjdlxswx;
	}
	public String getHjdlxgat()
	{
		return hjdlxgat;
	}
	public void setHjdlxgat(String hjdlxgat)
	{
		this.hjdlxgat = hjdlxgat;
	}
	public String getHjdlxgw()
	{
		return hjdlxgw;
	}
	public void setHjdlxgw(String hjdlxgw)
	{
		this.hjdlxgw = hjdlxgw;
	}
	public String getHjdlxqt()
	{
		return hjdlxqt;
	}
	public void setHjdlxqt(String hjdlxqt)
	{
		this.hjdlxqt = hjdlxqt;
	}
	public String getZzcslj()
	{
		return zzcslj;
	}
	public void setZzcslj(String zzcslj)
	{
		this.zzcslj = zzcslj;
	}
	public String getZzcsjmjz()
	{
		return zzcsjmjz;
	}
	public void setZzcsjmjz(String zzcsjmjz)
	{
		this.zzcsjmjz = zzcsjmjz;
	}
	public String getZzcsdwnb()
	{
		return zzcsdwnb;
	}
	public void setZzcsdwnb(String zzcsdwnb)
	{
		this.zzcsdwnb = zzcsdwnb;
	}
	public String getZzcsgdxc()
	{
		return zzcsgdxc;
	}
	public void setZzcsgdxc(String zzcsgdxc)
	{
		this.zzcsgdxc = zzcsgdxc;
	}
	public String getZzcszlfw()
	{
		return zzcszlfw;
	}
	public void setZzcszlfw(String zzcszlfw)
	{
		this.zzcszlfw = zzcszlfw;
	}
	public String getZzcsqt()
	{
		return zzcsqt;
	}
	public void setZzcsqt(String zzcsqt)
	{
		this.zzcsqt = zzcsqt;
	}
	public String getLeve()
	{
		return leve;
	}
	public void setLeve(String leve)
	{
		this.leve = leve;
	}
    
    
}
