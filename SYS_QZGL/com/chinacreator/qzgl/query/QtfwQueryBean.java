package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;
/**
 * 其他服务查询条件
 * @author Administrator
 *
 */
public class QtfwQueryBean  extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String startfwsj ; //服务时间(开始时间)
	private String endfwsj ; // 服务时间（截至时间）
	private String jbrxm ; // 经办人
	private String fwnr ; // 服务内容
	public String getStartfwsj() {
		return startfwsj;
	}
	public void setStartfwsj(String startfwsj) {
		this.startfwsj = startfwsj;
	}
	public String getEndfwsj() {
		return endfwsj;
	}
	public void setEndfwsj(String endfwsj) {
		this.endfwsj = endfwsj;
	}
	public String getJbrxm() {
		return jbrxm;
	}
	public void setJbrxm(String jbrxm) {
		this.jbrxm = jbrxm;
	}
	public String getFwnr() {
		return fwnr;
	}
	public void setFwnr(String fwnr) {
		this.fwnr = fwnr;
	}
	
	
}
