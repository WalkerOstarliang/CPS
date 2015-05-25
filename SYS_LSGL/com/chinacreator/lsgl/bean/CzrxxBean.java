package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class CzrxxBean extends BaseValue
{
	
	/**
	 * 
	 */
	private static final long	serialVersionUID	= -3695021696864283735L;
	private String id;	//主键ID
	private String czfwbh;	//出租房屋编号
	private String fwid;	//房屋ID
	private String czrbh;	//承租人编号
	private String czrzjzl;	//证件种类
	private String czrzjzlms;
	private String czrzjhm;	//证件号码
	private String xm;	//承租人姓名
	private String xb;	//承租人性别
	private String xbms;
	private String csrq;	//出生日期
	private String lxfs;	//联系方式
	private String czrq;	//承租日期
	private String czyt;	//承租用途
	private String czytms;
	private String zxrq;	//注销日期
	private String czrzt;	//1普通 2登记复杂人
	private String czrztms;
	private String zxyy;	//注销原因
	private String zxbs;	//注销标识
	private String zxbsms;
	private String ssxq;	//省市县区
	private String slrq;	//受理日期
	private String bz;	//备注
	private String sssqdm;	//所属社区代码
	private String djrxm;	//登记人姓名
	private String djdwdm;	//登记单位代码
	private String djdwmc;	//登记单位名称
	private String djrsfzh;	//登记人身份证号
	private String czrxm;	//操作人姓名
	private String czdwdm;	//操作单位代码
	private String czdwmc;	//操作单位名称
	private String czrsfzh;	//操作人身份证号
	private String zxrxm;	//注销人姓名
	private String zxdwdm;	//注销单位代码
	private String zxdwmc;	//注销单位名称
	private String zxrsfzh;	//注销人身份证号
	private String djsj;
	private String czsj;
	private String cz;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCzfwbh() {
		return czfwbh;
	}
	public void setCzfwbh(String czfwbh) {
		this.czfwbh = czfwbh;
	}
	public String getFwid() {
		return fwid;
	}
	public void setFwid(String fwid) {
		this.fwid = fwid;
	}
	public String getCzrbh() {
		return czrbh;
	}
	public void setCzrbh(String czrbh) {
		this.czrbh = czrbh;
	}
	public String getCzrzjzl() {
		return czrzjzl;
	}
	public void setCzrzjzl(String czrzjzl) {
		this.czrzjzl = czrzjzl;
	}
	public String getCzrzjhm() {
		return czrzjhm;
	}
	public void setCzrzjhm(String czrzjhm) {
		this.czrzjhm = czrzjhm;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getLxfs() {
		return lxfs;
	}
	public void setLxfs(String lxfs) {
		this.lxfs = lxfs;
	}
	public String getCzrq() {
		return czrq;
	}
	public void setCzrq(String czrq) {
		this.czrq = czrq;
	}
	public String getCzyt() {
		return czyt;
	}
	public void setCzyt(String czyt) {
		this.czyt = czyt;
	}
	public String getZxrq() {
		return zxrq;
	}
	public void setZxrq(String zxrq) {
		this.zxrq = zxrq;
	}
	public String getCzrzt() {
		return czrzt;
	}
	public void setCzrzt(String czrzt) {
		this.czrzt = czrzt;
	}
	public String getZxyy() {
		return zxyy;
	}
	public void setZxyy(String zxyy) {
		this.zxyy = zxyy;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getSsxq() {
		return ssxq;
	}
	public void setSsxq(String ssxq) {
		this.ssxq = ssxq;
	}
	public String getSlrq() {
		return slrq;
	}
	public void setSlrq(String slrq) {
		this.slrq = slrq;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getSssqdm() {
		return sssqdm;
	}
	public void setSssqdm(String sssqdm) {
		this.sssqdm = sssqdm;
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
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getCzrxm() {
		return czrxm;
	}
	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}
	public String getCzdwdm() {
		return czdwdm;
	}
	public void setCzdwdm(String czdwdm) {
		this.czdwdm = czdwdm;
	}
	public String getCzdwmc() {
		return czdwmc;
	}
	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}
	public String getCzrsfzh() {
		return czrsfzh;
	}
	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
	}
	public String getZxrxm() {
		return zxrxm;
	}
	public void setZxrxm(String zxrxm) {
		this.zxrxm = zxrxm;
	}
	public String getZxdwdm() {
		return zxdwdm;
	}
	public void setZxdwdm(String zxdwdm) {
		this.zxdwdm = zxdwdm;
	}
	public String getZxdwmc() {
		return zxdwmc;
	}
	public void setZxdwmc(String zxdwmc) {
		this.zxdwmc = zxdwmc;
	}
	public String getZxrsfzh() {
		return zxrsfzh;
	}
	public void setZxrsfzh(String zxrsfzh) {
		this.zxrsfzh = zxrsfzh;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getCzsj() {
		return czsj;
	}
	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}
	public String getCz() {
		StringBuffer sb = new StringBuffer();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(loginInfo.getOrgcode().equals(djdwdm)){
			sb.append("<span onclick=\"logout("+id+")\" style=\"color:green\" class=\"cps_span_href\">注销</span>&nbsp;");
		}
		cz = sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getCzrzjzlms() {
		czrzjzlms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", czrzjzl);
		return czrzjzlms;
	}
	public void setCzrzjzlms(String czrzjzlms) {
		this.czrzjzlms = czrzjzlms;
	}
	public String getXbms() {
		xbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		return xbms;
	}
	public void setXbms(String xbms) {
		this.xbms = xbms;
	}
	public String getCzytms() {
		czytms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_CZYT", czyt);
		return czytms;
	}
	public void setCzytms(String czytms) {
		this.czytms = czytms;
	}
	public String getCzrztms() {
		czrztms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_CZRZT", czrzt);
		return czrztms;
	}
	public void setCzrztms(String czrztms) {
		this.czrztms = czrztms;
	}
	public String getZxbsms() {
		zxbsms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZXBS", zxbs);
		return zxbsms;
	}
	public void setZxbsms(String zxbsms) {
		this.zxbsms = zxbsms;
	}
	
}
