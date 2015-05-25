package com.chinacreator.qzgl.bean;


import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;

public class HbgzBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8670906010260982102L;
	
	private String bh;				//编号
	private String bggzzt;			//报告工作主题
	private String bggzsj;			//报告工作时间
	private String cjrs;			//参加人数
	private String bggzzcrxm;		//报告工作主持人姓名
	private String bggzzcrlxdh;		//报告工作主持人联系电话
	private String bggzdd;			//报告工作地点
	private String bggznr;			//报告工作内容
	private String qzjy;			//群众建议
	private String djrjh;			//登记人警号
	private String djrxm;			//登记人姓名
	private String djsj;			//登记时间
	private String djdwdm;			//登记单位代码
	private String djdwmc;			//登记单位名称
	private String cz;				//操作
	private String fjbh;
	private String fjmc;
	
	private String haveFjxx;		//0 为没有附件
	private String fj;
	private String djrsfzh;
	private List<HbgzyhrBean> yhrList;
	/*******************************************************************************
	 *                        Getter & Setter                                      *
	 *******************************************************************************/
	
	public String getDjrjh() {
		return djrjh;
	}
	public String getFj() {
		return fj;
	}
	public void setFj(String fj) {
		this.fj = fj;
	}
	public String getHaveFjxx() {
		if(haveFjxx == null || haveFjxx.trim().equals("")){
			if(!"0".equals(fj)){
				haveFjxx = "<a href=\"#\" onclick=\"downloadFjxx('"+bh+"')\">下载附件</a>";
//				haveFjxx = "下载附件";
			}
			else{
				haveFjxx="无";
			}
		}
		return haveFjxx;
	}
	public void setHaveFjxx(String haveFjxx) {
		this.haveFjxx = haveFjxx;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getBggzzt() {
		return bggzzt;
	}
	public void setBggzzt(String bggzzt) {
		this.bggzzt = bggzzt;
	}
	public String getBggzsj() {
		return bggzsj;
	}
	public void setBggzsj(String bggzsj) {
		this.bggzsj = bggzsj;
	}
	public String getCjrs() {
		return cjrs;
	}
	public void setCjrs(String cjrs) {
		this.cjrs = cjrs;
	}
	public String getBggzzcrxm() {
		return bggzzcrxm;
	}
	public void setBggzzcrxm(String bggzzcrxm) {
		this.bggzzcrxm = bggzzcrxm;
	}
	public String getBggzzcrlxdh() {
		return bggzzcrlxdh;
	}
	public void setBggzzcrlxdh(String bggzzcrlxdh) {
		this.bggzzcrlxdh = bggzzcrlxdh;
	}
	public String getBggzdd() {
		return bggzdd;
	}
	public void setBggzdd(String bggzdd) {
		this.bggzdd = bggzdd;
	}
	public String getBggznr() {
		return bggznr;
	}
	public void setBggznr(String bggznr) {
		this.bggznr = bggznr;
	}
	public String getQzjy() {
		return qzjy;
	}
	public void setQzjy(String qzjy) {
		this.qzjy = qzjy;
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
			sb.append("&nbsp;<span onclick=\"openInfoWin('detail','").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
			if(qxpd()){
				sb.append("<span onclick=\"openInfoWin('update','").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
				sb.append("<span onclick=\"deleteInfoByBh('").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
			}
			
			if(ValidateHelper.isNotEmptyString(fjbh)){
				sb.append("<span onclick=\"dbFileDown('t_fwqz_fjxx','bh','fj','").append(fjbh).append("','").append(fjmc).append("')\" style=\"color:green\" class=\"cps_span_href\">下载附件</span>");
//				haveFjxx = "下载附件";
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
	public List<HbgzyhrBean> getYhrList() {
		return yhrList;
	}
	public void setYhrList(List<HbgzyhrBean> yhrList) {
		this.yhrList = yhrList;
	}
	public String getFjbh() {
		return fjbh;
	}
	public void setFjbh(String fjbh) {
		this.fjbh = fjbh;
	}
	public String getFjmc() {
		return fjmc;
	}
	public void setFjmc(String fjmc) {
		this.fjmc = fjmc;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	

}
