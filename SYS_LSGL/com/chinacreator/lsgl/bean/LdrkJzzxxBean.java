package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 流动人口居住证信息
 * @company  chinacreator
 * @author zhun.liu
 * @date  Jan 17, 2014  4:50:03 PM
 */
public class LdrkJzzxxBean {
	/** 人员基本信息 */
	private String xm;
	private String sfzh;
	private String xb;
	private String xbms;
	private String xzzxz;
	private String rylb;
	private String rylbms;
	private String hjdxz;
	private String mz;
	private String mzms;
	private String hjdqh;   //户籍地区划
	
	private String rkfwglid;  //人口房屋关联ID
	
	private String jzzxxbh;	//   居住证编号
	private String fzrq;	//   发证日期
	private String yxqx;	//   有效期限
	private String yxqxms;
	private String djsj;	//	 登记时间
	private String djdw;	//	 登记单位
	private String djdwmc;	//	 登记单位代码
	private String djr;	//       登记人警号
	private String djrxm;	//   登记人姓名
	private String xgsj;	//	 修改时间
	private String xgr;	//		 修改人警号
	private String xgdw;	//	 修改人单位
	private String xgrxm;	//   修改人姓名
	private String xgdwmc;	//   修改人单位代码
	private String jzzrybh;	//   居住证人员编号
	private String jzzsfzh; //   居住证身份证号
	private String jzzdyzt;	//   居住证打印状态   10  未制证   20 已制证  30 注销 
	private String jzzdyztms;   
	private String jzzzxbs;	//   注销标识
	private String jzzzxbsms;
	private String zpbh;	//   照片编号
	private String jzzzxsj;	//   居住证注销时间
	private String jzzzxyy;	//   居住证注销原因
	private String dyzt;   //状态  1 首次打印  2 遗失补打 3 错正重打
	private String dyztms;
	private String zzbh;
	private String djrsfzh;  //登记人身份证号
	private String xgrsfzh;  //修改人身份证号
	private String cz;
	private String jzzhccz;
	
	private String zzdwdm;
	
	private String zzdwmc;
	
	private String zzsj;
	
	/**
	 * 流动人口注销页面去向
	 */
	private String qx;
	
	/**
	 * 流动人口注销标示
	 */
	private String ldrkzxbs;
	
	private String ldrkzxbsms;
	
	private String ldrkdjsj;

	private String fzrqmindate;
	
