package com.chinacreator.dwdj.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.DwjbxxBean;

/**
 * 单位信息（用于单位派发 签收 退回）
 */
public class DwBaseBean extends DwjbxxBean {

	private static final long serialVersionUID = -4779329091765532849L;

	/**
	 * 业务系统主键
	 */
	private String ywzjid;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 法人身份证
	 */
	private String frdbsfzh;
	
	/**
	 * 法人姓名
	 */
	private String frdbxm;
	
	/**
	 * 法人电话
	 */
	private String frdblxdh;
	
	/**
	 * 单位电话
	 */
	private String dwdh;
	
	/**
	 * 单位地址
	 */
	private String dwdz;
	
	/**
	 * 行业类别
	 */
	private String hylb;
	
	/**
	 * 行业类别名称
	 */
	private String hylbmc;
	
	/**
	 * 单位分类
	 */
	private String dwlb;
	
	/**
	 * 组织结构代码
	 */
	private String zzjgdm;
	
	/**
	 * 营业执照号
	 */
	private String yyzzhm;
	
	/**
	 * 开业日期
	 */
	private String kyrq;
	
	/**
	 * 所属责任单位
	 */
	private String sszrdwdm;
	
	/**
	 * 所属责任单位名称
	 */
	private String sszrdwmc;
	
	/**
	 * 所属责任单位代码
	 */
	private String sssqdm;
	
	/**
	 * 注销标识
	 */
	private String zxbs;
	
	/**
	 * 注销时间
	 */
	private String zxsj;
	
	/**
	 * 登记时间
	 */
	private String djsj;
	
	/**
	 * 修改时间
	 */
	private String xgsj;
	
	/**
	 * 入库时间
	 */
	private String jlrksj;
	
	/**
	 * 变更时间
	 */
	private String jlbgsj;
	
	/**
	 * 签收标识
	 */
	private String qsbs;
	
	/**
	 * 单位派发状态
	 */
	private String pfzt;
	
	/**
	 * 签收状态
	 */
	private String qszt;
	
	/**
	 * 管理部门
	 */
	private String glbm;
	
	/**
	 * 管理状态
	 */
	private String glzt;
	
	/**
	 * 原业务系统单位类型
	 */
	private String ywxtdwlx;
	
	/**
	 * 派发单位代码
	 */
	private String pfdwdm;
	
	/**
	 * 操作
	 */
	private String cz;
	
	/**
	 * 责任单位级别
	 */
	private int zrdwdmLeve = -1;
	
	/**
	 * 派发后单位级别
	 */
	private int pfhdwdmLeve = -1;
	
	/**
	 * 派发后单位代码
	 */
	private String pfhdwdm;
	
	public String getYwzjid() {
		return ywzjid;
	}

