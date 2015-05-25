package com.chinacreator.common.cps.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;

public class UserLxfsBean  {
	private String id;	//主键ID
	private String userid;	//用户id
	private String xm;
	private String username;	//用户名（警号）
	private String sfzh;	//身份证
	private String mobile;	//手机号码
	private String telephone;	//电话号码
	private String orgdwdm;
	private String orgdwmc;
	private String cz;
	private String mz;  //民族
	private String whcd;  //文化程度
	private String gzgw;  //工作岗位（社区民警需填写警务室名称）
	private String gzgwms;  
	private String zw;  //职务
	private String zwms;
	private String xzjb;  //行政级别
	private String gzsj;  //工作时间
	private String cjsj;  //从警时间
	private String pcsgzsj;  //派出所工作时间
	private String sfzzsqmj;  //是否专职社区民警
	private String sqmjsfcwhjz;  //社区民警是否村（居）委会兼职
	private String cssqjwsj;  //从事社区警务时间
	private String dnjlcs;  //当年奖励次数
	private String dncccs;  //当年惩处次数
	private String dnjzywpxcs;  //当年集中业务培训次数
	/**
	 * 是否驻村民警
	 */
	private String sfzcmj;
	
	private String lbqxcjsj;
	
	private String leve;
	
	public String getSfzcmj() {
		return sfzcmj;
	}
	public void setSfzcmj(String sfzcmj) {
		this.sfzcmj = sfzcmj;
	}
	private String hjsj;
	private String hjqk;
	private String bz;
	
	
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getHjsj() {
		return hjsj;
	}
	public void setHjsj(String hjsj) {
		this.hjsj = hjsj;
	}
	public String getHjqk() {
		return hjqk;
	}
	public void setHjqk(String hjqk) {
		this.hjqk = hjqk;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getOrgdwdm() {
		return orgdwdm;
	}
	public void setOrgdwdm(String orgdwdm) {
		this.orgdwdm = orgdwdm;
	}
	public String getOrgdwmc() {
		return orgdwmc;
	}
	public void setOrgdwmc(String orgdwmc) {
		this.orgdwmc = orgdwmc;
	}
	public String getCz()
	{
		cz = "";
		cz += "<span  onclick=\"openLxfsPage('" + id + "','" + userid +"', 'update')\" style=\"color:green\" class=\"cps_span_href\">修改</span>";
		cz += "&nbsp;<span  onclick=\"openLxfsPage('" + id + "','" + userid +"', 'detail')\"  style=\"color:green\" class=\"cps_span_href\">详情</span>";
		return cz;
	}
	public void setCz(String cz)
	{
		this.cz = cz;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getWhcd() {
		return whcd;
	}
	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}
	public String getGzgw() {
		return gzgw;
	}
	public void setGzgw(String gzgw) {
		this.gzgw = gzgw;
	}
	public String getZw() {
		return zw;
	}
	public void setZw(String zw) {
		this.zw = zw;
	}
	public String getXzjb() {
		return xzjb;
	}
	public void setXzjb(String xzjb) {
		this.xzjb = xzjb;
	}
	public String getGzsj() {
		return gzsj;
	}
	public void setGzsj(String gzsj) {
		this.gzsj = gzsj;
	}
	public String getCjsj() {
		return cjsj;
	}
	public void setCjsj(String cjsj) {
		this.cjsj = cjsj;
	}
	public String getPcsgzsj() {
		return pcsgzsj;
	}
	public void setPcsgzsj(String pcsgzsj) {
		this.pcsgzsj = pcsgzsj;
	}
	public String getSfzzsqmj() {
		return sfzzsqmj;
	}
	public void setSfzzsqmj(String sfzzsqmj) {
		this.sfzzsqmj = sfzzsqmj;
	}
	public String getSqmjsfcwhjz() {
		return sqmjsfcwhjz;
	}
	public void setSqmjsfcwhjz(String sqmjsfcwhjz) {
		this.sqmjsfcwhjz = sqmjsfcwhjz;
	}
	public String getCssqjwsj() {
		return cssqjwsj;
	}
	public void setCssqjwsj(String cssqjwsj) {
		this.cssqjwsj = cssqjwsj;
	}
	public String getDnjlcs() {
		return dnjlcs;
	}
	public void setDnjlcs(String dnjlcs) {
		this.dnjlcs = dnjlcs;
	}
	public String getDncccs() {
		return dncccs;
	}
	public void setDncccs(String dncccs) {
		this.dncccs = dncccs;
	}
	public String getDnjzywpxcs() {
		return dnjzywpxcs;
	}
	public void setDnjzywpxcs(String dnjzywpxcs) {
		this.dnjzywpxcs = dnjzywpxcs;
	}
	public String getZwms() {
		zwms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZW", zw);
		return zwms;
	}
	public void setZwms(String zwms) {
		this.zwms = zwms;
	}
	public String getGzgwms() {
		gzgwms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_GZGW", gzgw);
		return gzgwms;
	}
	public void setGzgwms(String gzgwms) {
		this.gzgwms = gzgwms;
	}
	public String getLbqxcjsj()
	{
		return lbqxcjsj;
	}
	public void setLbqxcjsj(String lbqxcjsj)
	{
		this.lbqxcjsj = lbqxcjsj;
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
