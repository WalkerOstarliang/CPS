package com.chinacreator.afgl.zaxl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.zagl.bean.OperateBean;

/**
 * 治安巡逻信息
 */
public class ZaxlBean extends OperateBean {

	private static final long serialVersionUID = -1054232113441806281L;
	
	/**
	 * 主键（6位行政区划 + 14位时间 + 7位序列）
	 */
	private String id;
	
	/**
	 * 巡逻时间
	 */
	private String xlsj;
	
	/**
	 * 巡逻对象
	 */
	private String xldx;
	
	/**
	 * 巡逻路线
	 */
	private String xllx;
	
	/**
	 * 巡逻社区代码
	 */
	private String xlsqdm;
	
	/**
	 * 巡逻社区名称
	 */
	private String xlsqmc;
	
	/**
	 * 巡逻情况
	 */
	private String xlqk;
	
	/**
	 * 备注
	 */
	private String bz;
	
	private String cz;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getXlsj() {
		return xlsj;
	}

	public void setXlsj(String xlsj) {
		this.xlsj = xlsj;
	}

	public String getXldx() {
		return xldx;
	}

	public void setXldx(String xldx) {
		this.xldx = xldx;
	}

	public String getXlsqdm() {
		return xlsqdm;
	}

	public void setXlsqdm(String xlsqdm) {
		this.xlsqdm = xlsqdm;
	}

	public String getXlqk() {
		return xlqk;
	}

	public void setXlqk(String xlqk) {
		this.xlqk = xlqk;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getXlsqmc() {
		return xlsqmc;
	}

	public void setXlsqmc(String xlsqmc) {
		this.xlsqmc = xlsqmc;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openZaxlInfoWin('" + CommonConstant.OPERTYPE_DETAIL + "','" + id + "')\" style=\"color:green\">详情</span>&nbsp;";
		LoginInfo login = ActionContextHelper.getLoginInfo();
		if(login.getLeve() == 5){
			cz += "<span class=\"cps_span_href\" onclick=\"openZaxlInfoWin('" + CommonConstant.OPERTYPE_UPDATE + "','" + id + "')\" style=\"color:green\">修改</span>&nbsp;";
			cz += "<span class=\"cps_span_href\" onclick=\"cancelZaxl('" + id + "')\" style=\"color:green\">注销</span>&nbsp;";
		}
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getXllx() {
		return xllx;
	}

	public void setXllx(String xllx) {
		this.xllx = xllx;
	}
}
