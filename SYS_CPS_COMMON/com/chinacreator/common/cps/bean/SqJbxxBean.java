package com.chinacreator.common.cps.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * CPS 社区基本信息
 * @author mingchun.xiong
 *
 */
public class SqJbxxBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2811212395829705024L;
	
	private String sqbh;
	private String sqmc;
	private String ssxzqh;
	private String ssxzqhmc;
	private String ssjdxz;
	private String ssjdxzmc;
	private String jdxzfzr;
	private String jdxzfzrdh;
	private String gxsqjwsdm;
	private String gxsqjwsmc;
	private String djrxm;
	private String djrjh;
	private String djdwdm;
	private String djdwmc;
	private String djsj;
	private String zxbs;
	private String zxsj;
	private String zxyy;
	private String sqmjxm;
	private String sqmjlxdh;
	private String sspcsdm;
	private String sspcsmc;
	private String sqlx;
	private String sqlxmc;
	
	public String getSqbh() {
		return sqbh;
	}
	public void setSqbh(String sqbh) {
		this.sqbh = sqbh;
	}
	public String getSqmc() {
		return sqmc;
	}
	public void setSqmc(String sqmc) {
		this.sqmc = sqmc;
	}
	public String getSsxzqh() {
		return ssxzqh;
	}
	public void setSsxzqh(String ssxzqh) {
		this.ssxzqh = ssxzqh;
	}
	public String getSsjdxz() {
		return ssjdxz;
	}
	public void setSsjdxz(String ssjdxz) {
		this.ssjdxz = ssjdxz;
	}
	public String getJdxzfzr() {
		return jdxzfzr;
	}
	public void setJdxzfzr(String jdxzfzr) {
		this.jdxzfzr = jdxzfzr;
	}
	public String getJdxzfzrdh() {
		return jdxzfzrdh;
	}
	public void setJdxzfzrdh(String jdxzfzrdh) {
		this.jdxzfzrdh = jdxzfzrdh;
	}
	public String getGxsqjwsdm() {
		return gxsqjwsdm;
	}
	public void setGxsqjwsdm(String gxsqjwsdm) {
		this.gxsqjwsdm = gxsqjwsdm;
	}
	
	public String getGxsqjwsmc() {
		if (ValidateHelper.isEmptyString(gxsqjwsmc))
		{
			gxsqjwsmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(gxsqjwsdm);
		}
		return gxsqjwsmc;
	}
	public void setGxsqjwsmc(String gxsqjwsmc) {
		this.gxsqjwsmc = gxsqjwsmc;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}
	public String getDjdwdm() {
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}
	public String getDjdwmc() {
		return djdwmc;
	}
	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getZxsj() {
		return zxsj;
	}
	public void setZxsj(String zxsj) {
		this.zxsj = zxsj;
	}
	public String getZxyy() {
		return zxyy;
	}
	public void setZxyy(String zxyy) {
		this.zxyy = zxyy;
	}
	public String getSqmjxm() {
		return sqmjxm;
	}
	public void setSqmjxm(String sqmjxm) {
		this.sqmjxm = sqmjxm;
	}
	public String getSqmjlxdh() {
		return sqmjlxdh;
	}
	public void setSqmjlxdh(String sqmjlxdh) {
		this.sqmjlxdh = sqmjlxdh;
	}
	public String getSspcsdm() {
		return sspcsdm;
	}
	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}
	public String getSspcsmc() {
		sspcsmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(sspcsdm);
		return sspcsmc;
	}
	public void setSspcsmc(String sspcsmc) {
		this.sspcsmc = sspcsmc;
	}
	public String getSqlx() {
		return sqlx;
	}
	public void setSqlx(String sqlx) {
		this.sqlx = sqlx;
	}
	public String getSsxzqhmc() {
		ssxzqhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", ssxzqh);
		return ssxzqhmc;
	}
	public void setSsxzqhmc(String ssxzqhmc) {
		this.ssxzqhmc = ssxzqhmc;
	}
	public String getSsjdxzmc() {
		ssjdxzmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.HN_XZQH, ssjdxz);
		return ssjdxzmc;
	}
	public void setSsjdxzmc(String ssjdxzmc) {
		this.ssjdxzmc = ssjdxzmc;
	}
	public String getSqlxmc() {
		sqlxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("SQLX", sqlx);
		return sqlxmc;
	}
	public void setSqlxmc(String sqlxmc) {
		this.sqlxmc = sqlxmc;
	}
	
	
}
