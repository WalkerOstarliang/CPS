package com.chinacreator.zagl.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 突发事件预案
 */
public class TfsjyaBean extends OperateBean {

	private static final long serialVersionUID = -4125487032353097369L;
	
	/**
	 * 预案编号
	 */
	private String yabh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 预案类型
	 */
	private String yalx;
	private String yalxmc;
	
	/**
	 * 修订时间
	 */
	private String xdsj;
	
	/**
	 * 要求人员情况
	 */
	private String yqryqk;
	
	/**
	 * 要求装备情况
	 */
	private String yqzbqk;

	/**
	 * 预案内容
	 */
	private String yanr;
	
	/**
	 * 预案演练
	 */
	private YaylBean yayl = new YaylBean();
	private List<YaylBean> yaylList = new ArrayList<YaylBean>();
	
	private String cz;

	public String getYabh() {
		return yabh;
	}

	public void setYabh(String yabh) {
		this.yabh = yabh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getYalx() {
		return yalx;
	}

	public void setYalx(String yalx) {
		this.yalx = yalx;
	}

	public String getXdsj() {
		return xdsj;
	}

	public void setXdsj(String xdsj) {
		this.xdsj = xdsj;
	}

	public String getYqryqk() {
		return yqryqk;
	}

	public void setYqryqk(String yqryqk) {
		this.yqryqk = yqryqk;
	}

	public String getYqzbqk() {
		return yqzbqk;
	}

	public void setYqzbqk(String yqzbqk) {
		this.yqzbqk = yqzbqk;
	}

	public String getYanr() {
		return yanr;
	}

	public void setYanr(String yanr) {
		this.yanr = yanr;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openTfsjya('"+this.yabh+"','update')\">修改</span>";
		cz += "&nbsp;|&nbsp;<span class=\"cps_span_href\" onclick=\"delTfsjya('"+this.yabh +"')\">删除</span>";
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public YaylBean getYayl() {
		return yayl;
	}

	public void setYayl(YaylBean yayl) {
		this.yayl = yayl;
	}

	public List<YaylBean> getYaylList() {
		return yaylList;
	}

	public void setYaylList(List<YaylBean> yaylList) {
		this.yaylList = yaylList;
	}

	public String getYalxmc() {
		if(ValidateHelper.isNotEmptyString(this.yalx)){
			yalxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_YALX", this.yalx);
		}
		return yalxmc;
	}

	public void setYalxmc(String yalxmc) {
		this.yalxmc = yalxmc;
	}
	
}