	public void setYwzjid(String ywzjid) {
		this.ywzjid = ywzjid;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getFrdbsfzh() {
		return frdbsfzh;
	}

	public void setFrdbsfzh(String frdbsfzh) {
		this.frdbsfzh = frdbsfzh;
	}

	public String getFrdbxm() {
		return frdbxm;
	}

	public void setFrdbxm(String frdbxm) {
		this.frdbxm = frdbxm;
	}

	public String getFrdblxdh() {
		return frdblxdh;
	}

	public void setFrdblxdh(String frdblxdh) {
		this.frdblxdh = frdblxdh;
	}

	public String getDwdh() {
		return dwdh;
	}

	public void setDwdh(String dwdh) {
		this.dwdh = dwdh;
	}

	public String getDwdz() {
		return dwdz;
	}

	public void setDwdz(String dwdz) {
		this.dwdz = dwdz;
	}

	public String getHylb() {
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}

	public String getHylbmc() {
		if(ValidateHelper.isNotEmptyString(hylb)){
			hylbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_HYLB", hylb); 
		}
		return hylbmc;
	}

	public void setHylbmc(String hylbmc) {
		this.hylbmc = hylbmc;
	}

	public String getDwlb() {
		return dwlb;
	}

	public void setDwlb(String dwlb) {
		this.dwlb = dwlb;
	}

	public String getZzjgdm() {
		return zzjgdm;
	}

	public void setZzjgdm(String zzjgdm) {
		this.zzjgdm = zzjgdm;
	}

	public String getYyzzhm() {
		return yyzzhm;
	}

	public void setYyzzhm(String yyzzhm) {
		this.yyzzhm = yyzzhm;
	}

	public String getKyrq() {
		return kyrq;
	}

	public void setKyrq(String kyrq) {
		this.kyrq = kyrq;
	}

	public String getSszrdwdm() {
		return sszrdwdm;
	}

	public void setSszrdwdm(String sszrdwdm) {
		this.sszrdwdm = sszrdwdm;
	}

	public String getSssqdm() {
		return sssqdm;
	}

	public void setSssqdm(String sssqdm) {
		this.sssqdm = sssqdm;
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

	public String getJlrksj() {
		return jlrksj;
	}

	public void setJlrksj(String jlrksj) {
		this.jlrksj = jlrksj;
	}

	public String getJlbgsj() {
		return jlbgsj;
	}

	public void setJlbgsj(String jlbgsj) {
		this.jlbgsj = jlbgsj;
	}

	public String getQsbs() {
		return qsbs;
	}

	public void setQsbs(String qsbs) {
		this.qsbs = qsbs;
	}

	public String getGlbm() {
		return glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public String getGlzt() {
		return glzt;
	}

	public void setGlzt(String glzt) {
		this.glzt = glzt;
	}

	public String getYwxtdwlx() {
		return ywxtdwlx;
	}

	public void setYwxtdwlx(String ywxtdwlx) {
		this.ywxtdwlx = ywxtdwlx;
	}

	public String getCz() {
		LoginInfo login = ActionContextHelper.getLoginInfo();
		int userLeve = login.getLeve();
		String userCode = "";
		if(userLeve == 1){
			userCode = login.getOrgcode().substring(0,2) + "0000000000";
		}else if(userLeve == 2){
			userCode = login.getOrgcode().substring(0,4) + "00000000";
		}else if(userLeve == 3){
			userCode = login.getOrgcode().substring(0,6) + "000000";
		}else if(userLeve == 4){
			userCode = login.getOrgcode().substring(0,8) + "0000";
		}else{
			userCode = login.getOrgcode();
		}
		
		//责任单位级别
		if(ValidateHelper.isNotEmptyString(sszrdwdm) && zrdwdmLeve == -1){
			zrdwdmLeve = CommonDBBaseHelper.getOrgLeve(sszrdwdm);
		}
		
		if(ValidateHelper.isNotEmptyString(pfhdwdm) && pfhdwdmLeve == -1){
			pfhdwdmLeve = CommonDBBaseHelper.getOrgLeve(pfhdwdm);
		}
		
		cz = "<span class=\"cps_span_href\" onclick=\"openDwOpWin('" + ywzjid + "','" + ywxtdwlx + "')\" style=\"color:green\">详情</span>&nbsp;";
		
		//警务区用户不能派发
		if(userLeve < 5 ){
			if((!CommonConstant.DW_OP_CZZT_QS.equals(qsbs))  //未签收
					&& (userCode.equals(pfhdwdm) ||          //派发后的单位代码和用户单位代码相同
							(ValidateHelper.isEmptyString(pfhdwdm) && sszrdwdm.equals(userCode))) //未派发过且责任单位代码和用户单位代码相同
					&& !(userLeve == 3 && CommonConstant.DW_OP_CZZT_TH.equals(qsbs) && pfhdwdm.equals(userCode) && "04".equals(hylb))  //大队对退回的单位不能再派发
					){  
				cz += "<span class=\"cps_span_href\" onclick=\"openDwOpWin('" + ywzjid + "','" + ywxtdwlx + "','1')\" style=\"color:green\">派发</span>&nbsp;";
			}
			
			//大队可锁定已派发且没有签收的单位, 已锁定不能再次锁定
			if(userLeve <= 3    //大队及以上单位
					&& !CommonConstant.DW_OP_CZZT_QS.equals(qsbs)   //未签收
					&& !(CommonConstant.DW_OP_GLZT_SD.equals(glzt))  //未锁定
					&& (pfhdwdmLeve > userLeve || zrdwdmLeve > userLeve)
					&& !(CommonConstant.DW_OP_CZZT_TH.equals(qsbs) && login.getOrgcode().equals(pfhdwdm))){
				cz += "<span class=\"cps_span_href\" onclick=\"dwsdGl('1','" + ywzjid + "','" + ywxtdwlx + "')\" style=\"color:green\">锁定</span>&nbsp;";
			}
			
			//大队可对锁定的单位撤销锁定 (未签收的单位)
			if(userLeve <= 3 && CommonConstant.DW_OP_GLZT_SD.equals(glzt) && !CommonConstant.DW_OP_CZZT_QS.equals(qsbs)){
				cz += "<span class=\"cps_span_href\" onclick=\"dwsdGl('0','" + ywzjid + "','" + ywxtdwlx + "')\" style=\"color:green\">撤销</span>&nbsp;";
			}
		}else{
			//已签收不能再次签收
			if(!CommonConstant.DW_OP_CZZT_QS.equals(qsbs)){
				cz += "<span class=\"cps_span_href\" onclick=\"openDwOpWin('" + ywzjid + "','" + ywxtdwlx + "','2')\" style=\"color:green\">签收</span>&nbsp;";
			}
		}
		
		//已签收不能退回，大队不能退回，责任单位级别比用户级别大的（已派发）不能退回， 锁定不能退回
		if((!CommonConstant.DW_OP_CZZT_QS.equals(qsbs)) //已签收
				&& (userLeve > 3)   //大队以下单位
				&& (pfhdwdmLeve <= userLeve) //未派发
				&& !CommonConstant.DW_OP_GLZT_SD.equals(glzt)){ //未锁定
			cz += "<span class=\"cps_span_href\" onclick=\"openDwOpWin('" + ywzjid + "','" + ywxtdwlx + "','3')\" style=\"color:green\">退回</span>&nbsp;";
		}
		
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getPfzt() {
		LoginInfo login = ActionContextHelper.getLoginInfo();
		if(ValidateHelper.isNotEmptyString(pfhdwdm) && pfhdwdmLeve == -1){
			pfhdwdmLeve = CommonDBBaseHelper.getOrgLeve(pfhdwdm);
		}
		if(ValidateHelper.isNotEmptyString(sszrdwdm) && zrdwdmLeve == -1){
			zrdwdmLeve = CommonDBBaseHelper.getOrgLeve(sszrdwdm);
		}
		//派发后单位代码相同 并且签收标识为已退回
		if(CommonConstant.DW_OP_CZZT_TH.equals(qsbs) && login.getOrgcode().equals(pfhdwdm)){
			pfzt ="<span class=\"cps_span_href\" onclick=\"openDwOpWin('" + ywzjid + "','" + ywxtdwlx + "','3','" + CommonConstant.OPERTYPE_DETAIL + "')\" style=\"color:color\">已退回</span>&nbsp;";
		}else{
			//派发后单位级别比用户级别大为已派发
			if(pfhdwdmLeve > login.getLeve() || zrdwdmLeve > login.getLeve()){
				pfzt = "<span class=\"cps_span_href\" onclick=\"openDwOpWin('" + ywzjid + "','" + ywxtdwlx + "','1','" + CommonConstant.OPERTYPE_DETAIL + "')\" style=\"color:color\">已派发</span>&nbsp;";
			}else{
				pfzt = "未派发";
			}
		}
		return pfzt;
	}

	public String getQszt() {
		if(CommonConstant.DW_OP_CZZT_QS.equals(qsbs)){
			qszt = "<span class=\"cps_span_href\" onclick=\"openDwOpWin('" + ywzjid + "','" + ywxtdwlx + "','2','" + CommonConstant.OPERTYPE_DETAIL + "')\" style=\"color:color\">已签收</span>&nbsp;";
		}else{
			qszt = "未签收";
		}
		return qszt;
	}

	public void setQszt(String qszt) {
		this.qszt = qszt;
	}

	public void setPfzt(String pfzt) {
		this.pfzt = pfzt;
	}

	public String getSszrdwmc() {
		if(ValidateHelper.isNotEmptyString(sszrdwdm)){
			sszrdwmc = DictionaryCacheHellper.getOrganizationOrgNameByCode(sszrdwdm);
		}
		return sszrdwmc;
	}

	public void setSszrdwmc(String sszrdwmc) {
		this.sszrdwmc = sszrdwmc;
	}

	public String getPfdwdm() {
		return pfdwdm;
	}

	public void setPfdwdm(String pfdwdm) {
		this.pfdwdm = pfdwdm;
	}

	public String getPfhdwdm() {
		return pfhdwdm;
	}

	public void setPfhdwdm(String pfhdwdm) {
		this.pfhdwdm = pfhdwdm;
	}
}
