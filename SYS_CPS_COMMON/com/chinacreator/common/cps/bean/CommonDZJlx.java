package com.chinacreator.common.cps.bean;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class CommonDZJlx extends QueryBean{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8735277106039270640L;
	private String id;          //主键
	private String dm;			//街路巷代码
	private String mc;			//街路巷名称
	private String ssxzqh;		//所属性质区划
	private String ssxzqhmc;	
	private String djrxm;		//登记人姓名
	private String djdwdm;		//登记单位代码
	private String djdwmc;		//登记单位名称
	private String isvalid;     //是否有效
	private String jlxpy;       //拼音
	private String sssqdm;
	private String bslx;		//标示类型
	private String jc;
	
	private String cz;
	
	private String djsj;
	private String djrjh;
	private String djrsfzh;
	private String sfmzmm;
	private String sfmzmmms;
	
	
	public String getSfmzmm() {
		return sfmzmm;
	}
	public void setSfmzmm(String sfmzmm) {
		this.sfmzmm = sfmzmm;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDm() {
		return dm;
	}
	public void setDm(String dm) {
		this.dm = dm;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getSsxzqh() {
		return ssxzqh;
	}
	public void setSsxzqh(String ssxzqh) {
		this.ssxzqh = ssxzqh;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
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
	public String getJlxpy() {
		return jlxpy;
	}
	public void setJlxpy(String jlxpy) {
		this.jlxpy = jlxpy;
	}
	public String getIsvalid() {
		return isvalid;
	}
	public void setIsvalid(String isvalid) {
		this.isvalid = isvalid;
	}
	public String getSsxzqhmc() {
		ssxzqhmc =  DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", ssxzqh);
		return ssxzqhmc;
	}
	public void setSsxzqhmc(String ssxzqhmc) {
		this.ssxzqhmc = ssxzqhmc;
	}
	public String getSssqdm()
	{
		return sssqdm;
	}
	public void setSssqdm(String sssqdm)
	{
		this.sssqdm = sssqdm;
	}
	public String getBslx()
	{
		return bslx;
	}
	public void setBslx(String bslx)
	{
		this.bslx = bslx;
	}
	public String getCz() {
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"openJlxWin('detail','" + id+"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		sb.append("<span onclick=\"openJlxWin('update','" + id+"')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
		sb.append("<span onclick=\"deteleJlx('" + id+"')\" style=\"color:green\" class=\"cps_span_href\">注销</span>");
		cz=sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getSfmzmmms() {
		sfmzmmms =  DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZDSF", sfmzmm);
		return sfmzmmms;
	}
	public void setSfmzmmms(String sfmzmmms) {
		this.sfmzmmms = sfmzmmms;
	}
	public String getJc()
	{
		return jc;
	}
	public void setJc(String jc)
	{
		this.jc = jc;
	}
	
}
