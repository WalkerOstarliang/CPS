package com.chinacreator.xtgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.ValidateHelper;

public class KhpmBean extends BaseValue {

	private static final long serialVersionUID = -4689178684769207734L;
	
	private String id;
	
	/**
	 * 机构代码
	 */
	private String orgcode;
	
	/**
	 * 民警姓名
	 */
	private String mjxm;
	
	/**
	 * 机构名称
	 */
	private String orgname;
	
	/**
	 * 统计起始时间
	 */
	private String tjqssj;
	
	/**
	 * 统计截止时间
	 */
	private String tjzzsj;
	
	/**
	 * 总分值
	 */
	private String zfz;
	
	/**
	 * 基础信息采集数量 5分 大类：两实信息采集维护25分
	 */
	private String jcxxcjslfz;
	
	/**
	 * 信息维护10分 大类：两实信息采集维护25分
	 */
	private String xxwffz;
	
	/**
	 * 信息质量10分 大类：两实信息采集维护25分
	 */
	private String xxzlfz;
	
	/**
	 * 下发数据维护8分 大类：重点人员动态管控20分
	 */
	private String xfsjwffz;
	
	/**
	 * 委托签收管理6分 大类：重点人员动态管控20分
	 */
	private String wtqsglfz;
	
	/**
	 * 在控登记质量6分 大类：重点人员动态管控20分
	 */
	private String zkdjzlfz;
	
	/**
	 * 消防基础工作5分 大类：相关警种基础工作20分
	 */
	private String xfjcgzfz;
	
	/**
	 * 治安基础工作5分 大类：相关警种基础工作20分
	 */
	private String zajcgzfz;
	
	/**
	 * 国保基础工作2分 大类：相关警种基础工作20分
	 */
	private String gbjcgzfz;
	
	/**
	 * 刑侦基础工作2分 大类：相关警种基础工作20分
	 */
	private String xzjcgzfz;
	
	/**
	 * 网技基础工作2分 大类：相关警种基础工作20分
	 */
	private String wjjcgzfz;
	
	/**
	 * 内保基础工作2分 大类：相关警种基础工作20分
	 */
	private String nbjcgzfz;
	
	/**
	 * 禁毒基础工作2分 大类：相关警种基础工作20分
	 */
	private String jdjcgzfz;
	
	/**
	 * 情报收集2分 大类：情报信息收集报送5分
	 */
	private String qbsjfz;
	
	/**
	 * 情报运用3分 大类：情报信息收集报送5分
	 */
	private String qbyyfz;
	
	/**
	 * 当月盘查辖区10名以上可疑人员  大类：安全防范日常管理5分
	 */
	private String dypcxqkyryfz;
	
	/**
	 * 录入盘查信息不准确的  大类：安全防范日常管理5分
	 */
	private String lrpcxxbzqfz;
	
	/**
	 * 当月盘查抓获网上在逃人员  大类：安全防范日常管理5分
	 */
	private String dypczhwsztryfz;
	
	/**
	 * 经盘查发现非本派出所的重点人员   安全防范日常管理5分
	 */
	private String jpcfxfbdzdryfz;
	
	/**
	 * 管控的重点人员被治安处罚 安全防范日常管理5分
	 */
	private String gkzdrybzacffz;
	
	/**
	 * 管控的重点人员被刑事处罚 安全防范日常管理5分
	 */
	private String gkzdrybxscffz;
	
	/**
	 * 两实人口采集被治安处罚以上的 安全防范日常管理5分
	 */
	private String lsrkcjbzacffz;
	
	/**
	 * 两实人口采集被刑事处罚以上的 安全防范日常管理5分
	 */
	private String lsrkcjbxscffz;
	
	/**
	 * 防范入室盗窃案件10分
	 */
	private String ffrsdqajfz;
	
	/**
	 * 统计人
	 */
	private String tjr;

	/**
	 * 统计单位
	 */
	private String tjdw;
	
	/**
	 * 两实总分
	 */
	private String lszf;
	
	/**
	 * 重点人员总分
	 */
	private String zdryzf;
	
	/**
	 * 相关警种总分
	 */
	private String xgjzzf;
	
	/**
	 * 情报总分
	 */
	private String qbzf; 
	
	/**
	 * 安全防范总分
	 */
	private String aqffzf;
	
	/**
	 * 排名
	 */
	private String pm;
	
	/**
	 * 重点人员重新违法犯罪2分
	 */
	private String zdrycxwffz;
	
	/**
	 * 取保候审监视居住管理2分
	 */
	private String qbhsjsjzgl;
	
	/**
	 * 八进社区工作总分
	 */
	private String bjsqgzzf;
	
	/**
	 * 群众走访总分
	 */
	private String qzzfzf;
	
