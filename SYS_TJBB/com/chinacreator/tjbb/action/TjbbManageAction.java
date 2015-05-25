package com.chinacreator.tjbb.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.OrgJwsBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.JqtbBean;
import com.chinacreator.menu.bean.MhtjQueryBean;
import com.chinacreator.menu.bean.XqqktjBean;
import com.chinacreator.menu.business.MenuManagerBusiness;
import com.chinacreator.tjbb.bean.CzfwTjbbBean;
import com.chinacreator.tjbb.bean.DatalrtjBean;
import com.chinacreator.tjbb.bean.DwaqjctjbbBean;
import com.chinacreator.tjbb.bean.DwtjBean;
import com.chinacreator.tjbb.bean.GabzzrkTjbbBean;
import com.chinacreator.tjbb.bean.JdTbBean;
import com.chinacreator.tjbb.bean.JzztjbbBean;
import com.chinacreator.tjbb.bean.LdrkTjbbBean;
import com.chinacreator.tjbb.bean.PcsJbqkTjBean;
import com.chinacreator.tjbb.bean.PcsJwqJbqkListBean;
import com.chinacreator.tjbb.bean.PcsjbqkhzBean;
import com.chinacreator.tjbb.bean.WeekTableTjbbBean;
import com.chinacreator.tjbb.bean.WeekTjbbBean;
import com.chinacreator.tjbb.query.DataLrthQueryBean;
import com.chinacreator.tjbb.query.DwtjQueryBean;
import com.chinacreator.tjbb.query.JdTbQueryBean;
import com.chinacreator.tjbb.query.PcsTjqkQueryBean;
import com.chinacreator.tjbb.services.TjbbManageServices;

/**
 * 统计报表管理对象action
 * 
 * @filename TjbbManageAction.java
 * @author mingchun.xiong
 * @date Jul 21, 2014
 *
 */
