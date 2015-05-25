package com.chinacreator.common.cps.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 地址信息对象
 * 
 * @author mingchun.xiong
 * @date 2013-8-6
 */
public class DzxxBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 1621852086155656263L;
	private String dzid;
	private String dzbm;
	private String stmc;
	private String dzmc;
	private String sjxzqh;
	private String sjxzqhmc;
	private String ssxqdm;
	private String ssxqmc;
	private String jdxzdm;
	private String jdxzmc;
	private String sqdm;
	private String fsdz;
	/**
	 * 社区名称
	 */
	private String sqmc;
	private String jlxdm;
	private String jlxmc;
	private String mph;
	private String xqz;
	private String ldh;
	private String dyh;
	private String lch;
	private String fjh;
	private String dzxzb;
	private String dzyzb;
	private String dzjd;
	private String dzwd;
	private String djrxm;
	private String djrdwdm;
	private String djrdwmc;
	private String djsj;
	
	private String cz;

	public String getDzbm()
	{
		return dzbm;
	}
	public void setDzbm(String dzbm)
	{
		this.dzbm = dzbm;
	}
	public String getDzmc()
	{
		return dzmc;
	}
	public void setDzmc(String dzmc)
	{
		this.dzmc = dzmc;
	}
	public String getSsxqdm()
	{
		return ssxqdm;
	}
	public void setSsxqdm(String ssxqdm)
	{
		this.ssxqdm = ssxqdm;
	}
	public String getJdxzdm()
	{
		return jdxzdm;
	}
	public void setJdxzdm(String jdxzdm)
	{
		this.jdxzdm = jdxzdm;
	}
	public String getSqdm()
	{
		return sqdm;
	}
	public void setSqdm(String sqdm)
	{
		this.sqdm = sqdm;
	}
	public String getJlxdm()
	{
		return jlxdm;
	}
	public void setJlxdm(String jlxdm)
	{
		this.jlxdm = jlxdm;
	}
	public String getJlxmc()
	{
		return jlxmc;
	}
	public void setJlxmc(String jlxmc)
	{
		this.jlxmc = jlxmc;
	}
	public String getMph()
	{
		return mph;
	}
	public void setMph(String mph)
	{
		this.mph = mph;
	}
	public String getXqz()
	{
		return xqz;
	}
	public void setXqz(String xqz)
	{
		this.xqz = xqz;
	}
	public String getLdh()
	{
		return ldh;
	}
	public void setLdh(String ldh)
	{
		this.ldh = ldh;
	}
	public String getDyh()
	{
		return dyh;
	}
	public void setDyh(String dyh)
	{
		this.dyh = dyh;
	}
	public String getLch()
	{
		return lch;
	}
	public void setLch(String lch)
	{
		this.lch = lch;
	}
	public String getFjh()
	{
		return fjh;
	}
	public void setFjh(String fjh)
	{
		this.fjh = fjh;
	}
	public String getDzxzb()
	{
		return dzxzb;
	}
	public void setDzxzb(String dzxzb)
	{
		this.dzxzb = dzxzb;
	}
	public String getDzyzb()
	{
		return dzyzb;
	}
	public void setDzyzb(String dzyzb)
	{
		this.dzyzb = dzyzb;
	}
	public String getDzjd()
	{
		return dzjd;
	}
	public void setDzjd(String dzjd)
	{
		this.dzjd = dzjd;
	}
	public String getDzwd()
	{
		return dzwd;
	}
	public void setDzwd(String dzwd)
	{
		this.dzwd = dzwd;
	}
	public String getDjrxm()
	{
		return djrxm;
	}
	public void setDjrxm(String djrxm)
	{
		this.djrxm = djrxm;
	}
	public String getDjrdwdm()
	{
		return djrdwdm;
	}
	public void setDjrdwdm(String djrdwdm)
	{
		this.djrdwdm = djrdwdm;
	}
	public String getDjrdwmc()
	{
		return djrdwmc;
	}
	public void setDjrdwmc(String djrdwmc)
	{
		this.djrdwmc = djrdwmc;
	}
	public String getDjsj()
	{
		return djsj;
	}
	public void setDjsj(String djsj)
	{
		this.djsj = djsj;
	}
	public String getDzid()
	{
		return dzid;
	}
	public void setDzid(String dzid)
	{
		this.dzid = dzid;
	}
	public String getSjxzqh()
	{
		return sjxzqh;
	}
	public void setSjxzqh(String sjxzqh)
	{
		this.sjxzqh = sjxzqh;
	}
	
	public String getSjxzqhmc() {
		sjxzqhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", sjxzqh);
		return sjxzqhmc;
	}
	public void setSjxzqhmc(String sjxzqhmc) {
		this.sjxzqhmc = sjxzqhmc;
	}
	public String getSsxqmc()
	{
		ssxqmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", ssxqdm);
		return ssxqmc;
	}
	public void setSsxqmc(String ssxqmc)
	{
		this.ssxqmc = ssxqmc;
	}
	public String getJdxzmc()
	{
		jdxzmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.HN_XZQH, jdxzdm);
		return jdxzmc;
	}
	public void setJdxzmc(String jdxzmc)
	{
		this.jdxzmc = jdxzmc;
	}
	public String getSqmc()
	{
		sqmc =  DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.HN_XZQH, sqdm);
		return sqmc;
	}
	public void setSqmc(String sqmc)
	{
		this.sqmc = sqmc;
	}
	public String getStmc()
	{
		return stmc;
	}
	public void setStmc(String stmc)
	{
		this.stmc = stmc;
	}
	public String getCz() {
		StringBuffer sb = new StringBuffer();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		sb.append("<span onclick=\"openDzInfoWin('detail','" + dzid+"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		if (loginInfo.getOrgcode().equals(djrdwdm))
		{
			sb.append("<span onclick=\"openDzInfoWin('update','" + dzid +"')\" style=\"color:green\" class=\"cps_span_href\">核实登记</span>&nbsp;");
		}
		cz = sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getFsdz() {
		return fsdz;
	}
	public void setFsdz(String fsdz) {
		this.fsdz = fsdz;
	}
	
	
}
