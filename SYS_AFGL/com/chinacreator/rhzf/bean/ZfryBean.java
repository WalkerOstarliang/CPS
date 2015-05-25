package com.chinacreator.rhzf.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.ActionContextHelper;

/**
 * 走访人员
 */
public class ZfryBean extends RkJbxxBean {

	private static final long serialVersionUID = -6485476414114842612L;
	
	/**
	 * 是否见面
	 */
	private String sfjm;
	
	/**
	 * 走访ID
	 */
	private String zfid;
	
	/**
	 * 人口房屋关联ID
	 */
	private String rkfwglid;
	
	/**
	 * 操作
	 */
	private String cz;

	public String getSfjm() {
		return sfjm;
	}

	public void setSfjm(String sfjm) {
		this.sfjm = sfjm;
	}

	public String getZfid() {
		return zfid;
	}

	public void setZfid(String zfid) {
		this.zfid = zfid;
	}

	public String getRkfwglid() {
		return rkfwglid;
	}

	public void setRkfwglid(String rkfwglid) {
		this.rkfwglid = rkfwglid;
	}

	public String getCz() {
		LoginInfo login = ActionContextHelper.getLoginInfo();
		StringBuffer sb = new StringBuffer();
		sb.append("<span onclick=\"openSyrkInfoPage('" + CommonConstant.OPERTYPE_RYDAXX + "','" + super.getRybh() + "','" + super.getRylb() + "')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		if(login.getLeve() == 5){
			sb.append("<span onclick=\"openRkInfo('" + CommonConstant.OPERTYPE_UPDATE + "','" + super.getRkid() + "','" + super.getRybh() + "','" + super.getRylb() + "','" + getRkfwglid() + "')\" style=\"color:green\" class=\"cps_span_href\">修改</span>");
		}
		cz = sb.toString();
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
}
