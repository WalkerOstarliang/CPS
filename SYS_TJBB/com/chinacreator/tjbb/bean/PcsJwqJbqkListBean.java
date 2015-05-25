package com.chinacreator.tjbb.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class PcsJwqJbqkListBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2321814655243795481L;
	
	private String sjdm;
	private String sjmc;
	private String fxjdm;
	private String fxjmc;
	private String pcsdm;
	private String pcsmc;
	private String jwqdm;
	private String jwqmc;
	private String realname;
	private String username;
	private String sfzh;
	private String age;
	private String lxdh;
	private String mobile;
	private String gxsq;
	private String jwqdj;
	private String jwqdjms;
	private String pbfjs;
	public String getSjdm()
	{
		return sjdm;
	}
	public void setSjdm(String sjdm)
	{
		this.sjdm = sjdm;
	}
	public String getSjmc()
	{
		return sjmc;
	}
	public void setSjmc(String sjmc)
	{
		this.sjmc = sjmc;
	}
	public String getFxjdm()
	{
		return fxjdm;
	}
	public void setFxjdm(String fxjdm)
	{
		this.fxjdm = fxjdm;
	}
	public String getFxjmc()
	{
		return fxjmc;
	}
	public void setFxjmc(String fxjmc)
	{
		this.fxjmc = fxjmc;
	}
	public String getPcsdm()
	{
		return pcsdm;
	}
	public void setPcsdm(String pcsdm)
	{
		this.pcsdm = pcsdm;
	}
	public String getPcsmc()
	{
		return pcsmc;
	}
	public void setPcsmc(String pcsmc)
	{
		this.pcsmc = pcsmc;
	}
	public String getJwqdm()
	{
		return jwqdm;
	}
	public void setJwqdm(String jwqdm)
	{
		this.jwqdm = jwqdm;
	}
	public String getJwqmc()
	{
		return jwqmc;
	}
	public void setJwqmc(String jwqmc)
	{
		this.jwqmc = jwqmc;
	}
	public String getRealname()
	{
		return realname;
	}
	public void setRealname(String realname)
	{
		this.realname = realname;
	}
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public String getSfzh()
	{
		return sfzh;
	}
	public void setSfzh(String sfzh)
	{
		this.sfzh = sfzh;
	}
	public String getAge()
	{
		return age;
	}
	public void setAge(String age)
	{
		this.age = age;
	}
	public String getLxdh()
	{
		if (ValidateHelper.isEmptyString(lxdh))
		{
			lxdh = mobile;
		}
		return lxdh;
	}
	public void setLxdh(String lxdh)
	{
		this.lxdh = lxdh;
	}
	public String getGxsq()
	{
		return gxsq;
	}
	public void setGxsq(String gxsq)
	{
		this.gxsq = gxsq;
	}
	public String getJwqdj()
	{
		return jwqdj;
	}
	public void setJwqdj(String jwqdj)
	{
		this.jwqdj = jwqdj;
	}
	public String getPbfjs()
	{
		return pbfjs;
	}
	public void setPbfjs(String pbfjs)
	{
		this.pbfjs = pbfjs;
	}
	public String getJwqdjms()
	{
		jwqdjms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("KHKP_JWQFL", jwqdj);
		return jwqdjms;
	}
	public void setJwqdjms(String jwqdjms)
	{
		this.jwqdjms = jwqdjms;
	}
	public String getMobile()
	{
		return mobile;
	}
	public void setMobile(String mobile)
	{
		this.mobile = mobile;
	}
	
}
