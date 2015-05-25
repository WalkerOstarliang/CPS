package com.chinacreator.xfdw.query;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.helper.ActionContextHelper;


/**
 * @ClassName: HzldQuery
 * @author 禹文超
 * @mail wenchao.yu@163.com
 * @date Mar 24, 20159:29:25 AM
 * @Description: TODO
 */

public class HzldQuery{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3482387119457769073L;
	
	private String hzxh;
	private String qhsjStart;
	private String qhsjEnd;
	private String zt;
	private String qhdd;
	private String ssdwdm;
	private String issy;
	private String czrjh;

	public String getIssy() {
		return issy;
	}

	public void setIssy(String issy) {
		this.issy = issy;
	}

	public String getSsdwdm() {
		return ssdwdm;
	}

	public void setSsdwdm(String ssdwdm) {
		this.ssdwdm = ssdwdm;
	}

	public String getQhsjStart() {
		return qhsjStart;
	}

	public void setQhsjStart(String qhsjStart) {
		this.qhsjStart = qhsjStart;
	}

	public String getQhsjEnd() {
		return qhsjEnd;
	}

	public void setQhsjEnd(String qhsjEnd) {
		this.qhsjEnd = qhsjEnd;
	}

	public String getZt() {
		return zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	public String getQhdd() {
		return qhdd;
	}

	public void setQhdd(String qhdd) {
		this.qhdd = qhdd;
	}

	public String getHzxh() {
		return hzxh;
	}

	public void setHzxh(String hzxh) {
		this.hzxh = hzxh;
	}

	public String getCzrjh() {
		return czrjh;
	}

	public void setCzrjh(String czrjh) {
		if(!StringUtils.isBlank(czrjh)){
			czrjh=ActionContextHelper.getLoginInfo().getUsername();
		}
		this.czrjh = czrjh;
	}

	
}
