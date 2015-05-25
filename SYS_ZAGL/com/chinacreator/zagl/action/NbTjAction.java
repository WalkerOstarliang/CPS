package com.chinacreator.zagl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.nbtj.AjxxBean;
import com.chinacreator.zagl.bean.nbtj.NbdwFaTj;
import com.chinacreator.zagl.bean.nbtj.NbtjQuery;
import com.chinacreator.zagl.bean.nbtj.WyxqFaTj;
import com.chinacreator.zagl.bean.nbtj.Wyxqtb;
import com.chinacreator.zagl.bean.nbtj.ZddwFa;
import com.chinacreator.zagl.services.NbTjService;
import com.chinacreator.zagl.services.impl.NbTjServiceImpl;

public class NbTjAction extends CPSBaseAction {

	private static final long serialVersionUID = 524525652601813958L;
	
	private NbtjQuery query;

	/**
	 * 物业小区通报
	 */
	private List<Wyxqtb> wyxqTb;
	
	/**
	 * 物业小区发案统计
	 */
	private List<WyxqFaTj> wyxqfatj;
	
	/**
	 * 内保单位发案统计
	 */
	private List<NbdwFaTj> nbdwfatj;
	
	/**
	 * 重点单位发案统计
	 */
	private List<ZddwFa> zddwfatj;
	
	/**
	 * 案件
	 */
	private List<AjxxBean> ajxxList;
	
	private NbTjService service;
	
	public NbTjAction(){
		super();
		query = new NbtjQuery();
		wyxqTb = new ArrayList<Wyxqtb>();
		wyxqfatj = new ArrayList<WyxqFaTj>();
		nbdwfatj = new ArrayList<NbdwFaTj>();
		zddwfatj = new ArrayList<ZddwFa>();
		ajxxList = new ArrayList<AjxxBean>();
		
		service = new NbTjServiceImpl();
		
	}
	
	
	/**
	 * 跳转到物业小区通报
	 * @return
	 */
	public String toWyxqTbPage(){
		if(ValidateHelper.isEmptyString(query.getTjsj_start()) && ValidateHelper.isEmptyString(query.getTjsj_end())){
			initQuery();
		}
		wyxqTb = service.queryWyxqTb(query);
		return "toWyxqTbPage";
	}

	/**
	 * 导出物业小区通报
	 * @return
	 */
	public String expWyxqTb(){
		toWyxqTbPage();
		return "expWyxqTb";
	}
	
	
	/**
	 * 物业小区发案统计
	 * @return
	 */
	public String toWyxqFaTjPage(){
		initQuery();
		return  "toWyxqFaTjPage";
	}
	
	/**
	 * 导出物业小区发案统计
	 * @return
	 */
	public String expWyxqFaTj(){
		toWyxqFaPage();
		return "expWyxqFaTj";
	}
	
	public String toWyxqFaPage(){
		if(ValidateHelper.isNotEmptyString(query.getOrgcode())){
			query.setOrgLeve(CommonDBBaseHelper.getOrgLeve(query.getOrgcode()) + "");
			wyxqfatj = service.queryWyxqFa(query);
		}
		return "toWyxqFaPage";
	} 
	
	/**
	 * 内保单位发案统计
	 * @return
	 */
	public String toNbdwFaTjPage(){
		initQuery();
		return "toNbdwFaTjPage";
	}
	
	/**
	 * 导出内保单位发案
	 * @return
	 */
	public String expNbdwfaTj(){
		if(ValidateHelper.isNotEmptyString(query.getOrgcode())){
			query.setOrgLeve(CommonDBBaseHelper.getOrgLeve(query.getOrgcode()) + "");
			nbdwfatj = service.queryNbdwFa(query);
		}
		return "expNbdwfaTj";
	}
	
	public String toNbdwFaPage(){
		if(ValidateHelper.isNotEmptyString(query.getOrgcode())){
			query.setOrgLeve(CommonDBBaseHelper.getOrgLeve(query.getOrgcode()) + "");
			nbdwfatj = service.queryNbdwFa(query);
		}
		return "toNbdwFaPage";
	}
	
	/**
	 * 重点单位发案统计
	 * @return
	 */
	public String toZddwfaTjPage(){
		initQuery();
		return "toZddwfaTjPage";
	}
	
