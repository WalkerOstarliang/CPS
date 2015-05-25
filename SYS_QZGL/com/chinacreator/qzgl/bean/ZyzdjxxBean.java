package com.chinacreator.qzgl.bean;

import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class ZyzdjxxBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8002655742042043972L;
	
	private String bh;
	private String xm;
	private String sfzh;
	private String xb;
	private String xbmc;
	private String csrq;
	private String whcd;
	private String whcdmc;
	private String lxdh;
	private String email;
	private String qqhm;
	private String jtzz;
	private String ssjwqsdm;
	private String ssjwqsmc;
	private String sspcsdm;
	private String sspcsmc;
	private String djrxm;
	private String djsj;
	private String djdwdm;
	private String djdwmc;
	private String djrjh;
	private String cz;
	private String djrsfzh;
	
	
	private List<ZyzzcxxBean> zyzzList;
	
	public List<ZyzzcxxBean> getZyzzList() {
		return zyzzList;
	}
	public void setZyzzList(List<ZyzzcxxBean> zyzzList) {
		this.zyzzList = zyzzList;
	}
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
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
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getWhcd() {
		return whcd;
	}
	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQqhm() {
		return qqhm;
	}
	public void setQqhm(String qqhm) {
		this.qqhm = qqhm;
	}
	public String getJtzz() {
		return jtzz;
	}
	public void setJtzz(String jtzz) {
		this.jtzz = jtzz;
	}
	public String getSsjwqsdm() {
		return ssjwqsdm;
	}
	public void setSsjwqsdm(String ssjwqsdm) {
		this.ssjwqsdm = ssjwqsdm;
	}
	public String getSsjwqsmc() {
		if (ValidateHelper.isEmptyString(ssjwqsmc))
		{
			ssjwqsmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(ssjwqsdm);
		}
		return ssjwqsmc;
	}
	public void setSsjwqsmc(String ssjwqsmc) {
		this.ssjwqsmc = ssjwqsmc;
	}
	public String getSspcsdm() {
		return sspcsdm;
	}
	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}
	public String getSspcsmc() {
		sspcsmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(sspcsdm);
		return sspcsmc;
	}
	public void setSspcsmc(String sspcsmc) {
		this.sspcsmc = sspcsmc;
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
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}
	public String getXbmc() {
		if(ValidateHelper.isNotEmptyString(xb)){
			xbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		}
		return xbmc;
	}
	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}
	public String getCz() {
		if(cz==null || cz.trim().equals("")){
			StringBuffer sb = new StringBuffer();
			if(qxpd()){
				sb.append("<span onclick=\"add('update','").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
				sb.append("<span onclick=\"deleteInfoByBh('").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
			}
			sb.append("<span onclick=\"add('detail','").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
			cz=sb.toString();
		}
		return cz;
	}
 	private boolean qxpd(){
		LoginInfo log = ActionContextHelper.getLoginInfo();
		if(djdwdm.endsWith(log.getOrgcode())){
			return true;
		}
		return false;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getWhcdmc() {
		if(ValidateHelper.isNotEmptyString(whcd)){
			whcdmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_WHCD", whcd);
		}
		return whcdmc;
	}
	public void setWhcdmc(String whcdmc) {
		this.whcdmc = whcdmc;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	
	

}
