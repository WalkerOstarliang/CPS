package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
/**
 * 中文描述	吸毒人员查获尿检信息
 * @author zhun.liu
 *
 */
public class ZdryXdchNjxxBean extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6917028707447570605L;
	
	private String id;    //编号
	private String xdrybh;					//吸毒人员编号
	private String chrq;					//查获日期
	private String chdq;					//查获地区
	private String chdqmc;
	private String chdd;					//查获地点
	private String xdcs;					//吸毒场所
	private String dply;					//毒品来源
	private String dpzl;					//毒品种类
	private String wfss;					//违法事实
	private String chdwdm;					//查获单位代码
	private String chdwmc;					//查获单位名称
	private String njrq;					//尿检日期
	private String njdq;					//尿检地区
	private String njdqmc;
	private String njdd;					//尿检地点
	private String njjg;					//尿检结果
	private String fxcs;					//复吸次数
	private String djrxm;					//登记人姓名
	private String djsj;					//登记时间
	private String djdwdm;					//登记单位代码
	private String djdwmc;					//登记单位名称
	private String czrxm;					//操作人姓名
	private String czsj;					//操作时间
	private String czdwdm;					//操作单位代码
	private String czdwmc;					//操作单位名称
	private String czbs;					//操作标示
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXdrybh() {
		return xdrybh;
	}
	public void setXdrybh(String xdrybh) {
		this.xdrybh = xdrybh;
	}
	public String getChrq() {
		return chrq;
	}
	public void setChrq(String chrq) {
		this.chrq = chrq;
	}
	public String getChdq() {
		return chdq;
	}
	public void setChdq(String chdq) {
		this.chdq = chdq;
	}
	public String getChdd() {
		return chdd;
	}
	public void setChdd(String chdd) {
		this.chdd = chdd;
	}
	public String getXdcs() {
		return xdcs;
	}
	public void setXdcs(String xdcs) {
		this.xdcs = xdcs;
	}
	public String getDply() {
		return dply;
	}
	public void setDply(String dply) {
		this.dply = dply;
	}
	public String getDpzl() {
		return dpzl;
	}
	public void setDpzl(String dpzl) {
		this.dpzl = dpzl;
	}
	public String getWfss() {
		return wfss;
	}
	public void setWfss(String wfss) {
		this.wfss = wfss;
	}
	public String getChdwdm() {
		return chdwdm;
	}
	public void setChdwdm(String chdwdm) {
		this.chdwdm = chdwdm;
	}
	public String getChdwmc() {
		return chdwmc;
	}
	public void setChdwmc(String chdwmc) {
		this.chdwmc = chdwmc;
	}
	public String getNjrq() {
		return njrq;
	}
	public void setNjrq(String njrq) {
		this.njrq = njrq;
	}
	public String getNjdq() {
		return njdq;
	}
	public void setNjdq(String njdq) {
		this.njdq = njdq;
	}
	public String getNjdd() {
		return njdd;
	}
	public void setNjdd(String njdd) {
		this.njdd = njdd;
	}
	public String getNjjg() {
		return njjg;
	}
	public void setNjjg(String njjg) {
		this.njjg = njjg;
	}
	public String getFxcs() {
		return fxcs;
	}
	public void setFxcs(String fxcs) {
		this.fxcs = fxcs;
	}
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
	public String getChdqmc() {
		chdqmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH",chdq);
		return chdqmc;
	}
	public void setChdqmc(String chdqmc) {
		this.chdqmc = chdqmc;
	}
	public String getNjdqmc() {
		njdqmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH",njdq);
		return njdqmc;
	}
	public void setNjdqmc(String njdqmc) {
		this.njdqmc = njdqmc;
	}
	
	
	
}
