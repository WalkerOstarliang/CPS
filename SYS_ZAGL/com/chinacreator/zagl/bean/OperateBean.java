package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;

public class OperateBean extends BaseValue {
	
	private static final long serialVersionUID = -6658483021942998500L;
	
	/**
	 * 登记人姓名
	 */
	private String djrxm;
	
	/**
	 * 登记时间
	 */
	private String djsj;
	
	/**
	 * 登记单位名称
	 */
	private String djdwmc;
	
	/**
	 * 登记单位代码
	 */
	private String djdwdm;
	
	/**
	 * 登记人警号
	 */
	private String djrjh;
	
	/**
	 * 操作人警号
	 */
	private String czrjh;
	
	/**
	 * 操作人姓名
	 */
	private String czrxm;
	
	/**
	 * 操作时间
	 */
	private String czsj;
	
	/**
	 * 操作单位代码
	 */
	private String czdwdm;
	
	/**
	 * 操作单位名称
	 */
	private String czdwmc;
	
	/**
	 * 操作标识
	 */
	private String czbs;
	
	private String djrsfzh;  //登记人身份证号	
	private String czrsfzh;  //操作人身份证号
	
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

	public String getDjdwmc() {
		return djdwmc;
	}

	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}

	public String getDjdwdm() {
		return djdwdm;
	}

	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}

	public String getCzrxm() {
		return czrxm;
	}

	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}

	public String getCzsj() {
		return czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public String getCzdwdm() {
		return czdwdm;
	}

	public void setCzdwdm(String czdwdm) {
		this.czdwdm = czdwdm;
	}

	public String getCzdwmc() {
		return czdwmc;
	}

	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}

	public String getCzbs() {
		return czbs;
	}

	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

	public String getDjrjh() {
		return djrjh;
	}

	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}

	public String getCzrjh() {
		return czrjh;
	}

	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
	}

	public String getDjrsfzh() {
		return djrsfzh;
	}

	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}

	public String getCzrsfzh() {
		return czrsfzh;
	}

	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
	}
	
	/**
	 * 初始化登记信息
	 */
	public void initDjxx() {
		LoginInfo login = ActionContextHelper.getLoginInfo();
		
		this.djsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
		this.djrxm = login.getRealname();
		this.djrsfzh = login.getSfzh();
		this.djrjh = login.getUsername();
		this.djdwmc = login.getOrgname();
		this.djdwdm = login.getOrgcode();
	}
	
	/**
	 * 初始化操作信息  不包括操作标识
	 */
	public void initCzxx(){
		LoginInfo login = ActionContextHelper.getLoginInfo();
		
		this.czsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
		this.czrxm = login.getRealname();
		this.czrsfzh = login.getSfzh();
		this.czrjh = login.getUsername();
		this.czdwmc = login.getOrgname();
		this.czdwdm = login.getOrgcode();
		
	}
}
