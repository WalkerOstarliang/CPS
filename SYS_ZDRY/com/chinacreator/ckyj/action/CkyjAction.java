package com.chinacreator.ckyj.action;

import org.springframework.beans.BeanUtils;

import com.chinacreator.ckyj.bean.CkyjQsFkBean;
import com.chinacreator.ckyj.bean.YjfkBean;
import com.chinacreator.ckyj.bean.YjqsBean;
import com.chinacreator.ckyj.query.CkyjQueryBean;
import com.chinacreator.ckyj.services.CkyjService;
import com.chinacreator.ckyj.services.impl.CkyjServiceImpl;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class CkyjAction extends CPSBaseAction {

	private static final long serialVersionUID = 1L;
	
	private CkyjQsFkBean ckxx;
	private CkyjService service;
	private CkyjQueryBean query;
	private String yjxxbh;
	private LoginInfo loginInfo;
	
	/*用户机构代码*/
	private String userOrgCode;
	/*用户机构名称*/
	private String userOrgName;
	
	public CkyjAction(){
		ckxx = new CkyjQsFkBean();
		service = new CkyjServiceImpl();
		query = new CkyjQueryBean();
		loginInfo = ActionContextHelper.getLoginInfo();
	}
	
	//跳转到常控预警列表页面
	public String toCkyjListPage(){
		if(loginInfo.getLeve() == 2){
			userOrgCode = loginInfo.getCitygajgdm();
		}else if(loginInfo.getLeve() == 3){
			userOrgCode = loginInfo.getCountrygajgdm();
		}else if(loginInfo.getLeve() == 4){
			userOrgCode = loginInfo.getPcsdm();
		}else if(loginInfo.getLeve() == 5){
			userOrgCode = loginInfo.getJwsqdm();
		}
		userOrgName = DictionaryCacheHellper.getOrganizationOrgNameByCode(userOrgCode);
		return "toCkyjListPage";
	}
	
	//分页查询常控预警列表
	public void queryCkyjxxPageResultInfo(){
		responseWrite(service.queryCkyjPageResultInfo(query,getPageInfo()));
	}

	//跳转到预警信息详细页面
	public String toYjxxDetailPage(){
		ckxx = service.queryCkyjDetail(yjxxbh);
		return "toYjxxDetailPage";
	}
	
	//跳转到预警签收页面
	public String toYjqsPage(){
		ckxx = service.queryCkyjDetail(yjxxbh);
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			YjqsBean yjqs = new YjqsBean();
			
			yjqs.setQsdw(loginInfo.getOrgname());
			yjqs.setQsdwjgdm(loginInfo.getOrgcode());
			yjqs.setQsrxm(loginInfo.getRealname());
			yjqs.setQsrsfzh(loginInfo.getSfzh());
			yjqs.setQssj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			ckxx.setYjqs(yjqs);
		}
		
		return "toYjqsPage";
	}
	
	//预警签收
	public void yjqs(){
		responseWrite(service.qsYj(ckxx));
	}
	
	//跳转到签收列表页面
	public String toYjqsListPage(){
		if(loginInfo.getLeve() == 2){
			userOrgCode = loginInfo.getCitygajgdm();
		}else if(loginInfo.getLeve() == 3){
			userOrgCode = loginInfo.getCountrygajgdm();
		}else if(loginInfo.getLeve() == 4){
			userOrgCode = loginInfo.getPcsdm();
		}else if(loginInfo.getLeve() == 5){
			userOrgCode = loginInfo.getJwsqdm();
		}
		userOrgName = DictionaryCacheHellper.getOrganizationOrgNameByCode(userOrgCode);
		return "toYjqsListPage";
	}
	
	//分页查询已签收的预警
	public void queryYjqsResultPageInfo(){
		responseWrite(service.queryCkyjqsPageResultInfo(query, getPageInfo()));
	}
	
	//跳转到反馈信息页面
	public String toFkInfoPage(){
		String id = ckxx.getYjfk().getId();
		ckxx = service.queryCkyjDetail(yjxxbh);
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			YjfkBean bean = ckxx.getYjfk();
			if(bean == null){
				bean = new YjfkBean();
			}
			BeanUtils.copyProperties(ckxx.getCkyj(), bean);
			
			bean.setYjxxbh(yjxxbh);
			bean.setId("");
			bean.setLdxxbh("");
			
			bean.setFxmbzrmjxm(loginInfo.getRealname());
			bean.setFxmbzrdw(loginInfo.getOrgname());
			bean.setFxmbzrdwjgdm(loginInfo.getOrgcode());
			bean.setFxmbzrmjsfzh(loginInfo.getSfzh());
			
			bean.setCzzrmjxm(loginInfo.getRealname());
			bean.setCzzrdwjgdm(loginInfo.getOrgcode());
			bean.setCzzrmjsfzh(loginInfo.getSfzh());
			bean.setCzzrdw(loginInfo.getOrgname());
			
			bean.setFkrxm(loginInfo.getRealname());
			bean.setFkrsfzh(loginInfo.getSfzh());
			bean.setFkdw(loginInfo.getOrgname());
			bean.setFkdwjgdm(loginInfo.getOrgcode());
			bean.setFksj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
			ckxx.setYjfk(bean);
		}else{
			YjfkBean bean = service.queryYjfkById(id);
			ckxx.setYjfk(bean);
		}
		
		return "toFkInfoPage";
	}
	
	//跳转到预警签收反馈页面
	public String toYjqsfkPage(){
		ckxx = service.queryCkyjDetail(yjxxbh);
		return "toYjqsfkPage";
	}
	
	//保存反馈信息
	public void saveFkxx(){
		responseWrite(service.saveYjfk(ckxx));
	}
	
	public CkyjQsFkBean getCkxx() {
		
		return ckxx;
	}

	public void setCkxx(CkyjQsFkBean ckxx) {
		this.ckxx = ckxx;
	}

	public CkyjQueryBean getQuery() {
		return query;
	}

	public void setQuery(CkyjQueryBean query) {
		this.query = query;
	}

	public String getYjxxbh() {
		return yjxxbh;
	}

	public void setYjxxbh(String yjxxbh) {
		this.yjxxbh = yjxxbh;
	}

	public String getUserOrgCode() {
		return userOrgCode;
	}

	public void setUserOrgCode(String userOrgCode) {
		this.userOrgCode = userOrgCode;
	}

	public String getUserOrgName() {
		return userOrgName;
	}

	public void setUserOrgName(String userOrgName) {
		this.userOrgName = userOrgName;
	}
}