	private String fzrqmaxdate;
	/**
	 * 新增居住证打印日志标记
	 */
	private String dyrjh  ; //  居住证打印人警号
	private String dyrxm  ; //  居住证打印人姓名
	private String dyip  ; //   居住证打印人IP地址
	private String dysj  ; //   居住证打印时间
	private String dydwdm  ; // 居住证打印单位代码
	private String dydwmc  ; // 居住证打印单位名称
	
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getXgrsfzh() {
		return xgrsfzh;
	}
	public void setXgrsfzh(String xgrsfzh) {
		this.xgrsfzh = xgrsfzh;
	}
	public String getJzzxxbh() {
		return jzzxxbh;
	}
	public void setJzzxxbh(String jzzxxbh) {
		this.jzzxxbh = jzzxxbh;
	}
	public String getFzrq() {
		return fzrq;
	}
	public void setFzrq(String fzrq) {
		this.fzrq = fzrq;
	}
	public String getYxqx() {
		return yxqx;
	}
	public void setYxqx(String yxqx) {
		this.yxqx = yxqx;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getDjdw() {
		return djdw;
	}
	public void setDjdw(String djdw) {
		this.djdw = djdw;
	}
	public String getDjdwmc() {
		return djdwmc;
	}
	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}
	public String getDjr() {
		return djr;
	}
	public void setDjr(String djr) {
		this.djr = djr;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getXgsj() {
		return xgsj;
	}
	public void setXgsj(String xgsj) {
		this.xgsj = xgsj;
	}
	public String getXgr() {
		return xgr;
	}
	public void setXgr(String xgr) {
		this.xgr = xgr;
	}
	public String getXgdw() {
		return xgdw;
	}
	public void setXgdw(String xgdw) {
		this.xgdw = xgdw;
	}
	public String getXgrxm() {
		return xgrxm;
	}
	public void setXgrxm(String xgrxm) {
		this.xgrxm = xgrxm;
	}
	public String getXgdwmc() {
		return xgdwmc;
	}
	public void setXgdwmc(String xgdwmc) {
		this.xgdwmc = xgdwmc;
	}
	public String getJzzrybh() {
		return jzzrybh;
	}
	public void setJzzrybh(String jzzrybh) {
		this.jzzrybh = jzzrybh;
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
	public String getZpbh() {
		return zpbh;
	}
	public void setZpbh(String zpbh) {
		this.zpbh = zpbh;
	}
	public String getJzzzxsj() {
		return jzzzxsj;
	}
	public void setJzzzxsj(String jzzzxsj) {
		this.jzzzxsj = jzzzxsj;
	}
	public String getJzzzxyy() {
		return jzzzxyy;
	}
	public void setJzzzxyy(String jzzzxyy) {
		this.jzzzxyy = jzzzxyy;
	}
	public String getJzzsfzh() {
		return jzzsfzh;
	}
	public void setJzzsfzh(String jzzsfzh) {
		this.jzzsfzh = jzzsfzh;
	}
	public String getJzzzxbsms() {
		if("1".equals(jzzzxbs)){
			jzzzxbsms = "<font color=\"red\">已注销</font>";
		}else{
			jzzzxbsms = "<font color=\"green\">有效</font>";
		}
		return jzzzxbsms;
	}
	public void setJzzzxbsms(String jzzzxbsms) {
		this.jzzzxbsms = jzzzxbsms;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
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
	public String getXbms() {
		xbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		return xbms;
	}
	public void setXbms(String xbms) {
		this.xbms = xbms;
	}
	public String getXzzxz() {
		return xzzxz;
	}
	public void setXzzxz(String xzzxz) {
		this.xzzxz = xzzxz;
	}
	public String getRylb() {
		return rylb;
	}
	public void setRylb(String rylb) {
		this.rylb = rylb;
	}
	public String getRylbms() {
		rylbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_RYLB", rylb);
		return rylbms;
	}
	public void setRylbms(String rylbms) {
		this.rylbms = rylbms;
	}
	public String getHjdxz() {
		return hjdxz;
	}
	public void setHjdxz(String hjdxz) {
		this.hjdxz = hjdxz;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getMzms() {
		mzms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_MZ", mz);
		return mzms;
	}
	public void setMzms(String mzms) {
		this.mzms = mzms;
	}
	public String getZzbh() {
		return zzbh;
	}
	public void setZzbh(String zzbh) {
		this.zzbh = zzbh;
	}
	public String getYxqxms() {
		yxqxms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZZYXQX", yxqx);
		return yxqxms;
	}
	public void setYxqxms(String yxqxms) {
		this.yxqxms = yxqxms;
	}
	public String getJzzdyztms() {
		jzzdyztms = "";
		if("20".equals(jzzdyzt)){
			jzzdyztms = "<font color='green'>";
		}else if("10".equals(jzzdyzt)){
			jzzdyztms = "<font color='red'>";
		}
		jzzdyztms += DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_JZZDYZT", jzzdyzt);
		if("20".equals(jzzdyzt) || "10".equals(jzzdyzt)){
			jzzdyztms +="</font>";
		}
		return jzzdyztms;
	}
	public void setJzzdyztms(String jzzdyztms) {
		this.jzzdyztms = jzzdyztms;
	}
	public String getCz() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"openLdrkJzzxxWin('detail','" + jzzrybh + "','" + zzbh + "')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		if(loginInfo.getOrgcode().equals(djdw))
		{
			sb.append("<span onclick=\"openLdrkJzzxxWin('update','" + jzzrybh + "','" + zzbh + "')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
		}
		sb.append("<span onclick=\"openPreviewPage('" + jzzrybh + "','" + jzzxxbh + "')\" style=\"color:green\" class=\"cps_span_href\">预览</span>&nbsp;");
		cz = sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getDyzt() {
		return dyzt;
	}
	public void setDyzt(String dyzt) {
		this.dyzt = dyzt;
	}
	public String getQx() {
		return qx;
	}
	public void setQx(String qx) {
		this.qx = qx;
	}
	public String getHjdqh() {
		return hjdqh;
	}
	public void setHjdqh(String hjdqh) {
		this.hjdqh = hjdqh;
	}
	public String getRkfwglid() {
		return rkfwglid;
	}
	public void setRkfwglid(String rkfwglid) {
		this.rkfwglid = rkfwglid;
	}
	public String getJzzhccz()
	{
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"openLdrkJzzxxWin('detail','" + jzzrybh + "')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		sb.append("<span onclick=\"openPreviewPage('" + jzzrybh + "')\" style=\"color:green\" class=\"cps_span_href\">预览</span>&nbsp;");
		jzzhccz = sb.toString();
		return jzzhccz;
	}
	public void setJzzhccz(String jzzhccz)
	{
		this.jzzhccz = jzzhccz;
	}
	public String getZzdwdm()
	{
		return zzdwdm;
	}
	public void setZzdwdm(String zzdwdm)
	{
		this.zzdwdm = zzdwdm;
	}
	public String getZzdwmc()
	{
		return zzdwmc;
	}
	public void setZzdwmc(String zzdwmc)
	{
		this.zzdwmc = zzdwmc;
	}
	public String getZzsj()
	{
		return zzsj;
	}
	public void setZzsj(String zzsj)
	{
		this.zzsj = zzsj;
	}
	public String getDyztms()
	{
		if ("1".equals(dyzt))
		{
			dyztms = "<font color='green'>首次打印</font>";
		}
		else if ("2".equals(dyzt))
		{
			dyztms = "<font color='green'>遗失补打</font>";
		}
		else if ("3".equals(dyzt))
		{
			dyztms = "<font color='green'>错证重打</font>";
		}
		else
		{
			dyztms = "<font color='green'>未打印</font>";
		}
		return dyztms;
	}
	public void setDyztms(String dyztms)
	{
		this.dyztms = dyztms;
	}
	public String getLdrkzxbs()
	{
		return ldrkzxbs;
	}
	public void setLdrkzxbs(String ldrkzxbs)
	{
		this.ldrkzxbs = ldrkzxbs;
	}
	public String getLdrkzxbsms()
	{
		if ("1".equals(ldrkzxbs))
		{
			ldrkzxbsms = "<font color='red'>已注销</font>";
		}
		else
		{
			ldrkzxbsms = "<font color='green'>正常</font>";
		}
		return ldrkzxbsms;
	}
	public void setLdrkzxbsms(String ldrkzxbsms)
	{
		this.ldrkzxbsms = ldrkzxbsms;
	}
	public String getLdrkdjsj()
	{
		return ldrkdjsj;
	}
	public void setLdrkdjsj(String ldrkdjsj)
	{
		this.ldrkdjsj = ldrkdjsj;
	}
	public String getFzrqmindate()
	{
		return fzrqmindate;
	}
	public void setFzrqmindate(String fzrqmindate)
	{
		this.fzrqmindate = fzrqmindate;
	}
	public String getFzrqmaxdate()
	{
		return fzrqmaxdate;
	}
	public void setFzrqmaxdate(String fzrqmaxdate)
	{
		this.fzrqmaxdate = fzrqmaxdate;
	}
	public String getDyrjh() {
		return dyrjh;
	}
	public void setDyrjh(String dyrjh) {
		this.dyrjh = dyrjh;
	}
	public String getDyrxm() {
		return dyrxm;
	}
	public void setDyrxm(String dyrxm) {
		this.dyrxm = dyrxm;
	}
	public String getDyip() {
		return dyip;
	}
	public void setDyip(String dyip) {
		this.dyip = dyip;
	}
	public String getDysj() {
		return dysj;
	}
	public void setDysj(String dysj) {
		this.dysj = dysj;
	}
	public String getDydwdm() {
		return dydwdm;
	}
	public void setDydwdm(String dydwdm) {
		this.dydwdm = dydwdm;
	}
	public String getDydwmc() {
		return dydwmc;
	}
	public void setDydwmc(String dydwmc) {
		this.dydwmc = dydwmc;
	}
	
}
