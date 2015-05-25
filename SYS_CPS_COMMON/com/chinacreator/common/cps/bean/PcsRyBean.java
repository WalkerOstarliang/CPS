package com.chinacreator.common.cps.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 派出所荣誉
 */
public class PcsRyBean extends BaseValue {

	private static final long serialVersionUID = -8055699128721236510L;
	
	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 机构ID
	 */
	private String orgid;
	
	/**
	 * 机构代码
	 */
	private String orgcode;
	
	/**
	 * 获奖类型
	 */
	private String hjlx;
	private String hjlxmc;
	
	/**
	 * 获奖时间
	 */
	private String hjsj;
	
	/**
	 * 备注
	 */
	private String bz;
	
	/**
	 * 登记时间
	 */
	private String djsj; 
	
	/**
	 * 登记人姓名
	 */
	private String djrxm;
	
	/**
	 * 登记人警号
	 */
	private String djrjh;
	
	/**
	 * 登记人身份证号
	 */
	private String djrsfzh;
	
	/**
	 * 登记单位代码
	 */
	private String djdwdm;
	
	/**
	 * 登记单位名称
	 */
	private String djdwmc;
	
	/**
	 * 操作人姓名
	 */
	private String czrxm;
	
	/**
	 * 操作时间
	 */
	private String czsj;
	
	/**
	 * 操作人警号
	 */
	private String czrjh;
	
	/**
	 * 操作人身份证号
	 */
	private String czrsfzh;
	
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
	
	/**
	 * 操作
	 */
	private String cz;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getHjlx() {
		return hjlx;
	}

	public void setHjlx(String hjlx) {
		this.hjlx = hjlx;
	}

	public String getHjsj() {
		return hjsj;
	}

	public void setHjsj(String hjsj) {
		this.hjsj = hjsj;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getDjsj() {
		return djsj;
	}

	public void setDjsj(String djsj) {
		this.djsj = djsj;
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

	public String getDjrsfzh() {
		return djrsfzh;
	}

	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
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

	public String getCzrjh() {
		return czrjh;
	}

	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
	}

	public String getCzrsfzh() {
		return czrsfzh;
	}

	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
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

	public String getCz() {
//		cz = "<span class=\"cps_span_href\" onclick=\"openPcsRyWin('update')\" style=\"color:green\">修改</span>&nbsp;";
		cz = "<span class=\"cps_span_href\" onclick=\"deletePcsRy('" + id + "')\" style=\"color:green\">删除</span>&nbsp;";
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getHjlxmc() {
		if(ValidateHelper.isNotEmptyString(hjlx)){
			hjlxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_HJRY", hjlx);
		}
		return hjlxmc;
	}

	public void setHjlxmc(String hjlxmc) {
		this.hjlxmc = hjlxmc;
	}
}
