package com.chinacreator.gzgl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
/**
 * 耳目信息员信息
 */
public class ErmxxBean extends RkJbxxBean{
	private static final long serialVersionUID = -8604916811660275301L;
	
	private String zaembh; //治安耳目编号
	private String xxyrylb;   //人员类别
	private String xxyrylbmc;
	private String gzdw;   //工作单位
	private String zy;     //职业
	private String zymc;
	private String qkqk;   //前科情况
	private String grjl;   //个人简历
	private String jtjsh;  //家庭及社会关系
	private String sxzzqk;  //思想政治情况
	private String qysj;    //启用时间
	private String tysj;    //停用时间
	private String glsymj;  //管理使用民警
	private String glsymjjh;
	private String glsymjdwdm;
	private String glsymjdwmc;
	private String tzsyszyj;  //停止使用所长意见
	private String tzsyyy;    //停止使用原因
	private String xsbx;      //现实表现
	private String wjrxm;     //物件人姓名
	private String wjsj;      //物件时间
	private String wjryj;     //物件人意见
	private String ldxm;      //领导姓名
	private String ldszdwdm;   //领导所在单位代码
	private String ldszdwmc;   //领导所在单位名称
	private String ldshsj;     //领导审核时间
	private String ldyj;       //领导意见
	private String djrxm;  
	private String djmjjh;
	private String djsj;
	private String djdwdm;
	private String djdwmc;
	private String cz;
	private String qyzt;
	private String qyztmc;
	private String djrsfzh;
	
	/**
	 * 性别名称
	 */
	private String xbmc;
	
	/**
	 * 操作人姓名
	 */
	private String czrxm;
	
	/**
	 * 操作人警号
	 */
	private String czrjh;
	
	/**
	 * 操作时间
	 */
	private String czsj;
	
	/**
	 * 操作单位代码
	 */
	private String czdwdm;
	
	/**
	 * 操作单位名称
	 */
	private String czdwmc;
	
	/**
	 * 操作人身份证
	 */
	private String czrsfzh;
	
	/**
	 * 奖励记载
	 */
	private String jljz;
	
	/**
	 * 反映情况简要记载
	 */
	private String fyqkjyjz;
	
	/**
	 * 备注
	 */
	private String bz;
	
	/**
	 * 操作标识
	 */
	private String czbs;
	
	/**
	 * 所属单位代码
	 */
	private String ssdwdm;
	
	/**
	 * 所属单位名称
	 */
	private String ssdwmc;
	
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getZaembh() {
		return zaembh;
	}
	public void setZaembh(String zaembh) {
		this.zaembh = zaembh;
	}
	
