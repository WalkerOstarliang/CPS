package com.chinacreator.gzgl.query;
/**
 * 巡逻队任务查询bean
 */
import com.chinacreator.common.bean.QueryBean;

public class XunldRwQueryBean extends QueryBean{
	private static final long serialVersionUID = -5863065432053977024L;

	/**
	 * 登录用户的机构代码
	 */
	private String orgCode;
	
	/**
	 * 执行巡逻队编号
	 */
	private String zxxldbh;
	private String xldmc;
	
	/**
	 * 任务编号
	 */
	private String bh;
	
	/**
	 * 执行地域范围
	 */
	private String zxdyfw;
	
	/**
	 * 工作开始日期（开始）
	 */
	private String gzqsrq_start;
	
	/**
	 * 工作开始日期(结束)
	 */
	private String gzqsrq_end;
	
	/**
	 * 工作结束日期(开始)
	 */
	private String gzjzrq_start;
	
	/**
	 * 工作结束日期(结束)
	 */
	private String gzjzrq_end;
	
	/**
	 * 操作模式
	 */
	private String op;
	private String xldlx;
	
	private String xldzrrxm;
	
	private String cxbs;
	
	private String ssdwfgld;
	
	private String zjrqstart;
	
	private String zjrqend;
	
	private String cxrqstart;
	
	private String cxrqend;
	
	//巡逻队员
	private String xldybh;
	
	private String xldbh;
	
	private String xldyxm;
	
	private String xldyxb;
	
	private String xldysfzh;
	
	private String sgrqstart;
	
	private String sgrqend;
	
	private String tcrqstart;
	
	private String tcrqend;
	
	private String zgzt;

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getZxxldbh() {
		return zxxldbh;
	}

	public void setZxxldbh(String zxxldbh) {
		this.zxxldbh = zxxldbh;
	}

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getGzqsrq_start() {
		return gzqsrq_start;
	}

	public void setGzqsrq_start(String gzqsrqStart) {
		gzqsrq_start = gzqsrqStart;
	}

	public String getGzqsrq_end() {
		return gzqsrq_end;
	}

	public void setGzqsrq_end(String gzqsrqEnd) {
		gzqsrq_end = gzqsrqEnd;
	}

	public String getGzjzrq_start() {
		return gzjzrq_start;
	}

	public void setGzjzrq_start(String gzjzrqStart) {
		gzjzrq_start = gzjzrqStart;
	}

	public String getGzjzrq_end() {
		return gzjzrq_end;
	}

	public void setGzjzrq_end(String gzjzrqEnd) {
		gzjzrq_end = gzjzrqEnd;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getZxdyfw() {
		return zxdyfw;
	}

	public void setZxdyfw(String zxdyfw) {
		this.zxdyfw = zxdyfw;
	}

	public String getXldmc() {
		return xldmc;
	}

	public void setXldmc(String xldmc) {
		this.xldmc = xldmc;
	}

	public String getXldlx() {
		return xldlx;
	}

	public void setXldlx(String xldlx) {
		this.xldlx = xldlx;
	}

	public String getXldzrrxm() {
		return xldzrrxm;
	}

	public void setXldzrrxm(String xldzrrxm) {
		this.xldzrrxm = xldzrrxm;
	}

	public String getCxbs() {
		return cxbs;
	}

	public void setCxbs(String cxbs) {
		this.cxbs = cxbs;
	}

	public String getSsdwfgld() {
		return ssdwfgld;
	}

	public void setSsdwfgld(String ssdwfgld) {
		this.ssdwfgld = ssdwfgld;
	}

	public String getZjrqstart() {
		return zjrqstart;
	}

	public void setZjrqstart(String zjrqstart) {
		this.zjrqstart = zjrqstart;
	}

	public String getZjrqend() {
		return zjrqend;
	}

	public void setZjrqend(String zjrqend) {
		this.zjrqend = zjrqend;
	}

	public String getCxrqstart() {
		return cxrqstart;
	}

	public void setCxrqstart(String cxrqstart) {
		this.cxrqstart = cxrqstart;
	}

	public String getCxrqend() {
		return cxrqend;
	}

	public void setCxrqend(String cxrqend) {
		this.cxrqend = cxrqend;
	}

	public String getXldybh() {
		return xldybh;
	}

	public void setXldybh(String xldybh) {
		this.xldybh = xldybh;
	}

	public String getXldbh() {
		return xldbh;
	}

	public void setXldbh(String xldbh) {
		this.xldbh = xldbh;
	}

	public String getXldyxm() {
		return xldyxm;
	}

	public void setXldyxm(String xldyxm) {
		this.xldyxm = xldyxm;
	}

	public String getXldyxb() {
		return xldyxb;
	}

	public void setXldyxb(String xldyxb) {
		this.xldyxb = xldyxb;
	}

	public String getXldysfzh() {
		return xldysfzh;
	}

	public void setXldysfzh(String xldysfzh) {
		this.xldysfzh = xldysfzh;
	}

	public String getSgrqstart() {
		return sgrqstart;
	}

	public void setSgrqstart(String sgrqstart) {
		this.sgrqstart = sgrqstart;
	}

	public String getSgrqend() {
		return sgrqend;
	}

	public void setSgrqend(String sgrqend) {
		this.sgrqend = sgrqend;
	}

	public String getTcrqstart() {
		return tcrqstart;
	}

	public void setTcrqstart(String tcrqstart) {
		this.tcrqstart = tcrqstart;
	}

	public String getTcrqend() {
		return tcrqend;
	}

	public void setTcrqend(String tcrqend) {
		this.tcrqend = tcrqend;
	}

	public String getZgzt() {
		return zgzt;
	}

	public void setZgzt(String zgzt) {
		this.zgzt = zgzt;
	}
	
	
}
