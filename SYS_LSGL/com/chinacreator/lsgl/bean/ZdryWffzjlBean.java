package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class ZdryWffzjlBean extends BaseValue {
	
	/**
	 * 重点对象违法犯罪记录
	 */
	private static final long serialVersionUID = 5706734806961509104L;
	private String id; 
	private String rybh;   //人员编号
	private String sfzh;   // 身份证号
	private String fzsj;   //犯罪时间
	private String fzdd;	//犯罪地点
	private String wtxz;	//问题性质
	private String wtxzmc;
	private String cljg;	//处理结果
	private String whdw;    //维护单位
	private String whr;		//维护人
	private String ajle;	//案件类别
	private String ajlemc;
	private String xzdx;	//选择对象
	private String xzdxmc;
	private String xzwp;	//选择物品
	private String xzwpmc;

	private String zasd;	//作案手段
	private String zasdmc;
	private String zagj;	//作案工具
	private String zagjmc;
	private String xzfs;	//销账方式
	private String xzfsmc;
	private String zatd;	//作案特点
	private String zatdmc;   
	private String xzsj;	//选择时机
	private String xzsjmc;
	private String xzcs;	//选择处所
	private String xzcsmc;
	private String hddq;	//活动地区
	private String bz;		//备注
	private String czbs;	//操作标识
	private String czrxm;	//操作人姓名
	private String czdwdm;	//操作单位代码
	private String czdwmc;	//操作单位名称
	private String czsj;	//操作时间
	
	private String czrsfzh;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getFzsj() {
		return fzsj;
	}
	public void setFzsj(String fzsj) {
		this.fzsj = fzsj;
	}
	public String getFzdd() {
		return fzdd;
	}
	public void setFzdd(String fzdd) {
		this.fzdd = fzdd;
	}
	public String getWtxz() {
		return wtxz;
	}
	public void setWtxz(String wtxz) {
		this.wtxz = wtxz;
	}
	public String getCljg() {
		return cljg;
	}
	public void setCljg(String cljg) {
		this.cljg = cljg;
	}
	public String getWhdw() {
		return whdw;
	}
	public void setWhdw(String whdw) {
		this.whdw = whdw;
	}
	public String getWhr() {
		return whr;
	}
	public void setWhr(String whr) {
		this.whr = whr;
	}
	public String getAjle() {
		return ajle;
	}
	public void setAjle(String ajle) {
		this.ajle = ajle;
	}
	public String getXzdx() {
		return xzdx;
	}
	public void setXzdx(String xzdx) {
		this.xzdx = xzdx;
	}
	public String getXzwp() {
		return xzwp;
	}
	public void setXzwp(String xzwp) {
		this.xzwp = xzwp;
	}
	public String getZasd() {
		return zasd;
	}
	public void setZasd(String zasd) {
		this.zasd = zasd;
	}
	public String getZagj() {
		return zagj;
	}
	public void setZagj(String zagj) {
		this.zagj = zagj;
	}
	public String getXzfs() {
		return xzfs;
	}
	public void setXzfs(String xzfs) {
		this.xzfs = xzfs;
	}
	public String getZatd() {
		return zatd;
	}
	public void setZatd(String zatd) {
		this.zatd = zatd;
	}
	public String getXzsj() {
		return xzsj;
	}
	public void setXzsj(String xzsj) {
		this.xzsj = xzsj;
	}
	public String getXzcs() {
		return xzcs;
	}
	public void setXzcs(String xzcs) {
		this.xzcs = xzcs;
	}
	public String getHddq() {
		return hddq;
	}
	public void setHddq(String hddq) {
		this.hddq = hddq;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
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
	public String getXzwpmc() {
		String str="";
		if(ValidateHelper.isNotEmptyString(xzwp)){
			String []arr=new String[10];
			arr=xzwp.split(",");
			for (int i = 0; i < arr.length; i++) {
				str += DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZATZ_XZWP", arr[i])+",";		
			}
		}else{
			return null;
		}
		xzwpmc=str.substring(0,str.length()-1);
		return xzwpmc;
	}
	public void setXzwpmc(String xzwpmc) {
		this.xzwpmc = xzwpmc;
	}
	public String getZasdmc() {
		String str="";
		if(ValidateHelper.isNotEmptyString(zasd)){
			String []arr=new String[10];
			arr=zasd.split(",");
			for (int i = 0; i < arr.length; i++) {
				str += DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GA_ZASD", arr[i])+",";		
			}
		}else{
			return null;
		}
		zasdmc=str.substring(0,str.length()-1);
		return zasdmc;
	}
	public void setZasdmc(String zasdmc) {
		this.zasdmc = zasdmc;
	}
	public String getZagjmc() {
		String str="";
		if(ValidateHelper.isNotEmptyString(zagj)){
			String []arr=new String[10];
			arr=zagj.split(",");
			for (int i = 0; i < arr.length; i++) {
				str += DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZAGJ", arr[i])+",";		
			}
		}else{
			return null;
		}
		zagjmc=str.substring(0,str.length()-1);
		return zagjmc;
	}
	public void setZagjmc(String zagjmc) {
		this.zagjmc = zagjmc;
	}
	public String getXzfsmc() {
		String str="";
		if(ValidateHelper.isNotEmptyString(xzfs)){
			String []arr=new String[10];
			arr=xzfs.split(",");
			for (int i = 0; i < arr.length; i++) {
				str += DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GA_XZFS", arr[i])+",";		
			}
		}else{
			return null;
		}
		xzfsmc=str.substring(0,str.length()-1);
		return xzfsmc;
	}
	public void setXzfsmc(String xzfsmc) {
		this.xzfsmc = xzfsmc;
	}
	public String getZatdmc() {
		String str="";
		if(ValidateHelper.isNotEmptyString(zatd)){
			String []arr=new String[10];
			arr=zatd.split(",");
			for (int i = 0; i < arr.length; i++) {
				str += DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GA_ZATD", arr[i])+",";		
			}
		}else{
			return null;
		}
		zatdmc=str.substring(0,str.length()-1);
		return zatdmc;
	}
	public void setZatdmc(String zatdmc) {
		this.zatdmc = zatdmc;
	}
	public String getXzsjmc() {
		String str="";
		if(ValidateHelper.isNotEmptyString(xzsj)){
			String []arr=new String[10];
			arr=xzsj.split(",");
			for (int i = 0; i < arr.length; i++) {
				str += DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_XZSJ", arr[i])+",";		
			}
		}else{
			return null;
		}
		xzsjmc=str.substring(0,str.length()-1);
		return xzsjmc;
	}
	public void setXzsjmc(String xzsjmc) {
		this.xzsjmc = xzsjmc;
	}
	public String getXzcsmc() {
		String str="";
		if(ValidateHelper.isNotEmptyString(xzcs)){
			String []arr=new String[10];
			arr=xzcs.split(",");
			for (int i = 0; i < arr.length; i++) {
				str += DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GA_XZCS", arr[i])+",";		
			}
		}else{
			return null;
		}
		xzcsmc=str.substring(0,str.length()-1);
		return xzcsmc;	
	}
	public void setXzcsmc(String xzcsmc) {
		this.xzcsmc = xzcsmc;
	}
	public String getWtxzmc() {
		wtxzmc=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_WTXZ", wtxz);
		return wtxzmc;
	}
	public void setWtxzmc(String wtxzmc) {
		this.wtxzmc = wtxzmc;
	}
	public String getAjlemc() {
		ajlemc=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_AJLB", ajle);
		return ajlemc;
	}
	public void setAjlemc(String ajlemc) {
		this.ajlemc = ajlemc;
	}
	public String getXzdxmc() {
		String str="";
		if(ValidateHelper.isNotEmptyString(xzdx)){
			String []arr=new String[10];
			arr=xzdx.split(",");
			for (int i = 0; i < arr.length; i++) {
				str += DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GA_XZDX", arr[i])+",";		
			}
		}else{
			return null;
		}
		xzdxmc=str.substring(0,str.length()-1);
		return xzdxmc;
	}
	public void setXzdxmc(String xzdxmc) {
		this.xzdxmc = xzdxmc;
	}
	public String getCzrsfzh() {
		return czrsfzh;
	}
	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
	}
}
