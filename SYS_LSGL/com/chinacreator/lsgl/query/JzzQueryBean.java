package com.chinacreator.lsgl.query;

import java.util.Calendar;

import com.chinacreator.common.bean.QueryBean;

public class JzzQueryBean extends QueryBean {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1692951701191374176L;
	private String jzzxxbh;
	private String jzzdyzt;	//   居住证打印状态
	private String jzzzxbs;	//   注销标识
	private String jzzsfzh; //   居住证身份证号
	private String dyzt;
	
	private String xb;
	private String csrq_start;
	private String csrq_end;
	private String age_start;
	private String age_end;
	private String fzrq_start;
	private String fzrq_end;
	private String ywzp;
	
	private String djsj_start;
	private String djsj_end;
	private String hjdqh;
	private String mz;
	private String orgname;
	private String orgLeve;
	
	private String sfcyry;
	private String sfqkljry;
	private String sfrsdqqkry;
	private String gwdq;
	private String lbdsc;
	private String djcs;
	private String parentCode;
	
	/* *******居住证统计查询条件******** */
	private String tjsj_start;    //统计开始时间
	private String tjsj_end;      //统计结束时间
	private String tjdwdm;        //统计单位代码
	private String tjdwmc;        //统计单位名称
	private String tjjb;          //统计级别
	
	// 居住证统计导出制表时间
	private String zbsj ;
	
	/* *************************** */
	/**
	 * 是否分页  0:不分页
	 */
	private String isPage;
	
	private boolean isUsePage = true;

	public String getOrgLeve()
	{
		return orgLeve;
	}
	public void setOrgLeve(String orgLeve)
	{
		this.orgLeve = orgLeve;
	}
	public String getJzzdyzt() {
		return jzzdyzt;
	}
	public void setJzzdyzt(String jzzdyzt) {
		this.jzzdyzt = jzzdyzt;
	}
	public String getJzzzxbs() {
		return jzzzxbs;
	}
	public void setJzzzxbs(String jzzzxbs) {
		this.jzzzxbs = jzzzxbs;
	}
	public String getJzzsfzh() {
		return jzzsfzh;
	}
	public void setJzzsfzh(String jzzsfzh) {
		this.jzzsfzh = jzzsfzh;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getCsrq_start() {
		return csrq_start;
	}
	public void setCsrq_start(String csrq_start) {
		this.csrq_start = csrq_start;
	}
	public String getCsrq_end() {
		return csrq_end;
	}
	public void setCsrq_end(String csrq_end) {
		this.csrq_end = csrq_end;
	}
	public String getAge_start() {
		return age_start;
	}
	public void setAge_start(String age_start) {
		this.age_start = age_start;
	}
	public String getAge_end() {
		return age_end;
	}
	public void setAge_end(String age_end) {
		this.age_end = age_end;
	}
	public String getFzrq_start() {
		return fzrq_start;
	}
	public void setFzrq_start(String fzrq_start) {
		this.fzrq_start = fzrq_start;
	}
	public String getFzrq_end() {
		return fzrq_end;
	}
	public void setFzrq_end(String fzrq_end) {
		this.fzrq_end = fzrq_end;
	}
	public String getYwzp()
	{
		return ywzp;
	}
	public void setYwzp(String ywzp)
	{
		this.ywzp = ywzp;
	}
	public String getDyzt() {
		return dyzt;
	}
	public void setDyzt(String dyzt) {
		this.dyzt = dyzt;
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
	public String getHjdqh() {
		return hjdqh;
	}
	public void setHjdqh(String hjdqh) {
		this.hjdqh = hjdqh;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getSfcyry()
	{
		return sfcyry;
	}
	public void setSfcyry(String sfcyry)
	{
		this.sfcyry = sfcyry;
	}
	public String getSfqkljry()
	{
		return sfqkljry;
	}
	public void setSfqkljry(String sfqkljry)
	{
		this.sfqkljry = sfqkljry;
	}
	public String getSfrsdqqkry()
	{
		return sfrsdqqkry;
	}
	public void setSfrsdqqkry(String sfrsdqqkry)
	{
		this.sfrsdqqkry = sfrsdqqkry;
	}
	public String getGwdq()
	{
		return gwdq;
	}
	public void setGwdq(String gwdq)
	{
		this.gwdq = gwdq;
	}
	public String getLbdsc()
	{
		return lbdsc;
	}
	public void setLbdsc(String lbdsc)
	{
		this.lbdsc = lbdsc;
	}
	public String getDjcs()
	{
		return djcs;
	}
	public void setDjcs(String djcs)
	{
		this.djcs = djcs;
	}
	public boolean isUsePage()
	{
		if("0".equals(this.isPage)){
			isUsePage = false;
		}
		return isUsePage;
	}
	public void setUsePage(boolean isUsePage)
	{
		this.isUsePage = isUsePage;
	}
	public String getParentCode()
	{
		return parentCode;
	}
	public void setParentCode(String parentCode)
	{
		this.parentCode = parentCode;
	}
	public String getIsPage()
	{
		return isPage;
	}
	public void setIsPage(String isPage)
	{
		this.isPage = isPage;
	}
	public String getTjsj_start() {
		return tjsj_start;
	}
	public void setTjsj_start(String tjsjStart) {
		tjsj_start = tjsjStart;
	}
	public String getTjsj_end() {
		return tjsj_end;
	}
	public void setTjsj_end(String tjsjEnd) {
		tjsj_end = tjsjEnd;
	}
	public String getTjdwdm() {
		return tjdwdm;
	}
	public void setTjdwdm(String tjdwdm) {
		this.tjdwdm = tjdwdm;
	}
	public String getTjjb() {
		return tjjb;
	}
	public void setTjjb(String tjjb) {
		this.tjjb = tjjb;
	}
	public String getTjdwmc() {
		return tjdwmc;
	}
	public void setTjdwmc(String tjdwmc) {
		this.tjdwmc = tjdwmc;
	}
	public String getJzzxxbh()
	{
		return jzzxxbh;
	}
	public void setJzzxxbh(String jzzxxbh)
	{
		this.jzzxxbh = jzzxxbh;
	}
	public String getZbsj() {
		int y,m,d;
		Calendar cal = Calendar.getInstance();
		y = cal.get(Calendar.YEAR);
		m = cal.get(Calendar.MONTH)+1;
		d = cal.get(Calendar.DATE);
		zbsj = y+"年"+m+"月"+d+"日";
		return zbsj;
	}
	public void setZbsj(String zbsj) {
		this.zbsj = zbsj;
	}
	
	
}
