package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class ZdryXsbxBean extends BaseValue{

	/**
	 * 重点人员现实表现bean
	 */
	private static final long serialVersionUID = -7942916205429054174L;
	private String jlbh; 	
	private String rybh;	//人员编号
	private String sfzh;	//身份证号
	private String zkzt;	//在控状态
	private String zkztmc;  //在控状态名称
	private String sfzyry;	//是否在押人员
	private String sfzyrymc;//是否在押人员名称
	private String gzqssj;	//关押起始时间
	private String gydd;	//关押地点
	private String badw;	//办案单位
	private String badwdh;	//办案单位电话
	private String gyyy;	//关押原因
	private String zyjsnzt;	//在原籍市内状态
	private String lkbssj;	//离开本市时间
	private String qwbsqh;	//去往省市区县
	private String qwbsqhmc;
	private String sfcqyjbg;	//是否长期有家不归
	private String jzqssj;	//居住起始时间
	private String zzxz;	//住址详址
	private String sfcqhjyfzcs;	//是否长期混迹于复杂场所
	private String csmc;	//场所名称
	private String csdm;	//场所代码
	private String csxz;	//场所详址
	private String sfygdzy;	//是否有固定职业
	private String gzdwmc;	//工作单位名称
	private String gzdwxz;	//工作单位详址
	private String sfjjjj;	//是否经济拮据
	private String jjjjpdyj;	//经济拮据判断依据
	private String ysr;	//月收入
	private String sfdjtwgdsy;	//是否多家庭无固定收入
	private String wgdsrpdyy;	//无固定收入判断依据
	private String rcxfsfmxdysr;	//日常消费是否明细大于收入
	private String xfdrsrpdyj;	//消费大于收入判断依据
	private String sfgzsjc;	//是否够置私家车
	private String cjcjz;	//私家车价值
	private String gcsj;	//购车时间
	private String cphm;	//车牌号码
	private String sfgzfc;	//是否购置房产
	private String fcjz;	//房产价值
	private String gfsj;	//购房时间
	private String fwdz;	//房屋地址
	private String jqsfycwwffzxyrdkn;	//近期是否有成为违法犯罪嫌疑人的可能
	private String cwwfzxyrpdyj;	//近期是否有成为违法犯罪嫌疑人的可能性判断依据
	private String hszrdwdm;	//核实责任单位代码
	private String hszedwmc;	//核实责任单位名称
	private String hsmjxm;	//核实民警姓名
	private String hsmjsfzh;	//核实民警身份证号
	private String hssj;	//核实时间
	private String hsddqh;	//核实地址区划
	private String hsddqhmc;
	private String hsddxz;	//核实地址详址
	private String xsqkms;	//现实情况描述
	private String djrxm;	//登记人姓名
	private String djdwdm;	//登记单位代码
	private String djdwmc;	//登记单位名称
	private String djsj;	//登记时间
	private String czrxm;	//操作人姓名
	private String czdwdm;	//操作单位代码
	private String czdwmc;	//操作单位名称
	private String czsj;	//操作时间
	private String czbs;
	
	private String djrsfzh;
	private String czrsfzh;
	
	/**
	 * 重点人员联系方式
	 */
	private String zdrylxfs;
	
	/**
	 * 侵财性犯罪次数
	 */
	private String qcxfzcs;
	
	/**
	 * 重点人员联系方式备注
	 */
	private String lxfsbz;
	private String zdrybh;
	
	public String getZdrybh() {
		return zdrybh;
	}
	public void setZdrybh(String zdrybh) {
		this.zdrybh = zdrybh;
	}
	public String getJlbh() {
		return jlbh;
	}
	public void setJlbh(String jlbh) {
		this.jlbh = jlbh;
	}
	public String getRybh() {
		return rybh;
	}
	public void setRybh(String rybh) {
		this.rybh = rybh;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getZkzt() {
		return zkzt;
	}
	public void setZkzt(String zkzt) {
		this.zkzt = zkzt;
	}
	public String getSfzyry() {
		return sfzyry;
	}
	public void setSfzyry(String sfzyry) {
		this.sfzyry = sfzyry;
	}
	public String getGzqssj() {
		return gzqssj;
	}
	public void setGzqssj(String gzqssj) {
		this.gzqssj = gzqssj;
	}
	public String getGydd() {
		return gydd;
	}
	public void setGydd(String gydd) {
		this.gydd = gydd;
	}
	public String getBadw() {
		return badw;
	}
	public void setBadw(String badw) {
		this.badw = badw;
	}
	public String getBadwdh() {
		return badwdh;
	}
	public void setBadwdh(String badwdh) {
		this.badwdh = badwdh;
	}
	public String getGyyy() {
		return gyyy;
	}
	public void setGyyy(String gyyy) {
		this.gyyy = gyyy;
	}
	public String getZyjsnzt() {
		return zyjsnzt;
	}
	public void setZyjsnzt(String zyjsnzt) {
		this.zyjsnzt = zyjsnzt;
	}
	public String getLkbssj() {
		return lkbssj;
	}
	public void setLkbssj(String lkbssj) {
		this.lkbssj = lkbssj;
	}
	public String getQwbsqh() {
		return qwbsqh;
	}
	public void setQwbsqh(String qwbsqh) {
		this.qwbsqh = qwbsqh;
	}
	public String getSfcqyjbg() {
		return sfcqyjbg;
	}
	public void setSfcqyjbg(String sfcqyjbg) {
		this.sfcqyjbg = sfcqyjbg;
	}
	public String getJzqssj() {
		return jzqssj;
	}
	public void setJzqssj(String jzqssj) {
		this.jzqssj = jzqssj;
	}
	public String getZzxz() {
		return zzxz;
	}
	public void setZzxz(String zzxz) {
		this.zzxz = zzxz;
	}
	public String getSfcqhjyfzcs() {
		return sfcqhjyfzcs;
	}
	public void setSfcqhjyfzcs(String sfcqhjyfzcs) {
		this.sfcqhjyfzcs = sfcqhjyfzcs;
	}
	public String getCsmc() {
		return csmc;
	}
	public void setCsmc(String csmc) {
		this.csmc = csmc;
	}
	public String getCsdm() {
		return csdm;
	}
	public void setCsdm(String csdm) {
		this.csdm = csdm;
	}
	public String getCsxz() {
		return csxz;
	}
	public void setCsxz(String csxz) {
		this.csxz = csxz;
	}
	public String getSfygdzy() {
		return sfygdzy;
	}
	public void setSfygdzy(String sfygdzy) {
		this.sfygdzy = sfygdzy;
	}
	public String getGzdwmc() {
		return gzdwmc;
	}
	public void setGzdwmc(String gzdwmc) {
		this.gzdwmc = gzdwmc;
	}
	public String getGzdwxz() {
		return gzdwxz;
	}
	public void setGzdwxz(String gzdwxz) {
		this.gzdwxz = gzdwxz;
	}
	public String getSfjjjj() {
		return sfjjjj;
	}
	public void setSfjjjj(String sfjjjj) {
		this.sfjjjj = sfjjjj;
	}
	public String getJjjjpdyj() {
		return jjjjpdyj;
	}
	public void setJjjjpdyj(String jjjjpdyj) {
		this.jjjjpdyj = jjjjpdyj;
	}
	public String getYsr() {
		return ysr;
	}
	public void setYsr(String ysr) {
		this.ysr = ysr;
	}
	public String getSfdjtwgdsy() {
		return sfdjtwgdsy;
	}
	public void setSfdjtwgdsy(String sfdjtwgdsy) {
		this.sfdjtwgdsy = sfdjtwgdsy;
	}
	public String getWgdsrpdyy() {
		return wgdsrpdyy;
	}
	public void setWgdsrpdyy(String wgdsrpdyy) {
		this.wgdsrpdyy = wgdsrpdyy;
	}
	public String getRcxfsfmxdysr() {
		return rcxfsfmxdysr;
	}
	public void setRcxfsfmxdysr(String rcxfsfmxdysr) {
		this.rcxfsfmxdysr = rcxfsfmxdysr;
	}
	public String getXfdrsrpdyj() {
		return xfdrsrpdyj;
	}
	public void setXfdrsrpdyj(String xfdrsrpdyj) {
		this.xfdrsrpdyj = xfdrsrpdyj;
	}
	public String getSfgzsjc() {
		return sfgzsjc;
	}
	public void setSfgzsjc(String sfgzsjc) {
		this.sfgzsjc = sfgzsjc;
	}
	public String getCjcjz() {
		return cjcjz;
	}
	public void setCjcjz(String cjcjz) {
		this.cjcjz = cjcjz;
	}
	public String getGcsj() {
		return gcsj;
	}
	public void setGcsj(String gcsj) {
		this.gcsj = gcsj;
	}
	public String getCphm() {
		return cphm;
	}
	public void setCphm(String cphm) {
		this.cphm = cphm;
	}
	public String getSfgzfc() {
		return sfgzfc;
	}
	public void setSfgzfc(String sfgzfc) {
		this.sfgzfc = sfgzfc;
	}
	public String getFcjz() {
		return fcjz;
	}
	public void setFcjz(String fcjz) {
		this.fcjz = fcjz;
	}
	public String getGfsj() {
		return gfsj;
	}
	public void setGfsj(String gfsj) {
		this.gfsj = gfsj;
	}
	public String getFwdz() {
		return fwdz;
	}
	public void setFwdz(String fwdz) {
		this.fwdz = fwdz;
	}
	public String getJqsfycwwffzxyrdkn() {
		return jqsfycwwffzxyrdkn;
	}
	public void setJqsfycwwffzxyrdkn(String jqsfycwwffzxyrdkn) {
		this.jqsfycwwffzxyrdkn = jqsfycwwffzxyrdkn;
	}
	public String getCwwfzxyrpdyj() {
		return cwwfzxyrpdyj;
	}
	public void setCwwfzxyrpdyj(String cwwfzxyrpdyj) {
		this.cwwfzxyrpdyj = cwwfzxyrpdyj;
	}
	public String getHszrdwdm() {
		return hszrdwdm;
	}
	public void setHszrdwdm(String hszrdwdm) {
		this.hszrdwdm = hszrdwdm;
	}
	public String getHszedwmc() {
		return hszedwmc;
	}
	public void setHszedwmc(String hszedwmc) {
		this.hszedwmc = hszedwmc;
	}
	public String getHsmjxm() {
		return hsmjxm;
	}
	public void setHsmjxm(String hsmjxm) {
		this.hsmjxm = hsmjxm;
	}
	public String getHsmjsfzh() {
		return hsmjsfzh;
	}
	public void setHsmjsfzh(String hsmjsfzh) {
		this.hsmjsfzh = hsmjsfzh;
	}
	public String getHssj() {
		return hssj;
	}
	public void setHssj(String hssj) {
		this.hssj = hssj;
	}
	public String getHsddqh() {
		return hsddqh;
	}
	public void setHsddqh(String hsddqh) {
		this.hsddqh = hsddqh;
	}
	public String getHsddxz() {
		return hsddxz;
	}
	public void setHsddxz(String hsddxz) {
		this.hsddxz = hsddxz;
	}
	public String getXsqkms() {
		return xsqkms;
	}
	public void setXsqkms(String xsqkms) {
		this.xsqkms = xsqkms;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
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
	public String getCzrxm() {
		return czrxm;
	}
	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
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
	public String getCzsj() {
		return czsj;
	}
	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}
	public String getQwbsqhmc() {
		qwbsqhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH",qwbsqh);
		return qwbsqhmc;
	}
	public void setQwbsqhmc(String qwbsqhmc) {
		this.qwbsqhmc = qwbsqhmc;
	}
	public String getHsddqhmc() {
		hsddqhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH",hsddqh);
		return hsddqhmc;
	}
	public void setHsddqhmc(String hsddqhmc) {
		this.hsddqhmc = hsddqhmc;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getZkztmc() {
		if(ValidateHelper.isNotEmptyString(this.zkzt)){
			zkztmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDRY_ZKZT", this.zkzt);
		}
		return zkztmc;
	}
	public void setZkztmc(String zkztmc) {
		this.zkztmc = zkztmc;
	}
	public String getSfzyrymc() {
		if(ValidateHelper.isNotEmptyString(this.sfzyry)){
			sfzyrymc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZT", this.sfzyry);
		}
		return sfzyrymc;
	}
	public void setSfzyrymc(String sfzyrymc) {
		this.sfzyrymc = sfzyrymc;
	}
	public String getZdrylxfs() {
		return zdrylxfs;
	}
	public void setZdrylxfs(String zdrylxfs) {
		this.zdrylxfs = zdrylxfs;
	}
	public String getLxfsbz() {
		return lxfsbz;
	}
	public void setLxfsbz(String lxfsbz) {
		this.lxfsbz = lxfsbz;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getCzrsfzh() {
		return czrsfzh;
	}
	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
	}
	public String getQcxfzcs() {
		return qcxfzcs;
	}
	public void setQcxfzcs(String qcxfzcs) {
		this.qcxfzcs = qcxfzcs;
	}
}
