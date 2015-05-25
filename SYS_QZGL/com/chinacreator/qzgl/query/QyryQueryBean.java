package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;
/**
 * 为民服务-- 工作管理-- 弃婴信息查询条件
 * @author Administrator
 *
 */
public class QyryQueryBean extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 9086036410973334199L;
	private String djdwdm ; // 录入单位代码
	private String qyryxm ; // 弃婴姓名
	private String qyryly ; // 弃婴来源
	private String fxstartDate ; // 弃婴被发现开始时间
	private String fxendDate ; // 弃婴被发现截至时间
	private String dsstartDate; // 弃婴到所开始时间
	private String dsendDate ; //弃婴到所截至时间
	private String qyryfxrxm ; // 弃婴发现人姓名
	public String getDjdwdm() {
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}
	public String getQyryxm() {
		return qyryxm;
	}
	public void setQyryxm(String qyryxm) {
		this.qyryxm = qyryxm;
	}
	public String getQyryly() {
		return qyryly;
	}
	public void setQyryly(String qyryly) {
		this.qyryly = qyryly;
	}
	public String getFxstartDate() {
		return fxstartDate;
	}
	public void setFxstartDate(String fxstartDate) {
		this.fxstartDate = fxstartDate;
	}
	public String getFxendDate() {
		return fxendDate;
	}
	public void setFxendDate(String fxendDate) {
		this.fxendDate = fxendDate;
	}
	public String getDsstartDate() {
		return dsstartDate;
	}
	public void setDsstartDate(String dsstartDate) {
		this.dsstartDate = dsstartDate;
	}
	public String getDsendDate() {
		return dsendDate;
	}
	public void setDsendDate(String dsendDate) {
		this.dsendDate = dsendDate;
	}
	public String getQyryfxrxm() {
		return qyryfxrxm;
	}
	public void setQyryfxrxm(String qyryfxrxm) {
		this.qyryfxrxm = qyryfxrxm;
	}
	
}
