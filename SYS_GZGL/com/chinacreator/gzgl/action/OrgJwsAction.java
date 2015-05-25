package com.chinacreator.gzgl.action;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.OrgJwsBean;
import com.chinacreator.common.cps.bean.PcsRyBean;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.OrgFjBean;
import com.chinacreator.gzgl.query.OrgJwsQuery;
import com.chinacreator.gzgl.service.FjService;
import com.chinacreator.gzgl.service.OrgJwsService;
import com.chinacreator.lsgl.query.RkQueryBean;

public class OrgJwsAction extends CPSBaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private  OrgJwsBean jwsBean;
	private  OrgJwsBean pcsBean;
	private  OrgFjBean fjBean;  //辅警
	private  OrgJwsService jwsService;
	private  FjService fjService;
	private  OrgJwsQuery   jwsQuery;
	private  String operType;
	private  String id;
	private  String rootOrgCode;
	
	private String rootParentDm;
	private String rootParentMc;
	private Integer ispcs;
	private RkQueryBean queryBean;
	private String ids;
	private List<OrgFjBean> fjBeans;
	
	/**
	 * 派出所荣誉
	 */
	private PcsRyBean pcsry;
	
	private String sfzh;
	public OrgJwsAction(){
		pcsBean = new OrgJwsBean();
		jwsBean = new OrgJwsBean();
		jwsService = new OrgJwsService();
		jwsQuery = new OrgJwsQuery();
		fjBean=new OrgFjBean();
		fjService = new FjService();
		queryBean = new RkQueryBean();
		
		pcsry = new PcsRyBean();
	}
	
	/**
	 * 跳转至警务室信息列表页面
	 * @return
	 */
	public String toJwsList(){
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		jwsQuery.setCitygajgjgdm(loginInfo.getCitygajgdm());
		jwsQuery.setCountrygajgjgdm(loginInfo.getCountrygajgdm());
		jwsQuery.setPcsdm(loginInfo.getPcsdm());
		return "toJwsList";
	}
	/**
	 * 跳转到流口协管员查询界面
	 * @return
	 */
	public String toLkXgyglPage()
	{
		initQueryBean(queryBean);
		return "toLkXgyglPage";
	}
	
	/**
	 * 调整至协辅警页面
	 * @return
	 * @date Sep 10, 2014 3:07:22 PM
	 */
	public String toXfjglPage()
	{
		super.initQueryBean(queryBean);
		return "toXfjglPage";
	}
	
	public String toXfdyglPage()
	{
		super.initQueryBean(queryBean);
		return "toXfdyglPage";
	}
	
	public String toFzryglPage()
	{
		super.initQueryBean(queryBean);
		return "toFzryglPage";
	}
	
	/**
	 * 查询警务室信息列表
	 * @throws SQLException
	 */
	public void queryJwsList() throws SQLException{
		PageResultInfo<OrgJwsBean> resultInfo = jwsService.queryOrgJwsBean(getPageInfo(),jwsQuery);
		responseWrite(resultInfo);
	}
	
	/**
	 * 跳转至警务室修改/详情页面
	 * @return
	 * @throws SQLException 
	 */
	public String toJwsPage() throws SQLException{
		jwsBean = jwsService.queryOrgJwsBeanById(id);
		return "toJwsPage"; 
	}
	
	/**
	 * 保存修改后的信息
	 * @return
	 * @throws SQLException 
	 */
	public void updateJws() throws Exception{
		jwsService.updateJwsBean(jwsBean);
		responseWrite(true);
	}
	
	
	/**
	 * 以下是派出所模块
	 * @return
	 * @throws Exception 
	 */
	
	
	
	//跳转到修改界面
	public String toPcsPageInfo() throws Exception
	{
		
		pcsBean=jwsService.queryPcsBeanByOrgcode(pcsBean.getOrgcode());
		if (ValidateHelper.isEmptyString(pcsBean.getJwmsd())){
			pcsBean.setJwmsd("三");
		}
		if (ValidateHelper.isEmptyString(pcsBean.getJwmss())){
			pcsBean.setJwmss("一");
		}
		if (ValidateHelper.isEmptyString(pcsBean.getDsmc1())){
			pcsBean.setDsmc1("社区警务队");
		}
		if (ValidateHelper.isEmptyString(pcsBean.getDsmc2())){
			pcsBean.setDsmc2("案件办理队");
		}
		if (ValidateHelper.isEmptyString(pcsBean.getDsmc3())){
			pcsBean.setDsmc3("巡逻防控队");
		}
		if (ValidateHelper.isEmptyString(pcsBean.getDsmc4())){
			pcsBean.setDsmc4("综合信息研判室");
		}
		if(ValidateHelper.isEmptyString(pcsBean.getId())){
			pcsBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		}
		return "toPcsPageInfo";
	}
	
	//保存派出所信息
	public void savePcsBean()
	{
		try 
		{
			if(ValidateHelper.isNotEmptyString(pcsBean.getId()))
			{
				jwsService.updatePcsBean(pcsBean);
				responseWrite(true);
			}
			else
			{
				jwsService.insertPcsBean(pcsBean);
				responseWrite(true);
			}
		} 
		catch (Exception e) 
		{
			responseWrite(false);
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 查询派出所荣誉
	 */
	public void queryPcsRyList(){
		responseWrite(jwsService.queryPcsRyList(pcsry.getOrgid(), getPageInfo()));
	}
	
	/**
	 * 保存派出所荣誉
	 */
	public void savePcsRy(){
		responseWrite(jwsService.savePcsRy(pcsry));
	}

	/**
	 * 删除派出所荣誉
	 */
	public void deletePcsRy(){
		jwsService.delPcsRy(pcsry);
	} 
	
	/**
	 * 辅警模块
	 * @return
	 * @throws Exception 
	 */
	
	public String toFjPageInfo() throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			String xldbh = fjBean.getXldbh();
			String fjlb = fjBean.getFjlb();
			fjBean= fjService.queryFjBeanBySfzh(sfzh);
			if(fjBean==null)
			{
				fjBean = new OrgFjBean();
				fjBean.setSfzh(sfzh);
				fjBean.setSsdwdm(loginInfo.getOrgcode());
				fjBean.setSsdwmc(loginInfo.getOrgname());
				if(!("3".equals(fjlb))){
					fjBean.setFjjh(CommonSequenceHelper.getLkXgyBh(loginInfo.getOrgcode()));
				}
				fjBean.setFjlb(fjlb);
				fjBean.setXldbh(xldbh);
			}
		}
		else
		{
			fjBean=fjService.queryFjBeanByFjid(fjBean.getId());
		}
		return "toFjPageInfo";
	}
	
	//分页
	public void queryFjListPageInfo() throws Exception
	{
		PageResultInfo<OrgFjBean> list=fjService.queryFjBeanPageInfo(rootOrgCode, getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 根据查询bean分页查询
	 */
	
	public void queryFjListPageInfoByQueryBean() throws Exception
	{
		PageResultInfo<OrgFjBean> list=fjService.queryFjBeanPageInfoByQueryBean(queryBean, getPageInfo());
		responseWrite(list);
	}
	
	//保存
	public void saveFjBean()
	{
		try {
			if(ValidateHelper.isNotEmptyString(fjBean.getId())){
				fjService.updateFjBean(fjBean);
				responseWrite(true);
			}else{
				if(!fjService.queryFjBeanBySfzhAndDW(fjBean)){
					fjService.insertFjBean(fjBean);
					responseWrite(true);
				}else{
					responseWrite("sameperson");
				}
			}
			
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	
	public void loginoutFjBean() {
		try {
			fjService.loginoutFjBeanById(fjBean.getId());
			responseWrite(true);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	
	/**
	 * 导出派出所模板信息
	 * @return
	 * @throws Exception 
	 */
	public String toExportPcsPage() throws Exception{
		pcsBean=jwsService.queryPcsBeanByOrgcode(pcsBean.getOrgcode());
		return "toExportPcsPage";
	}
	
	
	public String toExportExcelFjxxInfoPage() throws Exception{
		if(ValidateHelper.isNotEmptyString(ids)){
			fjBeans = fjService.queryFjBeanByIds(ids);
		}else{
			fjBeans = fjService.queryFjBeansByQueryBean(queryBean);
		}
		return "toExportExcelFjxxInfoPage";
	}
	
	public OrgJwsBean getJwsBean() {
		return jwsBean;
	}

	public void setJwsBean(OrgJwsBean jwsBean) {
		this.jwsBean = jwsBean;
	}

	public OrgJwsService getJwsService() {
		return jwsService;
	}

	public void setJwsService(OrgJwsService jwsService) {
		this.jwsService = jwsService;
	}

	public OrgJwsQuery getJwsQuery() {
		return jwsQuery;
	}

	public void setJwsQuery(OrgJwsQuery jwsQuery) {
		this.jwsQuery = jwsQuery;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public OrgJwsBean getPcsBean() {
		return pcsBean;
	}

	public void setPcsBean(OrgJwsBean pcsBean) {
		this.pcsBean = pcsBean;
	}

	public OrgFjBean getFjBean() {
		return fjBean;
	}

	public void setFjBean(OrgFjBean fjBean) {
		this.fjBean = fjBean;
	}

	public String getRootOrgCode() {
		return rootOrgCode;
	}

	public void setRootOrgCode(String rootOrgCode) {
		this.rootOrgCode = rootOrgCode;
	}

	public String getRootParentDm() {
		return rootParentDm;
	}

	public void setRootParentDm(String rootParentDm) {
		this.rootParentDm = rootParentDm;
	}

	public String getRootParentMc() {
		return rootParentMc;
	}

	public void setRootParentMc(String rootParentMc) {
		this.rootParentMc = rootParentMc;
	}

	public Integer getIspcs() {
		return ispcs;
	}

	public void setIspcs(Integer ispcs) {
		this.ispcs = ispcs;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public RkQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(RkQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public List<OrgFjBean> getFjBeans() {
		return fjBeans;
	}

	public void setFjBeans(List<OrgFjBean> fjBeans) {
		this.fjBeans = fjBeans;
	}

	public PcsRyBean getPcsry() {
		return pcsry;
	}

	public void setPcsry(PcsRyBean pcsry) {
		this.pcsry = pcsry;
	}
	
	
}
