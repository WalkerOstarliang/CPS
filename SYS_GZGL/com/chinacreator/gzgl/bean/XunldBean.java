package com.chinacreator.gzgl.bean;

/**
 * 巡逻队BEAN
 */
import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;

public class XunldBean extends BaseValue{

	private static final long serialVersionUID = 107074454531870674L;
	
	/**
	 * 任务编号 主键
	 */
	private String bh;
	
	/**
	 * 执行巡逻队编号
	 */
	private String zxxldbh;
	
	/**
	 * 执行人员姓名
	 */
	private String zxryxm;
	
	/**
	 * 工作开始日期
	 */
	private String gzqsrq;
	
	/**
	 * 工作结束日期
	 */
	private String gzjzrq;
	
	/**
	 * 工作开始时间
	 */
	private String gzqstime;
	
	/**
	 * 工作结束时间
	 */
	private String gzjstime;
	
	/**
	 * 执行地域范围
	 */
	private String zxdyfw;
	
	/**
	 * 执行任务描述
	 */
	private String zxrwms;
	
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
	 * 更新时间
	 */
	private String gxsj;
	
	/**
	 * 操作标识
	 */
	private String czbz;
	
	/**
	 * 操作
	 */
	private String cz;
	
	/**
	 * 操作模式
	 */
	private String op;
	
	/**
	 * 巡逻队名称
	 */
	private String xldmc;

	/**
	 * 工作日期
	 */
	private String gzrq;
	
	/**
	 * 工作时间
	 */
	private String gzsj;
	
	/**
	 * 巡逻队员
	 */
	private String xldy; 
	private String xlsj;
	private String xlfs;
	private String ddmj;
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

	public String getZxxldbh() {
		return zxxldbh;
	}

	public void setZxxldbh(String zxxldbh) {
		this.zxxldbh = zxxldbh;
	}

	public String getZxryxm() {
		return zxryxm;
	}

	public void setZxryxm(String zxryxm) {
		this.zxryxm = zxryxm;
	}

	public String getGzqsrq() {
		return gzqsrq;
	}

	public void setGzqsrq(String gzqsrq) {
		this.gzqsrq = gzqsrq;
	}

	public String getGzjzrq() {
		return gzjzrq;
	}

	public void setGzjzrq(String gzjzrq) {
		this.gzjzrq = gzjzrq;
	}

	public String getGzqstime() {
		return gzqstime;
	}

	public void setGzqstime(String gzqstime) {
		this.gzqstime = gzqstime;
	}

	public String getGzjstime() {
		return gzjstime;
	}

	public void setGzjstime(String gzjstime) {
		this.gzjstime = gzjstime;
	}

	public String getZxdyfw() {
		return zxdyfw;
	}

	public void setZxdyfw(String zxdyfw) {
		this.zxdyfw = zxdyfw;
	}

	public String getZxrwms() {
		return zxrwms;
	}

	public void setZxrwms(String zxrwms) {
		this.zxrwms = zxrwms;
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

	public String getGxsj() {
		return gxsj;
	}

	public void setGxsj(String gxsj) {
		this.gxsj = gxsj;
	}

	public String getCzbz() {
		return czbz;
	}

	public void setCzbz(String czbz) {
		this.czbz = czbz;
	}

	public String getCz() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		StringBuffer buffer = new StringBuffer();
		String orgCode = loginInfo.getOrgcode();
		if(orgCode.equals(djdwdm)){
			buffer.append("<span onclick=\"javascript:openView('" + CommonConstant.OPERTYPE_UPDATE + "','" + orgCode + "','" + this.bh + "');\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
			buffer.append("<span onclick=\"javascript:del('" + this.bh + "');\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
		}
		buffer.append("<span onclick=\"javascript:openView('" + CommonConstant.OPERTYPE_DETAIL + "','" + orgCode + "','" + this.bh + "');\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		this.cz = buffer.toString();
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

	public String getXldmc() {
		return xldmc;
	}

	public void setXldmc(String xldmc) {
		this.xldmc = xldmc;
	}

	public String getGzrq() {
		return gzrq;
	}

	public void setGzrq(String gzrq) {
		this.gzrq = gzrq;
	}

	public String getGzsj() {
		return gzsj;
	}

	public void setGzsj(String gzsj) {
		this.gzsj = gzsj;
	}

	public String getXldy() {
		return xldy;
	}

	public void setXldy(String xldy) {
		this.xldy = xldy;
	}

	public String getXlsj() {
		return xlsj;
	}

	public void setXlsj(String xlsj) {
		this.xlsj = xlsj;
	}

	public String getXlfs() {
		return xlfs;
	}

	public void setXlfs(String xlfs) {
		this.xlfs = xlfs;
	}

	public String getDdmj() {
		return ddmj;
	}

	public void setDdmj(String ddmj) {
		this.ddmj = ddmj;
	}
	
}
