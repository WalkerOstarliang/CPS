package com.chinacreator.afgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
/**
 * 小区信息对象
 * @author mingchun.xiong
 *
 */
public class XqxxBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 3786300505761608274L;
	private String xqbh;
	private String xqmc;
	private String sssqbh;
	private String sssqmc;
	private String xqdz;
	private String xqfzrxm;
	private String xqfzrlxdh;
	private String wygsmc;
	private String wygsfzr;
	private String wygsfzrlxdh;
	private String gllx;
	private String gllxmc;
	private String glms;
	private String glmsmc;
	private String dms;
	private String lds;
	private String xqmj;
	private String jlrq;
	private String cxrq;
	private String cxyy;
	private String djrxm;
	private String djrjh;
	private String djdwdm;
	private String djdwmc;
	private String djsj;
	private String cxbs;
	private String cxbsmc;
	private String gxsj;
	public String getXqbh()
	{
		return xqbh;
	}
	public void setXqbh(String xqbh)
	{
		this.xqbh = xqbh;
	}
	public String getXqmc()
	{
		return xqmc;
	}
	public void setXqmc(String xqmc)
	{
		this.xqmc = xqmc;
	}
	public String getSssqbh()
	{
		return sssqbh;
	}
	public void setSssqbh(String sssqbh)
	{
		this.sssqbh = sssqbh;
	}
	public String getSssqmc()
	{
		return sssqmc;
	}
	public void setSssqmc(String sssqmc)
	{
		this.sssqmc = sssqmc;
	}
	public String getXqdz()
	{
		return xqdz;
	}
	public void setXqdz(String xqdz)
	{
		this.xqdz = xqdz;
	}
	public String getXqfzrxm()
	{
		return xqfzrxm;
	}
	public void setXqfzrxm(String xqfzrxm)
	{
		this.xqfzrxm = xqfzrxm;
	}
	public String getXqfzrlxdh()
	{
		return xqfzrlxdh;
	}
	public void setXqfzrlxdh(String xqfzrlxdh)
	{
		this.xqfzrlxdh = xqfzrlxdh;
	}
	public String getWygsmc()
	{
		return wygsmc;
	}
	public void setWygsmc(String wygsmc)
	{
		this.wygsmc = wygsmc;
	}
	public String getWygsfzr()
	{
		return wygsfzr;
	}
	public void setWygsfzr(String wygsfzr)
	{
		this.wygsfzr = wygsfzr;
	}
	public String getWygsfzrlxdh()
	{
		return wygsfzrlxdh;
	}
	public void setWygsfzrlxdh(String wygsfzrlxdh)
	{
		this.wygsfzrlxdh = wygsfzrlxdh;
	}
	public String getGllx()
	{
		return gllx;
	}
	public void setGllx(String gllx)
	{
		this.gllx = gllx;
	}
	public String getGlms()
	{
		return glms;
	}
	public void setGlms(String glms)
	{
		this.glms = glms;
	}
	public String getDms()
	{
		return dms;
	}
	public void setDms(String dms)
	{
		this.dms = dms;
	}
	public String getLds()
	{
		return lds;
	}
	public void setLds(String lds)
	{
		this.lds = lds;
	}
	public String getXqmj()
	{
		return xqmj;
	}
	public void setXqmj(String xqmj)
	{
		this.xqmj = xqmj;
	}
	public String getJlrq()
	{
		return jlrq;
	}
	public void setJlrq(String jlrq)
	{
		this.jlrq = jlrq;
	}
	public String getCxrq()
	{
		return cxrq;
	}
	public void setCxrq(String cxrq)
	{
		this.cxrq = cxrq;
	}
	public String getCxyy()
	{
		return cxyy;
	}
	public void setCxyy(String cxyy)
	{
		this.cxyy = cxyy;
	}
	public String getDjrxm()
	{
		return djrxm;
	}
	public void setDjrxm(String djrxm)
	{
		this.djrxm = djrxm;
	}
	public String getDjrjh()
	{
		return djrjh;
	}
	public void setDjrjh(String djrjh)
	{
		this.djrjh = djrjh;
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
	public String getDjsj()
	{
		return djsj;
	}
	public void setDjsj(String djsj)
	{
		this.djsj = djsj;
	}
	public String getCxbs()
	{
		return cxbs;
	}
	public void setCxbs(String cxbs)
	{
		this.cxbs = cxbs;
	}
	public String getGxsj()
	{
		return gxsj;
	}
	public void setGxsj(String gxsj)
	{
		this.gxsj = gxsj;
	}
	public String getGllxmc()
	{
		gllxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AFGL_GLLX", gllx);
		return gllxmc;
	}
	public void setGllxmc(String gllxmc)
	{
		this.gllxmc = gllxmc;
	}
	public String getGlmsmc()
	{
		glmsmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_GLMS", glms);
		return glmsmc;
	}
	public void setGlmsmc(String glmsmc)
	{
		this.glmsmc = glmsmc;
	}
	public String getCxbsmc()
	{
		cxbsmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZXBS", cxbs);
		if ("0".equals(cxbs))
		{
			cxbsmc = "<font color=='red'>" + cxbsmc + "</font>";
		}
		return cxbsmc;
	}
	public void setCxbsmc(String cxbsmc)
	{
		this.cxbsmc = cxbsmc;
	}
	
}
