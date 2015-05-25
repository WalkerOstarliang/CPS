package com.chinacreator.afgl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 治安盘查信息
 *
 */
public class ZapcxxBean {
	
	private String pcbh;				//盘查编号
	private String kkbh;				//卡口编号
	private String kkmc;				//卡口名称
	private String kkwz;				//卡口位置
	private String kkfw;				//卡口范围
	private String pcmjxm;				//盘查民警姓名
	private String pcmjjh;				//盘查民警警号
	private String pcdwdm;				//盘查单位代码
	private String pcdwmc;				//盘查单位名称
	private String pcsj;				//盘查时间
	private String pcyy;				//盘查原因
	private String pcyymc;				//盘查原因
	private String bpcrxm;				//被盘查人姓名
	private String bpcrsfzh;			//被盘查人身份证号
	private String bpcrxb;				//被盘查人性别
	private String bpcrxbmc;			//被盘查人性别
	private String bpcrcsrq;			//被盘查人出生日期
	private String bpcrhjdqh;			//被盘查人户籍地区划
	private String bpcrhjdxz;			//被盘查人户籍地详址
	private String bpcrxzdxz;			//被盘查人现住地详址
	private String cypcry;				//参与盘查人员
	private String pclb;				//盘查类别
	private String pclbmc;				//盘查类别
	private String pcclcjh;				//盘查车辆车架号
	private String pcclcph;				//盘查车辆车牌号
	private String pcclcpssr;			//盘查车辆车牌所属人
	private String pcclfdjh;			//盘查车辆发动机号
	private String pcdd;				//盘查地点
	private String cljg;				//处理结果
	private String pccllx;				//盘查车辆类型；物品类型
	private String pccllxmc;			//盘查车辆类型；物品类型
	private String pcclqk;				//盘查处理情况
	private String djrxm;				//登记人姓名
	private String djrjh;				//登记人警号
	private String djdwdm;				//登记单位代码
	private String djdwmc;				//登记单位名称
	private String djsj;				//登记时间
	private String czbs;				//操作标识
	private String cz;
	private String hasKywp;				//是否有可疑物品
	
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getPcbh() {
		return pcbh;
	}
	public void setPcbh(String pcbh) {
		this.pcbh = pcbh;
	}
	public String getKkbh() {
		return kkbh;
	}
	public void setKkbh(String kkbh) {
		this.kkbh = kkbh;
	}
	public String getKkmc() {
		return kkmc;
	}
	public void setKkmc(String kkmc) {
		this.kkmc = kkmc;
	}
	public String getPcmjxm() {
		return pcmjxm;
	}
	public void setPcmjxm(String pcmjxm) {
		this.pcmjxm = pcmjxm;
	}
	public String getPcmjjh() {
		return pcmjjh;
	}
	public void setPcmjjh(String pcmjjh) {
		this.pcmjjh = pcmjjh;
	}
	public String getPcdwdm() {
		return pcdwdm;
	}
	public void setPcdwdm(String pcdwdm) {
		this.pcdwdm = pcdwdm;
	}
	public String getPcdwmc() {
		return pcdwmc;
	}
	public void setPcdwmc(String pcdwmc) {
		this.pcdwmc = pcdwmc;
	}
	public String getPcsj() {
		return pcsj;
	}
	public void setPcsj(String pcsj) {
		this.pcsj = pcsj;
	}
	public String getPcyy() {
		return pcyy;
	}
	public void setPcyy(String pcyy) {
		this.pcyy = pcyy;
	}
	public String getBpcrxm() {
		return bpcrxm;
	}
	public void setBpcrxm(String bpcrxm) {
		this.bpcrxm = bpcrxm;
	}
	public String getBpcrsfzh() {
		return bpcrsfzh;
	}
	public void setBpcrsfzh(String bpcrsfzh) {
		this.bpcrsfzh = bpcrsfzh;
	}
	public String getBpcrxb() {
		return bpcrxb;
	}
	public void setBpcrxb(String bpcrxb) {
		this.bpcrxb = bpcrxb;
	}
	public String getBpcrcsrq() {
		return bpcrcsrq;
	}
	public void setBpcrcsrq(String bpcrcsrq) {
		this.bpcrcsrq = bpcrcsrq;
	}
	public String getBpcrhjdqh() {
		return bpcrhjdqh;
	}
	public void setBpcrhjdqh(String bpcrhjdqh) {
		this.bpcrhjdqh = bpcrhjdqh;
	}
	public String getBpcrxzdxz() {
		return bpcrxzdxz;
	}
	public void setBpcrxzdxz(String bpcrxzdxz) {
		this.bpcrxzdxz = bpcrxzdxz;
	}
	public String getCypcry() {
		return cypcry;
	}
	public void setCypcry(String cypcry) {
		this.cypcry = cypcry;
	}
	public String getPclb() {
		return pclb;
	}
	public void setPclb(String pclb) {
		this.pclb = pclb;
	}
	public String getPcclcjh() {
		return pcclcjh;
	}
	public void setPcclcjh(String pcclcjh) {
		this.pcclcjh = pcclcjh;
	}
	public String getPcclcph() {
		return pcclcph;
	}
	public void setPcclcph(String pcclcph) {
		this.pcclcph = pcclcph;
	}
	public String getPcclfdjh() {
		return pcclfdjh;
	}
	public void setPcclfdjh(String pcclfdjh) {
		this.pcclfdjh = pcclfdjh;
	}
	public String getPcdd() {
		return pcdd;
	}
	public void setPcdd(String pcdd) {
		this.pcdd = pcdd;
	}
	public String getCljg() {
		return cljg;
	}
	public void setCljg(String cljg) {
		this.cljg = cljg;
	}
	public String getPccllx() {
		return pccllx;
	}
	public void setPccllx(String pccllx) {
		this.pccllx = pccllx;
	}
	public String getPcclqk() {
		return pcclqk;
	}
	public void setPcclqk(String pcclqk) {
		this.pcclqk = pcclqk;
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
	public String getPcclcpssr() {
		return pcclcpssr;
	}
	public void setPcclcpssr(String pcclcpssr) {
		this.pcclcpssr = pcclcpssr;
	}
	public String getKkwz() {
		return kkwz;
	}
	public void setKkwz(String kkwz) {
		this.kkwz = kkwz;
	}
	public String getKkfw() {
		return kkfw;
	}
	public void setKkfw(String kkfw) {
		this.kkfw = kkfw;
	}
	public String getBpcrhjdxz() {
		if(ValidateHelper.isNotEmptyString(bpcrhjdqh)){
			bpcrhjdxz = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", bpcrhjdqh);
		}
		return bpcrhjdxz;
	}
	public void setBpcrhjdxz(String bpcrhjdxz) {
		this.bpcrhjdxz = bpcrhjdxz;
	}
	public String getBpcrxbmc() {
		if(ValidateHelper.isNotEmptyString(bpcrxb)){
			bpcrxbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", bpcrxb);
		}
		return bpcrxbmc;
	}
	public void setBpcrxbmc(String bpcrxbmc) {
		this.bpcrxbmc = bpcrxbmc;
	}
	public String getPclbmc() {
		if(ValidateHelper.isNotEmptyString(pclb)){
			pclbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_PCLX", pclb);
		}
		return pclbmc;
	}
	public void setPclbmc(String pclbmc) {
		this.pclbmc = pclbmc;
	}
	public String getPccllxmc() {
		if(ValidateHelper.isNotEmptyString(pccllx)){
			pccllxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_CLLX", pccllx);
		}
		return pccllxmc;
	}
	public void setPccllxmc(String pccllxmc) {
		this.pccllxmc = pccllxmc;
	}
	public String getPcyymc() {
		if(ValidateHelper.isNotEmptyString(pcyy)){
			pcyymc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_PCYY", pcyy);
		}
		return pcyymc;
	}
	public void setPcyymc(String pcyymc) {
		this.pcyymc = pcyymc;
	}
	public String getHasKywp() {
		return hasKywp;
	}
	public void setHasKywp(String hasKywp) {
		this.hasKywp = hasKywp;
	}
	
}
