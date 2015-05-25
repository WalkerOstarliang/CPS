package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class CzfwCzxxBean extends BaseValue {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String czxxbh;	//承租信息编号
	private String ryjgbh;	//承租编号
	private String czfwbh;	//房屋编号
	private String fjbh;	//房间编号
	private String yfzgx;	//与房主关系
	private String zlrq;	//租赁日期
	private String tzrq;	//退租日期
	private String tzyy;	//退租原因
	private String djsj;	//登记时间
	private String djdwdm;	//登记单位
	private String djr;	//登记人(警号)
	private String djrxm;	//登记人
	private String djdwmc;	//登记单位
	private String xgdw;	//修改单位代码
	private String xgr;	//修改人(警号)
	private String xgsj;	//修改时间
	private String xgrxm;	//修改人
	private String xgdwmc;	//修改单位
	private String ras;	//关联更新标识
	private String hzrxm;	//合租人姓名（私有，关联人员）
	private String hzrsfzh;	//合租人份证号（私有，关联人员）
	private String hzrxb;	//合租人性别（私有，关联人员）
	private String hzrxbms;
	private String jgdwmc;	//机构单位名称（公有，关联机构）
	
	private String czstmc;
	private String czrlx;
	
	private String czzt;
	private String cz;
	private String czDetail;
	
	public String getCzxxbh() {
		return czxxbh;
	}
	public void setCzxxbh(String czxxbh) {
		this.czxxbh = czxxbh;
	}
	public String getRyjgbh() {
		return ryjgbh;
	}
	public void setRyjgbh(String ryjgbh) {
		this.ryjgbh = ryjgbh;
	}
	public String getCzfwbh() {
		return czfwbh;
	}
	public void setCzfwbh(String czfwbh) {
		this.czfwbh = czfwbh;
	}
	public String getFjbh() {
		return fjbh;
	}
	public void setFjbh(String fjbh) {
		this.fjbh = fjbh;
	}
	public String getYfzgx() {
		return yfzgx;
	}
	public void setYfzgx(String yfzgx) {
		this.yfzgx = yfzgx;
	}
	public String getZlrq() {
		return zlrq;
	}
	public void setZlrq(String zlrq) {
		this.zlrq = zlrq;
	}
	public String getTzrq() {
		return tzrq;
	}
	public void setTzrq(String tzrq) {
		this.tzrq = tzrq;
	}
	public String getTzyy() {
		return tzyy;
	}
	public void setTzyy(String tzyy) {
		this.tzyy = tzyy;
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
	public String getDjdwmc() {
		return djdwmc;
	}
	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}
	public String getXgdw() {
		return xgdw;
	}
	public void setXgdw(String xgdw) {
		this.xgdw = xgdw;
	}
	public String getXgr() {
		return xgr;
	}
	public void setXgr(String xgr) {
		this.xgr = xgr;
	}
	public String getXgsj() {
		return xgsj;
	}
	public void setXgsj(String xgsj) {
		this.xgsj = xgsj;
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
	public String getRas() {
		return ras;
	}
	public void setRas(String ras) {
		this.ras = ras;
	}
	public String getHzrxm() {
		return hzrxm;
	}
	public void setHzrxm(String hzrxm) {
		this.hzrxm = hzrxm;
	}
	public String getHzrsfzh() {
		return hzrsfzh;
	}
	public void setHzrsfzh(String hzrsfzh) {
		this.hzrsfzh = hzrsfzh;
	}
	public String getHzrxb() {
		return hzrxb;
	}
	public void setHzrxb(String hzrxb) {
		this.hzrxb = hzrxb;
	}
	public String getJgdwmc() {
		return jgdwmc;
	}
	public void setJgdwmc(String jgdwmc) {
		this.jgdwmc = jgdwmc;
	}
	public String getHzrxbms() {
		hzrxbms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", hzrxb);
		return hzrxbms;
	}
	public void setHzrxbms(String hzrxbms) {
		this.hzrxbms = hzrxbms;
	}
	public String getCzrlx()
	{
		return czrlx;
	}
	public void setCzrlx(String czrlx)
	{
		this.czrlx = czrlx;
	}
	public String getCzzt()
	{
		return czzt;
	}
	public void setCzzt(String czzt)
	{
		this.czzt = czzt;
	}
	public String getCzstmc()
	{
		if (ValidateHelper.isNotEmptyString(hzrxm))
		{
			czstmc = hzrxm;
		}
		else if (ValidateHelper.isNotEmptyString(jgdwmc))
		{
			czstmc = jgdwmc;
		}
		return czstmc;
	}
	public void setCzstmc(String czstmc)
	{
		this.czstmc = czstmc;
	}
	public String getCz() {
		StringBuffer sb = new StringBuffer();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo.getOrgcode().equals(djdwdm))
		{
			sb.append("<span onclick=\"openCzrPage('update','" + czxxbh +"')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
		}
		sb.append("<span onclick=\"openCzrPage('detail','" + czxxbh +"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		cz = sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getCzDetail() {
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"openCzrPage('detail','" + czxxbh +"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		czDetail = sb.toString();
		return czDetail;
	}
	public void setCzDetail(String czDetail) {
		this.czDetail = czDetail;
	}
	
	
	
	
}
