package com.chinacreator.rhzf.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.OperateBean;

public class RhzfBean extends OperateBean {

	private static final long serialVersionUID = -4494305051043998059L;
	
	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 地址ID
	 */
	private String dzid;
	
	/**
	 * 地址名称
	 */
	private String dzmc;
	
	/**
	 * 房屋ID
	 */
	private String fwid;
	
	/**
	 * 走访类型
	 */
	private String zflx;
	private String zflxmc;
	
	/**
	 * 走访原因
	 */
	private String zfyy;
	
	/**
	 * 走访内容
	 */
	private String zfnr;
	
	/**
	 * 走访人姓名
	 */
	private String zfrxm;
	
	/**
	 * 走访人警号
	 */
	private String zfrjh;
	
	/**
	 * 走访时间
	 */
	private String zfsj;
	
	/**
	 * 录入情况
	 */
	private String lrqk;
	
	/**
	 * 入户走访人员
	 */
	private String rhzfry_old;
	
	/**
	 * 居住人数
	 */
	private String jzrs;
	
	/**
	 * 走访人员
	 */
	private List<ZfryBean> zfryList = new ArrayList<ZfryBean>();
	
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

	public String getDzid() {
		return dzid;
	}

	public void setDzid(String dzid) {
		this.dzid = dzid;
	}

	public String getDzmc() {
		return dzmc;
	}

	public void setDzmc(String dzmc) {
		this.dzmc = dzmc;
	}

	public String getZflx() {
		return zflx;
	}

	public void setZflx(String zflx) {
		this.zflx = zflx;
	}

	public String getZfyy() {
		return zfyy;
	}

	public void setZfyy(String zfyy) {
		this.zfyy = zfyy;
	}

	public String getZfnr() {
		return zfnr;
	}

	public void setZfnr(String zfnr) {
		this.zfnr = zfnr;
	}

	public String getZfrxm() {
		return zfrxm;
	}

	public void setZfrxm(String zfrxm) {
		this.zfrxm = zfrxm;
	}

	public String getZfrjh() {
		return zfrjh;
	}

	public void setZfrjh(String zfrjh) {
		this.zfrjh = zfrjh;
	}

	public String getZfsj() {
		return zfsj;
	}

	public void setZfsj(String zfsj) {
		this.zfsj = zfsj;
	}

	public String getLrqk() {
		return lrqk;
	}

	public void setLrqk(String lrqk) {
		this.lrqk = lrqk;
	}

	public String getCz() {
		LoginInfo login = ActionContextHelper.getLoginInfo();
		cz = "<span class=\"cps_span_href\" onclick=\"openRhzfWin('" + id + "','" + CommonConstant.OPERTYPE_DETAIL + "')\" style=\"color:green\">详情</span>&nbsp;";
		if(login.getLeve() == 5){
			cz += "<span class=\"cps_span_href\" onclick=\"openRhzfWin('" + id + "','" + CommonConstant.OPERTYPE_UPDATE + "')\" style=\"color:green\">修改</span>&nbsp;";
			cz += "<span class=\"cps_span_href\" onclick=\"cancelRhzf('" + id + "','" + CommonConstant.OPERTYPE_DELETE + "')\" style=\"color:green\">注销</span>";
		}
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getRhzfry_old() {
		return rhzfry_old;
	}

	public void setRhzfry_old(String rhzfryOld) {
		rhzfry_old = rhzfryOld;
	}

	public String getZflxmc() {
		if(ValidateHelper.isNotEmptyString(zflx)){
			zflxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZFLX", zflx);
		}
		return zflxmc;
	}

	public void setZflxmc(String zflxmc) {
		this.zflxmc = zflxmc;
	}

	public List<ZfryBean> getZfryList() {
		return zfryList;
	}

	public void setZfryList(List<ZfryBean> zfryList) {
		this.zfryList = zfryList;
	}

	public String getJzrs() {
		return jzrs;
	}

	public void setJzrs(String jzrs) {
		this.jzrs = jzrs;
	}

	public String getFwid() {
		return fwid;
	}

	public void setFwid(String fwid) {
		this.fwid = fwid;
	}
}
