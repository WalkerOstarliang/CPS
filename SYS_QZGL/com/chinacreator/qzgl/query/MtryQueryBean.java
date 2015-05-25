package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;
/**
 * 迷途人员查询条件
 * @author Administrator
 *
 */
public class MtryQueryBean extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String djdwdm ; // 录入单位代码
	private String mtryxm ; // 迷途人员姓名
	private String mtryly ; // 迷途人员来源
	private String fxstartDate ; // 迷途人员被发现开始时间
	private String fxendDate ; // 迷途人员被发现截至时间
	private String dsstartDate; // 迷途人员到所开始时间
	private String dsendDate ; //迷途人员到所截至时间
	private String mtrysjrxm ; // 迷途人员送交人员姓名
	public String getDjdwdm() {
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}
	public String getMtryxm() {
		return mtryxm;
	}
	public void setMtryxm(String mtryxm) {
		this.mtryxm = mtryxm;
	}
	public String getMtryly() {
		return mtryly;
	}
	public void setMtryly(String mtryly) {
		this.mtryly = mtryly;
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
	public String getMtrysjrxm() {
		return mtrysjrxm;
	}
	public void setMtrysjrxm(String mtrysjrxm) {
		this.mtrysjrxm = mtrysjrxm;
	}
	
	
	
}
