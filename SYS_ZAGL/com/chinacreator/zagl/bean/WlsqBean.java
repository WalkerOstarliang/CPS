package com.chinacreator.zagl.bean;

import java.util.List;

import com.chinacreator.common.bean.CommonLogBean;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;

public class WlsqBean extends CommonLogBean{
	private static final long serialVersionUID = -3065695994091421876L;
	
	private String wlsqbh;
	  //'ID';
	private String sssqbh;
	  //'所属社区编号';
	private String sssqmc;
	  //'所属社区名称';
	private String ssxzqh;
	  //'所属行政区划';
	private String ssjdxz;
	  //'所属街道';
	private String ssxzqhmc;
	  //'所属行政区划';
	private String ssjdxzmc;
	  //'所属街道';
	private String djrxm;
	  //'登记人姓名';
	private String djrjh;
	  //'登记人警号';
	private String djdwdm;
	  //'登记单位代码';
	private String djdwmc;
	  //'登记单位名称';
	private String djsj;
	  //'登记时间';
	private String czbs;
	//操作人姓名
	private String czrxm;
	//操作单位名称
	private String czdwmc;
	//操作单位代码
	private String czdwdm;
	//操作时间
	private String czsj;
	//操作人警号
	private String czrjh;
	
	//操作
	private String cz;
	
	//社区网站
	private List<SqwzBean> sqwzList;
	
	//社区论坛
	private List<SqltBean> sqLtList;
	
	//社区QQ群
	private List<SqQQqBean> sqQQqList;
	
	//网站数
	private String wzs;
	
	//论坛数
	private String lts;
	
	//QQ群数
	private String qqqs;
	
	public String getWlsqbh() {
		return wlsqbh;
	}
	public void setWlsqbh(String wlsqbh) {
		this.wlsqbh = wlsqbh;
	}
	public String getSssqbh() {
		return sssqbh;
	}
	public void setSssqbh(String sssqbh) {
		this.sssqbh = sssqbh;
	}
	public String getSssqmc() {
		return sssqmc;
	}
	public void setSssqmc(String sssqmc) {
		this.sssqmc = sssqmc;
	}
	public String getSsxzqh() {
		return ssxzqh;
	}
	public void setSsxzqh(String ssxzqh) {
		this.ssxzqh = ssxzqh;
	}
	public String getSsjdxz() {
		return ssjdxz;
	}
	public void setSsjdxz(String ssjdxz) {
		this.ssjdxz = ssjdxz;
	}
	public String getSsxzqhmc() {
		return ssxzqhmc;
	}
	public void setSsxzqhmc(String ssxzqhmc) {
		this.ssxzqhmc = ssxzqhmc;
	}
	public String getSsjdxzmc() {
		return ssjdxzmc;
	}
	public void setSsjdxzmc(String ssjdxzmc) {
		this.ssjdxzmc = ssjdxzmc;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
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
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getCzrxm() {
		return czrxm;
	}
	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}
	public String getCzdwmc() {
		return czdwmc;
	}
	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}
	public String getCzdwdm() {
		return czdwdm;
	}
	public void setCzdwdm(String czdwdm) {
		this.czdwdm = czdwdm;
	}
	public String getCzsj() {
		return czsj;
	}
	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}
	public List<SqwzBean> getSqwzList() {
		return sqwzList;
	}
	public void setSqwzList(List<SqwzBean> sqwzList) {
		this.sqwzList = sqwzList;
	}
	public List<SqltBean> getSqLtList() {
		return sqLtList;
	}
	public void setSqLtList(List<SqltBean> sqLtList) {
		this.sqLtList = sqLtList;
	}
	public List<SqQQqBean> getSqQQqList() {
		return sqQQqList;
	}
	public void setSqQQqList(List<SqQQqBean> sqQQqList) {
		this.sqQQqList = sqQQqList;
	}
	public String getCz() {
		StringBuffer cz_buff = new StringBuffer();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String orgUser = loginInfo.getOrgcode();
		
		if(orgUser !=null &&  djdwdm!= null && orgUser.substring(0, 8).equals(djdwdm.substring(0, 8))){
			cz_buff.append("<span onclick=\"openWlsqView('" + CommonConstant.OPERTYPE_UPDATE + "','" + this.wlsqbh + "')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
			cz_buff.append("<span onclick=\"delWlsq('" + this.wlsqbh + "')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
		}
		cz_buff.append("<span onclick=\"openWlsqView('" + CommonConstant.OPERTYPE_DETAIL + "','" + this.wlsqbh + "')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		cz = cz_buff.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getWzs() {
		return wzs;
	}
	public void setWzs(String wzs) {
		this.wzs = wzs;
	}
	public String getLts() {
		return lts;
	}
	public void setLts(String lts) {
		this.lts = lts;
	}
	public String getQqqs() {
		return qqqs;
	}
	public void setQqqs(String qqqs) {
		this.qqqs = qqqs;
	}
	public String getCzrjh() {
		return czrjh;
	}
	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
	}
}
