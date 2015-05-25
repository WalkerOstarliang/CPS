package com.chinacreator.lsgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 房屋基本查询条件对象
 * 
 * @author mingchun.xiong
 * @date 2013-8-6
 */
public class FwQueryBean extends QueryBean
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -8876033532375724196L;
	
	private String sfzh;
	
	private String stid;
	
	private String dzid;
	
	private String fwid;
	
	private String zpid;
	
	private String dzmc;
	
	private String stmc;
	
	private String msgtype;
	
	private String jsppage;
	
	private String sjxzqh;
	
	private String xjxzqh;
	
	private String jdxzdm;
	
	private String sqdm;
	
	private String cqrxm;
	
	private String cqrsfzh;
	
	private String frdbsfzh;
	
	private String frdbxm;
	
	private String hzxm;
	
	private String hzsfzh;
	
	private String sylb;
	
	private String sfczw;

	private String rylb;
	
	private boolean hideSfzh;
	
	private String rylbms;
	
	private String jlxdm;
	
	private String mph;
	
	private String xqz;
	
	private String ldxz;
	
	private String dyh;
	
	private String lch;
	
	private String lchz; //楼层后缀
	
	private String fjh;
	
	private String shhz; //室号后缀
	
	private String cqlx;
	
	private String zxbs;
	//房屋注销标识
	private String fwzxbs;
	
	 //是否查询出租屋标识 1 :是
    private String czwcx;
    
	private String djsj_start;
	
	private String djsj_end;
	
	//出租屋注销标识描述
	private String czwzxbsms;
	
	/**
	 * 界面类型 select ：选择，带有双击返回事件
	 */
	private String selectType;
	
	private String czType;
	
	private String czfwbph;   //房屋标牌号
	
	private String wxcts;  //未巡查天数
	
	private String fsdz;  //附属地址
	
	private String sfqdzrz;
	
	private String oldfwid; // 需要迁移的房屋id
	
	private String isczfdj;
	
	private String dwmc;
	
	private String zjzl;
	
	private String zjhm;
	
	private String gj;
	
	private String ywm;
	
	private String ywx;
	
	private String xb;
	
	private String cyrybh;
	
	public String getOldfwid() {
		return oldfwid;
	}

	public void setOldfwid(String oldfwid) {
		this.oldfwid = oldfwid;
	}

	public String getSfqdzrz() {
		return sfqdzrz;
	}

	public void setSfqdzrz(String sfqdzrz) {
		this.sfqdzrz = sfqdzrz;
	}

	public String getSjxzqh()
	{
		return sjxzqh;
	}

	public void setSjxzqh(String sjxzqh)
	{
		this.sjxzqh = sjxzqh;
	}

	public String getXjxzqh()
	{
		return xjxzqh;
	}

	public void setXjxzqh(String xjxzqh)
	{
		this.xjxzqh = xjxzqh;
	}

	public String getJdxzdm()
	{
		return jdxzdm;
	}

	public void setJdxzdm(String jdxzdm)
	{
		this.jdxzdm = jdxzdm;
	}

	public String getSqdm()
	{
		return sqdm;
	}

	public void setSqdm(String sqdm)
	{
		this.sqdm = sqdm;
	}

	public String getCqrxm()
	{
		return cqrxm;
	}

	public void setCqrxm(String cqrxm)
	{
		this.cqrxm = cqrxm;
	}

	public String getCqrsfzh()
	{
		return cqrsfzh;
	}

	public void setCqrsfzh(String cqrsfzh)
	{
		this.cqrsfzh = cqrsfzh;
	}

	
	public String getSfczw() {
		return sfczw;
	}

	public void setSfczw(String sfczw) {
		this.sfczw = sfczw;
	}

	public String getHzxm()
	{
		return hzxm;
	}

	public void setHzxm(String hzxm)
	{
		this.hzxm = hzxm;
	}

	public String getHzsfzh()
	{
		return hzsfzh;
	}

	public void setHzsfzh(String hzsfzh)
	{
		this.hzsfzh = hzsfzh;
	}

	public String getSylb()
	{
		return sylb;
	}

	public void setSylb(String sylb)
	{
		this.sylb = sylb;
	}

	public String getFwid()
	{
		return fwid;
	}

	public void setFwid(String fwid)
	{
		this.fwid = fwid;
	}

	public String getZpid()
	{
		return zpid;
	}

	public void setZpid(String zpid)
	{
		this.zpid = zpid;
	}

	public String getMsgtype()
	{
		return msgtype;
	}

	public void setMsgtype(String msgtype)
	{
		this.msgtype = msgtype;
	}

	public String getJsppage()
	{
		return jsppage;
	}

	public void setJsppage(String jsppage)
	{
		this.jsppage = jsppage;
	}

	public String getRylb()
	{
		return rylb;
	}

	public void setRylb(String rylb)
	{
		this.rylb = rylb;
	}

	public boolean isHideSfzh()
	{
		return hideSfzh;
	}

	public void setHideSfzh(boolean hideSfzh)
	{
		this.hideSfzh = hideSfzh;
	}

	public String getSelectType()
	{
		return selectType;
	}

	public void setSelectType(String selectType)
	{
		this.selectType = selectType;
	}

	public String getDzmc()
	{
		return dzmc;
	}

	public void setDzmc(String dzmc)
	{
		this.dzmc = dzmc;
	}

	public String getStmc()
	{
		return stmc;
	}

	public void setStmc(String stmc)
	{
		this.stmc = stmc;
	}

	public String getFrdbsfzh()
	{
		return frdbsfzh;
	}

	public void setFrdbsfzh(String frdbsfzh)
	{
		this.frdbsfzh = frdbsfzh;
	}

	public String getFrdbxm()
	{
		return frdbxm;
	}

	public void setFrdbxm(String frdbxm)
	{
		this.frdbxm = frdbxm;
	}

	public String getStid()
	{
		return stid;
	}

	public void setStid(String stid)
	{
		this.stid = stid;
	}

	public String getDzid()
	{
		return dzid;
	}

	public void setDzid(String dzid)
	{
		this.dzid = dzid;
	}

	public String getRylbms() {
		return rylbms;
	}

	public void setRylbms(String rylbms) {
		this.rylbms = rylbms;
	}

	public String getJlxdm() {
		return jlxdm;
	}

	public void setJlxdm(String jlxdm) {
		this.jlxdm = jlxdm;
	}

	public String getMph() {
		return mph;
	}

	public void setMph(String mph) {
		this.mph = mph;
	}

	public String getXqz() {
		return xqz;
	}

	public void setXqz(String xqz) {
		this.xqz = xqz;
	}

	public String getLdxz() {
		return ldxz;
	}

	public void setLdxz(String ldxz) {
		this.ldxz = ldxz;
	}

	public String getDyh() {
		return dyh;
	}

	public void setDyh(String dyh) {
		this.dyh = dyh;
	}

	public String getLch() {
		return lch;
	}

	public void setLch(String lch) {
		this.lch = lch;
	}

	public String getFjh() {
		return fjh;
	}

	public void setFjh(String fjh) {
		this.fjh = fjh;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getCzType()
	{
		return czType;
	}

	public void setCzType(String czType)
	{
		this.czType = czType;
	}

	public String getCqlx()
	{
		return cqlx;
	}

	public void setCqlx(String cqlx)
	{
		this.cqlx = cqlx;
	}

	public String getZxbs() {
		return zxbs;
	}

	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}

	public String getDjsj_start() {
		return djsj_start;
	}

	public void setDjsj_start(String djsj_start) {
		this.djsj_start = djsj_start;
	}

	public String getDjsj_end() {
		return djsj_end;
	}

	public void setDjsj_end(String djsj_end) {
		this.djsj_end = djsj_end;
	}

	public String getLchz() {
		return lchz;
	}

	public void setLchz(String lchz) {
		this.lchz = lchz;
	}

	public String getShhz() {
		return shhz;
	}

	public void setShhz(String shhz) {
		this.shhz = shhz;
	}

	public String getCzfwbph() {
		return czfwbph;
	}

	public void setCzfwbph(String czfwbph) {
		this.czfwbph = czfwbph;
	}

	public String getWxcts() {
		return wxcts;
	}

	public void setWxcts(String wxcts) {
		this.wxcts = wxcts;
	}

	public String getFsdz()
	{
		return fsdz;
	}

	public void setFsdz(String fsdz)
	{
		this.fsdz = fsdz;
	}

	public String getCzwzxbsms() {
		return czwzxbsms; 
	}

	public void setCzwzxbsms(String czwzxbsms) {
		this.czwzxbsms = czwzxbsms;
	}

	public String getFwzxbs() {
		return fwzxbs;
	}

	public void setFwzxbs(String fwzxbs) {
		this.fwzxbs = fwzxbs;
	}

	public String getIsczfdj()
	{
		return isczfdj;
	}

	public void setIsczfdj(String isczfdj)
	{
		this.isczfdj = isczfdj;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getCzwcx() {
		return czwcx;
	}

	public void setCzwcx(String czwcx) {
		this.czwcx = czwcx;
	}

	public String getZjzl()
	{
		return zjzl;
	}

	public void setZjzl(String zjzl)
	{
		this.zjzl = zjzl;
	}

	public String getZjhm()
	{
		return zjhm;
	}

	public void setZjhm(String zjhm)
	{
		this.zjhm = zjhm;
	}

	public String getCyrybh()
	{
		return cyrybh;
	}

	public void setCyrybh(String cyrybh)
	{
		this.cyrybh = cyrybh;
	}

	public String getGj()
	{
		return gj;
	}

	public void setGj(String gj)
	{
		this.gj = gj;
	}

	public String getYwm()
	{
		return ywm;
	}

	public void setYwm(String ywm)
	{
		this.ywm = ywm;
	}

	public String getYwx()
	{
		return ywx;
	}

	public void setYwx(String ywx)
	{
		this.ywx = ywx;
	}

	public String getXb()
	{
		return xb;
	}

	public void setXb(String xb)
	{
		this.xb = xb;
	}
	
}
