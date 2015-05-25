package com.chinacreator.common.cps.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.SqJbxxBean;
import com.chinacreator.afgl.services.SqJbxxService;
import com.chinacreator.common.action.PaginationAction;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.OrganizationBean;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.XzqhMappingBean;
import com.chinacreator.common.cps.business.DictionaryBusiness;
import com.chinacreator.common.cps.business.OrgUserbusiness;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.PropertiesUtil;
import com.chinacreator.common.helper.ValidateHelper;

public class CPSBaseAction extends PaginationAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -5482444849389016286L;
	
	private String rootParentCode = "430000000000";
	
	//市州
	private List<SystemDictionaryBean> cityXzqhList = new ArrayList<SystemDictionaryBean>();
	
	
	//县区
	private List<SystemDictionaryBean> countryXzqhList = new ArrayList<SystemDictionaryBean>();
	
	
	//派出所
	private List<OrganizationBean> pcsOrgList = new ArrayList<OrganizationBean>();
	
	//警务室/社区
	private List<OrganizationBean> jwsqOrgList = new ArrayList<OrganizationBean>();

	//乡镇街道列表
	private List<SystemDictionaryBean> xzjdqhList = new ArrayList<SystemDictionaryBean>();
	
	//市级公安机构
	private List<SystemDictionaryBean> cityGajgjgList = new ArrayList<SystemDictionaryBean>();
	
	//县区公安机构
	private List<SystemDictionaryBean> countryGajgjgList = new ArrayList<SystemDictionaryBean>();
	
	//派出所公安机构
	private List<SystemDictionaryBean> pcsGajgjgList = new ArrayList<SystemDictionaryBean>();
	
	//可访问派出所
	private List<SystemDictionaryBean> kfwPcsGajgjgList = new ArrayList<SystemDictionaryBean>();
	
	//专长
	private List<SystemDictionaryBean> zcList = new ArrayList<SystemDictionaryBean>();
	//文化程度
	private List<SystemDictionaryBean> whcdList = new ArrayList<SystemDictionaryBean>();
	//性别
	private List<SystemDictionaryBean> xbList = new ArrayList<SystemDictionaryBean>();
	//纠纷类型
	private List<SystemDictionaryBean> jflxList = new ArrayList<SystemDictionaryBean>();
	
	private String pgisiframeurl = "";
	
	private String mapServicesUrl = "";
	
	//行政社区
	private List<SqJbxxBean> sqJbxxList = new ArrayList<SqJbxxBean>();
	
	private boolean displayAddBtn;
	
	/**
	 * 系统时间
	 */
	private String sysdate="";
	
	protected void initQueryBean(QueryBean queryBean)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		queryBean.setCitygajgjgdm(loginInfo.getCitygajgdm());
		queryBean.setCountrygajgjgdm(loginInfo.getCountrygajgdm());
		queryBean.setCitydm(loginInfo.getCitydm());
		queryBean.setCountrydm(loginInfo.getCountrydm());
		queryBean.setJdxzdm(loginInfo.getJdxzdm());
		queryBean.setPcsdm(loginInfo.getPcsdm());
		queryBean.setJwsqdm(loginInfo.getJwsqdm());
		queryBean.setSqdm(loginInfo.getSqdm());
		queryBean.setLeve(loginInfo.getLeve());
		queryBean.setOrgcode(loginInfo.getOrgcode());
	}
	
	
	public List<SystemDictionaryBean> getCityXzqhList() {
		cityXzqhList = DictionaryCacheHellper.getSystemDictionaryBeanListByParentDm("GB_XZQH", "430000");
		return cityXzqhList;
	}

	public void setCityXzqhList(List<SystemDictionaryBean> cityXzqhList) {
		this.cityXzqhList = cityXzqhList;
	}

	public List<SystemDictionaryBean> getCountryXzqhList() 
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		DictionaryBusiness business = new DictionaryBusiness();
		
		if (loginInfo.getLeve() >= 2)
		{
			List<XzqhMappingBean> mapBenas = business.getXzqhByPz(loginInfo.getCountrydm());
			if (ValidateHelper.isNotEmptyCollection(mapBenas))
			{
				for (XzqhMappingBean bean : mapBenas)
				{
					SystemDictionaryBean dicBean = DictionaryCacheHellper.getSystemDictionaryBeanByZdlbAndDm("GB_XZQH", bean.getYxzqh());
					countryXzqhList.add(dicBean);
				}
			}
			else
			{
				countryXzqhList = DictionaryCacheHellper.getSystemDictionaryBeanListByParentDm("GB_XZQH", loginInfo.getCitydm());
			}
		}
		return countryXzqhList;
	}

	public void setCountryXzqhList(List<SystemDictionaryBean> countryXzqhList) {
		this.countryXzqhList = countryXzqhList;
	}

	public List<OrganizationBean> getPcsOrgList() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		OrgUserbusiness business = null;
		if (loginInfo.getLeve() >= 3)
		{
			business = new OrgUserbusiness();
			pcsOrgList = business.queryPcsOrgListByParentDm(loginInfo.getCountrydm() + "000000");
		}
		return pcsOrgList;
	}

	public void setPcsOrgList(List<OrganizationBean> pcsOrgList) {
		this.pcsOrgList = pcsOrgList;
	}

	public List<OrganizationBean> getJwsqOrgList() 
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		OrgUserbusiness business = null;
		if (loginInfo.getLeve() >= 4)
		{
			business = new OrgUserbusiness();
			jwsqOrgList = business.queryJwsqOrgListByParentDm(loginInfo.getPcsdm());
		}
		
		return jwsqOrgList;
	}

	public void setJwsqOrgList(List<OrganizationBean> jwsqOrgList) {
		this.jwsqOrgList = jwsqOrgList;
	}

	
	public List<SystemDictionaryBean> getXzjdqhList() 
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		DictionaryBusiness business = new DictionaryBusiness();
		if (ValidateHelper.isNotEmptyString(loginInfo.getCountrydm()))
		{
			int leve = loginInfo.getLeve();
			if(leve==4 || leve==5)
			{
				List<XzqhMappingBean> mapBenas = business.getXzqhByPz(loginInfo.getCountrydm());
				if (ValidateHelper.isNotEmptyCollection(mapBenas))
				{
					for (XzqhMappingBean bean : mapBenas)
					{
						String yxzqh = bean.getYxzqh() + "000000";
						List<SystemDictionaryBean> list = business.queryXzjdDicBeanByPcsdm(yxzqh);
						xzjdqhList.addAll(list);
					}
				}
				else
				{
					xzjdqhList = business.queryXzjdDicBeanByPcsdm(loginInfo.getPcsdm());
				}
			}
			if (ValidateHelper.isEmptyCollection(xzjdqhList))
			{
				List<XzqhMappingBean> mapBenas = business.getXzqhByPz(loginInfo.getCountrydm());
				if (ValidateHelper.isNotEmptyCollection(mapBenas))
				{
					for (XzqhMappingBean bean : mapBenas)
					{
						String yxzqh = bean.getYxzqh() + "000000";
						List<SystemDictionaryBean> list = DictionaryCacheHellper.getSystemDictionaryBeanListByParentDm(CommonConstant.HN_XZQH, yxzqh);
						xzjdqhList.addAll(list);
					}
				}
				else
				{
					xzjdqhList = DictionaryCacheHellper.getSystemDictionaryBeanListByParentDm(CommonConstant.HN_XZQH, loginInfo.getCountrygajgdm());
				}
			}
		}
		return xzjdqhList;
	}

	
	public List<SqJbxxBean> getSqJbxxList() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (ValidateHelper.isNotEmptyString(loginInfo.getJdxzdm()))
		{
			try
			{
				SqJbxxService sqJbxxervice = new SqJbxxService();
				int leve = loginInfo.getLeve();
				if(leve==5)
				{
					sqJbxxList = sqJbxxervice.querySqJbxxBeanListByJdxzdmAndJwqdm(loginInfo.getOrgcode());
				}
				if (ValidateHelper.isEmptyCollection(sqJbxxList))
				{
					sqJbxxList = sqJbxxervice.querySqJbxxBeanListByJdxzdm(loginInfo.getJdxzdm());
				}
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return sqJbxxList;
	}


	public void setSqJbxxList(List<SqJbxxBean> sqJbxxList) {
		this.sqJbxxList = sqJbxxList;
	}


	public void setXzjdqhList(List<SystemDictionaryBean> xzjdqhList) {
		this.xzjdqhList = xzjdqhList;
	}

	public List<SystemDictionaryBean> getZcList() {
		zcList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("GB_ZC");
		return zcList;
	}


	public void setZcList(List<SystemDictionaryBean> zcList) {
		this.zcList = zcList;
	}


	public List<SystemDictionaryBean> getWhcdList() {
		whcdList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("GB_WHCD");
		return whcdList;
	}


	public void setWhcdList(List<SystemDictionaryBean> whcdList) {
		this.whcdList = whcdList;
	}


	public List<SystemDictionaryBean> getXbList() {
		xbList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("GB_XB");
		return xbList;
	}


	public void setXbList(List<SystemDictionaryBean> xbList) {
		this.xbList = xbList;
	}


	public List<SystemDictionaryBean> getJflxList() {
		jflxList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("QZFW_JFTJ_JFLX");
		return jflxList;
	}


	public void setJflxList(List<SystemDictionaryBean> jflxList) {
		this.jflxList = jflxList;
	}


	public List<SystemDictionaryBean> getCityGajgjgList()
	{
		cityGajgjgList = DictionaryCacheHellper.queryCityGajgjgdws(rootParentCode);
		//List<SystemDictionaryBean> otherslist = DictionaryCacheHellper.queryOtherOrgSelect("1");
		//cityGajgjgList.addAll(otherslist);
		return cityGajgjgList;
	}


	public void setCityGajgjgList(List<SystemDictionaryBean> cityGajgjgList)
	{
		this.cityGajgjgList = cityGajgjgList;
	}


	public List<SystemDictionaryBean> getCountryGajgjgList()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo.getLeve() >= 2)
		{
			countryGajgjgList = DictionaryCacheHellper.queryCountryGajgjgdws(loginInfo.getCitygajgdm());
		}
		return countryGajgjgList;
	}


	public void setCountryGajgjgList(List<SystemDictionaryBean> countryGajgjgList)
	{
		this.countryGajgjgList = countryGajgjgList;
	}


	public List<SystemDictionaryBean> getPcsGajgjgList()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo.getLeve() >= 3)
		{
			pcsGajgjgList = DictionaryCacheHellper.queryPcsGajgjgdws(loginInfo.getCountrygajgdm());
		}
		return pcsGajgjgList;
	}


	public void setPcsGajgjgList(List<SystemDictionaryBean> pcsGajgjgList)
	{
		this.pcsGajgjgList = pcsGajgjgList;
	}


	public String getPgisiframeurl() {
		pgisiframeurl = DictionaryCacheHellper.getSystemParamenterValueByKey("pgis.url.iframe");
		return pgisiframeurl;
	}


	public void setPgisiframeurl(String pgisiframeurl) {
		this.pgisiframeurl = pgisiframeurl;
	}


	public String getMapServicesUrl() 
	{
		String value = PropertiesUtil.getValue("load.pgis.config.from.database");
		if ("false".equals(value))
		{
			mapServicesUrl = PropertiesUtil.getValue("pgis.mapservices.url");
		}
		else
		{
			mapServicesUrl = DictionaryCacheHellper.getSystemParamenterValueByKey("pgis.mapservices.url");
		}
		return mapServicesUrl;
	}


	public void setMapServicesUrl(String mapServicesUrl) {
		this.mapServicesUrl = mapServicesUrl;
	}


	public boolean getDisplayAddBtn()
	{
		String display = DictionaryCacheHellper.getSystemParamenterValueByKey("control.display.add.buton");
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		//控制添加按钮的显示
		if (Boolean.parseBoolean(display))
		{
			if (loginInfo.getLeve() == 5)
			{
				displayAddBtn = true;
			}
			else
			{
				displayAddBtn = false; 
			}
		}
		else
		{
			displayAddBtn = true; 
		}
		return displayAddBtn;
	}


	public void setDisplayAddBtn(boolean displayAddBtn)
	{
		this.displayAddBtn = displayAddBtn;
	}


	public String getSysdate() {
		sysdate = DateTimeHelper.getNowDateStr("yyyyMMddHHmmss");
		return sysdate;
	}


	public void setSysdate(String sysdate) {
		this.sysdate = sysdate;
	}


	public List<SystemDictionaryBean> getKfwPcsGajgjgList() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo.getLeve() >= 3)
		{
			kfwPcsGajgjgList = DictionaryCacheHellper.queryKfwPcsGajgjgdws(loginInfo.getCountrygajgdm());
		}
		return kfwPcsGajgjgList;
	}


	public void setKfwPcsGajgjgList(List<SystemDictionaryBean> kfwPcsGajgjgList) {
		this.kfwPcsGajgjgList = kfwPcsGajgjgList;
	}
	
	
}