	/**
	 * 一般性走访
	 */
	private String ybxzf;
	
	/**
	 * 入室盗窃回访
	 */
	private String rsdqhf; 
	
	/**
	 * 防控刑事治安案件总分
	 */
	private String fkxszaajzf;
	
	/**
	 * 治安案件
	 */
	private String zaaj;
	
	/**
	 * 刑事案件
	 */
	private String xsaj;
	
	/**
	 * 境外人员管理
	 */
	private String jwrygl;
	
	/**
	 * 社区矫正对象管理
	 */
	private String sqjzdxgl;
	
	/**
	 * 稳控对象管理
	 */
	private String wkdxgl;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getTjqssj() {
		return tjqssj;
	}

	public void setTjqssj(String tjqssj) {
		this.tjqssj = tjqssj;
	}

	public String getTjzzsj() {
		return tjzzsj;
	}

	public void setTjzzsj(String tjzzsj) {
		this.tjzzsj = tjzzsj;
	}

	public String getZfz() {
		return zfz;
	}

	public void setZfz(String zfz) {
		this.zfz = zfz;
	}

	public String getJcxxcjslfz() {
		if(ValidateHelper.isNotEmptyString(jcxxcjslfz)){
			jcxxcjslfz =jcxxcjslfz.trim();
		}
		return jcxxcjslfz;
	}

	public void setJcxxcjslfz(String jcxxcjslfz) {
		this.jcxxcjslfz = jcxxcjslfz;
	}

	public String getXxwffz() {
		if(ValidateHelper.isNotEmptyString(xxwffz)){
			xxwffz =xxwffz.trim();
		}
		return xxwffz;
	}

	public void setXxwffz(String xxwffz) {
		this.xxwffz = xxwffz;
	}

	public String getXxzlfz() {
		if(ValidateHelper.isNotEmptyString(xxzlfz)){
			xxzlfz =xxzlfz.trim();
		}
		return xxzlfz;
	}

	public void setXxzlfz(String xxzlfz) {
		this.xxzlfz = xxzlfz;
	}

	public String getXfsjwffz() {
		if(ValidateHelper.isNotEmptyString(xfsjwffz)){
			xfsjwffz =xfsjwffz.trim();
		}
		return xfsjwffz;
	}

	public void setXfsjwffz(String xfsjwffz) {
		this.xfsjwffz = xfsjwffz;
	}

	public String getWtqsglfz() {
		if(ValidateHelper.isNotEmptyString(wtqsglfz)){
			wtqsglfz =wtqsglfz.trim();
		}
		return wtqsglfz;
	}

	public void setWtqsglfz(String wtqsglfz) {
		this.wtqsglfz = wtqsglfz;
	}

	public String getZkdjzlfz() {
		if(ValidateHelper.isNotEmptyString(zkdjzlfz)){
			zkdjzlfz =zkdjzlfz.trim();
		}
		return zkdjzlfz;
	}

	public void setZkdjzlfz(String zkdjzlfz) {
		this.zkdjzlfz = zkdjzlfz;
	}

	public String getXfjcgzfz() {
		if(ValidateHelper.isNotEmptyString(xfjcgzfz)){
			xfjcgzfz =xfjcgzfz.trim();
		}
		return xfjcgzfz;
	}

	public void setXfjcgzfz(String xfjcgzfz) {
		this.xfjcgzfz = xfjcgzfz;
	}

	public String getZajcgzfz() {
		if(ValidateHelper.isNotEmptyString(zajcgzfz)){
			zajcgzfz =zajcgzfz.trim();
		}
		return zajcgzfz;
	}

	public void setZajcgzfz(String zajcgzfz) {
		this.zajcgzfz = zajcgzfz;
	}

	public String getGbjcgzfz() {
		if(ValidateHelper.isNotEmptyString(gbjcgzfz)){
			gbjcgzfz =gbjcgzfz.trim();
		}
		return gbjcgzfz;
	}

	public void setGbjcgzfz(String gbjcgzfz) {
		this.gbjcgzfz = gbjcgzfz;
	}

	public String getXzjcgzfz() {
		if(ValidateHelper.isNotEmptyString(xzjcgzfz)){
			xzjcgzfz =xzjcgzfz.trim();
		}
		return xzjcgzfz;
	}

	public void setXzjcgzfz(String xzjcgzfz) {
		this.xzjcgzfz = xzjcgzfz;
	}

	public String getWjjcgzfz() {
		if(ValidateHelper.isNotEmptyString(wjjcgzfz)){
			wjjcgzfz =wjjcgzfz.trim();
		}
		return wjjcgzfz;
	}

	public void setWjjcgzfz(String wjjcgzfz) {
		this.wjjcgzfz = wjjcgzfz;
	}

