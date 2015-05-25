package com.chinacreator.afgl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 协管队员信息
 * @author Administrator
 *
 */
public class XgdyxxBean{
	private String xgdbh;			//			协管队编号
	private String xgdmc;			//			协管队名称
	private String sssqbh;			//			所属社区编号
	private String sssqmc;			//			所属社区名称
	private String zjrq;			//			组建日期
	private String fzrxm;			//			负责人姓名
	private String fzrlxdh;			//			负责人联系电话
	private String dybh;				//			队员编号
	private String dyxm;				//			队员姓名
	private String dysfzh;				//			队员身份证号
	private String dyxb;				//			队员性别
	private String dyxbmc;				//			队员性别
	private String whcd;				//			文化程度
	private String whcdmc;				//			文化程度
	private String dycsrq;				//			队员出生日期
	private String dyhjdxz;				//			队员户籍地详址
	private String dyxzdxz;				//			队员现住地祥址
	private String dylxdh;				//			队员联系电话
	private String gl;					//			工龄
	private String sgrq;				//			上岗日期
	private String lgrq;				//			离岗日期
	private String zgzt;				//			在岗状态
	private String gzbx;				//			工作表现
	private String shgx;				//			社会关系
	private String dyjl;				//			队员简历
	private String djrxm;				//			登记人姓名
	private String djrjh;				//			登记人警号
	private String djrdwdm;				//			登记人单位代码
	private String djrdwmc;				//			登记人单位名称
	private String djsj;				//			登记时间
	private String zxbs;				//			注销标识
	private String zxsj;				//			注销时间
	private String zxdwdm;				//			注销单位代码
	private String zxdwmc;				//			注销单位名称
	private String cz;
	private String czbs;
	private String zxbsmc;
	private String bz;
	private String pxqk;				//培训情况20130325
	private String djrsfzh;
	public String getDybh() {
		return dybh;
	}
	public void setDybh(String dybh) {
		this.dybh = dybh;
	}
	public String getDyxm() {
		return dyxm;
	}
	public void setDyxm(String dyxm) {
		this.dyxm = dyxm;
	}
	public String getDysfzh() {
		return dysfzh;
	}
	public void setDysfzh(String dysfzh) {
		this.dysfzh = dysfzh;
	}
	public String getDyxb() {
		return dyxb;
	}
	public void setDyxb(String dyxb) {
		this.dyxb = dyxb;
	}
	public String getWhcd() {
		return whcd;
	}
	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}
	public String getDycsrq() {
		return dycsrq;
	}
	public void setDycsrq(String dycsrq) {
		this.dycsrq = dycsrq;
	}
	public String getDyhjdxz() {
		return dyhjdxz;
	}
	public void setDyhjdxz(String dyhjdxz) {
		this.dyhjdxz = dyhjdxz;
	}
	public String getDyxzdxz() {
		return dyxzdxz;
	}
	public void setDyxzdxz(String dyxzdxz) {
		this.dyxzdxz = dyxzdxz;
	}
	public String getDylxdh() {
		return dylxdh;
	}
	public void setDylxdh(String dylxdh) {
		this.dylxdh = dylxdh;
	}
	public String getGl() {
		return gl;
	}
	public void setGl(String gl) {
		this.gl = gl;
	}
	public String getSgrq() {
		return sgrq;
	}
	public void setSgrq(String sgrq) {
		this.sgrq = sgrq;
	}
	public String getLgrq() {
		return lgrq;
	}
	public void setLgrq(String lgrq) {
		this.lgrq = lgrq;
	}
	public String getZgzt() {
		return zgzt;
	}
	public void setZgzt(String zgzt) {
		this.zgzt = zgzt;
	}
	public String getGzbx() {
		return gzbx;
	}
	public void setGzbx(String gzbx) {
		this.gzbx = gzbx;
	}
	public String getShgx() {
		return shgx;
	}
	public void setShgx(String shgx) {
		this.shgx = shgx;
	}
	public String getDyjl() {
		return dyjl;
	}
	public void setDyjl(String dyjl) {
		this.dyjl = dyjl;
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
	public String getDjrdwdm() {
		return djrdwdm;
	}
	public void setDjrdwdm(String djrdwdm) {
		this.djrdwdm = djrdwdm;
	}
	public String getDjrdwmc() {
		return djrdwmc;
	}
	public void setDjrdwmc(String djrdwmc) {
		this.djrdwmc = djrdwmc;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
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
	public String getZxdwdm() {
		return zxdwdm;
	}
	public void setZxdwdm(String zxdwdm) {
		this.zxdwdm = zxdwdm;
	}
	public String getZxdwmc() {
		return zxdwmc;
	}
	public void setZxdwmc(String zxdwmc) {
		this.zxdwmc = zxdwmc;
	}
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getZxbsmc() {
		if("1".equals(zxbs)){
			zxbsmc = "无效";
		}else if("0".equals(zxbs)){
			zxbsmc = "有效";
		}
		return zxbsmc;
	}
	public void setZxbsmc(String zxbsmc) {
		this.zxbsmc = zxbsmc;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getXgdbh() {
		return xgdbh;
	}
	public void setXgdbh(String xgdbh) {
		this.xgdbh = xgdbh;
	}
	public String getXgdmc() {
		return xgdmc;
	}
	public void setXgdmc(String xgdmc) {
		this.xgdmc = xgdmc;
	}
	public String getSssqbh() {
		return sssqbh;
	}
	public void setSssqbh(String sssqbh) {
		this.sssqbh = sssqbh;
	}
	public String getSssqmc() {
		return sssqmc;
	}
	public void setSssqmc(String sssqmc) {
		this.sssqmc = sssqmc;
	}
	public String getZjrq() {
		return zjrq;
	}
	public void setZjrq(String zjrq) {
		this.zjrq = zjrq;
	}
	public String getFzrxm() {
		return fzrxm;
	}
	public void setFzrxm(String fzrxm) {
		this.fzrxm = fzrxm;
	}
	public String getFzrlxdh() {
		return fzrlxdh;
	}
	public void setFzrlxdh(String fzrlxdh) {
		this.fzrlxdh = fzrlxdh;
	}
	public String getDyxbmc() {
		if(ValidateHelper.isNotEmptyString(dyxb)){
			dyxbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", dyxb);
		}
		return dyxbmc;
	}
	public void setDyxbmc(String dyxbmc) {
		this.dyxbmc = dyxbmc;
	}
	public String getWhcdmc() {
		if(ValidateHelper.isNotEmptyString(whcd)){
			whcdmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_WHCD", whcd);
		}
		return whcdmc;
	}
	public void setWhcdmc(String whcdmc) {
		this.whcdmc = whcdmc;
	}
	public String getPxqk() {
		return pxqk;
	}
	public void setPxqk(String pxqk) {
		this.pxqk = pxqk;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	
}
