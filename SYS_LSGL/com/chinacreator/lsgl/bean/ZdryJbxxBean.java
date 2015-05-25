package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 重点人员基本信息
 */
public class ZdryJbxxBean extends BaseValue {

	private static final long serialVersionUID = 5152444171993976862L;
	
	/**
	 * 人员编号
	 */
	private String renyuanbianhao;
	
	/**
	 * 取保方式
	 */
	private String qubaofangshi;
	
	/**
	 * 取保期限
	 */
	private String qubaoqixian;
	
	/**
	 * 姓名
	 */
	private String xingming;
	
	/**
	 * 联系电话
	 */
	private String lianxidianhua;
	
	/**
	 * 性别
	 */
	private String xingbie;
	private String xbmc;
	
	/**
	 * 身份证号
	 */
	private String shenfenzhenghao;

	/**
	 * 重点人员类型
	 */
	private String rylxflag;
	private String rylxmc;
	
	/**
	 * 年龄
	 */
	private String nianling;
	
	/**
	 * 出生日期
	 */
	private String chushengriqi;
	
	/**
	 * 现住地址
	 */
	private String zhuzhidizhi;
	
	/**
	 * 工作单位
	 */
	private String gongzuodanwei;
	
	/**
	 * 案件名称
	 */
	private String anjianmingcheng;
	
	/**
	 * 文书文号
	 */
	private String wenshuwenhao;
	
	/**
	 * 批准时间
	 */
	private String pizhunriqi;
	
	/**
	 * 办案单位名称
	 */
	private String banandanweimc;
	
	/**
	 * 公安名称
	 */
	private String gonganmingcheng;
	
	
	/**
	 * 操作
	 */
	private String cz;
	
	public String getRylxmc() {
		if(ValidateHelper.isNotEmptyString(rylxflag)){
			rylxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZDRY_RYLB_FLAG", rylxflag);
		}
		return rylxmc;
	}

	public void setRylxmc(String rylxmc) {
		this.rylxmc = rylxmc;
	}
	
	public String getXingbie() {
		return xingbie;
	}

	public void setXingbie(String xingbie) {
		this.xingbie = xingbie;
	}

	public String getXbmc() {
		if(ValidateHelper.isNotEmptyString(xingbie)){
			xbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xingbie);
		}
		return xbmc;
	}

	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}

	public String getShenfenzhenghao() {
		return shenfenzhenghao;
	}

	public void setShenfenzhenghao(String shenfenzhenghao) {
		this.shenfenzhenghao = shenfenzhenghao;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openZdryQsWin('"+ renyuanbianhao +"','detail')\" style=\"color:green\">详情</span>&nbsp;";
		if(ActionContextHelper.getLoginInfo().getLeve() == 4){
			cz += "<span class=\"cps_span_href\" onclick=\"openZdryQsWin('"+ renyuanbianhao +"')\" style=\"color:green\">签收</span>&nbsp;";
		}
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getRenyuanbianhao() {
		return renyuanbianhao;
	}

	public void setRenyuanbianhao(String renyuanbianhao) {
		this.renyuanbianhao = renyuanbianhao;
	}

	public String getQubaofangshi() {
		if("1".equals(qubaofangshi)){
			qubaofangshi = "财保";
		}else if("0".equals(qubaofangshi)){
			qubaofangshi = "人保";
		}
		return qubaofangshi;
	}

	public void setQubaofangshi(String qubaofangshi) {
		this.qubaofangshi = qubaofangshi;
	}

	public String getQubaoqixian() {
		return qubaoqixian;
	}

	public void setQubaoqixian(String qubaoqixian) {
		this.qubaoqixian = qubaoqixian;
	}

	public String getXingming() {
		return xingming;
	}

	public void setXingming(String xingming) {
		this.xingming = xingming;
	}

	public String getLianxidianhua() {
		return lianxidianhua;
	}

	public void setLianxidianhua(String lianxidianhua) {
		this.lianxidianhua = lianxidianhua;
	}

	public String getRylxflag() {
		return rylxflag;
	}

	public void setRylxflag(String rylxflag) {
		this.rylxflag = rylxflag;
	}

	public String getNianling() {
		return nianling;
	}

	public void setNianling(String nianling) {
		this.nianling = nianling;
	}

	public String getChushengriqi() {
		return chushengriqi;
	}

	public void setChushengriqi(String chushengriqi) {
		this.chushengriqi = chushengriqi;
	}

	public String getZhuzhidizhi() {
		return zhuzhidizhi;
	}

	public void setZhuzhidizhi(String zhuzhidizhi) {
		this.zhuzhidizhi = zhuzhidizhi;
	}

	public String getGongzuodanwei() {
		return gongzuodanwei;
	}

	public void setGongzuodanwei(String gongzuodanwei) {
		this.gongzuodanwei = gongzuodanwei;
	}

	public String getAnjianmingcheng() {
		return anjianmingcheng;
	}

	public void setAnjianmingcheng(String anjianmingcheng) {
		this.anjianmingcheng = anjianmingcheng;
	}

	public String getWenshuwenhao() {
		return wenshuwenhao;
	}

	public void setWenshuwenhao(String wenshuwenhao) {
		this.wenshuwenhao = wenshuwenhao;
	}

	public String getPizhunriqi() {
		return pizhunriqi;
	}

	public void setPizhunriqi(String pizhunriqi) {
		this.pizhunriqi = pizhunriqi;
	}

	public String getBanandanweimc() {
		return banandanweimc;
	}

	public void setBanandanweimc(String banandanweimc) {
		this.banandanweimc = banandanweimc;
	}

	public String getGonganmingcheng() {
		return gonganmingcheng;
	}

	public void setGonganmingcheng(String gonganmingcheng) {
		this.gonganmingcheng = gonganmingcheng;
	}
}
