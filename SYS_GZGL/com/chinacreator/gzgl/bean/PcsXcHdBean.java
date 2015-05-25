package com.chinacreator.gzgl.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.OperateBean;

/**
 * 派出所宣传活动
 */
public class PcsXcHdBean extends OperateBean {

	private static final long serialVersionUID = -1329290893778592018L;
	
	private String id;
	
	/**
	 * 活动类型
	 */
	private String hdlx;
	private String hdlxmc;
	
	/**
	 * 活动时间
	 */
	private String hdsj;
	
	/**
	 * 活动详址
	 */
	private String hdxz;
	
	/**
	 * 活动内容
	 */
	private String hdnr;
	
	/**
	 * 活动开展民警警号
	 */
	private String hdkzmjjh;
	
	/**
	 * 活动开展民警姓名
	 */
	private String hdkzmjxm;
	
	/**
	 * 活动开展单位代码
	 */
	private String hdkzdwdm;
	
	/**
	 * 活动开展单位名称
	 */
	private String hdkzdwmc;
	
	/**
	 * 注销标识
	 */
	private String zxbs;
	
	/**
	 * 注销时间
	 */
	private String zxsj;
	
	/**
	 * 操作标识
	 */
	private String czbs;
	
	/**
	 * 操作
	 */
	private String cz;
	
	private List<PcsXcHdZpBean> zpList = new ArrayList<PcsXcHdZpBean>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHdlx() {
		return hdlx;
	}

	public void setHdlx(String hdlx) {
		this.hdlx = hdlx;
	}

	public String getHdsj() {
		return hdsj;
	}

	public void setHdsj(String hdsj) {
		this.hdsj = hdsj;
	}

	public String getHdxz() {
		return hdxz;
	}

	public void setHdxz(String hdxz) {
		this.hdxz = hdxz;
	}

	public String getHdnr() {
		return hdnr;
	}

	public void setHdnr(String hdnr) {
		this.hdnr = hdnr;
	}

	public String getHdkzmjjh() {
		return hdkzmjjh;
	}

	public void setHdkzmjjh(String hdkzmjjh) {
		this.hdkzmjjh = hdkzmjjh;
	}

	public String getHdkzmjxm() {
		return hdkzmjxm;
	}

	public void setHdkzmjxm(String hdkzmjxm) {
		this.hdkzmjxm = hdkzmjxm;
	}

	public String getHdkzdwdm() {
		return hdkzdwdm;
	}

	public void setHdkzdwdm(String hdkzdwdm) {
		this.hdkzdwdm = hdkzdwdm;
	}

	public String getHdkzdwmc() {
		return hdkzdwmc;
	}

	public void setHdkzdwmc(String hdkzdwmc) {
		this.hdkzdwmc = hdkzdwmc;
	}

	public String getZxbs() {
		return zxbs;
	}

	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}

	public String getZxsj() {
		return zxsj;
	}

	public void setZxsj(String zxsj) {
		this.zxsj = zxsj;
	}

	public String getCzbs() {
		return czbs;
	}

	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

	public List<PcsXcHdZpBean> getZpList() {
		return zpList;
	}

	public void setZpList(List<PcsXcHdZpBean> zpList) {
		this.zpList = zpList;
	}

	public String getHdlxmc() {
		if(ValidateHelper.isNotEmptyString(hdlx)){
			hdlxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_PCS_HDLX", hdlx);
		}
		return hdlxmc;
	}

	public void setHdlxmc(String hdlxmc) {
		this.hdlxmc = hdlxmc;
	}

	public String getCz() {
		LoginInfo user = ActionContextHelper.getLoginInfo();
		cz = "<span class=\"cps_span_href\" onclick=\"openPcsXcHdInfoWin('" + id + "','" + CommonConstant.OPERTYPE_DETAIL + "')\" style=\"color:green\">详情</span>&nbsp;";
		if(user.getOrgcode().equals(getDjdwdm())){
			cz += "<span class=\"cps_span_href\" onclick=\"openPcsXcHdInfoWin('" + id + "','" + CommonConstant.OPERTYPE_UPDATE + "')\" style=\"color:green\">修改</span>&nbsp;";
			cz += "<span class=\"cps_span_href\" onclick=\"deletePcsxchd('" + id + "')\" style=\"color:green\">注销</span>&nbsp;";
		}
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
}