	public String getXbmc() {
		if(ValidateHelper.isNotEmptyString(getXb())){
			xbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", getXb());
		}
		return xbmc;
	}
	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}
	public String getGzdw() {
		return gzdw;
	}
	public void setGzdw(String gzdw) {
		this.gzdw = gzdw;
	}
	public String getZy() {
		return zy;
	}
	public void setZy(String zy) {
		this.zy = zy;
	}
	
	public String getZymc() {
		zymc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_RY_ZY", zy);
		return zymc;
	}
	public void setZymc(String zymc) {
		this.zymc = zymc;
	}
	public String getQkqk() {
		return qkqk;
	}
	public void setQkqk(String qkqk) {
		this.qkqk = qkqk;
	}
	public String getGrjl() {
		return grjl;
	}
	public void setGrjl(String grjl) {
		this.grjl = grjl;
	}
	public String getJtjsh() {
		return jtjsh;
	}
	public void setJtjsh(String jtjsh) {
		this.jtjsh = jtjsh;
	}
	public String getSxzzqk() {
		return sxzzqk;
	}
	public void setSxzzqk(String sxzzqk) {
		this.sxzzqk = sxzzqk;
	}
	public String getQysj() {
		return qysj;
	}
	public void setQysj(String qysj) {
		this.qysj = qysj;
	}
	public String getTysj() {
		return tysj;
	}
	public void setTysj(String tysj) {
		this.tysj = tysj;
	}
	public String getGlsymj() {
		return glsymj;
	}
	public void setGlsymj(String glsymj) {
		this.glsymj = glsymj;
	}
	public String getTzsyszyj() {
		return tzsyszyj;
	}
	public void setTzsyszyj(String tzsyszyj) {
		this.tzsyszyj = tzsyszyj;
	}
	public String getTzsyyy() {
		return tzsyyy;
	}
	public void setTzsyyy(String tzsyyy) {
		this.tzsyyy = tzsyyy;
	}
	public String getXsbx() {
		return xsbx;
	}
	public void setXsbx(String xsbx) {
		this.xsbx = xsbx;
	}
	public String getWjrxm() {
		return wjrxm;
	}
	public void setWjrxm(String wjrxm) {
		this.wjrxm = wjrxm;
	}
	public String getWjsj() {
		return wjsj;
	}
	public void setWjsj(String wjsj) {
		this.wjsj = wjsj;
	}
	public String getWjryj() {
		return wjryj;
	}
	public void setWjryj(String wjryj) {
		this.wjryj = wjryj;
	}
	public String getLdxm() {
		return ldxm;
	}
	public void setLdxm(String ldxm) {
		this.ldxm = ldxm;
	}
	public String getLdszdwdm() {
		return ldszdwdm;
	}
	public void setLdszdwdm(String ldszdwdm) {
		this.ldszdwdm = ldszdwdm;
	}
	public String getLdszdwmc() {
		return ldszdwmc;
	}
	public void setLdszdwmc(String ldszdwmc) {
		this.ldszdwmc = ldszdwmc;
	}
	public String getLdshsj() {
		return ldshsj;
	}
	public void setLdshsj(String ldshsj) {
		this.ldshsj = ldshsj;
	}
	public String getLdyj() {
		return ldyj;
	}
	public void setLdyj(String ldyj) {
		this.ldyj = ldyj;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
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
	public String getGlsymjjh() {
		return glsymjjh;
	}
	public void setGlsymjjh(String glsymjjh) {
		this.glsymjjh = glsymjjh;
	}
	public String getGlsymjdwdm() {
		return glsymjdwdm;
	}
	public void setGlsymjdwdm(String glsymjdwdm) {
		this.glsymjdwdm = glsymjdwdm;
	}
	public String getGlsymjdwmc() {
		return glsymjdwmc;
	}
	public void setGlsymjdwmc(String glsymjdwmc) {
		this.glsymjdwmc = glsymjdwmc;
	}
	public String getCz() 
	{
		StringBuffer sb = new StringBuffer();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		sb.append("<span onclick=\"toAddXxyPage('detail','").append(zaembh).append("')\" style=\"color:green\"  class=\"cps_span_href\">详情</span>&nbsp;");
		if (loginInfo.getOrgcode().equals(djdwdm))
		{
			sb.append("<span onclick=\"toAddXxyPage('update','").append(zaembh).append("')\" style=\"color:green\"  class=\"cps_span_href\">修改</span>&nbsp;");
			if ("1".equals(qyzt))
			{
				sb.append("<span onclick=\"zxZaemxx('" + zaembh + "')\" style=\"color:green\" class=\"cps_span_href\">注销</span>&nbsp;");
			}
		}
		cz = sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getDjmjjh() {
		return djmjjh;
	}
	public void setDjmjjh(String djmjjh) {
		this.djmjjh = djmjjh;
	}
	public String getQyzt() {
		return qyzt;
	}
	public void setQyzt(String qyzt) {
		this.qyzt = qyzt;
	}
	public String getQyztmc() {
		if("1".equals(qyzt)){
			qyztmc = "启用";
		}else{
			qyztmc = "停用";
		}
		return qyztmc;
	}
	public void setQyztmc(String qyztmc) {
		this.qyztmc = qyztmc;
	}
	public String getXxyrylb() {
		return xxyrylb;
	}
	public void setXxyrylb(String xxyrylb) {
		this.xxyrylb = xxyrylb;
	}
	public String getXxyrylbmc() {
		xxyrylbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GZGL_XXY_RYLB", xxyrylb);
		return xxyrylbmc;
	}
	public void setXxyrylbmc(String xxyrylbmc) {
		this.xxyrylbmc = xxyrylbmc;
	}
	public String getCzrxm() {
		return czrxm;
	}
	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}
	public String getCzrjh() {
		return czrjh;
	}
	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
	}
	public String getCzsj() {
		return czsj;
	}
	public void setCzsj(String czsj) {
		this.czsj = czsj;
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
	public String getJljz() {
		return jljz;
	}
	public void setJljz(String jljz) {
		this.jljz = jljz;
	}
	public String getFyqkjyjz() {
		return fyqkjyjz;
	}
	public void setFyqkjyjz(String fyqkjyjz) {
		this.fyqkjyjz = fyqkjyjz;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getSsdwdm() {
		return ssdwdm;
	}
	public void setSsdwdm(String ssdwdm) {
		this.ssdwdm = ssdwdm;
	}
	public String getSsdwmc() {
		return ssdwmc;
	}
	public void setSsdwmc(String ssdwmc) {
		this.ssdwmc = ssdwmc;
	}
}
