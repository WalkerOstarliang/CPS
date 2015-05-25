package com.chinacreator.gzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 辅警bean
 * @company  chinacreator
 * @author zhun.liu
 * @date  Dec 6, 2013  7:02:40 PM
 */
public class OrgFjBean extends BaseValue{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 7630062289761286284L;
	private String id;	//主键Id
	private String fjxm;	//辅警姓名
	private String fjjh;	//辅警号 
	private String sfzh;	//身份证号码	
	private String xb;	//性别
	private String xbms;
	private String mz;	//民族
	private String whcd;	//文化程度
	private String whcdms;
	private String gzgw;	//工作岗位（社区警务室辅警需填写警务室名称）
	private String gzgwms;
	private String zw;	//职务
	private String sfczbz;	//是否财政保障
	private String sfczbzms;
	private String sfgajgglsykh;	//是否公安机关管理使用考核
	private String sfgajgglsykhms;
	private String hjd;	//户籍地	
	private String xzz;	//现住址	
	private String cyfjsj;	//从事辅警时间（年）
	private String dnjlcs;	//当年奖励次数
	private String dncccs;	//当年惩处次数
	private String dnjzywpxcs;	//当年集中业务培训次数
	private String lxfs;	//联系方式	
	private String ssdwdm;	//所属单位代码
	private String ssdwmc;	//所属单位名称
	private String fjlb;    //辅警类别
	private String fjlbms;
	
	private String djrjh;
	private String djrxm;
	private String djdwdm;
	private String djdwmc;
	private String djsj;
	private String lzsj;
	private String zxbs;
	private String djrsfzh;
	private String sfzz;
	private String sfzzms;
	
	private String pysj;
	private String cqorxz;
	private String htqx;
	private String gzly;
	private String gze;
	private String wxyj;
	private String xldbh;
	private String xldmc;
	private String gzjl;
	
	public String getPysj() {
		return pysj;
	}
	public void setPysj(String pysj) {
		this.pysj = pysj;
	}
	public String getCqorxz() {
		return cqorxz;
	}
	public void setCqorxz(String cqorxz) {
		this.cqorxz = cqorxz;
	}
	public String getHtqx() {
		return htqx;
	}
	public void setHtqx(String htqx) {
		this.htqx = htqx;
	}
	public String getGzly() {
		return gzly;
	}
	public void setGzly(String gzly) {
		this.gzly = gzly;
	}
	public String getGze() {
		return gze;
	}
	public void setGze(String gze) {
		this.gze = gze;
	}
	public String getWxyj() {
		return wxyj;
	}
	public void setWxyj(String wxyj) {
		this.wxyj = wxyj;
	}
	public String getSfzzms() {
		sfzzms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZDSF", sfzz);

		return sfzzms;
	}
	public void setSfzzms(String sfzzms) {
		this.sfzzms = sfzzms;
	}
	public String getSfzz() {
		return sfzz;
	}
	public void setSfzz(String sfzz) {
		this.sfzz = sfzz;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
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
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getLzsj() {
		return lzsj;
	}
	public void setLzsj(String lzsj) {
		this.lzsj = lzsj;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFjxm() {
		return fjxm;
	}
	public void setFjxm(String fjxm) {
		this.fjxm = fjxm;
	}
	public String getFjjh() {
		return fjjh;
	}
	public void setFjjh(String fjjh) {
		this.fjjh = fjjh;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
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
	public String getSfczbz() {
		return sfczbz;
	}
	public void setSfczbz(String sfczbz) {
		this.sfczbz = sfczbz;
	}
	public String getSfgajgglsykh() {
		return sfgajgglsykh;
	}
	public void setSfgajgglsykh(String sfgajgglsykh) {
		this.sfgajgglsykh = sfgajgglsykh;
	}
	public String getHjd() {
		return hjd;
	}
	public void setHjd(String hjd) {
		this.hjd = hjd;
	}
	public String getXzz() {
		return xzz;
	}
	public void setXzz(String xzz) {
		this.xzz = xzz;
	}
	public String getCyfjsj() {
		return cyfjsj;
	}
	public void setCyfjsj(String cyfjsj) {
		this.cyfjsj = cyfjsj;
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
	public String getLxfs() {
		return lxfs;
	}
	public void setLxfs(String lxfs) {
		this.lxfs = lxfs;
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
	public String getXbms() {
		xbms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);

		return xbms;
	}
	public void setXbms(String xbms) {
		this.xbms = xbms;
	}
	public String getWhcdms() {
		whcdms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_WHCD", whcd);
		return whcdms;
	}
	public void setWhcdms(String whcdms) {
		this.whcdms = whcdms;
	}
	public String getSfczbzms() {
		sfczbzms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZDSF", sfczbz);
		return sfczbzms;
	}
	public void setSfczbzms(String sfczbzms) {
		this.sfczbzms = sfczbzms;
	}
	public String getSfgajgglsykhms() {
		sfgajgglsykhms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZDSF", sfgajgglsykh);
		return sfgajgglsykhms;
	}
	public void setSfgajgglsykhms(String sfgajgglsykhms) {
		this.sfgajgglsykhms = sfgajgglsykhms;
	}
	public String getFjlb() {
		return fjlb;
	}
	public void setFjlb(String fjlb) {
		this.fjlb = fjlb;
	}
	public String getFjlbms() {
		fjlbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_FJLB", fjlb);
		return fjlbms;
	}
	public void setFjlbms(String fjlbms) {
		this.fjlbms = fjlbms;
	}
	public String getGzgwms() {
		gzgwms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_LKXGYGW", gzgw);
		return gzgwms;
	}
	public void setGzgwms(String gzgwms) {
		this.gzgwms = gzgwms;
	}
	public String getXldbh()
	{
		return xldbh;
	}
	public void setXldbh(String xldbh)
	{
		this.xldbh = xldbh;
	}
	public String getXldmc()
	{
		return xldmc;
	}
	public void setXldmc(String xldmc)
	{
		this.xldmc = xldmc;
	}
	public String getGzjl()
	{
		return gzjl;
	}
	public void setGzjl(String gzjl)
	{
		this.gzjl = gzjl;
	}
	
}
