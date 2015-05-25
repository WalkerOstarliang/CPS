package com.chinacreator.afgl.action;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.SqddbxxBean;
import com.chinacreator.afgl.bean.SqgbxxBean;
import com.chinacreator.afgl.query.SqddbxxQueryBean;
import com.chinacreator.afgl.query.SqgbxxQueryBean;
import com.chinacreator.afgl.services.SqgbxxService;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class SqgbxxglAction extends CPSBaseAction
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= -4226080192801521046L;
	/**
	 * 社区干部职务
	 */
	private List<SystemDictionaryBean> gbzwList = new ArrayList<SystemDictionaryBean>();
	/**
	 * 小区组干部职务
	 */
	private List<SystemDictionaryBean> xqzgbzwList = new ArrayList<SystemDictionaryBean>();
	
	/**
	 * 街道干部职务
	 */
	private List<SystemDictionaryBean> jdgbzwList = new ArrayList<SystemDictionaryBean>();
	
	private SqgbxxService service;
	private String gbbhs;
	private String gbbh;
	private String sqbh;
	private String sqmc;
	private SqgbxxQueryBean queryBean;
	private SqddbxxQueryBean queryBeanddb ;
	private String id ;
	private SqddbxxBean ddbbean ;
	private SqgbxxBean bean;
	private List<SqgbxxBean> sqgbList;
	private String sfzh;
	
	public SqgbxxglAction()
	{
		super();
		service = new SqgbxxService();
		queryBean = new SqgbxxQueryBean();
		queryBeanddb = new SqddbxxQueryBean();
		bean = new SqgbxxBean();
		ddbbean = new SqddbxxBean();
	}
	
	/**
	 * 调整到社区干部列表页面
	 * @return
	 */
	public String toSqgbListPage()
	{
		initQueryBean(queryBean);
		return "toSqgbListPage";
	}
	/**
	 * 跳转到社区党代表列表页面
	 * @return
	 */
	public String toSqddbListPage(){
		initQueryBean(queryBeanddb);
		return "toSqddbListPage";
	}
	/**
	 * 查询社区党代表分页
	 * @throws Exception 
	 */
	public void querySqddbPageResult() throws Exception{
		PageResultInfo<SqddbxxBean> pageResult = service.querySqddbxxPageResultInfoByQueryBean(queryBeanddb, getPageInfo());
		responseWrite(pageResult); 
	}
	/**
	 * 弹出社区党代表信息页面
	 * @return
	 */
	public String toSqddbInfoPage(){
		if (CommonConstant.OPERTYPE_UPDATE.equals(operType) || CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			try {
				ddbbean = service.querySqddbxxBeanById(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			ddbbean.setIp(this.getIpAddress());
			ddbbean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			ddbbean.setDjrjh(loginInfo.getUsername());
			ddbbean.setDjrsfzh(loginInfo.getSfzh());
			ddbbean.setDjrxm(loginInfo.getRealname());
			ddbbean.setDjdwdm(loginInfo.getOrgcode());
			ddbbean.setDjdwmc(loginInfo.getOrgname());
			ddbbean.setSsjwqdm(loginInfo.getJwsqdm());
			ddbbean.setSsjwqmc(loginInfo.getJwsqmc());
		}
		return "toSqddbInfoPage";
	} 
	
	
	public String toSqgbDetailPage() throws Exception
	{
		if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			bean = service.querySqgbxxBeanByGbbh(bean.getGbbh());
		}
		if("1".equals(queryBean.getLx())){
			return "toSqgbInfoPage";
		}else if("2".equals(queryBean.getLx())){
			return "toXqzgbInfoPage";
		}else if("3".equals(queryBean.getLx())){
			return "toJdgbInfoPage";
		}else{
			return "toSqgbInfoPage";
		}
	}
	
	/**
	 * 调整明显页面
	 * @return
	 * @throws Exception
	 */
	public String toSqgbInfoPage() throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			bean = service.querySqgbxxBeanBySfzh(sfzh);
			if (bean == null)
			{
				bean = new SqgbxxBean();
				bean.setGbsfzh(sfzh);
				bean.setDjdwdm(loginInfo.getOrgcode());
				bean.setDjdwmc(loginInfo.getOrgname());
				bean.setDjrjh(loginInfo.getUsername());
				bean.setDjrxm(loginInfo.getRealname());
				bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			}
			if (ValidateHelper.isNotEmptyString(sqbh))
			{
				//bean = new SqgbxxBean();
				bean.setSssqbh(sqbh);
				bean.setSssqmc(sqmc);
			}
			if(null != bean.getSssqmc()) {
				bean.setSssqmc(URLDecoder.decode(URLDecoder.decode(bean.getSssqmc(), "utf-8"), "utf-8"));
			}
		}
		else if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			bean = service.querySqgbxxBeanByGbbh(gbbh);
		}
		else if (CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			bean = service.querySqgbxxBeanByGbbh(gbbh);
		}
		
		if("1".equals(queryBean.getLx())){
			return "toSqgbInfoPage";
		}else if("2".equals(queryBean.getLx())){
			return "toXqzgbInfoPage";
		}else if("3".equals(queryBean.getLx())){
			return "toJdgbInfoPage";
		}else{
			return "toSqgbInfoPage";
		}
	}
	
	public String showSqgbxxList()
	{
		return "showSqgbxxList";
	}
	
	/**
	 * 查询社区干部
	 * @throws Exception
	 */
	public void querySqgbPageResult() throws Exception
	{
		PageResultInfo<SqgbxxBean> pageResult = service.querySqgbxxPageResultInfoByQueryBean(queryBean, getPageInfo());
		responseWrite(pageResult); 
	}
	
	/**
	 * 导出社区干部信息
	 * @return
	 * @date Mar 26, 2015 10:19:11 AM
	 */
	public String exportSqgbxx()
	{
		try
		{
			PageResultInfo<SqgbxxBean> pageResult = service.querySqgbxxPageResultInfoByQueryBean(queryBean, null);
			sqgbList = pageResult.getDatas();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "exportSqgbxx";
	}
	
	/**
	 * 保存社区干部信息
	 * @throws Exception
	 */
	public void saveSqgbxxBean() throws Exception
	{
		try
		{
			//新增
			if (CommonConstant.OPERTYPE_ADD.equals(operType))
			{
				int count = service.querySqgbCountBySssqbhAndSfzh(bean.getSssqbh(), bean.getGbsfzh());
				if (count == 0)
				{
					bean = service.saveSqgbxxBean(bean, operType);
					responseWrite(bean);
				}
				//人员已经存在
				else
				{
					responseWrite("isexist");
				}
			}
			//修改
			else
			{
				bean = service.saveSqgbxxBean(bean, operType);
				responseWrite(bean);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 保存党代表信息  SqddbxxBean ddbbean
	 * @throws Exception
	 */
	public void saveSqddbxxBean() throws Exception
	{
		try
		{
			//新增
			if (CommonConstant.OPERTYPE_ADD.equals(operType))
			{
				int count = service.querySqddbCountBySssqbhAndSfzh(ddbbean.getSqdm(), ddbbean.getDdbsfzh());
				if (count == 0)
				{
					if(!ValidateHelper.isEmptyString(ddbbean.getId())){
						ddbbean.setId(this.getIpAddress());
					}	
					ddbbean = service.saveSqddbxxBean(ddbbean, operType);
					responseWrite(ddbbean);
				}
				//人员已经存在
				else
				{
					responseWrite("isexist");
				}
			}
			//修改
			else
			{
				ddbbean = service.saveSqddbxxBean(ddbbean, operType);
				responseWrite(ddbbean);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	
	
	/**
	 * 删除社区干部信息 物理删除
	 */
	public void deleteSqgbxxBeanByGbbhs() throws Exception
	{
		service.batchDeleteSqgbxxBeanByGbbhs(gbbhs);
		responseWrite(true);
	}
	
	public void deleteSqddbxxBeanById() throws Exception{
		service.DeleteSqddbxxBeanById(id);
		responseWrite(true);
	}
	public SqgbxxService getService() {
		return service;
	}

	public void setService(SqgbxxService service) {
		this.service = service;
	}



	public String getGbbhs() {
		return gbbhs;
	}



	public void setGbbhs(String gbbhs) {
		this.gbbhs = gbbhs;
	}



	public String getGbbh() {
		return gbbh;
	}



	public void setGbbh(String gbbh) {
		this.gbbh = gbbh;
	}



	public SqgbxxQueryBean getQueryBean() {
		return queryBean;
	}



	public void setQueryBean(SqgbxxQueryBean queryBean) {
		this.queryBean = queryBean;
	}



	public SqgbxxBean getBean() {
		return bean;
	}



	public void setBean(SqgbxxBean bean) {
		this.bean = bean;
	}

	public String getSqbh()
	{
		return sqbh;
	}

	public void setSqbh(String sqbh)
	{
		this.sqbh = sqbh;
	}

	public String getSqmc()
	{
		return sqmc;
	}

	public void setSqmc(String sqmc)
	{
		this.sqmc = sqmc;
	}

	public List<SystemDictionaryBean> getGbzwList()
	{
		gbzwList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("SQGBZW");
		return gbzwList;
	}

	public void setGbzwList(List<SystemDictionaryBean> gbzwList)
	{
		this.gbzwList = gbzwList;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public SqddbxxQueryBean getQueryBeanddb() {
		return queryBeanddb;
	}

	public void setQueryBeanddb(SqddbxxQueryBean queryBeanddb) {
		this.queryBeanddb = queryBeanddb;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public SqddbxxBean getDdbbean() {
		return ddbbean;
	}

	public void setDdbbean(SqddbxxBean ddbbean) {
		this.ddbbean = ddbbean;
	}

	public List<SqgbxxBean> getSqgbList()
	{
		return sqgbList;
	}

	public void setSqgbList(List<SqgbxxBean> sqgbList)
	{
		this.sqgbList = sqgbList;
	}

	public List<SystemDictionaryBean> getXqzgbzwList() {
		xqzgbzwList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_XQZGBZW");
		return xqzgbzwList;
	}

	public void setXqzgbzwList(List<SystemDictionaryBean> xqzgbzwList) {
		this.xqzgbzwList = xqzgbzwList;
	}

	public List<SystemDictionaryBean> getJdgbzwList() {
		 jdgbzwList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_JDGB_ZW");
		return jdgbzwList;
	}

	public void setJdgbzwList(List<SystemDictionaryBean> jdgbzwList) {
		this.jdgbzwList = jdgbzwList;
	}
}
