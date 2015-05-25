package com.chinacreator.nbgl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.SqJbxxBean;
import com.chinacreator.afgl.services.SqJbxxService;
import com.chinacreator.common.bean.OrganizationBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.nbgl.bean.AjxxBean;
import com.chinacreator.nbgl.bean.AjxxQueryBean;
import com.chinacreator.nbgl.service.ZddwAjHsService;
import com.chinacreator.nbgl.service.impl.ZddwAjHsServiceImpl;
import com.chinacreator.zagl.query.DwQueryBean;

/**
 * 重点单位案件核实
 * @author sytx
 */
public class ZddwAjHsAction extends CPSBaseAction {

	private static final long serialVersionUID = 839650645120300253L;
	
	//县区公安机构
	private List<SystemDictionaryBean> countryGajgjgList = new ArrayList<SystemDictionaryBean>();
	
	//派出所公安机构
	private List<SystemDictionaryBean> pcsGajgjgList = new ArrayList<SystemDictionaryBean>();
	
	//警务室/社区
	private List<OrganizationBean> jwsqOrgList = new ArrayList<OrganizationBean>();
	
	//行政社区
	private List<SqJbxxBean> sqJbxxList = new ArrayList<SqJbxxBean>();
	
	/**
	 * 案件类别
	 */
	private List<SystemDictionaryBean> ajlb;
	
	private ZddwAjHsService service;
	private AjxxQueryBean query;
	private AjxxBean ajxx;
	
	private List<AjxxBean> ajList;
	
	private DwQueryBean dwcx;
	
	public ZddwAjHsAction(){
		super();
		ajlb = new ArrayList<SystemDictionaryBean>();
		
		service = new ZddwAjHsServiceImpl();
		query = new AjxxQueryBean();
		ajxx = new AjxxBean();
		
		dwcx = new DwQueryBean();
		
		ajList = new ArrayList<AjxxBean>();
	}
	
	/**
	 * 案件核实
	 */
	public void ajHs(){
		responseWrite(service.ajhs(ajxx));
	}
	
	/**
	 * 跳转到案件列表页面
	 * @return
	 */
	public String toAjListPage(){
		return "toAjListPage";
	}
	
	/**
	 * 跳转到案件详细信息页面
	 * @return
	 */
	public String toAjDetailPage(){
		ajxx = service.queryAjxxInfoByAjbh(query.getAjbh());
		return "toAjDetailPage";
	}
	
	/**
	 * 查询案件列表
	 */
	public void queryAjList(){
		responseWrite(service.queryAjxxList(query, getPageInfo()));
	}
	
	/**
	 * 导出案件
	 */
	public String expAjList(){
		ajList = service.queryAjxxList(query);
		return "expAjList";
	}
	
	/**
	 * 跳转到内保单位选择页面
	 * @return
	 */
	public String toNbdwSelectPage(){
		fullXzqh();
		return "toNbdwSelectPage";
	}

	public List<SystemDictionaryBean> getAjlb() {
		ajlb = service.getAjlbDic();
		return ajlb;
	}

	public void setAjlb(List<SystemDictionaryBean> ajlb) {
		this.ajlb = ajlb;
	}

	public AjxxQueryBean getQuery() {
		return query;
	}

	public void setQuery(AjxxQueryBean query) {
		this.query = query;
	}

	public AjxxBean getAjxx() {
		return ajxx;
	}

	public void setAjxx(AjxxBean ajxx) {
		this.ajxx = ajxx;
	}
	
	private void fullXzqh(){
		initQueryBean(dwcx);
		if(ValidateHelper.isNotEmptyString(query.getFasqdm()) && !"null".equals(query.getFasqdm()) ){
			OrganizationBean jwq = DictionaryCacheHellper.queryJwqBySqdm(query.getFasqdm() );
			
			SqJbxxService sqJbxxervice = new SqJbxxService();
			
			try {
				setSqJbxxList(sqJbxxervice.querySqJbxxBeanListByJdxzdmAndJwqdm(jwq.getOrgcode()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dwcx.setSqdm(query.getFasqdm());
			if(jwq != null){
				setJwsqOrgList(DictionaryCacheHellper.getOrgListByParentDm(jwq.getParent_code()));
				dwcx.setJwsqdm(jwq.getOrgcode());
				
				setPcsGajgjgList(DictionaryCacheHellper.getDicListByParentDm(jwq.getOrgcode().substring(0,6) + "000000"));
				dwcx.setPcsdm(jwq.getOrgcode().substring(0,8) + "0000");
				
				setCountryGajgjgList(DictionaryCacheHellper.getDicListByParentDm(jwq.getOrgcode().substring(0,4) + "00000000"));
				dwcx.setCountrygajgjgdm(jwq.getOrgcode().substring(0,6) + "000000");
			}
		}
	}

	public DwQueryBean getDwcx() {
		return dwcx;
	}

	public void setDwcx(DwQueryBean dwcx) {
		this.dwcx = dwcx;
	}

	public List<SystemDictionaryBean> getCountryGajgjgList() {
		if(countryGajgjgList.size() == 0){
			countryGajgjgList = super.getCountryGajgjgList();
		}
		return countryGajgjgList;
	}

	public void setCountryGajgjgList(List<SystemDictionaryBean> countryGajgjgList) {
		this.countryGajgjgList = countryGajgjgList;
	}

	public List<SystemDictionaryBean> getPcsGajgjgList() {
		if(pcsGajgjgList.size() == 0 ){
			pcsGajgjgList = super.getPcsGajgjgList();
		}
		return pcsGajgjgList;
	}

	public void setPcsGajgjgList(List<SystemDictionaryBean> pcsGajgjgList) {
		this.pcsGajgjgList = pcsGajgjgList;
	}

	public List<OrganizationBean> getJwsqOrgList() {
		if(jwsqOrgList.size() == 0){
			jwsqOrgList = super.getJwsqOrgList();
		}
		return jwsqOrgList;
	}

	public void setJwsqOrgList(List<OrganizationBean> jwsqOrgList) {
		this.jwsqOrgList = jwsqOrgList;
	}

	public List<SqJbxxBean> getSqJbxxList() {
		if(sqJbxxList.size() == 0){
			sqJbxxList = super.getSqJbxxList();
		}
		return sqJbxxList;
	}

	public void setSqJbxxList(List<SqJbxxBean> sqJbxxList) {
		this.sqJbxxList = sqJbxxList;
	}

	public List<AjxxBean> getAjList() {
		return ajList;
	}

	public void setAjList(List<AjxxBean> ajList) {
		this.ajList = ajList;
	}
}
