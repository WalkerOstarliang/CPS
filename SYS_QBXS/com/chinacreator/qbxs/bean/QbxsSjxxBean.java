package com.chinacreator.qbxs.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;

/**
 * 
 * @company  chinacreator
 * @date  Mar 17, 2014  8:55:17 AM
 * 重要情报线索与事件信息表
 */
public class QbxsSjxxBean {
	private String id;
	private String ldxxbh;	//联动信息编号
	private String bssj;	//报送时间
	private String jjcd;	//紧急程度
	private String jjcdmc;
	private String fszt;	//发生状态
	private String fsztmc;
	private String bgcx;	//报告次序
	private String bgcxmc;
	private String xsxxly;	//线索信息来源
	private String xsxxlymc;
	private String bt;	//标题
	private String gjc;	//关键词
	private String xxzw;	//信息正文
	private String cjdwjgdm;	//采集单位机构代码
	private String cjdw;	//采集单位
	private String cjr;	//采集人
	private String tbdwjgdm;	//填报单位机构代码
	private String tbdw;	//填报单位
	private String tbr;	//填报人
	private String shr;	//审核人
	private String sszt;	//涉事主体
	private String sslb1;	//涉事类别
	private String sjmgsd;	//涉及敏感时点
	private String sjzdhd;	//涉及重大活动
	private String sjrsgm;	//涉及人数规模
	private String sjccssgm;	//涉及财产损失规模
	private String ssyy;	//涉事诱因
	private String bxxs;	//表现形式
	private String asjfssj;	//案(事)件发生时间
	private String asjdlb;	//案(事) 件发生地类别
	private String sasfsdsxq;	//案(事)件发生地所属省市代码
	private String sasfsdsxqmc; //案(事)件发生地所属省市
	private String sasfsdxz;	//案(事)件发生地详址
	private String yldxxbh;	//源联动信息编号
	private String rksj;	//入库时间
	private String cqshr;	//
	private String shsj;	//
	private String shyj;	//
	private String cjrdm;	//
	private String tqbz;	//
	private String sslb;	//重要情报线索与事件涉事类别
	private String jllx;	//
	private String jlzt;	//
	private String cjrid; //采集人ID
	private String cjrsfzh;
	
