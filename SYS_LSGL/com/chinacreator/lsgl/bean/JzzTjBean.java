package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 居住证统计bean
 */
public class JzzTjBean extends BaseValue {

	private static final long serialVersionUID = -2375429495155625544L;
	
	/**
	 * 单位代码
	 */
	private String orgcode;
	/**
	 * 单位名称
	 */
	private String orgname;
	
	/**
	 * 居住证打印数
	 */
	private String jzzdys;
	
	/**
	 * 居住证登记数
	 */
	private String jzzdjs;
	
	/**
	 * 居住证登记男人数
	 */
	private String jzzdjms;
	
	/**
	 * 居住证登记女人数
	 */
	private String jzzdjws;
	
	/**
	 * 居住证登记本省人数
	 */
	private String jzzdjbsrs;
	
	/**
	 * 居住证登记外省人数
	 */
	private String jzzdjwsrs;
	
	/**
	 * 废证数
	 */
	private String fzs;
	
	/**
	 * 遗失补打数
	 */
	private String ysbds;
	
	/**
	 * 流动人口登记数
	 */
	private String ldrkdjs;
	
	/**
	 * 废证率
	 */
	private String fzl;
	
	/**
	 * 遗失补打率
	 */
	private String ysbdl;
	
	/**
	 * 办证率
	 */
	private String bzl;
	
	private int orgLeve;

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getOrgname() {
		if(ValidateHelper.isNotEmptyString(jzzdjs)){
			if(ValidateHelper.isEmptyString(orgname)){
				orgname = "合计";
			}else{
				if(orgLeve<5){
					orgname = "<span class=\"cps_span_href\" onclick=\"jzztjDown('" + orgcode + "','"+orgname+"')\" style=\"color:green\">"+orgname+"</span>&nbsp;";
				}
			}
		}
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getJzzdys() {
		return jzzdys;
	}

	public void setJzzdys(String jzzdys) {
		this.jzzdys = jzzdys;
	}

	public String getJzzdjs() {
		return jzzdjs;
	}

	public void setJzzdjs(String jzzdjs) {
		this.jzzdjs = jzzdjs;
	}

	public String getJzzdjms() {
		return jzzdjms;
	}

	public void setJzzdjms(String jzzdjms) {
		this.jzzdjms = jzzdjms;
	}

	public String getJzzdjws() {
		return jzzdjws;
	}

	public void setJzzdjws(String jzzdjws) {
		this.jzzdjws = jzzdjws;
	}

	public String getJzzdjbsrs() {
		return jzzdjbsrs;
	}

	public void setJzzdjbsrs(String jzzdjbsrs) {
		this.jzzdjbsrs = jzzdjbsrs;
	}

	public String getJzzdjwsrs() {
		return jzzdjwsrs;
	}

	public void setJzzdjwsrs(String jzzdjwsrs) {
		this.jzzdjwsrs = jzzdjwsrs;
	}

	public String getFzs() {
		return fzs;
	}

	public void setFzs(String fzs) {
		this.fzs = fzs;
	}

	public String getYsbds() {
		return ysbds;
	}

	public void setYsbds(String ysbds) {
		this.ysbds = ysbds;
	}

	public String getLdrkdjs() {
		return ldrkdjs;
	}

	public void setLdrkdjs(String ldrkdjs) {
		this.ldrkdjs = ldrkdjs;
	}

	public String getFzl() {
		return fzl;
	}

	public void setFzl(String fzl) {
		this.fzl = fzl;
	}

	public String getYsbdl() {
		return ysbdl;
	}

	public void setYsbdl(String ysbdl) {
		this.ysbdl = ysbdl;
	}

	public String getBzl() {
		return bzl;
	}

	public void setBzl(String bzl) {
		this.bzl = bzl;
	}

	public int getOrgLeve() {
		return orgLeve;
	}

	public void setOrgLeve(int orgLeve) {
		this.orgLeve = orgLeve;
	}
	
}
