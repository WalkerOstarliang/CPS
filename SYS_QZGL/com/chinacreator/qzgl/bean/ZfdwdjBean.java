package com.chinacreator.qzgl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 
 * @author zhun.liu
 * 走访单位登记信息Bean
 *
 */
public class ZfdwdjBean {
	private String bh;                //编号
	private String zfdwmc;           //走访单位名称
	private String zfdwfrxm;       //走访单位法人姓名
	private String zfdwlxdh;          //联系电话
	private String dwszdz;         //单位所在地址
	private String dwsx;           //单位属性
	
	//新增一个单位属性名称的属性，方便界面显示
	private String dwsxmc;         //单位属性名称
	
	private String jdrxm;          //接待人姓名
	private String jdrlxdh;        //接待人联系电话
	private String jdrzw;          //接待人职务
	private String zfsj;          //走访时间
	private String zfsy;          //走访事由
	
	//新增一个走访事由的mc属性  用于在界面显示
	private String zfsymc;        //走访事由名称
	
	private String zfdcnr;          //走访调查内容
	private String zfdcjg;        //走访调查结果
	private String zfmjjh;        //走访民警警号
	private String zfmjxm;        //走访民警姓名
	private String zfmjdwdm;      //走访民警单位代码
	private String zfmjdwmc;      //走访民警单位名称
	private String sfjwdc;        //是否警务调查  未调查 ：0    已调查 ：1
	private String sfjwdcmc;       //是否警务调查名称     方便界面显示
	private String xxsfss;         //信息是否属实   否：0  是：1
	private String xxsfssmc;       //信息是否属实名称     方便界面显示
	
	private String dcjgms;         //调查结果描述
	private String dcrxm;          // 调查人姓名
	private String dcrdwdm;      // 调查人单位代码
	private String dcrdwmc;	     //调查人单位名称
	private String djrxm;        //登记人姓名
	private String djsj;         //登记时间
	private String djdwdm;       //登记单位代码
	private String djdwmc;       //登记单位名称
	private String cz;	         //操作
	
	
	
	public String getSfjwdcmc() {
		return DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("QZGL_DCZT", sfjwdcmc);
	}
	public void setSfjwdcmc(String sfjwdcmc) {
		this.sfjwdcmc = sfjwdcmc;
	}
	public String getXxsfssmc() {
		return DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("QZGL_XXZW", xxsfssmc);
	}
	public void setXxsfssmc(String xxsfssmc) {
		this.xxsfssmc = xxsfssmc;
	}
	public String getZfdwmc() {
		return zfdwmc;
	}
	public void setZfdwmc(String zfdwmc) {
		this.zfdwmc = zfdwmc;
	}
	public String getZfdwfrxm() {
		return zfdwfrxm;
	}
	public void setZfdwfrxm(String zfdwfrxm) {
		this.zfdwfrxm = zfdwfrxm;
	}
	public String getZfsj() {
		return zfsj;
	}
	public void setZfsj(String zfsj) {
		this.zfsj = zfsj;
	}
	public String getZfsy() {
		return zfsy;
	}
	public void setZfsy(String zfsy) {
		this.zfsy = zfsy;
	}
	public String getZfmjxm() {
		return zfmjxm;
	}
	public void setZfmjxm(String zfmjxm) {
		this.zfmjxm = zfmjxm;
	}
	public String getZfmjdwmc() {
		return zfmjdwmc;
	}
	public void setZfmjdwmc(String zfmjdwmc) {
		this.zfmjdwmc = zfmjdwmc;
	}
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getZfdwlxdh() {
		return zfdwlxdh;
	}
	public void setZfdwlxdh(String zfdwlxdh) {
		this.zfdwlxdh = zfdwlxdh;
	}
	public String getDwszdz() {
		return dwszdz;
	}
	public void setDwszdz(String dwszdz) {
		this.dwszdz = dwszdz;
	}
	public String getDwsx() {
		
		return dwsx;
	}
	public void setDwsx(String dwsx) {
		this.dwsx = dwsx;
	}
	public String getJdrxm() {
		return jdrxm;
	}
	public void setJdrxm(String jdrxm) {
		this.jdrxm = jdrxm;
	}
	public String getJdrzw() {
		return jdrzw;
	}
	public void setJdrzw(String jdrzw) {
		this.jdrzw = jdrzw;
	}
	public String getZfdcnr() {
		return zfdcnr;
	}
	public void setZfdcnr(String zfdcnr) {
		this.zfdcnr = zfdcnr;
	}
	public String getZfdcjg() {
		return zfdcjg;
	}
	public void setZfdcjg(String zfdcjg) {
		this.zfdcjg = zfdcjg;
	}
	public String getZfmjjh() {
		return zfmjjh;
	}
	public void setZfmjjh(String zfmjjh) {
		this.zfmjjh = zfmjjh;
	}
	public String getZfmjdwdm() {
		return zfmjdwdm;
	}
	public void setZfmjdwdm(String zfmjdwdm) {
		this.zfmjdwdm = zfmjdwdm;
	}
	public String getSfjwdc() {
		return sfjwdc;
	}
	public void setSfjwdc(String sfjwdc) {
		this.sfjwdc = sfjwdc;
	}
	public String getXxsfss() {
		return xxsfss;
	}
	public void setXxsfss(String xxsfss) {
		this.xxsfss = xxsfss;
	}
	public String getDcjgms() {
		return dcjgms;
	}
	public void setDcjgms(String dcjgms) {
		this.dcjgms = dcjgms;
	}
	public String getDcrxm() {
		return dcrxm;
	}
	public void setDcrxm(String dcrxm) {
		this.dcrxm = dcrxm;
	}
	public String getDcrdwdm() {
		return dcrdwdm;
	}
	public void setDcrdwdm(String dcrdwdm) {
		this.dcrdwdm = dcrdwdm;
	}
	public String getDcrdwmc() {
		return dcrdwmc;
	}
	public void setDcrdwmc(String dcrdwmc) {
		this.dcrdwmc = dcrdwmc;
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
	public String getJdrlxdh() {
		return jdrlxdh;
	}
	public void setJdrlxdh(String jdrlxdh) {
		this.jdrlxdh = jdrlxdh;
	}
	public String getDwsxmc() {
		return DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_DWSX", dwsxmc);
	}
	public void setDwsxmc(String dwsxmc) {
		this.dwsxmc = dwsxmc;
	}
	public String getZfsymc() {
		return DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZFGL_ZFSY", zfsymc);
	}
	public void setZfsymc(String zfsymc) {
		this.zfsymc = zfsymc;
	}
	
	
}
 