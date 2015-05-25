package com.chinacreator.afgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class AfXldRyxxBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -7201595416142818746L;
	
	private String xldybh;
	private String xldbh;
	private String xldmc;
	private String xldyxm;
	private String xldyxb;
	private String xldyxbmc;
	private String xldysfzh;
	private String xldycsrq;
	private String xldyhjdxz;
	private String xldyxzdxz;
	private String xldylxdh;
	private String sgrq;
	private String tcrq;
	private String zgzt;
	private String zgztmc;
	private String bz;
	private String djrxm;
	private String djrjh;
	private String djdwdm;
	private String djdwmc;
	private String djsj;
	private String gxsj;
	private String djrsfzh;
	
	private String bwzw;
	private String sfftjzry;
	private String zzhjz;
	private String dwdh;
	private String zzdh;
	private String tc;
	private String jlqk;
	private String grjl;
	private String jtcy;
	private String xzzw;
	
	
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getXldybh() {
		return xldybh;
	}
	public void setXldybh(String xldybh) {
		this.xldybh = xldybh;
	}
	public String getXldbh() {
		return xldbh;
	}
	public void setXldbh(String xldbh) {
		this.xldbh = xldbh;
	}
	public String getXldyxm() {
		return xldyxm;
	}
	public void setXldyxm(String xldyxm) {
		this.xldyxm = xldyxm;
	}
	public String getXldyxb() {
		return xldyxb;
	}
	public void setXldyxb(String xldyxb) {
		this.xldyxb = xldyxb;
	}
	public String getXldysfzh() {
		return xldysfzh;
	}
	public void setXldysfzh(String xldysfzh) {
		this.xldysfzh = xldysfzh;
	}
	public String getXldycsrq() {
		return xldycsrq;
	}
	public void setXldycsrq(String xldycsrq) {
		this.xldycsrq = xldycsrq;
	}
	 
	public String getXldyhjdxz() {
		return xldyhjdxz;
	}
	public void setXldyhjdxz(String xldyhjdxz) {
		this.xldyhjdxz = xldyhjdxz;
	}
	public String getXldyxzdxz() {
		return xldyxzdxz;
	}
	public void setXldyxzdxz(String xldyxzdxz) {
		this.xldyxzdxz = xldyxzdxz;
	}
	public String getXldylxdh() {
		return xldylxdh;
	}
	public void setXldylxdh(String xldylxdh) {
		this.xldylxdh = xldylxdh;
	}
	public String getSgrq() {
		return sgrq;
	}
	public void setSgrq(String sgrq) {
		this.sgrq = sgrq;
	}
	public String getTcrq() {
		return tcrq;
	}
	public void setTcrq(String tcrq) {
		this.tcrq = tcrq;
	}
	public String getZgzt() {
		return zgzt;
	}
	public void setZgzt(String zgzt) {
		this.zgzt = zgzt;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
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
	public String getGxsj() {
		return gxsj;
	}
	public void setGxsj(String gxsj) {
		this.gxsj = gxsj;
	}
	
	public String getXldyxbmc() {
		xldyxbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xldyxb);
		return xldyxbmc;
	}
	public void setXldyxbmc(String xldyxbmc) {
		this.xldyxbmc = xldyxbmc;
	}
	public String getXldmc() {
		return xldmc;
	}
	public void setXldmc(String xldmc) {
		this.xldmc = xldmc;
	}
	public String getZgztmc() {
		zgztmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_ZGZT", zgzt);
		return zgztmc;
	}
	public void setZgztmc(String zgztmc) {
		this.zgztmc = zgztmc;
	}
	public String getBwzw()
	{
		return bwzw;
	}
	public void setBwzw(String bwzw)
	{
		this.bwzw = bwzw;
	}
	public String getSfftjzry()
	{
		return sfftjzry;
	}
	public void setSfftjzry(String sfftjzry)
	{
		this.sfftjzry = sfftjzry;
	}
	public String getZzhjz()
	{
		return zzhjz;
	}
	public void setZzhjz(String zzhjz)
	{
		this.zzhjz = zzhjz;
	}
	public String getDwdh()
	{
		return dwdh;
	}
	public void setDwdh(String dwdh)
	{
		this.dwdh = dwdh;
	}
	public String getZzdh()
	{
		return zzdh;
	}
	public void setZzdh(String zzdh)
	{
		this.zzdh = zzdh;
	}
	public String getTc()
	{
		return tc;
	}
	public void setTc(String tc)
	{
		this.tc = tc;
	}
	public String getJlqk()
	{
		return jlqk;
	}
	public void setJlqk(String jlqk)
	{
		this.jlqk = jlqk;
	}
	public String getGrjl()
	{
		return grjl;
	}
	public void setGrjl(String grjl)
	{
		this.grjl = grjl;
	}
	public String getJtcy()
	{
		return jtcy;
	}
	public void setJtcy(String jtcy)
	{
		this.jtcy = jtcy;
	}
	public String getXzzw()
	{
		return xzzw;
	}
	public void setXzzw(String xzzw)
	{
		this.xzzw = xzzw;
	}
	
}
