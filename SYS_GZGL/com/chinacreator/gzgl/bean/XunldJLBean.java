package com.chinacreator.gzgl.bean;
/**
 * 巡逻队奖励
 */
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;

public class XunldJLBean extends QueryBean {

	private static final long serialVersionUID = 185841864782780369L;
	
	/**
	 * 编号（主键）
	 */
	private String bh;
	
	/**
	 * 当前登录用户的机构代码
	 */
	private String orgCode;
	
	/**
	 * 巡逻队编号
	 */
	private String xldbh;
	
	/**
	 * 巡逻队名称
	 */
	private String xldmc;
	
	/**
	 * 荣誉
	 */
	private String ry;
	
	/**
	 * 奖励时间
	 */
	private String jlsj;
	
	/**
	 * 奖励时间（用于查询条件）
	 */
	private String jlsj_end;
	
	/**
	 * 奖励原因
	 */
	private String jlyy;
	
	/**
	 * 登记人姓名
	 */
	private String djrxm;
	
	/**
	 * 登记时间
	 */
	private String djsj;
	
	/**
	 * 登记单位代码
	 */
	private String djdwdm;
	
	/**
	 * 登记单位名称
	 */
	private String djdwmc;
	
	/**
	 * 操作标识
	 */
	private String czbs;
	
	/**
	 * 更新时间
	 */
	private String gxsj;
	
	
	/**
	 * 奖励批准人姓名
	 */
	private String jlpzrxm;
	
	
	/**
	 * 奖励批准人警号
	 */
	private String jlpzrjh;
	
	
	/**
	 * 奖励批准单位名称
	 */
	private String jlpzdwmc;
	
	
	/**
	 * 奖励批准单位代码
	 */
	private String jlpzdwdm;
	
	
	/**
	 * 奖励批准日期
	 */
	private String jlpzrq;
	
	/**
	 * 操作
	 */
	private String cz;
	
	/**
	 * 操作模式
	 */
	private String op;
	
	private String djrsfzh;

	
	public String getDjrsfzh() {
		return djrsfzh;
	}

	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getXldbh() {
		return xldbh;
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public void setXldbh(String xldbh) {
		this.xldbh = xldbh;
	}

	public String getXldmc() {
		return xldmc;
	}

	public void setXldmc(String xldmc) {
		this.xldmc = xldmc;
	}

	public String getRy() {
		return ry;
	}

	public void setRy(String ry) {
		this.ry = ry;
	}

	public String getJlsj() {
		return jlsj;
	}

	public void setJlsj(String jlsj) {
		this.jlsj = jlsj;
	}

	public String getJlsj_end() {
		return jlsj_end;
	}

	public void setJlsj_end(String jlsjEnd) {
		jlsj_end = jlsjEnd;
	}

	public String getJlyy() {
		return jlyy;
	}

	public void setJlyy(String jlyy) {
		this.jlyy = jlyy;
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

	public String getCzbs() {
		return czbs;
	}

	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

	public String getGxsj() {
		return gxsj;
	}

	public void setGxsj(String gxsj) {
		this.gxsj = gxsj;
	}

	public String getJlpzrxm() {
		return jlpzrxm;
	}

	public void setJlpzrxm(String jlpzrxm) {
		this.jlpzrxm = jlpzrxm;
	}

	public String getJlpzrjh() {
		return jlpzrjh;
	}

	public void setJlpzrjh(String jlpzrjh) {
		this.jlpzrjh = jlpzrjh;
	}

	public String getJlpzdwmc() {
		return jlpzdwmc;
	}

	public void setJlpzdwmc(String jlpzdwmc) {
		this.jlpzdwmc = jlpzdwmc;
	}

	public String getJlpzdwdm() {
		return jlpzdwdm;
	}

	public void setJlpzdwdm(String jlpzdwdm) {
		this.jlpzdwdm = jlpzdwdm;
	}

	public String getJlpzrq() {
		return jlpzrq;
	}

	public void setJlpzrq(String jlpzrq) {
		this.jlpzrq = jlpzrq;
	}

	public String getCz() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String userCode = loginInfo.getOrgcode();
		StringBuffer buff = new StringBuffer();
		buff.append("<span onclick=\"javascript:openView('" + CommonConstant.OPERTYPE_DETAIL + "','" + userCode + "','" + this.bh + "');\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		if(userCode.equals(djdwdm)){
			buff.append("<span onclick=\"javascript:openView('" + CommonConstant.OPERTYPE_UPDATE + "','" + userCode + "','" + this.bh + "');\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
			buff.append("<span onclick=\"javascript:del('" + this.bh + "');\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
		}
		cz = buff.toString();
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}
}
