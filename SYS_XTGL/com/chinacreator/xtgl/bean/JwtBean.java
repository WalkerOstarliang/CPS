package com.chinacreator.xtgl.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 警务通对象
 * 
 * @filename JwtBean.java
 * @author mingchun.xiong
 * @date Apr 17, 2014
 *
 */
public class JwtBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -4042128135248492038L;
	
	private String id;
	private String kc_jwqdm;
	private String kc_jwqmc;
	private String jcpt_jwqdm;
	private String jcpt_jwqmc;
	private String jh;
	private String xm;
	private String yxx;
	private String yxxms;
	private String zxrq;
	private String zxyy;
	private String jwthm;
	private String gxsj;
	private String czdwdm;
	private String czdwmc;
	private String czrxm;
	private String czrjh;
	private String czrsfzh;
	private String czsj;
	private String cjrdwdm;
    private String cjrdwmc;
    
	public String getKc_jwqdm()
	{
		return kc_jwqdm;
	}
	public void setKc_jwqdm(String kc_jwqdm)
	{
		this.kc_jwqdm = kc_jwqdm;
	}
	public String getKc_jwqmc()
	{
		return kc_jwqmc;
	}
	public void setKc_jwqmc(String kc_jwqmc)
	{
		this.kc_jwqmc = kc_jwqmc;
	}
	public String getJcpt_jwqdm()
	{
		return jcpt_jwqdm;
	}
	public void setJcpt_jwqdm(String jcpt_jwqdm)
	{
		this.jcpt_jwqdm = jcpt_jwqdm;
	}
	public String getJcpt_jwqmc()
	{
		return jcpt_jwqmc;
	}
	public void setJcpt_jwqmc(String jcpt_jwqmc)
	{
		this.jcpt_jwqmc = jcpt_jwqmc;
	}
	public String getJh()
	{
		return jh;
	}
	public void setJh(String jh)
	{
		this.jh = jh;
	}
	public String getXm()
	{
		return xm;
	}
	public void setXm(String xm)
	{
		this.xm = xm;
	}
	public String getYxx()
	{
		return yxx;
	}
	public void setYxx(String yxx)
	{
		this.yxx = yxx;
	}
	public String getZxrq()
	{
		return zxrq;
	}
	public void setZxrq(String zxrq)
	{
		this.zxrq = zxrq;
	}
	public String getZxyy()
	{
		return zxyy;
	}
	public void setZxyy(String zxyy)
	{
		this.zxyy = zxyy;
	}
	public String getJwthm()
	{
		return jwthm;
	}
	public void setJwthm(String jwthm)
	{
		this.jwthm = jwthm;
	}
	public String getGxsj()
	{
		return gxsj;
	}
	public void setGxsj(String gxsj)
	{
		this.gxsj = gxsj;
	}
	public String getCzdwdm()
	{
		return czdwdm;
	}
	public void setCzdwdm(String czdwdm)
	{
		this.czdwdm = czdwdm;
	}
	public String getCzdwmc()
	{
		return czdwmc;
	}
	public void setCzdwmc(String czdwmc)
	{
		this.czdwmc = czdwmc;
	}
	public String getCzrxm()
	{
		return czrxm;
	}
	public void setCzrxm(String czrxm)
	{
		this.czrxm = czrxm;
	}
	public String getCzrjh()
	{
		return czrjh;
	}
	public void setCzrjh(String czrjh)
	{
		this.czrjh = czrjh;
	}
	public String getCzrsfzh()
	{
		return czrsfzh;
	}
	public void setCzrsfzh(String czrsfzh)
	{
		this.czrsfzh = czrsfzh;
	}
	public String getCzsj()
	{
		return czsj;
	}
	public void setCzsj(String czsj)
	{
		this.czsj = czsj;
	}
	public String getCjrdwdm()
	{
		return cjrdwdm;
	}
	public void setCjrdwdm(String cjrdwdm)
	{
		this.cjrdwdm = cjrdwdm;
	}
	public String getCjrdwmc()
	{
		return cjrdwmc;
	}
	public void setCjrdwmc(String cjrdwmc)
	{
		this.cjrdwmc = cjrdwmc;
	}
	public String getYxxms()
	{
		if ("0".equals(yxx))
		{
			yxxms = "有效";
		}
		else
		{
			yxxms = "<font color='red'>无效</font>";
		}
		return yxxms;
	}
	public void setYxxms(String yxxms)
	{
		this.yxxms = yxxms;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	
}
