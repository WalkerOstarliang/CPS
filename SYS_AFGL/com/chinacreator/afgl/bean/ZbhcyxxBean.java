package com.chinacreator.afgl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 治保会成员信息
 *
 */
public class ZbhcyxxBean {
	private String zbhcybh; 		//治保会成员编号
	private String zbhbh; 			//治保会编号
	private String xm; 				//姓名
	private String xb; 				//性别
	private String xbmc; 			//性别
	private String sfzh; 			//身份证号
	private String csrq; 			//出生日期
	private String lxdh;     		//联系电话
	private String hjdqh; 			//户籍地区划
	private String hjdxz; 			//户籍地详址
	private String xzdxz;			//现住地详址
	private String whcd; 			//文化程度
	private String whcdmc; 			//文化程度
	private String hyzk; 			//婚姻状况
	private String hyzkmc; 			//婚姻状况
	private String gzbx; 			//工作表现
	private String gzbxmc; 			//工作表现
	private String jccs;			//奖惩次数
	private String gzdw; 			//工作单位
	private String cjrq; 			//参加日期
	private String tcrq; 			//退出日期
	private String bcqk; 			//报酬情况
	private String ryjl; 			//人员简历
	private String shgx; 			//社会关系
	private String djrxm; 			//登记人姓名
	private String djrjh; 			//登记人警号
	private String djdwdm; 			//登记单位代码
	private String djdwmc; 			//登记单位名称
	private String djsj; 			//登记时间
	private String zbhzw;			//治保会职务
	private String zbhzwmc;			//治保会职务
	private String cz;				//	
	private String czbs;			//
	private String tcyy;
	private String tcbs;
	private String tcbsmc;
	private String sssqjwmc;
	private String sspcsmc;
	private String zbhmc;
	private String djrsfzh;
	private String sssqdm;
	private String sssqmc;
	
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getZbhcybh() {
		return zbhcybh;
	}
	public void setZbhcybh(String zbhcybh) {
		this.zbhcybh = zbhcybh;
	}
	public String getZbhbh() {
		return zbhbh;
	}
	public void setZbhbh(String zbhbh) {
		this.zbhbh = zbhbh;
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
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getHjdqh() {
		return hjdqh;
	}
	public void setHjdqh(String hjdqh) {
		this.hjdqh = hjdqh;
	}
	public String getXzdxz() {
		return xzdxz;
	}
	public void setXzdxz(String xzdxz) {
		this.xzdxz = xzdxz;
	}
	public String getWhcd() {
		return whcd;
	}
	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}
	public String getHyzk() {
		return hyzk;
	}
	public void setHyzk(String hyzk) {
		this.hyzk = hyzk;
	}
	public String getGzbx() {
		return gzbx;
	}
	public void setGzbx(String gzbx) {
		this.gzbx = gzbx;
	}
	public String getJccs() {
		return jccs;
	}
	public void setJccs(String jccs) {
		this.jccs = jccs;
	}
	public String getGzdw() {
		return gzdw;
	}
	public void setGzdw(String gzdw) {
		this.gzdw = gzdw;
	}
	public String getCjrq() {
		return cjrq;
	}
	public void setCjrq(String cjrq) {
		this.cjrq = cjrq;
	}
	public String getTcrq() {
		return tcrq;
	}
	public void setTcrq(String tcrq) {
		this.tcrq = tcrq;
	}
	public String getBcqk() {
		return bcqk;
	}
	public void setBcqk(String bcqk) {
		this.bcqk = bcqk;
	}
	public String getRyjl() {
		return ryjl;
	}
	public void setRyjl(String ryjl) {
		this.ryjl = ryjl;
	}
	public String getShgx() {
		return shgx;
	}
	public void setShgx(String shgx) {
		this.shgx = shgx;
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
	public String getZbhzw() {
		return zbhzw;
	}
	public void setZbhzw(String zbhzw) {
		this.zbhzw = zbhzw;
	}
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getXbmc() {
		if(ValidateHelper.isNotEmptyString(xb)){
			xbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		}
		return xbmc;
	}
	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}
	public String getHjdxz() {
		if(ValidateHelper.isNotEmptyString(hjdqh)){
			hjdxz = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", hjdqh);
		}
		return hjdxz;
	}
	public void setHjdxz(String hjdxz) {
		this.hjdxz = hjdxz;
	}
	public String getWhcdmc() {
		if(ValidateHelper.isNotEmptyString(whcd)){
			whcdmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_WHCD", whcd);
		}
		return whcdmc;
	}
	public void setWhcdmc(String whcdmc) {
		this.whcdmc = whcdmc;
	}
	public String getHyzkmc() {
		if(ValidateHelper.isNotEmptyString(hyzk)){
			hyzkmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_HYZK", hyzk);
		}
		return hyzkmc;
	}
	public void setHyzkmc(String hyzkmc) {
		this.hyzkmc = hyzkmc;
	}
	public String getGzbxmc() {
		if(ValidateHelper.isNotEmptyString(gzbx)){
			gzbxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_GZBX", gzbx);
		}
		return gzbxmc;
	}
	public void setGzbxmc(String gzbxmc) {
		this.gzbxmc = gzbxmc;
	}
	public String getZbhzwmc() {
		if(ValidateHelper.isNotEmptyString(zbhzw)){
			zbhzwmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZBHCYZW", zbhzw);
		}
		return zbhzwmc;
	}
	public void setZbhzwmc(String zbhzwmc) {
		this.zbhzwmc = zbhzwmc;
	}
	public String getTcyy() {
		return tcyy;
	}
	public void setTcyy(String tcyy) {
		this.tcyy = tcyy;
	}
	public String getTcbs() {
		
		return tcbs;
	}
	public void setTcbs(String tcbs) {
		this.tcbs = tcbs;
	}
	public String getSssqjwmc() {
		return sssqjwmc;
	}
	public void setSssqjwmc(String sssqjwmc) {
		this.sssqjwmc = sssqjwmc;
	}
	public String getSspcsmc() {
		return sspcsmc;
	}
	public void setSspcsmc(String sspcsmc) {
		this.sspcsmc = sspcsmc;
	}
	public String getZbhmc() {
		return zbhmc;
	}
	public void setZbhmc(String zbhmc) {
		this.zbhmc = zbhmc;
	}
	public String getTcbsmc() {
		if("1".equals(tcbs)){
			tcbsmc = "已退出";
		}else{
			tcbsmc = "未退出";
		}
		return tcbsmc;
	}
	public void setTcbsmc(String tcbsmc) {
		this.tcbsmc = tcbsmc;
	}
	public String getSssqdm()
	{
		return sssqdm;
	}
	public void setSssqdm(String sssqdm)
	{
		this.sssqdm = sssqdm;
	}
	public String getSssqmc()
	{
		return sssqmc;
	}
	public void setSssqmc(String sssqmc)
	{
		this.sssqmc = sssqmc;
	}
	
}