	public String toZddwfaPage(){
		/*if(ValidateHelper.isEmptyString(query.getTjsj_start()) && ValidateHelper.isEmptyString(query.getTjsj_end())){
			initQuery();
		}*/
		zddwfatj = service.queryZddwFa(query);
		return "toZddwfaPage";
	}
	
	/**
	 * 导出重点单位发案
	 * @return
	 */
	public String expZddwFa(){
		toZddwfaPage();
		return "expZddwFa";
	}
	
	/**
	 * 案件信息页面
	 * @return
	 */
	public String toAjxxPage(){
		ajxxList = service.queryAjxxList(query);
		return "toAjxxPage";
	}
	
	/**
	 * 导出案件信息
	 * @return
	 */
	public String expAjxx(){
		toAjxxPage();
		return "expAjxx";
	}
	
	/**
	 * 查询案件
	 */
	public void querAjxxList(){
		responseWrite(service.queryAjxx(query, getPageInfo()));
	}
	
	/**
	 * 导出案件信息
	 * @return
	 */
	public String toExpAjxxPage(){
		ajxxList = service.queryAjxxList(query);
		return "toExpAjxxPage";
	}
	
	private void initQuery(){
		String now = DateTimeHelper.getNowDateStr("yyyy-MM-dd");
		query.setTjsj_end(now);
		query.setTjsj_start( now.substring(0,8) + "01" );
		query.setTjrq(DateTimeHelper.getNowDateStr("yyyy-MM"));
		
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String orgcode = "";
		if(loginInfo.getLeve() == 1){
			orgcode = loginInfo.getOrgcode().substring(0,2) + "0000000000";
			query.setOrgcode(orgcode);
			query.setOrgname(DictionaryCacheHellper.getOrganizationOrgNameByCode(orgcode));
		}else if(loginInfo.getLeve() == 2){
			orgcode = loginInfo.getOrgcode().substring(0,4) + "00000000";
			query.setOrgcode(orgcode);
			query.setOrgname(DictionaryCacheHellper.getOrganizationOrgNameByCode(orgcode));	
		}else if(loginInfo.getLeve() == 3){
			orgcode = loginInfo.getOrgcode().substring(0,6) + "000000";
			query.setOrgcode(orgcode);
			query.setOrgname(DictionaryCacheHellper.getOrganizationOrgNameByCode(orgcode));	
		}else if(loginInfo.getLeve() == 4){
			orgcode = loginInfo.getOrgcode().substring(0,8) + "0000";
			query.setOrgcode(orgcode);
			query.setOrgname(DictionaryCacheHellper.getOrganizationOrgNameByCode(orgcode));	
		}else if(loginInfo.getLeve() == 5){
			orgcode = loginInfo.getOrgcode();
			query.setOrgcode(orgcode);
			query.setOrgname(DictionaryCacheHellper.getOrganizationOrgNameByCode(orgcode));	
		}
	}
/* ==========================Get And Set================================== */
	public List<Wyxqtb> getWyxqTb() {
		return wyxqTb;
	}


	public void setWyxqTb(List<Wyxqtb> wyxqTb) {
		this.wyxqTb = wyxqTb;
	}


	public NbtjQuery getQuery() {
		return query;
	}


	public void setQuery(NbtjQuery query) {
		this.query = query;
	}


	public List<WyxqFaTj> getWyxqfatj() {
		return wyxqfatj;
	}


	public void setWyxqfatj(List<WyxqFaTj> wyxqfatj) {
		this.wyxqfatj = wyxqfatj;
	}


	public List<NbdwFaTj> getNbdwfatj() {
		return nbdwfatj;
	}


	public void setNbdwfatj(List<NbdwFaTj> nbdwfatj) {
		this.nbdwfatj = nbdwfatj;
	}


	public List<ZddwFa> getZddwfatj() {
		return zddwfatj;
	}


	public void setZddwfatj(List<ZddwFa> zddwfatj) {
		this.zddwfatj = zddwfatj;
	}


	public List<AjxxBean> getAjxxList() {
		return ajxxList;
	}


	public void setAjxxList(List<AjxxBean> ajxxList) {
		this.ajxxList = ajxxList;
	}
}
