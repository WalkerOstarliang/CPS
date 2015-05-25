package com.chinacreator.afgl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 小区技防物防信息
 *
 */
public class XqjfwfssxxBean {
	
	private String cz;
	private String czbs;
	private String ssbh;				//设施编号
	private String ssmc;				//设施名称
	private String xqbh;				//小区编号
	private String xqmc;				//小区名称
	private String sqbh;				//社区编号
	private String sqmc;				//社区名称
	private String azwz;				//安装位置
	private String sslx;				//设施类型
	private String sslxmc;				//设施类型
	private String wzlx;				//位置类型
	private String wzlxmc;				//位置类型
	private String azsj;				//安装时间
	private String ccsj;				//拆除时间
	private String iscc;				//拆除标识
	private String isccmc;				//拆除标识
	private String ccyy;				//拆除原因
	private String sssl;				//设施数量
	private String sbyxqk;				//设备运行情况
	private String sbyxqkmc;
	private String isfhzy;				//是否发挥作用
	private String isfhzymc;			//是否发挥作用
	private String djrxm;
	private String djrjh;
	private String djsj;
	private String djdwdm;
	private String djdwmc;				
	private String bjsslj;				//报警设施连接
	private String bjssljmc;
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
	public String getSsbh() {
		return ssbh;
	}
	public void setSsbh(String ssbh) {
		this.ssbh = ssbh;
	}
	public String getXqbh() {
		return xqbh;
	}
	public void setXqbh(String xqbh) {
		this.xqbh = xqbh;
	}
	public String getXqmc() {
		return xqmc;
	}
	public void setXqmc(String xqmc) {
		this.xqmc = xqmc;
	}
	public String getSqbh() {
		return sqbh;
	}
	public void setSqbh(String sqbh) {
		this.sqbh = sqbh;
	}
	public String getSqmc() {
		return sqmc;
	}
	public void setSqmc(String sqmc) {
		this.sqmc = sqmc;
	}
	public String getAzwz() {
		return azwz;
	}
	public void setAzwz(String azwz) {
		this.azwz = azwz;
	}
	public String getSslx() {
		return sslx;
	}
	public void setSslx(String sslx) {
		this.sslx = sslx;
	}
	public String getWzlx() {
		return wzlx;
	}
	public void setWzlx(String wzlx) {
		this.wzlx = wzlx;
	}
	public String getAzsj() {
		return azsj;
	}
	public void setAzsj(String azsj) {
		this.azsj = azsj;
	}
	public String getCcsj() {
		return ccsj;
	}
	public void setCcsj(String ccsj) {
		this.ccsj = ccsj;
	}
	public String getSssl() {
		return sssl;
	}
	public void setSssl(String sssl) {
		this.sssl = sssl;
	}
	public String getSbyxqk() {
		return sbyxqk;
	}
	public void setSbyxqk(String sbyxqk) {
		this.sbyxqk = sbyxqk;
	}
	public String getIsfhzy() {
		return isfhzy;
	}
	public void setIsfhzy(String isfhzy) {
		this.isfhzy = isfhzy;
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
	public String getBjsslj() {
		return bjsslj;
	}
	public void setBjsslj(String bjsslj) {
		this.bjsslj = bjsslj;
	}
	public String getSslxmc() {
		if(ValidateHelper.isNotEmptyString(sslx)){
			sslxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_SSLX", sslx);
		}
		return sslxmc;
	}
	public void setSslxmc(String sslxmc) {
		this.sslxmc = sslxmc;
	}
	public String getWzlxmc() {
		if(ValidateHelper.isNotEmptyString(wzlx)){
			wzlxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_WZLX", wzlx);
		}
		return wzlxmc;
	}
	public void setWzlxmc(String wzlxmc) {
		this.wzlxmc = wzlxmc;
	}
	public String getBjssljmc() {
		if(ValidateHelper.isNotEmptyString(bjsslj)){
			bjssljmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_BJSSLJ", bjsslj);
		}
		return bjssljmc;
	}
	public void setBjssljmc(String bjssljmc) {
		this.bjssljmc = bjssljmc;
	}
	public String getIscc() {
		return iscc;
	}
	public void setIscc(String iscc) {
		this.iscc = iscc;
	}
	public String getCcyy() {
		return ccyy;
	}
	public void setCcyy(String ccyy) {
		this.ccyy = ccyy;
	}
	public String getIsccmc() {
		if("1".equals(iscc)){
			isccmc = "已拆除";
		}else if("0".equals(iscc)){
			isccmc = "使用中";
		}
		return isccmc;
	}
	public void setIsccmc(String isccmc) {
		this.isccmc = isccmc;
	}
	public String getSsmc() {
		return ssmc;
	}
	public void setSsmc(String ssmc) {
		this.ssmc = ssmc;
	}
	public String getIsfhzymc() {
		if(ValidateHelper.isNotEmptyString(isfhzy)){
			isfhzymc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("AF_ISFHZY", isfhzy);
		}
		return isfhzymc;
	}
	public void setIsfhzymc(String isfhzymc) {
		this.isfhzymc = isfhzymc;
	}
	public String getSbyxqkmc()
	{
		sbyxqkmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_SBYXQK", sbyxqk);
		return sbyxqkmc;
	}
	public void setSbyxqkmc(String sbyxqkmc)
	{
		this.sbyxqkmc = sbyxqkmc;
	}
	
	
}
