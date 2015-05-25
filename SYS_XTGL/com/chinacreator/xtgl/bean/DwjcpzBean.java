package com.chinacreator.xtgl.bean;

import com.chinacreator.common.bean.CommonLogBean;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 单位检查参数
 */
public class DwjcpzBean extends CommonLogBean {

	private static final long serialVersionUID = 1978786037854267268L;
	
	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 行业类别
	 */
	private String hylb;
	
	private String hylbmc;
	
	/**
	 * 单位大类
	 */
	private String dwdl;
	private String dwdlmc;
	
	/**
	 * 单位小类
	 */
	private String dwxl;
	private String dwxlmc;
	
	/**
	 * 检查周期（单位天）
	 */
	private String jczq;
	
	/**
	 * 登记日期
	 */
	private String djrq;
	
	/**
	 * 登记单位代码
	 */
	private String djdwdm;
	
	/**
	 * 登记单位名称
	 */
	private String djdwmc;
	
	/**
	 * 登记人姓名
	 */
	private String djrxm;
	
	/**
	 * 操作单位代码
	 */
	private String czdwdm;
	
	/**
	 * 操作单位名称
	 */
	private String czdwmc;
	
	/**
	 * 操作人姓名
	 */
	private String czrxm;
	
	/**
	 * 操作时间
	 */
	private String czsj;
	
	/**
	 * 操作标识
	 */
	private String czbs;
	
	/**
	 * 检查周期单位
	 */
	private String dw;
	
	/**
	 * 检查周期数值
	 */
	private String sz;
	
	/**
	 * 单位检查周期显示
	 */
	private String showJczq;
	
	/**
	 * 提醒提前天数
	 */
	private String tqtxts;
	
	/**
	 * 特殊日期
	 */
	private String[] tsrq;
	
	/**
	 * 操作人警号
	 */
	private String czrjh;
	
	/**
	 * 登记人警号
	 */
	private String djrjh;
	
	public String[] getTsrq() {
		return tsrq;
	}

	public void setTsrq(String[] tsrq) {
		this.tsrq = tsrq;
	}

	public String getShowJczq() {
		showJczq = this.sz+"("+DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_JCZQDW",this.dw)+")";
		return showJczq;
	}

	public void setShowJczq(String showJczq) {
		this.showJczq = showJczq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDwdl() {
		return dwdl;
	}

	public void setDwdl(String dwdl) {
		this.dwdl = dwdl;
	}

	public String getDwxl() {
		return dwxl;
	}

	public void setDwxl(String dwxl) {
		this.dwxl = dwxl;
	}

	public String getJczq() {
		return jczq;
	}

	public void setJczq(String jczq) {
		this.jczq = jczq;
	}

	public String getDjrq() {
		return djrq;
	}

	public void setDjrq(String djrq) {
		this.djrq = djrq;
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

	public String getDjrxm() {
		return djrxm;
	}

	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}

	public String getCzdwdm() {
		return czdwdm;
	}

	public void setCzdwdm(String czdwdm) {
		this.czdwdm = czdwdm;
	}

	public String getCzdwmc() {
		return czdwmc;
	}

	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}

	public String getCzrxm() {
		return czrxm;
	}

	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}

	public String getCzsj() {
		return czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public String getCzbs() {
		return czbs;
	}

	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

	public String getDw() {
		return dw;
	}

	public void setDw(String dw) {
		this.dw = dw;
	}

	public String getSz() {
		return sz;
	}

	public void setSz(String sz) {
		this.sz = sz;
	}

	public String getHylb() {
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}

	public String getHylbmc() {
		hylbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_HYLB",hylb);
		return hylbmc;
	}

	public void setHylbmc(String hylbmc) {
		this.hylbmc = hylbmc;
	}

	public String getDwdlmc() {
		if("01".equals(hylb)){
			dwdlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_THLB",dwdl);
		}else if("02".equals(hylb)){
			dwdlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GGCSLB",dwdl);
		}else if("03".equals(hylb)){
			dwdlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_DWFL",dwdl);
		}
		return dwdlmc;
	}

	public void setDwdlmc(String dwdlmc) {
		this.dwdlmc = dwdlmc;
	}

	public String getDwxlmc() {
		if("01".equals(hylb)){
			dwxlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_THLB",dwxl);
		}else if("02".equals(hylb)){
			dwxlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GGCSLB",dwxl);
		}else if("03".equals(hylb)){
			dwxlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_DWFL",dwxl);
		}
		return dwxlmc;
	}

	public void setDwxlmc(String dwxlmc) {
		this.dwxlmc = dwxlmc;
	}

	public String getTqtxts() {
		return tqtxts;
	}

	public void setTqtxts(String tqtxts) {
		this.tqtxts = tqtxts;
	}

	public String getCzrjh() {
		return czrjh;
	}

	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
	}

	public String getDjrjh() {
		return djrjh;
	}

	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}
	
}
