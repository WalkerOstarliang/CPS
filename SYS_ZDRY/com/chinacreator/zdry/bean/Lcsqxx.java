package com.chinacreator.zdry.bean;


import java.util.Date;
import java.util.List;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(重点人口列控申请信息实体类)
 * @date Mar 5, 2013 5:16:01 PM
 */
public class Lcsqxx extends QueryBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3141913435554744929L;

	private Date jbsj;
	private String sqrxm;
	private String sqdwdm;
	private String sqdwmc;
	private String sqsqjwsmc;
	private String sqsqjwsdm;
	private String sqsj;
	private String id;
	private String sqxxbh;
	private String ysqxxbh;
	private String rybh;
	private String lgsqlx;
	private String zdrklx;
	private String sfzh;
	private String xm;
	private String xb;
	private String jtzz;
	private String lxdh;
	private String ajms;
	private String grjj;
	private String zywtjyj;
	private String lcgly;
	private Date lcgrq;
	private String sqzt;
	private String lgczt;
	private String jbshdwdm;
	private String jbshdwmc;
	
	private String xbmc;
	private String startDjsj;
	private String endDjsj;
	private String lgcztmc;
	private String toChar_lcgrq;
	private String zdrklxmc;
	
	private String toChar_jbsj;
	
	private String cz;
	
	private String txcz;
	
	private List<Gxr> gxrList;
	private List<Lksqlzxx> lksqlzxxList;
	

	public List<Lksqlzxx> getLksqlzxxList() {
		return lksqlzxxList;
	}

	public void setLksqlzxxList(List<Lksqlzxx> lksqlzxxList) {
		this.lksqlzxxList = lksqlzxxList;
	}

	public List<Gxr> getGxrList() {
		return gxrList;
	}

	public void setGxrList(List<Gxr> gxrList) {
		this.gxrList = gxrList;
	}

	public String getTxcz() {
		txcz = "<a href='#' onclick=\"openSpWindow('"+sqxxbh+"','"+lgsqlx+"');\">审核</a>&nbsp;";
		return txcz;
	}
	
	public void setTxcz(String txcz) {
		this.txcz = txcz;
	}

	public String getCz() {
		cz = "<a href='#' onclick=\"openKcWindow('"+sqxxbh+"');\" >查看详情</a>&nbsp;"
			+"<a href='#' onclick=\"openCkWindow('"+sqxxbh+"','"+lgczt+"');\">撤控申请</a>"; 
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getZdrklxmc() {
		zdrklxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.ZDRY_ZDLB_RYLX, zdrklx);
		return zdrklxmc;
	}

	public void setZdrklxmc(String zdrklxmc) {
		this.zdrklxmc = zdrklxmc;
	}

	public String getToChar_lcgrq() {
		toChar_lcgrq = DateTimeHelper.conver(lcgrq, "yyyy-MM-dd");
		return toChar_lcgrq;
	}

	public void setToChar_lcgrq(String toChar_lcgrq) {
		this.toChar_lcgrq = toChar_lcgrq;
	}

	public String getLgcztmc() {
		lgcztmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.ZDRY_ZDLB_LGZT, lgczt);
		return lgcztmc;
	}

	public void setLgcztmc(String lgcztmc) {
		this.lgcztmc = lgcztmc;
	}

	public String getStartDjsj() {
		return startDjsj;
	}

	public void setStartDjsj(String startDjsj) {
		this.startDjsj = startDjsj;
	}

	public String getEndDjsj() {
		return endDjsj;
	}

	public void setEndDjsj(String endDjsj) {
		this.endDjsj = endDjsj;
	}

	public String getXbmc() {
		xbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.ZDRY_ZDLB_XB, xb);
		return xbmc;
	}

	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}

	public Date getJbsj() {
		return jbsj;
	}

	public void setJbsj(Date jbsj) {
		this.jbsj = jbsj;
	}

	public String getSqrxm() {
		return sqrxm;
	}

	public void setSqrxm(String sqrxm) {
		this.sqrxm = sqrxm;
	}

	public String getSqdwdm() {
		return sqdwdm;
	}

	public void setSqdwdm(String sqdwdm) {
		this.sqdwdm = sqdwdm;
	}

	public String getSqdwmc() {
		return sqdwmc;
	}

	public void setSqdwmc(String sqdwmc) {
		this.sqdwmc = sqdwmc;
	}

	public String getSqsqjwsmc() {
		return sqsqjwsmc;
	}

	public void setSqsqjwsmc(String sqsqjwsmc) {
		this.sqsqjwsmc = sqsqjwsmc;
	}

	public String getSqsqjwsdm() {
		return sqsqjwsdm;
	}

	public void setSqsqjwsdm(String sqsqjwsdm) {
		this.sqsqjwsdm = sqsqjwsdm;
	}

	public String getSqsj() {
		return sqsj;
	}

	public void setSqsj(String sqsj) {
		this.sqsj = sqsj;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSqxxbh() {
		return sqxxbh;
	}

	public void setSqxxbh(String sqxxbh) {
		this.sqxxbh = sqxxbh;
	}

	public String getYsqxxbh() {
		return ysqxxbh;
	}

	public void setYsqxxbh(String ysqxxbh) {
		this.ysqxxbh = ysqxxbh;
	}

	public String getRybh() {
		return rybh;
	}

	public void setRybh(String rybh) {
		this.rybh = rybh;
	}

	public String getLgsqlx() {
		return lgsqlx;
	}

	public void setLgsqlx(String lgsqlx) {
		this.lgsqlx = lgsqlx;
	}

	public String getZdrklx() {
		return zdrklx;
	}

	public void setZdrklx(String zdrklx) {
		this.zdrklx = zdrklx;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
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

	public String getJtzz() {
		return jtzz;
	}

	public void setJtzz(String jtzz) {
		this.jtzz = jtzz;
	}

	public String getLxdh() {
		return lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getAjms() {
		return ajms;
	}

	public void setAjms(String ajms) {
		this.ajms = ajms;
	}

	public String getGrjj() {
		return grjj;
	}

	public void setGrjj(String grjj) {
		this.grjj = grjj;
	}

	public String getZywtjyj() {
		return zywtjyj;
	}

	public void setZywtjyj(String zywtjyj) {
		this.zywtjyj = zywtjyj;
	}

	public String getLcgly() {
		return lcgly;
	}

	public void setLcgly(String lcgly) {
		this.lcgly = lcgly;
	}

	public Date getLcgrq() {
		return lcgrq;
	}

	public void setLcgrq(Date lcgrq) {
		this.lcgrq = lcgrq;
	}

	public String getSqzt() {
		return sqzt;
	}

	public void setSqzt(String sqzt) {
		this.sqzt = sqzt;
	}

	public String getLgczt() {
		return lgczt;
	}

	public void setLgczt(String lgczt) {
		this.lgczt = lgczt;
	}

	public String getJbshdwdm() {
		return jbshdwdm;
	}

	public void setJbshdwdm(String jbshdwdm) {
		this.jbshdwdm = jbshdwdm;
	}

	public String getJbshdwmc() {
		return jbshdwmc;
	}

	public void setJbshdwmc(String jbshdwmc) {
		this.jbshdwmc = jbshdwmc;
	}

	public String getToChar_jbsj() {
		toChar_jbsj = DateTimeHelper.conver(jbsj, "yyyy-MM-dd");
		return toChar_jbsj;
	}

	public void setToChar_jbsj(String toChar_jbsj) {
		this.toChar_jbsj = toChar_jbsj;
	}
}
