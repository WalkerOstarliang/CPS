package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;

public class ZdryZkDjTjBean extends BaseValue{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4935168211120137972L;
	/**
	 * 统计重点人员在控登记情况：
	 * 操作
	 * 责任单位(代码)
	 * 责任单位名称
	 * 重点人员数
	 * 登记数
	 * 在控数
	 * 登记率
	 * 在控率
	 */
	private String cz;    // 操作
	private String zdryzrdw;  // 责任单位(代码)
	private String zdryzrdwmc; // 责任单位名称
	private String zdrysl;    // 重点人员数量
	private String zkdjs;     // 在控登记数
	private String zkdjzks;   // 在控登记在控数
	private String zkdjsks;  // 在控登记失控数
	private String zkdjlv;    // 在控登记率
	private String zkdjzklv;   // 在控登记在控率
	/**
	 * 查询条件中的值
	 * @return
	 */
	private String dJdateStart;  // 统计开始时间
	private String dJdateEnd;   // 统计截止时间
	private String zdryxm;   // 重点人员姓名
	private String zdrysfzh; // 重点人员身份证号码
	private String zdryzrdwdm;  // 重点人员所属单位代码
	private String zdrysssqdm;  // 重点人员所属社区代码
	
	public String getDJdateStart() {
		return dJdateStart;
	}

	public void setDJdateStart(String jdateStart) {
		dJdateStart = jdateStart;
	}

	public String getDJdateEnd() {
		return dJdateEnd;
	}

	public void setDJdateEnd(String jdateEnd) {
		dJdateEnd = jdateEnd;
	}

	public String getZdryxm() {
		return zdryxm;
	}

	public void setZdryxm(String zdryxm) {
		this.zdryxm = zdryxm;
	}

	public String getZdrysfzh() {
		return zdrysfzh;
	}

	public void setZdrysfzh(String zdrysfzh) {
		this.zdrysfzh = zdrysfzh;
	}

	public String getZdryzrdwdm() {
		return zdryzrdwdm;
	}

	public void setZdryzrdwdm(String zdryzrdwdm) {
		this.zdryzrdwdm = zdryzrdwdm;
	}

	public String getZdrysssqdm() {
		return zdrysssqdm;
	}

	public void setZdrysssqdm(String zdrysssqdm) {
		this.zdrysssqdm = zdrysssqdm;
	}

	public String getZdryzrdw() {
		return zdryzrdw;
	}

	public void setZdryzrdw(String zdryzrdw) {
		this.zdryzrdw = zdryzrdw;
	}

	public String getZdryzrdwmc() {
		return zdryzrdwmc;
	}

	public void setZdryzrdwmc(String zdryzrdwmc) {
		this.zdryzrdwmc = zdryzrdwmc;
	}

	public String getZdrysl() {
		zdrysl = "<span class=\"cps_span_href\" onclick=\"openZdryxxWin( '"+this.zdryzrdw+"')\" style=\"color:green\">"+this.zdrysl+"</span>&nbsp;";
		return zdrysl;
	}

	public void setZdrysl(String zdrysl) {
		this.zdrysl = zdrysl;
	}

	public String getZkdjs() {
		if (!zkdjs.equals("0")){
			zkdjs = "<span class=\"cps_span_href\" onclick=\"openZdryzkdjxxWin( '"+this.zdryzrdw+"')\" style=\"color:green\">"+this.zkdjs+"</span>&nbsp;";
		}
		return zkdjs;
	}

	public void setZkdjs(String zkdjs) {
		this.zkdjs = zkdjs;
	}

	public String getZkdjzks() {
		if (!zkdjzks.equals("0")){
			zkdjzks = "<span class=\"cps_span_href\" onclick=\"openZdryzkdjzksxxWin( '"+this.zdryzrdw+"')\" style=\"color:green\">"+this.zkdjzks+"</span>&nbsp;";
		}
		return zkdjzks;
	}

	public void setZkdjzks(String zkdjzks) {
		this.zkdjzks = zkdjzks;
	}

	public String getZkdjlv() {
		return zkdjlv;
	}

	public void setZkdjlv(String zkdjlv) {
		this.zkdjlv = zkdjlv;
	}

	public String getZkdjzklv() {
		return zkdjzklv;
	}

	public void setZkdjzklv(String zkdjzklv) {
		this.zkdjzklv = zkdjzklv;
	}

	public String getCz() {
		// 此处已不用
		this.cz = "<span class=\"cps_span_href\" onclick=\"openZdryxxWin( '"+this.zdryzrdw+"')\" style=\"color:green\">点击查看</span>&nbsp;";
		return this.cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getZkdjsks() {
		if (!zkdjsks.equals("0")){
			zkdjsks = "<span class=\"cps_span_href\" onclick=\"openZdryzkdjsksxxWin( '"+this.zdryzrdw+"')\" style=\"color:green\">"+this.zkdjsks+"</span>&nbsp;";
		}
		return zkdjsks;
	}

	public void setZkdjsks(String zkdjsks) {
		this.zkdjsks = zkdjsks;
	}

}
