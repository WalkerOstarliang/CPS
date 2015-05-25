package com.chinacreator.afgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class AflmpcBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8558899054927587997L;
	private String jlbh;	//记录编号
	private String pcsj;	//盘查时间
	private String pcdd;	//盘查地点
	private String pcdxxm;	//盘查对象姓名
	private String pcdxsfzh;	//盘查对象身份证号
	private String lxfs;	//联系方式
	private String kywplx;	//可疑物品类型
	private String kywpmc;	//可疑物品名称
	private String xgrxm;	//修改人姓名
	private String xgrdwdm;	//修改人单位代码
	private String xgrdwmc;	//修改人单位名称
	private String djrxm;	//登记人姓名
	private String djrdwdm;	//登记人单位代码
	private String djrdwmc;	//登记人单位名称
	private String cllx;	//车辆类型
	private String cph;	//车牌号
	private String fdjh;	//发动机号
	private String cjh;	//车架号 
	private String pcyy;	//盘查原因   ZDY_LMPCYY
	private String pcyyms;
	private String ljd;	//落脚点
	private String bz;	//备注
	private String djsj; //登记时间
	private String xgsj; //修改时间
	private String cz;
	private String djrjh ; // 登记人警号
	//新增部分
	private String zxrjh; //注销人警号
	private String zxrxm ;//注销人姓名
	private String yxx ; // 有效性
	private String yxxms ;// 有效性描述
	private String zxsj ;//注销时间
	
	
	private String cljg;  //路面盘查处理结果  LMPC_CLJG
	private String cljgms;
	public String getJlbh() {
		return jlbh;
	}
	public void setJlbh(String jlbh) {
		this.jlbh = jlbh;
	}
	public String getPcsj() {
		return pcsj;
	}
	public void setPcsj(String pcsj) {
		this.pcsj = pcsj;
	}
	public String getPcdd() {
		return pcdd;
	}
	public void setPcdd(String pcdd) {
		this.pcdd = pcdd;
	}
	public String getPcdxxm() {
		return pcdxxm;
	}
	public void setPcdxxm(String pcdxxm) {
		this.pcdxxm = pcdxxm;
	}
	public String getPcdxsfzh() {
		return pcdxsfzh;
	}
	public void setPcdxsfzh(String pcdxsfzh) {
		this.pcdxsfzh = pcdxsfzh;
	}
	public String getLxfs() {
		return lxfs;
	}
	public void setLxfs(String lxfs) {
		this.lxfs = lxfs;
	}
	public String getKywplx() {
		return kywplx;
	}
	public void setKywplx(String kywplx) {
		this.kywplx = kywplx;
	}
	public String getKywpmc() {
		return kywpmc;
	}
	public void setKywpmc(String kywpmc) {
		this.kywpmc = kywpmc;
	}
	public String getXgrxm() {
		return xgrxm;
	}
	public void setXgrxm(String xgrxm) {
		this.xgrxm = xgrxm;
	}
	public String getXgrdwdm() {
		return xgrdwdm;
	}
	public void setXgrdwdm(String xgrdwdm) {
		this.xgrdwdm = xgrdwdm;
	}
	public String getXgrdwmc() {
		return xgrdwmc;
	}
	public void setXgrdwmc(String xgrdwmc) {
		this.xgrdwmc = xgrdwmc;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
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
	public String getCllx() {
		return cllx;
	}
	public void setCllx(String cllx) {
		this.cllx = cllx;
	}
	public String getCph() {
		return cph;
	}
	public void setCph(String cph) {
		this.cph = cph;
	}
	public String getFdjh() {
		return fdjh;
	}
	public void setFdjh(String fdjh) {
		this.fdjh = fdjh;
	}
	public String getCjh() {
		return cjh;
	}
	public void setCjh(String cjh) {
		this.cjh = cjh;
	}
	public String getPcyy() {
		return pcyy;
	}
	public void setPcyy(String pcyy) {
		this.pcyy = pcyy;
	}
	public String getLjd() {
		return ljd;
	}
	public void setLjd(String ljd) {
		this.ljd = ljd;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getXgsj() {
		return xgsj;
	}
	public void setXgsj(String xgsj) {
		this.xgsj = xgsj;
	}
	public String getCz() {
		if(cz==null || cz.trim().equals("")){
			StringBuffer sb = new StringBuffer();
				//sb.append("<span onclick=\"openAddLmpcxx('update','" + jlbh +"')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
				sb.append("<span onclick=\"openAddLmpcxx('detail','" + jlbh +"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
			cz=sb.toString();
		}
		return cz;
	}
	
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getCljg() {
		return cljg;
	}
	public void setCljg(String cljg) {
		this.cljg = cljg;
	}
	public String getPcyyms() {
		pcyyms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_LMPCYY", pcyy);
		return pcyyms;
	}
	public void setPcyyms(String pcyyms) {
		this.pcyyms = pcyyms;
	}
	public String getCljgms() {
		cljgms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("LMPC_CLJG", cljg);
		return cljgms;
	}
	public void setCljgms(String cljgms) {
		this.cljgms = cljgms;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}
	public String getZxrjh() {
		return zxrjh;
	}
	public void setZxrjh(String zxrjh) {
		this.zxrjh = zxrjh;
	}
	public String getZxrxm() {
		return zxrxm;
	}
	public void setZxrxm(String zxrxm) {
		this.zxrxm = zxrxm;
	}
	public String getYxx() {
		return yxx;
	}
	public void setYxx(String yxx) {
		this.yxx = yxx;
	}
	public String getZxsj() {
		return zxsj;
	}
	public void setZxsj(String zxsj) {
		this.zxsj = zxsj;
	}
	public String getYxxms() {
		if("0".equals(this.yxx)){
			yxxms = "正常";
		};
		if("1".equals(this.yxx)){
			yxxms = "注销";
		}
		return yxxms;
	}
	public void setYxxms(String yxxms) {
		this.yxxms = yxxms;
	}
	
	


}