	public String getNbjcgzfz() {
		if(ValidateHelper.isNotEmptyString(nbjcgzfz)){
			nbjcgzfz =nbjcgzfz.trim();
		}
		return nbjcgzfz;
	}

	public void setNbjcgzfz(String nbjcgzfz) {
		this.nbjcgzfz = nbjcgzfz;
	}

	public String getJdjcgzfz() {
		if(ValidateHelper.isNotEmptyString(jdjcgzfz)){
			jdjcgzfz =jdjcgzfz.trim();
		}
		return jdjcgzfz;
	}

	public void setJdjcgzfz(String jdjcgzfz) {
		this.jdjcgzfz = jdjcgzfz;
	}

	public String getQbsjfz() {
		if(ValidateHelper.isNotEmptyString(qbsjfz)){
			qbsjfz =qbsjfz.trim();
		}
		return qbsjfz;
	}

	public void setQbsjfz(String qbsjfz) {
		this.qbsjfz = qbsjfz;
	}

	public String getQbyyfz() {
		if(ValidateHelper.isNotEmptyString(qbyyfz)){
			qbyyfz =qbyyfz.trim();
		}
		return qbyyfz;
	}

	public void setQbyyfz(String qbyyfz) {
		this.qbyyfz = qbyyfz;
	}

	public String getDypcxqkyryfz() {
		if(ValidateHelper.isNotEmptyString(dypcxqkyryfz)){
			dypcxqkyryfz =dypcxqkyryfz.trim();
		}
		return dypcxqkyryfz;
	}

	public void setDypcxqkyryfz(String dypcxqkyryfz) {
		this.dypcxqkyryfz = dypcxqkyryfz;
	}

	public String getLrpcxxbzqfz() {
		if(ValidateHelper.isNotEmptyString(lrpcxxbzqfz)){
			lrpcxxbzqfz =lrpcxxbzqfz.trim();
		}
		return lrpcxxbzqfz;
	}

	public void setLrpcxxbzqfz(String lrpcxxbzqfz) {
		
		this.lrpcxxbzqfz = lrpcxxbzqfz;
	}

	public String getDypczhwsztryfz() {
		if(ValidateHelper.isNotEmptyString(dypczhwsztryfz)){
			dypczhwsztryfz =dypczhwsztryfz.trim();
		}
		return dypczhwsztryfz;
	}

	public void setDypczhwsztryfz(String dypczhwsztryfz) {
		this.dypczhwsztryfz = dypczhwsztryfz;
	}

	public String getJpcfxfbdzdryfz() {
		if(ValidateHelper.isNotEmptyString(jpcfxfbdzdryfz)){
			jpcfxfbdzdryfz =jpcfxfbdzdryfz.trim();
		}
		return jpcfxfbdzdryfz;
	}

	public void setJpcfxfbdzdryfz(String jpcfxfbdzdryfz) {
		this.jpcfxfbdzdryfz = jpcfxfbdzdryfz;
	}

	public String getGkzdrybzacffz() {
		if(ValidateHelper.isNotEmptyString(gkzdrybzacffz)){
			gkzdrybzacffz =gkzdrybzacffz.trim();
		}
		return gkzdrybzacffz;
	}

	public void setGkzdrybzacffz(String gkzdrybzacffz) {
		this.gkzdrybzacffz = gkzdrybzacffz;
	}

	public String getGkzdrybxscffz() {
		if(ValidateHelper.isNotEmptyString(gkzdrybxscffz)){
			gkzdrybxscffz =gkzdrybxscffz.trim();
		}
		return gkzdrybxscffz;
	}

	public void setGkzdrybxscffz(String gkzdrybxscffz) {
		this.gkzdrybxscffz = gkzdrybxscffz;
	}

	public String getLsrkcjbzacffz() {
		if(ValidateHelper.isNotEmptyString(lsrkcjbzacffz)){
			lsrkcjbzacffz =lsrkcjbzacffz.trim();
		}
		return lsrkcjbzacffz;
	}

	public void setLsrkcjbzacffz(String lsrkcjbzacffz) {
		this.lsrkcjbzacffz = lsrkcjbzacffz;
	}

	public String getLsrkcjbxscffz() {
		if(ValidateHelper.isNotEmptyString(lsrkcjbxscffz)){
			lsrkcjbxscffz =lsrkcjbxscffz.trim();
		}
		return lsrkcjbxscffz;
	}

	public void setLsrkcjbxscffz(String lsrkcjbxscffz) {
		this.lsrkcjbxscffz = lsrkcjbxscffz;
	}

	public String getFfrsdqajfz() {
		if(ValidateHelper.isNotEmptyString(ffrsdqajfz)){
			ffrsdqajfz =ffrsdqajfz.trim();
		}
		return ffrsdqajfz;
	}

