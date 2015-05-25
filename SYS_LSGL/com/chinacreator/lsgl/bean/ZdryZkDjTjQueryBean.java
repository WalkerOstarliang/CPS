package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.ValidateHelper;

public class ZdryZkDjTjQueryBean  extends QueryBean{
	/**
	 * 用于查询，条件
	 */
	private static final long serialVersionUID = -1653708705243857719L;
	
	private String djdateStart;  // 统计开始时间
	private String djdateEnd;   // 统计截止时间
	private String zdryxm;   // 重点人员姓名
	private String zdrysfzh; // 重点人员身份证号码
	private String zdryzrdwdm;  // 重点人员所属单位代码
	private String zdrysssqdm;  // 重点人员所属社区代码
	private String dxlb;  //重点人员对象类别
	/**
	 * 单位代码
	 */
	private String orgcode;
	  //统计级别  1：分县局；2：派出所；3：警务区
	private String tjjb; // 统计级别
	
	/**
	 * 机构级别
	 */
	private String orgLeve;
	
	
	public String getTjjb() {
		return tjjb;
	}
	public void setTjjb(String tjjb) {
		this.tjjb = tjjb;
	}
	public String getDjdateStart() {
		return djdateStart;
	}
	public void setDjdateStart(String djdateStart) {
		this.djdateStart = djdateStart;
	}
	public String getOrgcode() {
		return orgcode;
	}
	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}
	public String getDjdateEnd() {
		return djdateEnd;
	}
	public void setDjdateEnd(String djdateEnd) {
		this.djdateEnd = djdateEnd;
	}
	public String getZdryxm() {
		return zdryxm;
	}
	public void setZdryxm(String zdryxm) {
		this.zdryxm = zdryxm;
	}
	public String getZdrysfzh() {
		return zdrysfzh;
	}
	public void setZdrysfzh(String zdrysfzh) {
		this.zdrysfzh = zdrysfzh;
	}
	public String getZdryzrdwdm() {
		return zdryzrdwdm;
	}
	public void setZdryzrdwdm(String zdryzrdwdm) {
		this.zdryzrdwdm = zdryzrdwdm;
	}
	public String getZdrysssqdm() {
		return zdrysssqdm;
	}
	public void setZdrysssqdm(String zdrysssqdm) {
		this.zdrysssqdm = zdrysssqdm;
	}
	public String getDxlb() {
		return dxlb;
	}
	public void setDxlb(String dxlb) {
		this.dxlb = dxlb;
	}
	public String getOrgLeve() {
		if(ValidateHelper.isNotEmptyString(this.orgcode)){
			orgLeve = CommonDBBaseHelper.getOrgLeve(this.orgcode) + "";
		}
		return orgLeve;
	}
	public void setOrgLeve(String orgLeve) {
		this.orgLeve = orgLeve;
	}
	
}
