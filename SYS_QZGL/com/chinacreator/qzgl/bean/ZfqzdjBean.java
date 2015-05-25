package com.chinacreator.qzgl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 
 * @author zhun.liu
 *
 */
public class ZfqzdjBean {
	private String bh;       		//走访群众登记编号
	private String  zfdxxm;  		//走访对象姓名
	private String zfdxsfzh;  		//走访对象身份证号码
	private String zfdxlxdh;  		 //走访对象联系电话
	private String zfdxlx;  		 //走访对象类型
	
	private String zfdxlxmc;         //走访对象类型  方便界面显示  ，实际数据库中不存在。
	private String jtzz;			//家庭住址
	private String zfsj;      		 //走访时间
	private String zfsy;      		 //走访事由
	//新增一个 走访事由名称属性 方便界面显示
	private String zfsymc;           //走访事由名称
	private String zfdcnr;			//走访调查内容
	private String zfdcjg;			//走访调查结果
	private String zfmjjh;			//走访民警警号
	private String zfmjxm;			//走访民警姓名
	private String zfmjdwdm;		//走访民警单位代码
	private String zfmjdwmc;			//走访民警单位名称
	private String sfjwdc;        //是否警务调查  未调查 ：0    已调查 ：1
	private String sfjwdcmc;       //是否警务调查名称     方便界面显示
	private String xxsfss;         //信息是否属实   否：0  是：1
	private String xxsfssmc;       //信息是否属实名称     方便界面显示
	private String dcjgms;			//调查结果描述
	private String dcrxm;			//调查人姓名
	private String dcrdwdm;			//调查人单位代码
	private String dcrdwmc;			//调查人单位名称
	private String dcsj;			//调查时间
	private String djrxm;     //登记人姓名
	private String djsj;		//登记时间
	private String djdwdm;		//登记单位代码
	private String djdwmc;      //登记单位名称
	private String cz;	        //操作
	
	
	
	
	
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
	public String getZfdxxm() {
		return zfdxxm;
	}
	public void setZfdxxm(String zfdxxm) {
		this.zfdxxm = zfdxxm;
	}
	public String getZfdxsfzh() {
		return zfdxsfzh;
	}
	public void setZfdxsfzh(String zfdxsfzh) {
		this.zfdxsfzh = zfdxsfzh;
	}
	public String getZfsj() {
		return zfsj;
	}
	public void setZfsj(String zfsj) {
		this.zfsj = zfsj;
	}
	public String getZfsy() {
		return  zfsy;
	}
	public void setZfsy(String zfsy) {
		this.zfsy = zfsy;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjdwmc() {
		return djdwmc;
	}
	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
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
	public String getZfdxlxdh() {
		return zfdxlxdh;
	}
	public void setZfdxlxdh(String zfdxlxdh) {
		this.zfdxlxdh = zfdxlxdh;
	}
	public String getZfdxlx() {
		return zfdxlx;
	}
	public void setZfdxlx(String zfdxlx) {
		this.zfdxlx = zfdxlx;
	}
	public String getJtzz() {
		return jtzz;
	}
	public void setJtzz(String jtzz) {
		this.jtzz = jtzz;
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
	public String getZfmjxm() {
		return zfmjxm;
	}
	public void setZfmjxm(String zfmjxm) {
		this.zfmjxm = zfmjxm;
	}
	public String getZfmjdwdm() {
		return zfmjdwdm;
	}
	public void setZfmjdwdm(String zfmjdwdm) {
		this.zfmjdwdm = zfmjdwdm;
	}
	public String getZfmjdwmc() {
		return zfmjdwmc;
	}
	public void setZfmjdwmc(String zfmjdwmc) {
		this.zfmjdwmc = zfmjdwmc;
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
	public String getDcsj() {
		return dcsj;
	}
	public void setDcsj(String dcsj) {
		this.dcsj = dcsj;
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
	public String getZfdxlxmc() {
		return DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZFGL_QZSX", zfdxlxmc);
	}
	public void setZfdxlxmc(String zfdxlxmc) {
		this.zfdxlxmc = zfdxlxmc;
	}
	public String getZfsymc() {
		return DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZFGL_ZFSY", zfsymc);
	}
	public void setZfsymc(String zfsymc) {
		this.zfsymc = zfsymc;
	}
	
	
}
