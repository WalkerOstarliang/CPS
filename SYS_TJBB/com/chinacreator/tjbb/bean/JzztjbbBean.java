package com.chinacreator.tjbb.bean;

import java.text.NumberFormat;

import com.chinacreator.common.helper.ValidateHelper;

public class JzztjbbBean
{
	private String orgcode;
	private String orgname;
	private String leve;
	private String parent_code;
	private String tjrq;
	private String tjsj;
	private String tjqsrq;
	private String tjjzrq;
	private String ldrkzs;
	private String zbzs;
	private String bsbzrs;
	private String wsbzrs;
	private String nanbzrs;
	private String nvbzrs;
	private String fzs;
	private String ysbls;
	private String fzl;
	private String ysbll;
	private String bzl;
	
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
	public String getLeve()
	{
		return leve;
	}
	public void setLeve(String leve)
	{
		this.leve = leve;
	}
	public String getParent_code()
	{
		return parent_code;
	}
	public void setParent_code(String parent_code)
	{
		this.parent_code = parent_code;
	}
	public String getTjrq()
	{
		return tjrq;
	}
	public void setTjrq(String tjrq)
	{
		this.tjrq = tjrq;
	}
	public String getTjsj()
	{
		return tjsj;
	}
	public void setTjsj(String tjsj)
	{
		this.tjsj = tjsj;
	}
	public String getTjqsrq()
	{
		return tjqsrq;
	}
	public void setTjqsrq(String tjqsrq)
	{
		this.tjqsrq = tjqsrq;
	}
	public String getTjjzrq()
	{
		return tjjzrq;
	}
	public void setTjjzrq(String tjjzrq)
	{
		this.tjjzrq = tjjzrq;
	}
	public String getLdrkzs()
	{
		return ldrkzs;
	}
	public void setLdrkzs(String ldrkzs)
	{
		this.ldrkzs = ldrkzs;
	}
	public String getZbzs()
	{
		return zbzs;
	}
	public void setZbzs(String zbzs)
	{
		this.zbzs = zbzs;
	}
	public String getBsbzrs()
	{
		return bsbzrs;
	}
	public void setBsbzrs(String bsbzrs)
	{
		this.bsbzrs = bsbzrs;
	}
	public String getWsbzrs()
	{
		return wsbzrs;
	}
	public void setWsbzrs(String wsbzrs)
	{
		this.wsbzrs = wsbzrs;
	}
	public String getNanbzrs()
	{
		return nanbzrs;
	}
	public void setNanbzrs(String nanbzrs)
	{
		this.nanbzrs = nanbzrs;
	}
	public String getNvbzrs()
	{
		return nvbzrs;
	}
	public void setNvbzrs(String nvbzrs)
	{
		this.nvbzrs = nvbzrs;
	}
	public String getFzs()
	{
		return fzs;
	}
	public void setFzs(String fzs)
	{
		this.fzs = fzs;
	}
	public String getYsbls()
	{
		return ysbls;
	}
	public void setYsbls(String ysbls)
	{
		this.ysbls = ysbls;
	}
	public String getFzl()
	{
		if (ValidateHelper.isNotEmptyString(zbzs) && Double.parseDouble(zbzs) != 0)
		{
			double f = Double.parseDouble(fzs)/Double.parseDouble(zbzs);
			NumberFormat nf = NumberFormat.getPercentInstance();
			nf.setMinimumFractionDigits(2);
			fzl = nf.format(f);
		}
		else
		{
			fzl = "0.00%";
		}
		return fzl;
	}
	public void setFzl(String fzl)
	{
		this.fzl = fzl;
	}
	public String getYsbll()
	{
		if (ValidateHelper.isNotEmptyString(zbzs) && Double.parseDouble(zbzs) != 0)
		{
			double f = Double.parseDouble(ysbls)/Double.parseDouble(zbzs);
			NumberFormat nf = NumberFormat.getPercentInstance();
			nf.setMinimumFractionDigits(2);
			ysbll = nf.format(f);
		}
		else
		{
			ysbll = "0.00%";
		}
		return ysbll;
	}
	public void setYsbll(String ysbll)
	{
		this.ysbll = ysbll;
	}
	public String getBzl()
	{
		if (ValidateHelper.isNotEmptyString(ldrkzs) && Double.parseDouble(ldrkzs) != 0)
		{
			double f = Double.parseDouble(zbzs)/Double.parseDouble(ldrkzs);
			NumberFormat nf = NumberFormat.getPercentInstance();
			nf.setMinimumFractionDigits(2);
			bzl = nf.format(f);
		}
		else
		{
			bzl = "0.00%";
		}
		return bzl;
	}
	public void setBzl(String bzl)
	{
		this.bzl = bzl;
	}
	
	
}
