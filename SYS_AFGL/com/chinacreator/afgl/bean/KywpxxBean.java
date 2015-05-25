package com.chinacreator.afgl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 可疑物品信息
 *
 */
public class KywpxxBean {
	private String kywpbh;					//可疑物品编号
	private String pcbh;					//盘查编号
	private String wpmc;					//物品名称
	private String wplx;					//物品类型
	private String wplxmc;					//物品类型
	private String wpxh;					//物品型号
	private String wpgg;					//物品规格
	private String wpys;					//物品样式
	private String wpyas;					//物品颜色
    private String wpsl;					//物品数量
    private String wpsldw;					//物品数量单位
    private String wpsldwmc;				//物品数量单位
    private String wpzl;					//物品重量
    private String wpzldw;					//物品重量单位
    private String wpzldwmc;				//物品重量单位
    private String wpcd;					//物品长度
    private String wpcddw;					//物品长度单位
    private String wpcddwmc;				//物品长度单位
    private String zjdwdm;					//追缴单位代码
    private String zjdwmc;					//追缴单位名称
    private String zjsj;					//追缴时间
    private String wpxz;					//物品性质
    private String wpxzmc;					//物品性质
    private String wpjz;					//物品价值
    private String wptz;					//物品特征
    private String wpms;					//物品描述
    private String clzt;					//处理状态
    private String clztmc;					//处理状态
    private String clqk;					//处理情况
    private String clqkmc;					//处理情况
    private String clrxm;					//处理人姓名
    private String clrjh;					//处理人警号
    private String cldwdm;					//处理单位代码
    private String cldwmc;					//处理单位名称
    private String clrq;					//处理日期
    private String bz;						//备注
    private String wptp;					//物品图片
    private String wpcfdz;					//物品存放地址
    private String wplylx;					//物品来源类型
    private String wplylxmc;				//物品来源类型
	private String cz;						//操作
	private String djrxm;					//登记人姓名
	private String djrjh;					//登记人警号
	private String djdwdm;					//登记单位代码
	private String djdwmc;					//登记单位名称
	private String djsj;					//登记时间
	private String czbs;					//操作标识
	
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getKywpbh() {
		return kywpbh;
	}
	public void setKywpbh(String kywpbh) {
		this.kywpbh = kywpbh;
	}
	public String getPcbh() {
		return pcbh;
	}
	public void setPcbh(String pcbh) {
		this.pcbh = pcbh;
	}
	public String getWpmc() {
		return wpmc;
	}
	public void setWpmc(String wpmc) {
		this.wpmc = wpmc;
	}
	public String getWplx() {
		return wplx;
	}
	public void setWplx(String wplx) {
		this.wplx = wplx;
	}
	public String getWpxh() {
		return wpxh;
	}
	public void setWpxh(String wpxh) {
		this.wpxh = wpxh;
	}
	public String getWpgg() {
		return wpgg;
	}
	public void setWpgg(String wpgg) {
		this.wpgg = wpgg;
	}
	public String getWpys() {
		return wpys;
	}
	public void setWpys(String wpys) {
		this.wpys = wpys;
	}
	public String getWpyas() {
		return wpyas;
	}
	public void setWpyas(String wpyas) {
		this.wpyas = wpyas;
	}
	public String getWpsl() {
		return wpsl;
	}
	public void setWpsl(String wpsl) {
		this.wpsl = wpsl;
	}
	public String getWpsldw() {
		return wpsldw;
	}
	public void setWpsldw(String wpsldw) {
		this.wpsldw = wpsldw;
	}
	public String getWpzl() {
		return wpzl;
	}
	public void setWpzl(String wpzl) {
		this.wpzl = wpzl;
	}
	public String getWpzldw() {
		return wpzldw;
	}
	public void setWpzldw(String wpzldw) {
		this.wpzldw = wpzldw;
	}
	public String getWpcd() {
		return wpcd;
	}
	public void setWpcd(String wpcd) {
		this.wpcd = wpcd;
	}
	public String getWpcddw() {
		return wpcddw;
	}
	public void setWpcddw(String wpcddw) {
		this.wpcddw = wpcddw;
	}
	public String getZjdwdm() {
		return zjdwdm;
	}
	public void setZjdwdm(String zjdwdm) {
		this.zjdwdm = zjdwdm;
	}
	public String getZjdwmc() {
		return zjdwmc;
	}
	public void setZjdwmc(String zjdwmc) {
		this.zjdwmc = zjdwmc;
	}
	public String getZjsj() {
		return zjsj;
	}
	public void setZjsj(String zjsj) {
		this.zjsj = zjsj;
	}
	public String getWpxz() {
		return wpxz;
	}
	public void setWpxz(String wpxz) {
		this.wpxz = wpxz;
	}
	public String getWpjz() {
		return wpjz;
	}
	public void setWpjz(String wpjz) {
		this.wpjz = wpjz;
	}
	public String getWptz() {
		return wptz;
	}
	public void setWptz(String wptz) {
		this.wptz = wptz;
	}
	public String getWpms() {
		return wpms;
	}
	public void setWpms(String wpms) {
		this.wpms = wpms;
	}
	public String getClzt() {
		return clzt;
	}
	public void setClzt(String clzt) {
		this.clzt = clzt;
	}
	public String getClqk() {
		return clqk;
	}
	public void setClqk(String clqk) {
		this.clqk = clqk;
	}
	public String getClrxm() {
		return clrxm;
	}
	public void setClrxm(String clrxm) {
		this.clrxm = clrxm;
	}
	public String getClrjh() {
		return clrjh;
	}
	public void setClrjh(String clrjh) {
		this.clrjh = clrjh;
	}
	public String getCldwdm() {
		return cldwdm;
	}
	public void setCldwdm(String cldwdm) {
		this.cldwdm = cldwdm;
	}
	public String getCldwmc() {
		return cldwmc;
	}
	public void setCldwmc(String cldwmc) {
		this.cldwmc = cldwmc;
	}
	public String getClrq() {
		return clrq;
	}
	public void setClrq(String clrq) {
		this.clrq = clrq;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getWptp() {
		return wptp;
	}
	public void setWptp(String wptp) {
		this.wptp = wptp;
	}
	public String getWpcfdz() {
		return wpcfdz;
	}
	public void setWpcfdz(String wpcfdz) {
		this.wpcfdz = wpcfdz;
	}
	public String getWplylx() {
		return wplylx;
	}
	public void setWplylx(String wplylx) {
		this.wplylx = wplylx;
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
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getWplxmc() {
		if(ValidateHelper.isNotEmptyString(wplx)){
			wplxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_WPLB", wplx);
		}
		return wplxmc;
	}
	public void setWplxmc(String wplxmc) {
		this.wplxmc = wplxmc;
	}
	public String getWpsldwmc() {
		if(ValidateHelper.isNotEmptyString(wpsldw)){
			wpsldwmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_WPSLDW", wpsldw);
		}
		return wpsldwmc;
	}
	public void setWpsldwmc(String wpsldwmc) {
		this.wpsldwmc = wpsldwmc;
	}
	public String getWpzldwmc() {
		if(ValidateHelper.isNotEmptyString(wpzldw)){
			wpzldwmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_WPZLDW", wpzldw);
		}
		return wpzldwmc;
	}
	public void setWpzldwmc(String wpzldwmc) {
		this.wpzldwmc = wpzldwmc;
	}
	public String getWpcddwmc() {
		if(ValidateHelper.isNotEmptyString(wpcddw)){
			wpcddwmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_WPCDDW", wpcddw);
		}
		return wpcddwmc;
	}
	public void setWpcddwmc(String wpcddwmc) {
		this.wpcddwmc = wpcddwmc;
	}
	public String getWpxzmc() {
		if(ValidateHelper.isNotEmptyString(wpxz)){
			wpxzmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_WPXZ", wpxz);
		}
		return wpxzmc;
	}
	public void setWpxzmc(String wpxzmc) {
		this.wpxzmc = wpxzmc;
	}
	public String getClztmc() {
		if(ValidateHelper.isNotEmptyString(clzt)){
			clztmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_WPZT", clzt);
		}
		return clztmc;
	}
	public void setClztmc(String clztmc) {
		this.clztmc = clztmc;
	}
	public String getClqkmc() {
		if(ValidateHelper.isNotEmptyString(clqk)){
			clqkmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_WPCLQK", clqk);
		}
		return clqkmc;
	}
	public void setClqkmc(String clqkmc) {
		this.clqkmc = clqkmc;
	}
	public String getWplylxmc() {
		if(ValidateHelper.isNotEmptyString(wplylx)){
			wplylxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_WPLYLX", wplylx);
		}
		return wplylxmc;
	}
	public void setWplylxmc(String wplylxmc) {
		this.wplylxmc = wplylxmc;
	}
	
}