	public void setFfrsdqajfz(String ffrsdqajfz) {
		this.ffrsdqajfz = ffrsdqajfz;
	}

	public String getTjr() {
		return tjr;
	}

	public void setTjr(String tjr) {
		this.tjr = tjr;
	}

	public String getTjdw() {
		return tjdw;
	}

	public void setTjdw(String tjdw) {
		this.tjdw = tjdw;
	}

	public String getLszf() {
		if(ValidateHelper.isNotEmptyString(lszf)){
			lszf =lszf.trim();
		}
		return lszf;
	}

	public void setLszf(String lszf) {
		this.lszf = lszf;
	}

	public String getZdryzf() {
		if(ValidateHelper.isNotEmptyString(zdryzf)){
			zdryzf =zdryzf.trim();
		}
		return zdryzf;
	}

	public void setZdryzf(String zdryzf) {
		this.zdryzf = zdryzf;
	}

	public String getXgjzzf() {
		if(ValidateHelper.isNotEmptyString(xgjzzf)){
			xgjzzf =xgjzzf.trim();
		}
		return xgjzzf;
	}

	public void setXgjzzf(String xgjzzf) {
		this.xgjzzf = xgjzzf;
	}

	public String getQbzf() {
		if(ValidateHelper.isNotEmptyString(qbzf)){
			qbzf =qbzf.trim();
		}
		return qbzf;
	}

	public void setQbzf(String qbzf) {
		this.qbzf = qbzf;
	}

	public String getAqffzf() {
		if(ValidateHelper.isNotEmptyString(aqffzf)){
			aqffzf =aqffzf.trim();
		}
		return aqffzf;
	}

	public void setAqffzf(String aqffzf) {
		this.aqffzf = aqffzf;
	}

	public String getPm() {
		if(ValidateHelper.isNotEmptyString(this.pm)){
			pm = pm.trim();
			if(ValidateHelper.isEmptyString(pm)){
				pm = "1";
			}
		}else{
			pm = "1";
		}
		return pm;
	}

	public void setPm(String pm) {
		this.pm = pm;
	}

	public String getMjxm() {
		if(ValidateHelper.isEmptyString(this.mjxm)){
			mjxm = " ";
		}
		return mjxm;
	}

	public void setMjxm(String mjxm) {
		this.mjxm = mjxm;
	}

	public String getZdrycxwffz() {
		if(ValidateHelper.isNotEmptyString(zdrycxwffz)){
			zdrycxwffz =zdrycxwffz.trim();
		}
		return zdrycxwffz;
	}

	public void setZdrycxwffz(String zdrycxwffz) {
		this.zdrycxwffz = zdrycxwffz;
	}

	public String getQbhsjsjzgl() {
		if(ValidateHelper.isNotEmptyString(qbhsjsjzgl)){
			qbhsjsjzgl =qbhsjsjzgl.trim();
		}
		return qbhsjsjzgl;
	}

	public void setQbhsjsjzgl(String qbhsjsjzgl) {
		this.qbhsjsjzgl = qbhsjsjzgl;
	}

	public String getBjsqgzzf() {
		return bjsqgzzf;
	}

	public void setBjsqgzzf(String bjsqgzzf) {
		this.bjsqgzzf = bjsqgzzf;
	}

	public String getQzzfzf() {
		return qzzfzf;
	}

	public void setQzzfzf(String qzzfzf) {
		this.qzzfzf = qzzfzf;
	}

	public String getFkxszaajzf() {
		return fkxszaajzf;
	}

	public void setFkxszaajzf(String fkxszaajzf) {
		this.fkxszaajzf = fkxszaajzf;
	}

	public String getYbxzf() {
		return ybxzf;
	}

	public void setYbxzf(String ybxzf) {
		this.ybxzf = ybxzf;
	}

	public String getRsdqhf() {
		return rsdqhf;
	}

	public void setRsdqhf(String rsdqhf) {
		this.rsdqhf = rsdqhf;
	}

	public String getJwrygl() {
		return jwrygl;
	}

	public void setJwrygl(String jwrygl) {
		this.jwrygl = jwrygl;
	}

	public String getZaaj() {
		return zaaj;
	}

	public void setZaaj(String zaaj) {
		this.zaaj = zaaj;
	}

	public String getXsaj() {
		return xsaj;
	}

	public void setXsaj(String xsaj) {
		this.xsaj = xsaj;
	}

	public String getSqjzdxgl() {
		return sqjzdxgl;
	}

	public void setSqjzdxgl(String sqjzdxgl) {
		this.sqjzdxgl = sqjzdxgl;
	}

	public String getWkdxgl() {
		return wkdxgl;
	}

	public void setWkdxgl(String wkdxgl) {
		this.wkdxgl = wkdxgl;
	}
}
