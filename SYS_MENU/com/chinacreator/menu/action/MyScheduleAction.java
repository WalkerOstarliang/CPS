package com.chinacreator.menu.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.OrgJwsBean;
import com.chinacreator.common.cps.bean.UserLxfsBean;
import com.chinacreator.common.cps.business.UserLxfsBusiness;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.service.OrgJwsService;
import com.chinacreator.gzgl.service.UserLxfsService;
import com.chinacreator.menu.bean.AjjbxxBean;
import com.chinacreator.menu.bean.XttxListBean;
import com.chinacreator.menu.bean.XttxpzBean;
import com.chinacreator.menu.business.MenuManagerBusiness;
import com.chinacreator.menu.query.IndexQueryBean;
import com.fr.json.JSONObject;

public class MyScheduleAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -3325444631332934912L;
	private MenuManagerBusiness business;
	private List<XttxpzBean> xttxpzBeans;
	private List<XttxListBean> xttxListBeans;
	private List<AjjbxxBean> ajjbxxList;
	private XttxpzBean xttxpzBean;
	private String callback;
	
	private IndexQueryBean queryBean;
	private AjjbxxBean ajxxBean;
	private UserLxfsBean lxfsBean;
	private OrgJwsBean jwsBean;
	private UserLxfsBusiness lxfsBusiness;
	private String level;
	
	
	private OrgJwsBean pcsBean;
	private  OrgJwsService pcsService;
	private UserLxfsService lxfsService;
	
	/**
	 * 导出的Excel数据
	 */
	private List<List<String>> excelData;

	public MyScheduleAction()
	{
		super();
		jwsBean= new OrgJwsBean();
		business = new MenuManagerBusiness();
		xttxpzBean = new XttxpzBean();
		xttxListBeans = new ArrayList<XttxListBean>();
		lxfsBean=new UserLxfsBean();
		lxfsBusiness=new UserLxfsBusiness();
		
		pcsBean = new OrgJwsBean();
		pcsService = new OrgJwsService();
		lxfsService = new UserLxfsService();
		queryBean = new IndexQueryBean();
	}
	
	
	public String toMySchedulePage()
	{
		return "toMySchedulePage";
	}

	public String toMyGztxPage()
	{
		return "toMyGztxPage";
	}
	
	
	public void queryXttxPageResultInfo()
	{
		PageResultInfo<XttxListBean> pageResultInfo = new PageResultInfo<XttxListBean>();
		if (ValidateHelper.isNotEmptyString(xttxpzBean.getId()))
		{
			xttxpzBean = business.queryXttxpzBeanById(xttxpzBean.getId());
			pageResultInfo = business.queryXttxListBeansPageResult(xttxpzBean, getPageInfo());
		}
		responseWrite(pageResultInfo);
	}
	
	//导出工作提醒excel
	public String downloadExcel(){
		excelData = business.downLoadExcel(xttxpzBean.getId());
		return "downLoadExcel_" + xttxpzBean.getId();
	}
	
	public void getXttxCount()
	{
		int count = 0;
		try
		{
			xttxpzBeans = business.queryXttxpzBeans();
			if (ValidateHelper.isNotEmptyCollection(xttxpzBeans))
			{
				for (XttxpzBean pzbean : xttxpzBeans)
				{
					count= count + business.queryCountXttxpz(pzbean);
				}
			}
			String result = callback + "({'size':'" + count + "'})";
			response.setContentType("text/javascript");
			response.getWriter().print(result);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	//获得flag  判断用户需不需要输入联系方式和警务室维护信息
	public  void  getLoginFlag(){
		boolean flag=false;
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		level=String.valueOf(loginInfo.getLeve());
		try {
			lxfsBean=lxfsBusiness.queryUserLxfsByJh(loginInfo.getUsername());
			jwsBean=lxfsBusiness.queryOrgJwsByOrgCode(loginInfo.getOrgcode());
			if(loginInfo.getLeve()<4){
				if(lxfsBean!=null){
					String mobile=lxfsBean.getMobile();
					String telephone=lxfsBean.getTelephone();
					if(ValidateHelper.isNotEmptyString(mobile) 
							|| ValidateHelper.isNotEmptyString(telephone)){
						flag=true;
					}else{
						flag=false;
					}
				}else{
					flag=false;
				}
			}else {
				if(lxfsBean!=null && jwsBean!=null){
					String mobile=lxfsBean.getMobile();
					String telephone=lxfsBean.getTelephone();
					if(ValidateHelper.isNotEmptyString(mobile) 
							|| ValidateHelper.isNotEmptyString(telephone)){
						flag=true;
					}else{
						flag=false;
					}
				}else{
					flag=false;
				}
			}		
			String result = callback + "({'flag':'" + flag + "','level':'" + level + "'})";
			response.setContentType("text/javascript");
			response.getWriter().print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//跳转到checkafterlogin界面
	public String toCheckAfterLogin() throws Exception{
		toCheckAfterLogin1();
		return "toCheckAfterLogin";
	}
	
	
	//2013年12月9日14:36:47
	//区分派出所 警务室
	public String toCheckAfterLogin1() throws Exception{
		LoginInfo loginInfo=ActionContextHelper.getLoginInfo();
		//联系方式
		lxfsBean=lxfsService.queryuserLxfsBeanById(loginInfo.getUserid());
		
		if(loginInfo.getLeve()>=4){
		//派出所 or 警务室
			pcsBean=pcsService.queryPcsBeanByOrgcode(loginInfo.getOrgcode());
			if(pcsBean!=null){
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
			}
		}
		level=String.valueOf(loginInfo.getLeve());
		return "toCheckAfterLogin";
	}
	
	/**
	 *  保存联系方式和警务室维护情况
	 */
	public void saveLxfsOrJwsBean(){
		LoginInfo loginInfo=ActionContextHelper.getLoginInfo();
		if(loginInfo.getLeve()<4){
			try {
				if(ValidateHelper.isEmptyString(lxfsBean.getId())){
					lxfsBusiness.insertUserLxfsBean(lxfsBean);
				}else{
					lxfsBusiness.updateUserLxfsBean(lxfsBean);
				}
				responseWrite(true);
			} catch (Exception e) {
				responseWrite(false);
				e.printStackTrace();
			}
		}else{
			try {
				if(ValidateHelper.isEmptyString(lxfsBean.getId())){
					lxfsBusiness.insertUserLxfsBean(lxfsBean);
				}else{
					lxfsBusiness.updateUserLxfsBean(lxfsBean);
				}
				if(ValidateHelper.isEmptyString(pcsBean.getId())){
					pcsService.insertPcsBean(pcsBean);
				}else{
					pcsService.updatePcsBean(pcsBean);
				}
				responseWrite(true);
			} catch (Exception e) {
				responseWrite(false);
				e.printStackTrace();
			}
			
		}
	}	
	public String toMyGztxListPage()
	{
		xttxpzBeans = business.queryXttxpzBeans();
		return "toMyGztxListPage";
	}
	
	public void loadGztxCount()
	{
		JSONObject jo = new JSONObject();
		try
		{
			xttxpzBeans = business.queryXttxpzBeans();
			if (ValidateHelper.isNotEmptyCollection(xttxpzBeans))
			{
				for (XttxpzBean pzbean : xttxpzBeans)
				{
					int count = business.queryCountXttxpz(pzbean);
					jo.append("gztx_" + pzbean.getId(), count);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		responseWrite(jo.toString());
	}
	
	public String toMyGztxNotListPage()
	{
		xttxpzBeans = business.queryXttxpzBeans();
		if (ValidateHelper.isNotEmptyCollection(xttxpzBeans))
		{
			for (XttxpzBean pzbean : xttxpzBeans)
			{
				List<XttxListBean> list = business.queryXttxListBeansPageResult(pzbean);
				if (ValidateHelper.isNotEmptyCollection(list))
				{
					xttxListBeans.addAll(list);
					break;
				}
			}
		}
		return "toMyGztxNotListPage";
	}
	
	public String toGztxDataList()
	{
		return "toGztxDataList";
	}
	
	public String queryXq7tlfaList()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		queryBean.setLeve(loginInfo.getLeve());
		queryBean.setOrgcode(loginInfo.getOrgcode());
		queryBean.setBaoanriqi_start(DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), -7, "yyyy-MM-dd HH:mm:ss"));
		queryBean.setBaoanriqi_end(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		ajjbxxList = business.queryQmstAjxx(queryBean);
		return "queryXq7tlfaList";
	}
	
	public String toAjjbxxListPage()
	{
		return "toAjjbxxListPage";
	}
	
	public void queryAjjbxxListPageInfo()
	{
		PageResultInfo<AjjbxxBean> pageResult = business.queryAjjbxxListPageInfo(queryBean, getPageInfo());
		responseWrite(pageResult);
	}
	
	public String toAjxxDetail()
	{
		ajxxBean = business.queryAjxxDetailById(queryBean.getId());
		return "toAjxxDetail";
	}
	
	public String toXqjbqkPage()
	{
		return "toXqjbqkPage";
	}

	public List<XttxpzBean> getXttxpzBeans()
	{
		return xttxpzBeans;
	}

	public void setXttxpzBeans(List<XttxpzBean> xttxpzBeans)
	{
		this.xttxpzBeans = xttxpzBeans;
	}

	public XttxpzBean getXttxpzBean()
	{
		return xttxpzBean;
	}

	public void setXttxpzBean(XttxpzBean xttxpzBean)
	{
		this.xttxpzBean = xttxpzBean;
	}

	public List<XttxListBean> getXttxListBeans()
	{
		return xttxListBeans;
	}

	public void setXttxListBeans(List<XttxListBean> xttxListBeans)
	{
		this.xttxListBeans = xttxListBeans;
	}

	public String getCallback()
	{
		return callback;
	}

	public void setCallback(String callback)
	{
		this.callback = callback;
	}

	public UserLxfsBean getLxfsBean() {
		return lxfsBean;
	}

	public void setLxfsBean(UserLxfsBean lxfsBean) {
		this.lxfsBean = lxfsBean;
	}

	public OrgJwsBean getJwsBean() {
		return jwsBean;
	}

	public void setJwsBean(OrgJwsBean jwsBean) {
		this.jwsBean = jwsBean;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public OrgJwsBean getPcsBean() {
		return pcsBean;
	}

	public void setPcsBean(OrgJwsBean pcsBean) {
		this.pcsBean = pcsBean;
	}


	public List<List<String>> getExcelData() {
		return excelData;
	}


	public void setExcelData(List<List<String>> excelData) {
		this.excelData = excelData;
	}


	public List<AjjbxxBean> getAjjbxxList()
	{
		return ajjbxxList;
	}


	public void setAjjbxxList(List<AjjbxxBean> ajjbxxList)
	{
		this.ajjbxxList = ajjbxxList;
	}


	public IndexQueryBean getQueryBean()
	{
		return queryBean;
	}


	public void setQueryBean(IndexQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}


	public AjjbxxBean getAjxxBean()
	{
		return ajxxBean;
	}


	public void setAjxxBean(AjjbxxBean ajxxBean)
	{
		this.ajxxBean = ajxxBean;
	}
	
}