public class TjbbManageAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 1248743573040050435L;
	private MenuManagerBusiness business;
	private List<XqqktjBean> xqqktjBeans;
	private List<PcsJwqJbqkListBean> pcsjwqJbqkList;
	private TjbbManageServices services;
	private PcsJbqkTjBean pcsqkBean;
	private MhtjQueryBean queryBean;
	private PcsTjqkQueryBean pcstjQueryBean;
	private String orgcode;
	private String orgname;
	private String tjyf;
	private int leve;
	private List<OrgJwsBean> pcsjbxxList;
	private List<JqtbBean> jqtbFaqkBeans;
	private List<JqtbBean> yearFaqkBeans;
	private List<PcsjbqkhzBean> pcsjbqkhzList;
	private List<CzfwTjbbBean> czfwtjbbbeas;
	private CzfwTjbbBean czfwtjbean;
	
	private LdrkTjbbBean ldrktjbbBean;
	private List<LdrkTjbbBean> ldrktjbbBeans;
	
	private GabzzrkTjbbBean zzrktjbbBean;
	private List<GabzzrkTjbbBean> zzrktjbbBeans;
	
	private JzztjbbBean jzztjbbBean;
	private List<JzztjbbBean> jzztjbbBeans;
	private DataLrthQueryBean dataQueryBean;
	private List<DatalrtjBean> datalrtjList = new ArrayList<DatalrtjBean>();
	private int exeucte = 0;
	private DwaqjctjbbBean aqjctjBean;
	private List<DwaqjctjbbBean> aqjctjBeans;
	private WeekTjbbBean weekBean;
	private List<WeekTjbbBean> weekBeans;
	private List<WeekTableTjbbBean> weektableBeans;
	
	/**
	 * 派出所基本情况汇总
	 */
	private PcsjbqkhzBean pcshz;
	
	private List<DwtjBean> dwList;
	
	/**
	 * 单位统计查询条件
	 */
	private DwtjQueryBean dwQuery;
	
	private List<JdTbBean> jdTbList;
	private JdTbQueryBean jdtbQuery;
	
	public TjbbManageAction()
	{
		super();
		pcsqkBean = new PcsJbqkTjBean();
		services = new TjbbManageServices();
		queryBean = new MhtjQueryBean();
		pcstjQueryBean = new PcsTjqkQueryBean();
		business = new MenuManagerBusiness();
		
		pcshz = new PcsjbqkhzBean();
		
		dwList = new ArrayList<DwtjBean>();
		
		dwQuery = new DwtjQueryBean();
		
		jdTbList = new ArrayList<JdTbBean>();
		jdtbQuery = new JdTbQueryBean();
	}
	
	/**
	 * 跳转到季度通报页面
	 */
	public String toJdTbPage(){
		return "toJdTbPage";
	}
	
	public String toJdTbDataPage(){
		jdTbList = services.queryJdTbList(jdtbQuery);
		return "toJdTbDataPage";
	}
	
	public String exportJdtbDataPage()
	{
		jdTbList = services.queryJdTbList(jdtbQuery);
		return "exportJdtbDataPage";
	}
	
	/**
	 * 跳转到单位统计页面
	 * @return
	 */
	public String toDwTjPage(){
		LoginInfo login = ActionContextHelper.getLoginInfo();
		String userCode = "";
		int leve = login.getLeve();
		if(leve >=2){
			userCode = login.getOrgcode().substring(0,4) + "00000000";
		}else{
			userCode = login.getOrgcode().substring(0,2) + "0000000000";
		}
		
		dwQuery.setDwdm(userCode);
		dwQuery.setDwmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(userCode));
		return "toDwTjPage";
	}
	
	/**
	 * 单位统计结果
	 * @return
	 */
	public String toDwListPage(){
		dwQuery.setLeve(CommonDBBaseHelper.getOrgLeve(dwQuery.getDwdm()));
		dwList = services.queryDwtjList(dwQuery);
		return "toDwListPage";
	}
	
	public String downloadDwtj(){
		dwQuery.setLeve(CommonDBBaseHelper.getOrgLeve(dwQuery.getDwdm()));
		dwList = services.queryDwtjList(dwQuery);
		return "downloadDwtj";
	}
	
	public String toPcsJbqkTjPage()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (ValidateHelper.isEmptyString(queryBean.getOrgcode()))
		{
			String orgcode = loginInfo.getOrgcode().substring(0, 4)+"00000000";
			queryBean.setOrgcode(orgcode);
		}
		pcsqkBean = services.queryPcsJbqkListByParentCode(queryBean.getOrgcode());
		return "toPcsJbqkTjPage";
	}
	
	public String toPcsJbqkList()
	{
		return "toPcsJbqkList";
	}
	
	/**
	 * 派出所列表查询
	 * 
	 * @date Nov 5, 2014 2:56:34 PM
	 */
	public void queryPcsJwqJbqkListPageResult()
	{
		PageResultInfo<OrgJwsBean> pageResult = services.queryPcsJwqJbqkListPageResult(pcstjQueryBean, getPageInfo());
		responseWrite(pageResult);
	}
	
	public String exportPcsjbqkList()
	{
		pcsjbxxList = services.queryPcsjwqList(pcstjQueryBean);
		return "exportPcsjbqkList";
	}
	
	public String exportPcsJbqkTjPage()
	{
		toPcsJbqkTjPage();
		return "exportPcsJbqkTjPage";
		
	}
	
	public String printPcsJbqk()
	{
		toPcsJbqkTjPage();
		return "printPcsJbqk";
	}

	public String toJcsjtjtjPage()
	{
		if (ValidateHelper.isEmptyString(queryBean.getParent_dm()))
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			//社区警务室
			if (loginInfo.getLeve() == 5)
			{
				queryBean.setParent_dm(loginInfo.getPcsdm());
				queryBean.setLeve(loginInfo.getLeve());
			}
			//派出所
			else if (loginInfo.getLeve() == 4)
			{
				queryBean.setParent_dm(loginInfo.getCountrygajgdm());
				queryBean.setLeve(loginInfo.getLeve());
			}
			else
			{
				queryBean.setParent_dm(loginInfo.getRootOrgCode());
				queryBean.setLeve(loginInfo.getLeve() + 1);
			}
			orgcode = loginInfo.getRootOrgCode();
			leve = loginInfo.getLeve();
		}
		else
		{
			orgcode = queryBean.getParent_dm();
			if (queryBean.getLeve() == 5)
			{
				queryBean.setParent_dm(queryBean.getParent_dm().substring(0, 8)+"0000");
			}
			leve = queryBean.getLeve() -1;
			
		}
		xqqktjBeans = business.queryMhxqtjBeanList(queryBean);
		queryBean.setLeve(queryBean.getLeve() + 1);
		return "toJcsjtjtjPage";
	}
	
	public String exportJcsjtjPage()
	{
		toJcsjtjtjPage();
		return "exportJcsjtjPage";
	}
	
	/**
	 * 跳转派出所信息页面
	 * @return
	 * @date Sep 12, 2014 4:15:10 PM
	 */
	public String toPcsxxPage()
	{
		super.initQueryBean(pcstjQueryBean);
		return "toPcsxxPage";
	}
	
	public String loadPcsInfoPage()
	{
		pcsjwqJbqkList = services.queryPcsJwqJbqkListByQueryBean(pcstjQueryBean);
		return "loadPcsInfoPage";
	}
	
	public String exportPcsxxPage()
	{
		if (ValidateHelper.isNotEmptyString(pcstjQueryBean.getPcsdm()))
		{
			pcsqkBean.setOrgcode(pcstjQueryBean.getPcsdm());
			pcstjQueryBean.setSuborgcode(pcstjQueryBean.getPcsdm().substring(0, 8));
		}
		else if (ValidateHelper.isNotEmptyString(pcstjQueryBean.getCountrygajgjgdm()))
		{
			pcsqkBean.setOrgcode(pcstjQueryBean.getCountrygajgjgdm());
			pcstjQueryBean.setSuborgcode(pcstjQueryBean.getCountrygajgjgdm().substring(0, 6));
		}
		else if (ValidateHelper.isNotEmptyString(pcstjQueryBean.getCitygajgjgdm()))
		{
			pcsqkBean.setOrgcode(pcstjQueryBean.getCitygajgjgdm());
			pcstjQueryBean.setSuborgcode(pcstjQueryBean.getCitygajgjgdm().substring(0, 4));
		}
		pcsqkBean = services.queryPcsxxsl(pcstjQueryBean);
		pcsjwqJbqkList = services.queryPcsJwqJbqkListByQueryBean(pcstjQueryBean);
		return "exportPcsxxPage";
	}
	
	/**
	 * 跳转到派出所基本情况汇总
	 * @return
	 */
	public String toPcsjbqkhzPage(){
		return "toPcsjbqkhzPage";
	}
	
	/**
	 * 查询派出所基本情况汇总
	 */
	public void queryPcsjbqkhz(){
		responseWrite(services.queryPcsjbqkhz(pcstjQueryBean));
	}
	
	/**
	 * 派出所基本情况列表查询
	 * 
	 * @date Nov 26, 2014 4:58:29 PM
	 */
	public void queryPcsjbqkhzPageResult()
	{
		List<PcsjbqkhzBean> list = services.queryPcsjbqkhzPageResult(pcstjQueryBean);
		PageResultInfo<PcsjbqkhzBean> pageResultInfo = PaginationHelper.wrapPageResultInfo(getPageInfo(), (long)list.size(), list);
		responseWrite(pageResultInfo);
	}
	
	public String dowloadPcsjbqkhzList()
	{
		pcsjbqkhzList = services.queryPcsjbqkhzPageResult(pcstjQueryBean);
		return "dowloadPcsjbqkhzList";
	}
	
	/**
	 * 导出派出所基本情况汇总
	 * @return
	 */
	public String dowloadPcsjbqkhz()
	{
		pcshz = services.queryPcsjbqkhz(pcstjQueryBean);
		return "dowloadPcsjbqkhz";
	}
	
	/**
	 * 跳转至法案情况统计
	 * @return 
	 * @date Nov 24, 2014 2:18:20 PM
	 */
	public String toFqfzqkPage()
	{
		return "toFqfzqkPage";
	}
	
	
	public void queryFaqkPageResult()
	{
		responseWrite(services.queryFaqktjPageResult(queryBean, getPageInfo()));
	}
	
	/**
	 * 查询单位年度汇总
	 * 
	 * @date Feb 9, 2015 10:51:11 AM
	 */
	public void queryFaqkYearTjbb()
	{
		responseWrite(services.queryFaqktjYearHzPageResult(queryBean, getPageInfo()));
	}
	
	public String exportFaqkPage()
	{
		jqtbFaqkBeans = services.queryFaqktjPageList(queryBean);
		PageResultInfo<JqtbBean> jqtbbeans = services.queryFaqktjYearHzPageResult(queryBean, null);
		yearFaqkBeans = jqtbbeans.getDatas();
		return "exportFaqkPage";
	}
	
	
	public void loadFaqkXmlData()
	{
		String xml = services.loadFaqkXmlData(queryBean);
		returnValue(xml, "GBK");
	}
	
	public String toCzfwTjbbPage()
	{
		return "toCzfwTjbbPage";
	}
	
	public void queryCzfwtjbbPageResult()
	{
		czfwtjbbbeas = services.queryCzfwTjbbBeans(czfwtjbean);
		PageResultInfo<CzfwTjbbBean> pageResult = PaginationHelper.wrapPageResultInfo(getPageInfo(), (long)czfwtjbbbeas.size(), czfwtjbbbeas);
		responseWrite(pageResult);
	}
	
	public String exportCzfwTjbbPage()
	{
		czfwtjbbbeas = services.queryCzfwTjbbBeans(czfwtjbean);
		return "exportCzfwTjbbPage";
	}
	
	
	public String toLdrkTjbbPage()
	{
		return "toLdrkTjbbPage";
	}
	
	public void queryLdrkTjbbPageResult()
	{
		ldrktjbbBeans = services.queryLdrkTjbbBeans(ldrktjbbBean);
		PageResultInfo<LdrkTjbbBean> pageResult = PaginationHelper.wrapPageResultInfo(getPageInfo(), (long)ldrktjbbBeans.size(), ldrktjbbBeans);
		responseWrite(pageResult);
	}
	
	public String exportLdrkTjbbPage()
	{
		ldrktjbbBeans = services.queryLdrkTjbbBeans(ldrktjbbBean);
		return "exportLdrkTjbbPage";
	}
	
	public String toGabzzrktjbbPage()
	{
		if (exeucte == 1)
		{
			zzrktjbbBeans = services.queryGabzzrkTjbbBeans(zzrktjbbBean);
		}
		return "toGabzzrktjbbPage";
	}
	
	public String exportGabzzrktjbbPage()
	{
		zzrktjbbBeans = services.queryGabzzrkTjbbBeans(zzrktjbbBean);
		return "exportGabzzrktjbbPage";
	}
	
	
	public String toJzztjbbPage()
	{
		if (exeucte == 1)
		{
			jzztjbbBeans = services.queryJzztjbbBeans(jzztjbbBean);
		}
		if (jzztjbbBean == null)
		{
			jzztjbbBean = new JzztjbbBean();
			jzztjbbBean.setTjqsrq("20140801");
		}
		else if (ValidateHelper.isEmptyString(jzztjbbBean.getTjqsrq()))
		{
			jzztjbbBean.setTjqsrq("20140801");
		}
		return "toJzztjbbPage";
	}
	
	public String exportJzztjbbPage()
	{
		jzztjbbBeans = services.queryJzztjbbBeans(jzztjbbBean);
		return "exportJzztjbbPage";
	}
	
	public String toDatalrTjPage()
	{
		return "toDatalrTjPage";
	}
	
	public void queryDataLrtjPageResult()
	{
		PageResultInfo<DatalrtjBean> pageResult = services.queryDataLrtjBeans(dataQueryBean, getPageInfo());
		responseWrite(pageResult);
	}
	
	public String exportDataLrtjPage()
	{
		PageResultInfo<DatalrtjBean> pageResult = services.queryDataLrtjBeans(dataQueryBean, null);
		datalrtjList = pageResult.getDatas();
		return "exportDataLrtjPage";
	}
	
	public String toDwAqjctjbbPage()
	{
		if (aqjctjBean != null)
		{
			PageResultInfo<DwaqjctjbbBean> pageResult = services.queryDwaqjctjbbBeanPageResult(null, aqjctjBean);
			aqjctjBeans = pageResult.getDatas();
		}
		return "toDwAqjctjbbPage";
	}
	
	public String exportDwAqjcPage()
	{
		PageResultInfo<DwaqjctjbbBean> pageResult = services.queryDwaqjctjbbBeanPageResult(null, aqjctjBean);
		aqjctjBeans = pageResult.getDatas();
		return "exportDwAqjcPage";
	}
	
	/**
	 * 数据周采集情况统计
	 * @return
	 * @date Feb 11, 2015 11:48:06 AM
	 */
	public String toSjlrWeektjPage()
	{
		return "toSjlrWeektjPage";
	}
	
	public String loadWeekTablePage()
	{
		if (weekBean != null)
		{
			weekBean.initDate();
		}
		weektableBeans = services.queryWeekTableTjbbBeans(weekBean);
		return "loadWeekTablePage";
	}
	
	public void queryWekkqkPageResult()
	{
		if (weekBean != null)
		{
			weekBean.initDate();
		}
		PageResultInfo<WeekTjbbBean> pageResultInfo = services.queryWeekTjbbBeanPageResultInfo(weekBean, getPageInfo());
		responseWrite(pageResultInfo);
	}
	
	public String toExportWeektjqkPage()
	{
		if (weekBean != null)
		{
			weekBean.initDate();
		}
		weektableBeans = services.queryWeekTableTjbbBeans(weekBean);
		return "toExportWeektjqkPage";
	}
	
	public PcsJbqkTjBean getPcsqkBean()
	{
		return pcsqkBean;
	}

	public void setPcsqkBean(PcsJbqkTjBean pcsqkBean)
	{
		this.pcsqkBean = pcsqkBean;
	}

	public TjbbManageServices getServices()
	{
		return services;
	}

	public void setServices(TjbbManageServices services)
	{
		this.services = services;
	}

	public MhtjQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(MhtjQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public String getOrgcode()
	{
		return orgcode;
	}

	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
	}

	public int getLeve()
	{
		return leve;
	}

	public void setLeve(int leve)
	{
		this.leve = leve;
	}

	public List<XqqktjBean> getXqqktjBeans()
	{
		return xqqktjBeans;
	}

	public void setXqqktjBeans(List<XqqktjBean> xqqktjBeans)
	{
		this.xqqktjBeans = xqqktjBeans;
	}

	public String getOrgname()
	{
		orgname = DictionaryCacheHellper.getOrganizationOrgNameByCode(orgcode);
		return orgname;
	}

	public void setOrgname(String orgname)
	{
		this.orgname = orgname;
	}

	public PcsTjqkQueryBean getPcstjQueryBean()
	{
		return pcstjQueryBean;
	}

	public void setPcstjQueryBean(PcsTjqkQueryBean pcstjQueryBean)
	{
		this.pcstjQueryBean = pcstjQueryBean;
	}

	public List<PcsJwqJbqkListBean> getPcsjwqJbqkList()
	{
		return pcsjwqJbqkList;
	}

	public void setPcsjwqJbqkList(List<PcsJwqJbqkListBean> pcsjwqJbqkList)
	{
		this.pcsjwqJbqkList = pcsjwqJbqkList;
	}

	public PcsjbqkhzBean getPcshz() {
		return pcshz;
	}

	public void setPcshz(PcsjbqkhzBean pcshz) {
		this.pcshz = pcshz;
	}

	public List<OrgJwsBean> getPcsjbxxList()
	{
		return pcsjbxxList;
	}

	public void setPcsjbxxList(List<OrgJwsBean> pcsjbxxList)
	{
		this.pcsjbxxList = pcsjbxxList;
	}

	public List<JqtbBean> getJqtbFaqkBeans()
	{
		return jqtbFaqkBeans;
	}

	public void setJqtbFaqkBeans(List<JqtbBean> jqtbFaqkBeans)
	{
		this.jqtbFaqkBeans = jqtbFaqkBeans;
	}

	public List<PcsjbqkhzBean> getPcsjbqkhzList()
	{
		return pcsjbqkhzList;
	}

	public void setPcsjbqkhzList(List<PcsjbqkhzBean> pcsjbqkhzList)
	{
		this.pcsjbqkhzList = pcsjbqkhzList;
	}

	public List<CzfwTjbbBean> getCzfwtjbbbeas()
	{
		return czfwtjbbbeas;
	}

	public void setCzfwtjbbbeas(List<CzfwTjbbBean> czfwtjbbbeas)
	{
		this.czfwtjbbbeas = czfwtjbbbeas;
	}

	public CzfwTjbbBean getCzfwtjbean()
	{
		return czfwtjbean;
	}

	public void setCzfwtjbean(CzfwTjbbBean czfwtjbean)
	{
		this.czfwtjbean = czfwtjbean;
	}

	public LdrkTjbbBean getLdrktjbbBean()
	{
		return ldrktjbbBean;
	}

	public void setLdrktjbbBean(LdrkTjbbBean ldrktjbbBean)
	{
		this.ldrktjbbBean = ldrktjbbBean;
	}

	public List<LdrkTjbbBean> getLdrktjbbBeans()
	{
		return ldrktjbbBeans;
	}

	public void setLdrktjbbBeans(List<LdrkTjbbBean> ldrktjbbBeans)
	{
		this.ldrktjbbBeans = ldrktjbbBeans;
	}

	public GabzzrkTjbbBean getZzrktjbbBean()
	{
		return zzrktjbbBean;
	}

	public void setZzrktjbbBean(GabzzrkTjbbBean zzrktjbbBean)
	{
		this.zzrktjbbBean = zzrktjbbBean;
	}

	public List<GabzzrkTjbbBean> getZzrktjbbBeans()
	{
		return zzrktjbbBeans;
	}

	public void setZzrktjbbBeans(List<GabzzrkTjbbBean> zzrktjbbBeans)
	{
		this.zzrktjbbBeans = zzrktjbbBeans;
	}

	public int getExeucte()
	{
		return exeucte;
	}

	public void setExeucte(int exeucte)
	{
		this.exeucte = exeucte;
	}

	public JzztjbbBean getJzztjbbBean()
	{
		return jzztjbbBean;
	}

	public void setJzztjbbBean(JzztjbbBean jzztjbbBean)
	{
		this.jzztjbbBean = jzztjbbBean;
	}

	public List<JzztjbbBean> getJzztjbbBeans()
	{
		return jzztjbbBeans;
	}

	public void setJzztjbbBeans(List<JzztjbbBean> jzztjbbBeans)
	{
		this.jzztjbbBeans = jzztjbbBeans;
	}

	public DataLrthQueryBean getDataQueryBean()
	{
		return dataQueryBean;
	}

	public void setDataQueryBean(DataLrthQueryBean dataQueryBean)
	{
		this.dataQueryBean = dataQueryBean;
	}

	public List<DatalrtjBean> getDatalrtjList()
	{
		return datalrtjList;
	}

	public void setDatalrtjList(List<DatalrtjBean> datalrtjList)
	{
		this.datalrtjList = datalrtjList;
	}
	public DwaqjctjbbBean getAqjctjBean()
	{
		return aqjctjBean;
	}

	public void setAqjctjBean(DwaqjctjbbBean aqjctjBean)
	{
		this.aqjctjBean = aqjctjBean;
	}

	public List<DwaqjctjbbBean> getAqjctjBeans()
	{
		return aqjctjBeans;
	}

	public void setAqjctjBeans(List<DwaqjctjbbBean> aqjctjBeans)
	{
		this.aqjctjBeans = aqjctjBeans;
	}
	
	public List<DwtjBean> getDwList() {
		return dwList;
	}

	public void setDwList(List<DwtjBean> dwList) {
		this.dwList = dwList;
	}

	public DwtjQueryBean getDwQuery() {
		return dwQuery;
	}

	public void setDwQuery(DwtjQueryBean dwQuery) {
		this.dwQuery = dwQuery;
	}

	public String getTjyf()
	{
		return tjyf;
	}

	public void setTjyf(String tjyf)
	{
		this.tjyf = tjyf;
	}

	public List<JqtbBean> getYearFaqkBeans()
	{
		return yearFaqkBeans;
	}

	public void setYearFaqkBeans(List<JqtbBean> yearFaqkBeans)
	{
		this.yearFaqkBeans = yearFaqkBeans;
	}

	public WeekTjbbBean getWeekBean()
	{
		return weekBean;
	}

	public void setWeekBean(WeekTjbbBean weekBean)
	{
		this.weekBean = weekBean;
	}

	public List<WeekTjbbBean> getWeekBeans()
	{
		return weekBeans;
	}

	public void setWeekBeans(List<WeekTjbbBean> weekBeans)
	{
		this.weekBeans = weekBeans;
	}

	public List<JdTbBean> getJdTbList() {
		return jdTbList;
	}

	public void setJdTbList(List<JdTbBean> jdTbList) {
		this.jdTbList = jdTbList;
	}

	public JdTbQueryBean getJdtbQuery() {
		return jdtbQuery;
	}

	public void setJdtbQuery(JdTbQueryBean jdtbQuery) {
		this.jdtbQuery = jdtbQuery;
	}

	public List<WeekTableTjbbBean> getWeektableBeans()
	{
		return weektableBeans;
	}

	public void setWeektableBeans(List<WeekTableTjbbBean> weektableBeans)
	{
		this.weektableBeans = weektableBeans;
	}
	
}
