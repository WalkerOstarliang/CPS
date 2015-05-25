package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 重点人员取保候审
 *
 */
public class ZdryQbhsBean extends BaseValue {

	private static final long serialVersionUID = 4803248498821857875L;
	
	/**
	 * 性别
	 */
	private String xingbie;
	
	/**
	 * 工作单位
	 */
	private String gongzuodanwei;
	
	/**
	 * 现住地址
	 */
	private String zhuzhidizhi;
	
	/**
	 * 年龄
	 */
	private String nianling;
	
	/**
	 * 省份证号
	 */
	private String shenfenzhenghao;
	
	/**
	 * 出生日期
	 */
	private String chushengriqi;
	
	/**
	 * 案件名称
	 */
	private String anjianmingcheng;
	
	/**
	 * 案件编号
	 */
	private String anjianbianhao;
	
	/**
	 * 涉嫌罪名
	 */
	private String shexianzuiming;
	
	/**
	 * 法律依据
	 */
	private String falvyiju;
	
	/**
	 * 取保原因
	 */
	private String qubaoyuanyin;
	
	/**
	 * 保证金额
	 */
	private String bzjshuee;
	
	/**
	 * 保证金期限
	 */
	private String bzjqixian;
	
	/**
	 * 保证金银行
	 */
	private String bzjyinhang;

	/**
	 * 保证人姓名
	 */
	private String bzrxingming;
	
	/**
	 * 保证人性别
	 */
	private String bzrxingbie;
	private String xbmc;
	
	/**
	 * 保证人年龄
	 */
	private String bzrnianling;
	
	
	/**
	 * 保证人身份证号码
	 */
	private String bzrhaoma;
	
	/**
	 * 保证人联系电话
	 */
	private String bzrphone;
	
	/**
	 * 与保证人关系
	 */
	private String bzrguanxi;
	
	/**
	 * 保证人工作单位
	 */
	private String bzrdanwei;
	
	/**
	 * 保证人住址
	 */
	private String bzrzhuzhi;
	
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

	public String getGongzuodanwei() {
		return gongzuodanwei;
	}

	public void setGongzuodanwei(String gongzuodanwei) {
		this.gongzuodanwei = gongzuodanwei;
	}

	public String getZhuzhidizhi() {
		return zhuzhidizhi;
	}

	public void setZhuzhidizhi(String zhuzhidizhi) {
		this.zhuzhidizhi = zhuzhidizhi;
	}

	public String getNianling() {
		return nianling;
	}

	public void setNianling(String nianling) {
		this.nianling = nianling;
	}

	public String getShenfenzhenghao() {
		return shenfenzhenghao;
	}

	public void setShenfenzhenghao(String shenfenzhenghao) {
		this.shenfenzhenghao = shenfenzhenghao;
	}

	public String getChushengriqi() {
		return chushengriqi;
	}

	public void setChushengriqi(String chushengriqi) {
		this.chushengriqi = chushengriqi;
	}

	public String getAnjianmingcheng() {
		return anjianmingcheng;
	}

	public void setAnjianmingcheng(String anjianmingcheng) {
		this.anjianmingcheng = anjianmingcheng;
	}

	public String getAnjianbianhao() {
		return anjianbianhao;
	}

	public void setAnjianbianhao(String anjianbianhao) {
		this.anjianbianhao = anjianbianhao;
	}

	public String getShexianzuiming() {
		return shexianzuiming;
	}

	public void setShexianzuiming(String shexianzuiming) {
		this.shexianzuiming = shexianzuiming;
	}

	public String getFalvyiju() {
		return falvyiju;
	}

	public void setFalvyiju(String falvyiju) {
		this.falvyiju = falvyiju;
	}

	public String getQubaoyuanyin() {
		return qubaoyuanyin;
	}

	public void setQubaoyuanyin(String qubaoyuanyin) {
		this.qubaoyuanyin = qubaoyuanyin;
	}

	public String getBzjshuee() {
		return bzjshuee;
	}

	public void setBzjshuee(String bzjshuee) {
		this.bzjshuee = bzjshuee;
	}

	public String getBzjqixian() {
		return bzjqixian;
	}

	public void setBzjqixian(String bzjqixian) {
		this.bzjqixian = bzjqixian;
	}

	public String getBzjyinhang() {
		return bzjyinhang;
	}

	public void setBzjyinhang(String bzjyinhang) {
		this.bzjyinhang = bzjyinhang;
	}

	public String getBzrxingming() {
		return bzrxingming;
	}

	public void setBzrxingming(String bzrxingming) {
		this.bzrxingming = bzrxingming;
	}

	public String getBzrxingbie() {
		return bzrxingbie;
	}

	public void setBzrxingbie(String bzrxingbie) {
		this.bzrxingbie = bzrxingbie;
	}

	public String getXbmc() {
		if(ValidateHelper.isNotEmptyString(bzrxingbie)){
			xbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", bzrxingbie);
		}
		return xbmc;
	}

	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}

	public String getBzrnianling() {
		return bzrnianling;
	}

	public void setBzrnianling(String bzrnianling) {
		this.bzrnianling = bzrnianling;
	}

	public String getBzrhaoma() {
		return bzrhaoma;
	}

	public void setBzrhaoma(String bzrhaoma) {
		this.bzrhaoma = bzrhaoma;
	}

	public String getBzrphone() {
		return bzrphone;
	}

	public void setBzrphone(String bzrphone) {
		this.bzrphone = bzrphone;
	}

	public String getBzrguanxi() {
		return bzrguanxi;
	}

	public void setBzrguanxi(String bzrguanxi) {
		this.bzrguanxi = bzrguanxi;
	}

	public String getBzrdanwei() {
		return bzrdanwei;
	}

	public void setBzrdanwei(String bzrdanwei) {
		this.bzrdanwei = bzrdanwei;
	}

	public String getBzrzhuzhi() {
		return bzrzhuzhi;
	}

	public void setBzrzhuzhi(String bzrzhuzhi) {
		this.bzrzhuzhi = bzrzhuzhi;
	}

	public String getXingbie() {
		return xingbie;
	}

	public void setXingbie(String xingbie) {
		this.xingbie = xingbie;
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