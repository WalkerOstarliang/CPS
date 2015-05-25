package com.chinacreator.afgl.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 社区干部信息
 * @author mingchun.xiong
 *
 */
public class SqgbxxBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -3576945903209877640L;
	
	private String gbbh;
	private String sssqbh;
	private String gbxm;
	private String gbxb;
	private String gbxbmc;
	private String gbsfzh;
	private String gbcsrq;
	private String gblxdh;
	private String gbzzmm;
	private String gbzw;
	private String[] gbzws;
	private String gbzwmc;
	private String gbhjdqh;
	private String gbhjdqhmc;
	private String gbxzdxz;
	private String gbdrsj;
	private String gbdcsj;
	private String djrxm;
	private String djrjh;
	private String djdwdm;
	private String djdwmc;
	private String djsj;
	private String sssqmc;
	private String ssjwhbh;
	private String ssjwhmc;
	private String zxbs;
	private String zxsj;
	private String zxyy;
	private String bz;
	private String sfdl;
	private String sfdlms;
	private String djrsfzh;
	private String whcd;
	private String whcdms;
	private String sqlxdh;
	private String lx;
	
	public String getGbbh() {
		return gbbh;
	}
	public void setGbbh(String gbbh) {
		this.gbbh = gbbh;
	}
	public String getSssqbh() {
		return sssqbh;
	}
	public void setSssqbh(String sssqbh) {
		this.sssqbh = sssqbh;
	}
	public String getGbxm() {
		return gbxm;
	}
	public void setGbxm(String gbxm) {
		this.gbxm = gbxm;
	}
	public String getGbxb() {
		return gbxb;
	}
	public void setGbxb(String gbxb) {
		this.gbxb = gbxb;
	}
	public String getGbsfzh() {
		return gbsfzh;
	}
	public void setGbsfzh(String gbsfzh) {
		this.gbsfzh = gbsfzh;
	}
	public String getGbcsrq() {
		return gbcsrq;
	}
	public void setGbcsrq(String gbcsrq) {
		this.gbcsrq = gbcsrq;
	}
	public String getGblxdh() {
		return gblxdh;
	}
	public void setGblxdh(String gblxdh) {
		this.gblxdh = gblxdh;
	}
	public String getGbzzmm() {
		return gbzzmm;
	}
	public void setGbzzmm(String gbzzmm) {
		this.gbzzmm = gbzzmm;
	}
	
	public String getGbhjdqh() {
		return gbhjdqh;
	}
	public void setGbhjdqh(String gbhjdqh) {
		this.gbhjdqh = gbhjdqh;
	}
	public String getGbxzdxz() {
		return gbxzdxz;
	}
	public void setGbxzdxz(String gbxzdxz) {
		this.gbxzdxz = gbxzdxz;
	}
	public String getGbdrsj() {
		return gbdrsj;
	}
	public void setGbdrsj(String gbdrsj) {
		this.gbdrsj = gbdrsj;
	}
	public String getGbdcsj() {
		return gbdcsj;
	}
	public void setGbdcsj(String gbdcsj) {
		this.gbdcsj = gbdcsj;
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
	public String getSssqmc() {
		return sssqmc;
	}
	public void setSssqmc(String sssqmc) {
		this.sssqmc = sssqmc;
	}
	public String getSsjwhbh() {
		return ssjwhbh;
	}
	public void setSsjwhbh(String ssjwhbh) {
		this.ssjwhbh = ssjwhbh;
	}
	public String getSsjwhmc() {
		return ssjwhmc;
	}
	public void setSsjwhmc(String ssjwhmc) {
		this.ssjwhmc = ssjwhmc;
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
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getGbzw() {
		return gbzw;
	}
	public void setGbzw(String gbzw) {
		this.gbzw = gbzw;
	}
	public String[] getGbzws()
	{
		if (ValidateHelper.isNotEmptyString(gbzw))
		{
			gbzws = gbzw.split(",");
		}
		return gbzws;
	}
	public void setGbzws(String[] gbzws)
	{
		StringBuffer sb = new StringBuffer();
		if (ValidateHelper.isNotEmptyArray(gbzws))
		{
			for (String zw : gbzws)
			{
				sb.append(zw + ",");
			}
		}
		if (sb.toString().endsWith(","))
		{
			gbzw = sb.toString().substring(0, sb.toString().length() - 1);
		}
		this.gbzws = gbzws;
	}
	public String getGbxbmc() {
		gbxbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", gbxb);
		return gbxbmc;
	}
	public void setGbxbmc(String gbxbmc) {
		this.gbxbmc = gbxbmc;
	}
	public String getGbzwmc() {
		List<String> zwlist = new ArrayList<String>();
		if (getGbzws() != null)
		{
			for (String zw : getGbzws())
			{
				String zwmc = "";
				if("1".equals(lx)){
					zwmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("SQGBZW", zw);
				}else if("2".equals(lx)){
					zwmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_XQZGBZW", zw);
				}else if("3".equals(lx)){
					zwmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_JDGB_ZW", zw);
				}
				zwlist.add(zwmc);
			}
		}
		gbzwmc = zwlist.toString().replace("[", "").replace("]", "");
		return gbzwmc;
	}
	public void setGbzwmc(String gbzwmc) {
		this.gbzwmc = gbzwmc;
	}
	public String getSfdl() {
		return sfdl;
	}
	public void setSfdl(String sfdl) {
		this.sfdl = sfdl;
	}
	public String getGbhjdqhmc() {
		gbhjdqhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", gbhjdqh);
		return gbhjdqhmc;
	}
	public void setGbhjdqhmc(String gbhjdqhmc) {
		this.gbhjdqhmc = gbhjdqhmc;
	}
	public String getSfdlms()
	{
		sfdlms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("RYSFDL", sfdl);
		return sfdlms;
	}
	public void setSfdlms(String sfdlms)
	{
		this.sfdlms = sfdlms;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getWhcd()
	{
		return whcd;
	}
	public void setWhcd(String whcd)
	{
		this.whcd = whcd;
	}
	public String getWhcdms()
	{
		whcdms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_WHCD", whcd);
		return whcdms;
	}
	public void setWhcdms(String whcdms)
	{
		this.whcdms = whcdms;
	}
	public String getSqlxdh()
	{
		return sqlxdh;
	}
	public void setSqlxdh(String sqlxdh)
	{
		this.sqlxdh = sqlxdh;
	}
	public String getLx() {
		return lx;
	}
	public void setLx(String lx) {
		this.lx = lx;
	}
}