	private String cjsj;
	
	
	private String cz;
	public String getCjrid() {
		return cjrid;
	}
	public void setCjrid(String cjrid) {
		this.cjrid = cjrid;
	}
	public String getLdxxbh() {
		return ldxxbh;
	}
	public void setLdxxbh(String ldxxbh) {
		this.ldxxbh = ldxxbh;
	}
	public String getBssj() {
		return bssj;
	}
	public void setBssj(String bssj) {
		this.bssj = bssj;
	}
	public String getJjcd() {
		return jjcd;
	}
	public void setJjcd(String jjcd) {
		this.jjcd = jjcd;
	}
	public String getFszt() {
		return fszt;
	}
	public void setFszt(String fszt) {
		this.fszt = fszt;
	}
	public String getBgcx() {
		return bgcx;
	}
	public void setBgcx(String bgcx) {
		this.bgcx = bgcx;
	}
	public String getXsxxly() {
		return xsxxly;
	}
	public void setXsxxly(String xsxxly) {
		this.xsxxly = xsxxly;
	}
	public String getBt() {
		return bt;
	}
	public void setBt(String bt) {
		this.bt = bt;
	}
	public String getGjc() {
		return gjc;
	}
	public void setGjc(String gjc) {
		this.gjc = gjc;
	}
	public String getXxzw() {
		return xxzw;
	}
	public void setXxzw(String xxzw) {
		this.xxzw = xxzw;
	}
	public String getCjdwjgdm() {
		return cjdwjgdm;
	}
	public void setCjdwjgdm(String cjdwjgdm) {
		this.cjdwjgdm = cjdwjgdm;
	}
	public String getCjdw() {
		return cjdw;
	}
	public void setCjdw(String cjdw) {
		this.cjdw = cjdw;
	}
	public String getCjr() {
		return cjr;
	}
	public void setCjr(String cjr) {
		this.cjr = cjr;
	}
	public String getTbdwjgdm() {
		return tbdwjgdm;
	}
	public void setTbdwjgdm(String tbdwjgdm) {
		this.tbdwjgdm = tbdwjgdm;
	}
	public String getTbdw() {
		return tbdw;
	}
	public void setTbdw(String tbdw) {
		this.tbdw = tbdw;
	}
	public String getTbr() {
		return tbr;
	}
	public void setTbr(String tbr) {
		this.tbr = tbr;
	}
	public String getShr() {
		return shr;
	}
	public void setShr(String shr) {
		this.shr = shr;
	}
	public String getSszt() {
		return sszt;
	}
	public void setSszt(String sszt) {
		this.sszt = sszt;
	}
	public String getSslb1() {
		return sslb1;
	}
	public void setSslb1(String sslb1) {
		this.sslb1 = sslb1;
	}
	public String getSjmgsd() {
		return sjmgsd;
	}
	public void setSjmgsd(String sjmgsd) {
		this.sjmgsd = sjmgsd;
	}
	public String getSjzdhd() {
		return sjzdhd;
	}
	public void setSjzdhd(String sjzdhd) {
		this.sjzdhd = sjzdhd;
	}
	public String getSjrsgm() {
		return sjrsgm;
	}
	public void setSjrsgm(String sjrsgm) {
		this.sjrsgm = sjrsgm;
	}
	public String getSjccssgm() {
		return sjccssgm;
	}
	public void setSjccssgm(String sjccssgm) {
		this.sjccssgm = sjccssgm;
	}
	public String getSsyy() {
		return ssyy;
	}
	public void setSsyy(String ssyy) {
		this.ssyy = ssyy;
	}
	public String getBxxs() {
		return bxxs;
	}
	public void setBxxs(String bxxs) {
		this.bxxs = bxxs;
	}
	public String getAsjfssj() {
		return asjfssj;
	}
	public void setAsjfssj(String asjfssj) {
		this.asjfssj = asjfssj;
	}
	public String getAsjdlb() {
		return asjdlb;
	}
	public void setAsjdlb(String asjdlb) {
		this.asjdlb = asjdlb;
	}
	public String getSasfsdsxq() {
		return sasfsdsxq;
	}
	public void setSasfsdsxq(String sasfsdsxq) {
		this.sasfsdsxq = sasfsdsxq;
	}
	public String getSasfsdxz() {
		return sasfsdxz;
	}
	public void setSasfsdxz(String sasfsdxz) {
		this.sasfsdxz = sasfsdxz;
	}
	public String getYldxxbh() {
		return yldxxbh;
	}
	public void setYldxxbh(String yldxxbh) {
		this.yldxxbh = yldxxbh;
	}
	public String getRksj() {
		return rksj;
	}
	public void setRksj(String rksj) {
		this.rksj = rksj;
	}
	public String getCqshr() {
		return cqshr;
	}
	public void setCqshr(String cqshr) {
		this.cqshr = cqshr;
	}
	public String getShsj() {
		return shsj;
	}
	public void setShsj(String shsj) {
		this.shsj = shsj;
	}
	public String getShyj() {
		return shyj;
	}
	public void setShyj(String shyj) {
		this.shyj = shyj;
	}
	public String getCjrdm() {
		return cjrdm;
	}
	public void setCjrdm(String cjrdm) {
		this.cjrdm = cjrdm;
	}
	public String getTqbz() {
		return tqbz;
	}
	public void setTqbz(String tqbz) {
		this.tqbz = tqbz;
	}
	public String getSslb() {
		return sslb;
	}
	public void setSslb(String sslb) {
		this.sslb = sslb;
	}
	public String getJllx() {
		return jllx;
	}
	public void setJllx(String jllx) {
		this.jllx = jllx;
	}
	public String getJlzt() {
		return jlzt;
	}
	public void setJlzt(String jlzt) {
		this.jlzt = jlzt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSasfsdsxqmc() {
		return sasfsdsxqmc;
	}
	public void setSasfsdsxqmc(String sasfsdsxqmc) {
		this.sasfsdsxqmc = sasfsdsxqmc;
	}
	public String getBgcxmc() {
		if(ValidateHelper.isNotEmptyString(this.bgcx)){
			bgcxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("QBXS_BGCX", this.bgcx);
		}
		return bgcxmc;
	}
	public void setBgcxmc(String bgcxmc) {
		this.bgcxmc = bgcxmc;
	}
	
	public String getCz() {
		StringBuffer sb = new StringBuffer();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		sb.append("<span onclick=\"openQbxsWin('detail','" + id +"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		if (loginInfo.getOrgcode().equals(cjdwjgdm)) 
		{
			sb.append("<span onclick=\"openQbxsWin('update','" + id +"')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
			sb.append("<span onclick=\"openQbxsXbWin('add','" + ldxxbh + "','1')\" style=\"color:green\" class=\"cps_span_href\">续报</span>&nbsp;");
		}
		cz=sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getJjcdmc() {
		if(ValidateHelper.isNotEmptyString(this.jjcd)){
			jjcdmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("QBXS_JJCD", this.jjcd);
		}
		return jjcdmc;
	}
	public void setJjcdmc(String jjcdmc) {
		this.jjcdmc = jjcdmc;
	}
	public String getFsztmc() {
		if(ValidateHelper.isNotEmptyString(this.fszt)){
			fsztmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("QBXS_FSZT", this.fszt);
		}
		return fsztmc;
	}
	public void setFsztmc(String fsztmc) {
		this.fsztmc = fsztmc;
	}
	public String getXsxxlymc() {
		if(ValidateHelper.isNotEmptyString(this.xsxxly)){
			xsxxlymc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("QBXS_XXLY", this.xsxxly);
		}
		return xsxxlymc;
	}
	public void setXsxxlymc(String xsxxlymc) {
		this.xsxxlymc = xsxxlymc;
	}
	public String getCjrsfzh() {
		return cjrsfzh;
	}
	public void setCjrsfzh(String cjrsfzh) {
		this.cjrsfzh = cjrsfzh;
	}
	public String getCjsj() {
		return cjsj;
	}
	public void setCjsj(String cjsj) {
		this.cjsj = cjsj;
	}
}
