package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;

public class GyhdBean extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6735863178895504563L;

	private String bh;
	private String hdzt;
	private String hdsj;
	private String hddz;
	private String cydwjry;
	private String cyry;
	private String hdnr;
	private String bz;
	private String djrjh;			//登记人警号
	private String djrxm;			//登记人姓名
	private String djsj;			//登记时间
	private String djdwdm;			//登记单位代码
	private String djdwmc;			//登记单位名称
	private String cz;				//操作
	
	private String fj;				//查询附件的个数
	private String fjxx;			//附件的操作 
	private String djrsfzh;
	/*******************************************************************************
	 *                        Getter & Setter                                      *
	 *******************************************************************************/
	
	public String getBh() {
		return bh;
	}
	public String getFjxx() {
		if(fjxx == null || fjxx.trim().equals("")){
			StringBuffer sb = new StringBuffer();
			sb.append("<a href=\"#\" onclick=\"listFjxx('");
			sb.append(bh);
			sb.append("')\">");
			sb.append(fj);
			sb.append("</a>");
			fjxx = sb.toString();
		}
		return fjxx;
	}
	public void setFjxx(String fjxx) {
		this.fjxx = fjxx;
	}
	public String getFj() {
		return fj;
	}
	public void setFj(String fj) {
		this.fj = fj;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getHdzt() {
		return hdzt;
	}
	public void setHdzt(String hdzt) {
		this.hdzt = hdzt;
	}
	public String getHdsj() {
		return hdsj;
	}
	public void setHdsj(String hdsj) {
		this.hdsj = hdsj;
	}
	public String getHddz() {
		return hddz;
	}
	public void setHddz(String hddz) {
		this.hddz = hddz;
	}
	public String getCydwjry() {
		return cydwjry;
	}
	public void setCydwjry(String cydwjry) {
		this.cydwjry = cydwjry;
	}
	public String getCyry() {
		return cyry;
	}
	public void setCyry(String cyry) {
		this.cyry = cyry;
	}
	public String getHdnr() {
		return hdnr;
	}
	public void setHdnr(String hdnr) {
		this.hdnr = hdnr;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
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
	public String getCz() {
		if(cz==null || cz.trim().equals("")){
			StringBuffer sb = new StringBuffer();
			sb.append("<span onclick=\"openInfoWin('detail','").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
			if(qxpd()){
				sb.append("<span onclick=\"openInfoWin('update','").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
				sb.append("<span onclick=\"deleteInfoByBh('").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
			}
			cz=sb.toString();
		}
		return cz;
	}
	private boolean qxpd(){
		LoginInfo log = ActionContextHelper.getLoginInfo();
		if(djrjh.endsWith(log.getUsername())){
			return true;
		}
		return false;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	
	

}
