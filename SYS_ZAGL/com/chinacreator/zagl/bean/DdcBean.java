package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;

/**
 * 电动车
 */
public class DdcBean extends OperateBean {

	private static final long serialVersionUID = 6807148898788378086L;

	/**
	 * 电动车ID 主键
	 */
	private String  ddcid; 
	
	/**
	 * 电动车类型
	 */
	private String  ddclx; 
	
	/**
	 * 品牌
	 */
	private String  pp;
	
	/**
	 * 车辆识别码
	 */
	private String  clsbm;
	
	/**
	 * 电机号
	 */
	private String  djh; 
	
	/**
	 * 颜色
	 */
	private String  ys; 
	
	/**
	 * 号牌号码
	 */
	private String  hphm; 
	
	/**
	 * 经销店名称
	 */
	private String  jxdmc; 
	
	/**
	 * 门店地址
	 */
	private String  mddz; 
	
	/**
	 * 销售时间
	 */
	private String  xssj; 
	
	/**
	 * 购买者姓名
	 */
	private String  gmzxm; 
	
	/**
	 * 购买者身份证号
	 */
	private String  gmzsfzh; 
	
	/**
	 * 购买者电话
	 */
	private String  gmzdh; 
	
	/**
	 * 注销标识
	 */
	private String  zxbs; 
	
	/**
	 * 注销时间
	 */
	private String  zxsj; 
	
	/**
	 * 注销原因
	 */
	private String  zxyy;
	
	private String cz;

	public String getDdcid() {
		return ddcid;
	}

	public void setDdcid(String ddcid) {
		this.ddcid = ddcid;
	}

	public String getDdclx() {
		return ddclx;
	}

	public void setDdclx(String ddclx) {
		this.ddclx = ddclx;
	}

	public String getPp() {
		return pp;
	}

	public void setPp(String pp) {
		this.pp = pp;
	}

	public String getClsbm() {
		return clsbm;
	}

	public void setClsbm(String clsbm) {
		this.clsbm = clsbm;
	}

	public String getDjh() {
		return djh;
	}

	public void setDjh(String djh) {
		this.djh = djh;
	}

	public String getYs() {
		return ys;
	}

	public void setYs(String ys) {
		this.ys = ys;
	}

	public String getHphm() {
		return hphm;
	}

	public void setHphm(String hphm) {
		this.hphm = hphm;
	}

	public String getJxdmc() {
		return jxdmc;
	}

	public void setJxdmc(String jxdmc) {
		this.jxdmc = jxdmc;
	}

	public String getMddz() {
		return mddz;
	}

	public void setMddz(String mddz) {
		this.mddz = mddz;
	}

	public String getXssj() {
		return xssj;
	}

	public void setXssj(String xssj) {
		this.xssj = xssj;
	}

	public String getGmzxm() {
		return gmzxm;
	}

	public void setGmzxm(String gmzxm) {
		this.gmzxm = gmzxm;
	}

	public String getGmzsfzh() {
		return gmzsfzh;
	}

	public void setGmzsfzh(String gmzsfzh) {
		this.gmzsfzh = gmzsfzh;
	}

	public String getGmzdh() {
		return gmzdh;
	}

	public void setGmzdh(String gmzdh) {
		this.gmzdh = gmzdh;
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

	public String getCz() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		
		cz = "<span class=\"cps_span_href\" onclick=\"openDdcInfoWin('" + CommonConstant.OPERTYPE_DETAIL+ "','" + this.ddcid + "')\" " +
				"style=\"color:green\">详情</span>&nbsp;";
		
		if(loginInfo.getOrgcode().equals(this.getDjdwdm())){
			cz += "<span class=\"cps_span_href\" onclick=\"openDdcInfoWin('" + CommonConstant.OPERTYPE_UPDATE+ "','" + this.ddcid + "')\" " +
			"style=\"color:green\">修改</span>&nbsp;";
		}
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
	
}
