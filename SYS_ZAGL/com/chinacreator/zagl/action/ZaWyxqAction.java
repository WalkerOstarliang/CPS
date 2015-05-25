package com.chinacreator.zagl.action;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.WyxqAqjcBean;
import com.chinacreator.zagl.bean.WyxqBean;
import com.chinacreator.zagl.query.WyxqQuery;
import com.chinacreator.zagl.services.impl.WyxqServiceImpl;

public class ZaWyxqAction extends CPSBaseAction {

	private static final long serialVersionUID = 3243278343855753931L;
	
	/**
	 * 物业小区
	 */
	private WyxqBean wyxq;
	private WyxqQuery query;
	private WyxqAqjcBean wyxqajBean;
	
	private WyxqServiceImpl service;
	
	public ZaWyxqAction(){
		super();
		wyxq = new WyxqBean();
		wyxqajBean= new WyxqAqjcBean();
		query = new WyxqQuery();
		service = new WyxqServiceImpl();
	}
	
	/**
	 * 保存物业小区信息
	 */
	public void saveWyxq(){
		responseWrite(service.saveWyxq(wyxq));
	}
	
	/**
	 * 跳转到问物业小区页面
	 * @return
	 */
	public String toWyxqPage(){
		LoginInfo login = ActionContextHelper.getLoginInfo();
		
		if(CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			
			wyxq = new WyxqBean();
			if(ValidateHelper.isNotEmptyString(login.getCountrydm())){
				wyxq.setSsfxsjdm(login.getCountrydm());
				wyxq.setSsfxsjmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(login.getCountrydm() + "000000"));
			}
			
			if(ValidateHelper.isNotEmptyString(login.getPcsdm())){
				wyxq.setSspcsdm(login.getPcsdm());
				wyxq.setSspcsmc(DictionaryCacheHellper.getOrganizationBeanByOrgCode(login.getPcsdm()).getOrgjc());
				
				wyxq.setSqmjxm(login.getRealname());
				wyxq.setSqmjjh(login.getUsername());
			}
			
			wyxq.setZxbs(CommonConstant.ZX_DIC_ZC);
			wyxq.setYwwygs(query.getYwwygs());
			wyxq.initDjxx();
			wyxq.initCzxx();
		}else{
			wyxq = service.queryWyxqById(wyxq.getId());
			if(CommonConstant.OPERTYPE_UPDATE.equals(operType) && wyxq !=null){
				wyxq.initCzxx();
			}
		}
		
		return "toWyxqPage";
	}
	
	/**
	 * 跳转到物业小区列表页面
	 * @return
	 */
	public String toWyxqListPage(){
		initQueryBean(query);
		return "toWyxqListPage";
	}
	
	/**
	 * 查询物业小区列表
	 */
	public void queryWyxqList(){
		responseWrite(service.queryWyxqResultPageInfo(query, getPageInfo()));
	}
	/**
	 * 查询物业小区安全检查LIST
	 */
	public void queryWyxqaJList(){
		responseWrite(service.queryWyxqaJResultPageInfo(wyxqajBean.getWyxdwqid(), getPageInfo()));
	}
	/**
	 * 跳转到注销页面
	 * @return
	 */
	public String toWyxqZxPage(){
		wyxq = service.queryWyxqById(wyxq.getId());
		wyxq.setZxbs(CommonConstant.ZX_DIC_ZX);
		wyxq.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toWyxqZxPage";
	}
	/**
	 * 跳转到安全检查页面
	 */
	public String toWyxqAjPage(){
		LoginInfo login = ActionContextHelper.getLoginInfo();
		wyxq= service.queryWyxqById(wyxq.getId());
		if (CommonConstant.OPERTYPE_ADD.equals(operType)){
			if (wyxqajBean == null)
			{
				wyxqajBean = new WyxqAqjcBean();
			}
			wyxqajBean.setWyxdwqid(wyxq.getId());
			wyxqajBean.setXqmc(wyxq.getXqmc());
			wyxqajBean.setSspcsdm(login.getPcsdm());
			wyxqajBean.setSspcsmc(login.getPcsmc());
			wyxqajBean.setJcmjjh(login.getUsername());
			wyxqajBean.setJcmjxm(login.getRealname());
			wyxqajBean.setJcrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			//System.out.println(wyxqajBean.getJcrq());
		}
		return "toWyxqAjPage";
	}
	/**
	 * 保存物业小区安检信息
	 */
	public void saveWyxqaJ(){
		responseWrite(service.saveWyxqaJ(wyxqajBean));
	}
	/**
	 * 注销物业小区
	 */
	public void zxWyxq(){
		service.zxWyxq(wyxq);
	}
	

	public WyxqBean getWyxq() {
		return wyxq;
	}

	public void setWyxq(WyxqBean wyxq) {
		this.wyxq = wyxq;
	}

	public WyxqQuery getQuery() {
		return query;
	}

	public void setQuery(WyxqQuery query) {
		this.query = query;
	}

	public WyxqAqjcBean getWyxqajBean() {
		return wyxqajBean;
	}

	public void setWyxqajBean(WyxqAqjcBean wyxqajBean) {
		this.wyxqajBean = wyxqajBean;
	}
}
