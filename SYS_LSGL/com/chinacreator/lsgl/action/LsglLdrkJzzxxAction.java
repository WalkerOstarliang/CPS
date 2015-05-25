package com.chinacreator.lsgl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.constants.CommonFinalParams;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.FatjBean;
import com.chinacreator.lsgl.bean.JwrkxxBean;
import com.chinacreator.lsgl.bean.JzzDayinBean;
import com.chinacreator.lsgl.bean.JzzTjBean;
import com.chinacreator.lsgl.bean.LdrkJzzxxBean;
import com.chinacreator.lsgl.bean.LdrkTjBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.lsgl.bean.RsdfxBean;
import com.chinacreator.lsgl.query.JzzQueryBean;
import com.chinacreator.lsgl.query.TjQueryBean;
import com.chinacreator.lsgl.services.LsglLdrkJzzxxService;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.impl.LsglLdrkJzzxxServiceImpl;
import com.chinacreator.lsgl.services.impl.LsglRkServiceImpl;

/**
 * 流动人口居住证信息管理
 * @company  chinacreator
 * @author zhun.liu
 * @date  Jan 20, 2014  9:28:46 AM
 */
public class LsglLdrkJzzxxAction extends CPSBaseAction
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private LsglLdrkJzzxxService service;
	
	private LsglRkService rkService;
	private RkxxBean rkBean;
	private RkJbxxBean jbxxBean = null;
	private String operType;
	private LdrkJzzxxBean bean;
	
	private List<LdrkJzzxxBean> ldrkJjzList;
	
	private String zzbh;
	private String year;
	private String month;
	private String day;
	
	private JzzQueryBean queryBean;
	private List<JzzDayinBean> jzzList;
	private String rybhs;
	private String jzzbhs;
	private String dyzt;
	private JzzDayinBean dyBean;
	
	private String selectedrybhs;
	private String nowDate;
	private List<RkxxBean> rkBeans = new ArrayList<RkxxBean>();
	
	private List<LdrkxxBean> ldrkBeans;
	
	private List<LdrkTjBean> ldrktjBeans;
	private TjQueryBean tjqueryBean;
	private List<FatjBean>  faTjList;
	
	private List<RsdfxBean> rsdfxList;
	
	//居住证统计结果
	private List<JzzTjBean> jzztjResult;
	
	private String yjzzxxbh ; // 原居住证编号
	
	public String getYjzzxxbh() {
		return yjzzxxbh;
	}

	public void setYjzzxxbh(String yjzzxxbh) {
		this.yjzzxxbh = yjzzxxbh;
	}

	public LsglLdrkJzzxxAction(){
		service = new LsglLdrkJzzxxServiceImpl();
		rkService = new LsglRkServiceImpl();
		bean = new LdrkJzzxxBean();
		rkBean = new RkxxBean();
		queryBean = new JzzQueryBean();
		tjqueryBean =  new TjQueryBean();
		
		rsdfxList = new ArrayList<RsdfxBean>();
		
		jzztjResult = new ArrayList<JzzTjBean>();
		
		ldrkJjzList = new ArrayList<LdrkJzzxxBean>();
	}
	
	/**
	 * 进入流动人口居住证页面
	 * @return
	 * @date Aug 22, 2014 2:46:15 PM
	 */
	public String toLdrkJzzhcPage()
	{
		return "toLdrkJzzhcPage";
	}
	
	public String toLdrkchQueryListPage()
	{
		super.initQueryBean(queryBean);
		return "toLdrkchQueryListPage";
	}
	
	public void queryLdrkZhQueryPageResult()
	{
		PageResultInfo<LdrkxxBean> pageResultInfo = null;
		try
		{
			setCsrqAndAge();
			pageResultInfo = service.queryLdrkZhQueryPageResult(queryBean, getPageInfo());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResultInfo = new PageResultInfo<LdrkxxBean>();
		}
		responseWrite(pageResultInfo);
	}
	
	public String exportLdrkZhQueryPage()
	{
		PageResultInfo<LdrkxxBean> pageResultInfo = null;
		try
		{
			queryBean.setUsePage(false);
			setCsrqAndAge();
			pageResultInfo = service.queryLdrkZhQueryPageResult(queryBean, getPageInfo());
			ldrkBeans = pageResultInfo.getDatas();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "exportLdrkZhQueryPage";
	}
	
	/**
	 * 跳转到入室盗统计结果
	 * @return
	 * @date May 12, 2014 4:33:53 PM
	 */
	public String toExportLdrkRsqfx()
	{
		if("query".equals(operType)){
			try
			{
				PageResultInfo<RsdfxBean> pageResult = service.queryRsdfxBeansPageResult(queryBean, getPageInfo());
				rsdfxList = pageResult.getDatas();
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		
		return "toExportLdrkRsqfx";
	}
	
	/**
	 * 导出流口入室盗统计
	 * @return
	 * @date May 14, 2014 3:49:49 PM
	 */
	public String toExportLdrkRsqTj(){
		try
		{
			PageResultInfo<RsdfxBean> pageResult = service.queryRsdfxBeansPageResult(queryBean, getPageInfo());
			rsdfxList = pageResult.getDatas();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return "toExportLdrkRsqTj";
	}

	/**
	 * 入室盗窃分析统计结果查询
	 * 
	 * @date May 12, 2014 4:37:02 PM
	 */
	public void queryExportLdrkRsqfxResult()
	{
		PageResultInfo<RsdfxBean> pageResult = null;
		try
		{
			pageResult = service.queryRsdfxBeansPageResult(queryBean, getPageInfo());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResult = new PageResultInfo<RsdfxBean>();
		}
		responseWrite(pageResult);
	}
	
	private void setCsrqAndAge()
	{
		int age_start=0;
		int age_end=0;
		String nowStr=DateTimeHelper.getNowDateStr("yyyy").toString();
		int nowInt=Integer.parseInt(nowStr);
		if(ValidateHelper.isNotEmptyString(queryBean.getAge_start())){
			 age_start=Integer.parseInt(queryBean.getAge_start());
			 queryBean.setCsrq_end(String.valueOf(nowInt-age_start)+"-12-31");
		}else if(ValidateHelper.isNotEmptyString(queryBean.getAge_end())){
			 age_end =Integer.parseInt(queryBean.getAge_end());
			 queryBean.setCsrq_start(String.valueOf(nowInt-age_end)+"-01-01");
			 queryBean.setCsrq_end(String.valueOf(nowInt-age_end)+"-12-31");
		}
	    if(ValidateHelper.isNotEmptyString(queryBean.getAge_end())){
		     age_end =Integer.parseInt(queryBean.getAge_end());
			 queryBean.setCsrq_start(String.valueOf(nowInt-age_end)+"-01-01");
		}else if(ValidateHelper.isNotEmptyString(queryBean.getAge_start())){
			age_start=Integer.parseInt(queryBean.getAge_start());
			queryBean.setCsrq_start(String.valueOf(nowInt-age_start)+"-01-01");
			queryBean.setCsrq_end(String.valueOf(nowInt-age_start)+"-12-31");
		}
	}
	
	public String toLdrkExportWordPage()
	{
		if (ValidateHelper.isNotEmptyString(selectedrybhs))
		{
			String[] selectedrybharr = selectedrybhs.split(",");
			RkxxBean rkb = null;
			for (String rybh : selectedrybharr)
			{
				try
				{
					rkb = rkService.queryRkxxBeanByRybh(rkBean.getRylb(), rybh, "1", CommonConstant.OPERTYPE_UPDATE);
					//境外人口
					if(CommonFinalParams.RYLB_JWRK.equals(rkBean.getRylb()))
					{
						JwrkxxBean jwrkBean = rkService.queryJwrkJbxxByRybh(rybh);
						nowDate = DateTimeHelper.getNowDateStr("yyyy年MM月dd日");
						if(ValidateHelper.isNotEmptyString(rkb.getJbxxBean().getCsrq()))
						{
							String [] csrq = rkb.getJbxxBean().getCsrq().split("-");
							year = csrq[0];
							month = csrq[1];
							day = csrq[2];
							rkb.getJbxxBean().setCsrq(year+"年"+month+"月"+day+"日");
						}
						else
						{
							rkb.getJbxxBean().setCsrq("&nbsp&nbsp&nbsp年&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp日");
						}
						rkb.setJwrkBean(jwrkBean);
					}
					if (rkb != null)
					{
						rkBeans.add(rkb);
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		}
		if(CommonFinalParams.RYLB_LDRK.equals(rkBean.getRylb()))
		{
			return "toLdrkExportWordPage";
		}
		else if(CommonFinalParams.RYLB_JWRK.equals(rkBean.getRylb()))
		{
			return "toJwrkExportWordPage";
		}
		return null;
	}
	
	/**
	 * 跳转到居住证信息登记
	 * @return
	 * @throws Exception 
	 */
	public String toAddJzzxxPage()
	{
		try
		{
			if (ValidateHelper.isNotEmptyString(bean.getJzzrybh()))
			{
				jbxxBean = service.queryRkJbxxBeanByRybh(bean.getJzzrybh());
			}
			if (ValidateHelper.isNotEmptyString(zzbh))
			{
				bean = service.queryJzzxxBeanByZzbh(zzbh);
			}
			if (bean != null)
			{
				bean.setZzbh(zzbh);
				bean.setFzrqmindate(bean.getLdrkdjsj());
				bean.setFzrqmaxdate(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			}
			else
			{
				bean = new LdrkJzzxxBean();
				bean.setZzbh(zzbh);
				bean.setFzrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
				LdrkxxBean ldrkBean = service.getLdrkShorBeanInfo(zzbh);
				if (ldrkBean != null)
				{
					String xzzxz = ldrkBean.getZzdxz();
					bean.setXzzxz(xzzxz);
					bean.setLdrkdjsj(ldrkBean.getDjsj());
					bean.setFzrqmindate(ldrkBean.getDjsj());
				}
				bean.setFzrqmaxdate(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toAddJzzxxPage";
	}
	/**
	 * 跳转到居住证延期界面
	 * 需求说明：直接新增一条新居住证记录，注销之前正常的那条记录。
	 * @return
	 */
	public String toYqJzzxxPage(){
		try
		{
			if (ValidateHelper.isNotEmptyString(bean.getJzzrybh()))
			{
				jbxxBean = service.queryRkJbxxBeanByRybh(bean.getJzzrybh());
				yjzzxxbh = service.queryJzzxxBeanByZzbh(zzbh).getJzzxxbh();
			}
			bean = new LdrkJzzxxBean();
			bean.setZzbh(zzbh);
			bean.setFzrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			LdrkxxBean ldrkBean = service.getLdrkShorBeanInfo(zzbh);
			if (ldrkBean != null)
			{
				String xzzxz = ldrkBean.getZzdxz();
				bean.setXzzxz(xzzxz);
				bean.setLdrkdjsj(ldrkBean.getDjsj());
				bean.setFzrqmindate(ldrkBean.getDjsj());
			}
			bean.setFzrqmaxdate(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toYqJzzxxPage";
	}
	
	/**
	 * 根据人员编号查询多条居住证信息(注销 未注销)
	 * @throws Exception 
	 */
	public void queryJzzxxPageByRybh() throws Exception
	{
		PageResultInfo<LdrkJzzxxBean> list = service.queryJzzxxPageByRybh(bean.getJzzrybh(), getPageInfo());
		responseWrite(list);
	}
	
	public void queryJzzxxPageByZzbh()
	{
		PageResultInfo<LdrkJzzxxBean> pageResultInfo = null;
		try
		{
			pageResultInfo = service.queryJzzxxPageByZzbh(bean.getZzbh(), getPageInfo());
			responseWrite(pageResultInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResultInfo = new PageResultInfo<LdrkJzzxxBean>();
		}
		
	}
	
	public  void saveLdrkJzzxxBean()
	{
		if (ValidateHelper.isNotEmptyString(bean.getJzzxxbh()))
		{
			LdrkJzzxxBean ldrkjzxxBean = service.queryJzzxxBeanByJzzbh(bean.getJzzxxbh());
			//如果居住证状态已经注销或者已经制证则无法进行修改
			if (ldrkjzxxBean !=null && ("20".equals(ldrkjzxxBean.getJzzdyzt()) || "30".equals(ldrkjzxxBean.getJzzdyzt())))
			{
				responseWrite("cannotupdate");
			}
			else
			{
				bean = service.saveJzzxxBean(bean);
				responseWrite(bean);
			}
		}
		else
		{
			bean = service.saveJzzxxBean(bean);
			responseWrite(bean);
		}
		
	}
	/**
	 * 保存居住证延期信息
	 */
	public void saveLdrkJzzxxYqBean(){
		if (ValidateHelper.isNotEmptyString(yjzzxxbh))
		{
			service.zxJzzxxBean(yjzzxxbh);
		}
		bean = service.saveJzzxxBean(bean);
		responseWrite(bean);
	}
	public String toPrintPage() throws Exception
	{
		if(ValidateHelper.isNotEmptyString(bean.getJzzrybh()))
		{
			jbxxBean = service.queryRkJbxxBeanByRybh(bean.getJzzrybh());
		}
		if (ValidateHelper.isNotEmptyString(bean.getJzzxxbh()))
		{
			bean = service.queryJzzxxBeanByJzzbh(bean.getJzzxxbh());
			bean.setDyzt(dyzt);
			if(ValidateHelper.isNotEmptyString(bean.getFzrq()))
			{
				String [] fzrq = bean.getFzrq().split("-");
				year = fzrq[0];
				month = fzrq[1];
				day = fzrq[2];
			}
		}
		return "toPrintPage";
	}
	
	public String toPreViewPage() throws Exception
	{
		if(ValidateHelper.isNotEmptyString(bean.getJzzrybh()))
		{
			jbxxBean = service.queryRkJbxxBeanByRybh(bean.getJzzrybh());
		}
		if (ValidateHelper.isNotEmptyString(bean.getJzzxxbh()))
		{
			bean = service.queryJzzxxBeanByJzzbh(bean.getJzzxxbh());
			if(bean != null && ValidateHelper.isNotEmptyString(bean.getFzrq()))
			{
				String [] fzrq = bean.getFzrq().split("-");
				year = fzrq[0];
				month = fzrq[1];
				day = fzrq[2];
			}
		}
		return "toPreViewPage";
	}
	
	/**
	 * 更新打印状态
	 * @throws Exception
	 */
	public void  updateJzzxxBeanDyZt() throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		bean.setDyip(this.getRemortIP());
		bean.setDydwdm(loginInfo.getOrgcode());
		bean.setDydwmc(loginInfo.getOrgname());
		bean.setDysj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		service.updateJzzxxBeanDyZt(bean);
	}
	
	public void jzzPrint()
	{
		try
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String dyzt = bean.getDyzt();
			bean.setDyrjh(loginInfo.getUsername());
			bean.setDyrxm(loginInfo.getRealname());
			bean.setDyip(this.getRemortIP());
			bean.setDydwdm(loginInfo.getOrgcode());
			bean.setDydwmc(loginInfo.getOrgname());
			bean.setDysj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
			//首次打印更新居住证打印信息
			if ("1".equals(dyzt))
			{
				service.updateJzzxxBeanDyZt(bean);
			}
			//遗失补打 错证补打
			else if ("2".equals(dyzt) || "3".equals(dyzt))
			{
				bean = service.queryJzzxxBeanByJzzbh(bean.getJzzxxbh());
				bean.setDyzt(dyzt);
				service.czcdysbdInsertJzzxxBean(bean);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 居住证批量打印
	 * 
	 * @date Sep 3, 2014 10:01:20 AM
	 */
	public void jzzBatchPrint()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try
		{
			if (ValidateHelper.isNotEmptyString(jzzbhs) && ValidateHelper.isNotEmptyString(rybhs))
			{
				String[] jzzbharr = jzzbhs.split(",");
				String[] rybharr = rybhs.split(",");
				for (int i=0;i<jzzbharr.length;i++)
				{
					bean = new LdrkJzzxxBean();
					bean.setDyzt(dyzt);
					bean.setJzzrybh(rybharr[i]);
					bean.setJzzxxbh(jzzbharr[i]);
					
					bean.setDydwdm(loginInfo.getOrgcode());
					bean.setDydwmc(loginInfo.getOrgname());
					bean.setDyip(this.getRemortIP());
					bean.setDyrjh(loginInfo.getUsername());
					bean.setDyrxm(loginInfo.getRealname());
					//bean.setDysj(dysj);
					
					//首次打印更新居住证打印信息
					if ("1".equals(dyzt))
					{
						service.updateJzzxxBeanDyZt(bean);
					}
					//遗失补打 错证补打
					else if ("2".equals(dyzt) || "3".equals(dyzt))
					{
						bean = service.queryJzzxxBeanByJzzbh(bean.getJzzxxbh());
						bean.setDyzt(dyzt);
						
						bean.setDydwdm(loginInfo.getOrgcode());
						bean.setDydwmc(loginInfo.getOrgname());
						bean.setDyip(this.getRemortIP());
						bean.setDyrjh(loginInfo.getUsername());
						bean.setDyrxm(loginInfo.getRealname());
						
						service.czcdysbdInsertJzzxxBean(bean);
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	public void zxJzzxxBean()
	{
		service.zxJzzxxBean(queryBean.getJzzxxbh());
	}
	
	public void initQueryBean()
	{
		super.initQueryBean(queryBean);
	}
	/**
	 * 跳转到居住证登记证查询
	 */
	public String toJzzxxPageInfo(){
		initQueryBean();
		return "toJzzxxPageInfo";
	}
	
	public String toJzzDyListPage(){
		initQueryBean();
		return "toJzzDyListPage";
	}
	
	private JzzQueryBean initJjzQueryBean(){
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		int age_start=0;
		int age_end=0;
		String nowStr=DateTimeHelper.getNowDateStr("yyyy").toString();
		int nowInt=Integer.parseInt(nowStr);
		if(ValidateHelper.isNotEmptyString(queryBean.getAge_start())){
			 age_start=Integer.parseInt(queryBean.getAge_start());
			 queryBean.setCsrq_end(String.valueOf(nowInt-age_start)+"-12-31");
		}else if(ValidateHelper.isNotEmptyString(queryBean.getAge_end())){
			 age_end =Integer.parseInt(queryBean.getAge_end());
			 queryBean.setCsrq_start(String.valueOf(nowInt-age_end)+"-01-01");
			 queryBean.setCsrq_end(String.valueOf(nowInt-age_end)+"-12-31");
		}
	    if(ValidateHelper.isNotEmptyString(queryBean.getAge_end())){
		     age_end =Integer.parseInt(queryBean.getAge_end());
			 queryBean.setCsrq_start(String.valueOf(nowInt-age_end)+"-01-01");
		}else if(ValidateHelper.isNotEmptyString(queryBean.getAge_start())){
			age_start=Integer.parseInt(queryBean.getAge_start());
			queryBean.setCsrq_start(String.valueOf(nowInt-age_start)+"-01-01");
			queryBean.setCsrq_end(String.valueOf(nowInt-age_start)+"-12-31");
		}
	    queryBean.setLeve(loginInfo.getLeve());
	    queryBean.setOrgcode(loginInfo.getOrgcode());
	    
	    return queryBean;
		
	}
	
	/**
	 * 居住证导出
	 * @return
	 */
	public String downloadJjz(){
		initJjzQueryBean();
		ldrkJjzList = service.queryJzzxxList(queryBean);
		return "downloadJjz";
	} 
	
	/**
	 * 分页查询居住证登记信息
	 * @throws Exception
	 */
	public void queryLdrkJzzxxBeanPageInfo() throws Exception
	{
		initJjzQueryBean();
		PageResultInfo<LdrkJzzxxBean> list = service.queryJzzxxBeanPageInfo(queryBean, getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 跳转到批量打印界面
	 * @return
	 * @throws Exception 
	 */
	public String toBatchPrintPage() throws Exception
	{
		jzzList = new ArrayList<JzzDayinBean>();
		if (ValidateHelper.isNotEmptyString(rybhs) && ValidateHelper.isNotEmptyString(jzzbhs))
		{
			String rybharr[] = rybhs.split(",");
			String jzzbharr[] = jzzbhs.split(",");
			for (int i=0;i<jzzbharr.length;i++) 
			{
				dyBean = new JzzDayinBean();
				jbxxBean = service.queryRkJbxxBeanByRybh(rybharr[i]);
				bean = service.queryJzzxxBeanByJzzbh(jzzbharr[i]);
				bean.setDyzt(dyzt);
				if(ValidateHelper.isNotEmptyString(bean.getFzrq()))
				{
					String [] fzrq = bean.getFzrq().split("-");
					year = fzrq[0];
					month = fzrq[1];
					day = fzrq[2];
				}
				dyBean.setYear(year);
				dyBean.setMonth(month);
				dyBean.setDay(day);
				dyBean.setJzzBean(bean);
				dyBean.setJbxxBean(jbxxBean);
				jzzList.add(dyBean);
			}
		}
		return "toBatchPrintPage";
	}
	/**
	 * 获取客户端真实IP地址
	 * @return
	 */
	private String getRemortIP(){
		/*
		if(this.request.getHeader("x-forwarded-for") == null){
			String ip ;
			ip =  this.request.getRemoteAddr();
			if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("Proxy-Client-IP");
			}
			if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("WL-Proxy-Client-IP");
			}
			if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getRemoteAddr();
			}
			return ip ;
		}
		return ip
		*/
		String ip ;
		ip = this.getIpAddress();
		return ip ;
	}
	
	/**
	 * 跳转到流动人口 统计
	 * @throws Exception 
	 */
	public String toTjLdrkMzxx() throws Exception{
		queryBean.setDjsj_start(DateTimeHelper.convert(DateTimeHelper.getFirstDayOfMonth(), "yyyy-MM-dd"));
		queryBean.setDjsj_end(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toTjLdrkMzxx";
	}
	
	public String queryLdrkTjList() throws Exception
	{
		ldrktjBeans = service.queryLdrkTjBean(queryBean);
		return "queryLdrkTjList";
	}
	
	public String exportLdrkTjxx() throws Exception{
		ldrktjBeans = service.queryLdrkTjBean(queryBean);
		return "exportLdrkTjxx";
	}
	
	
	/**
	 * 发案统计
	 * @return
	 */
	public String toRsdqFatj(){
		tjqueryBean.setTjkssj(DateTimeHelper.convert(DateTimeHelper.getFirstDayOfMonth(), "yyyy-MM-dd"));
		return "toRsdqFatj";
	}
	
	/**
	 * 查询发案统计Bean
	 * @throws Exception 
	 */
	public String queryFatjBean() throws Exception{
		faTjList = service.queryFatjBean(tjqueryBean);
		return "queryFatjBean";
	}
	
	/**
	 * 导出发案统计
	 * @return
	 * @throws Exception
	 */
	public String expFatj() throws Exception{
		faTjList = service.queryFatjBean(tjqueryBean);
		return "expFatj";
	}
	
	
	/**
	 * 居住证统计页面
	 * @return
	 */
	public String toJzzTjPage(){
		LoginInfo login = ActionContextHelper.getLoginInfo();
		String userCode = login.getOrgcode();
		int userLeve = login.getLeve();
		if(userLeve == 2){
			userCode = userCode.substring(0,4) + "00000000";
		}else if(userLeve == 3){
			userCode = userCode.substring(0,7) + "000000";
		}else if(userLeve == 4){
			userCode = userCode.substring(0,9) + "0000";
		}
		
		queryBean.setTjdwdm(userCode);
		queryBean.setTjjb(userLeve + "");
		queryBean.setTjdwmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(userCode));
		return "toJzzTjPage";
	}
	
	/**
	 * 查询居住证统计
	 */
	public String queryJzztj(){
		jzztjResult = service.queryJzztjBeanList(queryBean);
		queryBean.setTjdwmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(queryBean.getTjdwdm()));
		return "queryJzztj";
	}
	
	/**
	 * 导出居住证统计
	 */
	public String downloadJZZtj(){
		jzztjResult = service.queryJzztjBeanList(queryBean);
		queryBean.setTjdwmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(queryBean.getTjdwdm()));
		return "downloadJZZtjPage";
	}
	
	/**      getter setter               */
	
	public LsglLdrkJzzxxService getService() {
		return service;
	}

	public void setService(LsglLdrkJzzxxService service) {
		this.service = service;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public LdrkJzzxxBean getBean() {
		return bean;
	}

	public void setBean(LdrkJzzxxBean bean) {
		this.bean = bean;
	}

	public LsglRkService getRkService() {
		return rkService;
	}

	public void setRkService(LsglRkService rkService) {
		this.rkService = rkService;
	}

	public RkxxBean getRkBean() {
		return rkBean;
	}

	public void setRkBean(RkxxBean rkBean) {
		this.rkBean = rkBean;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getZzbh() {
		return zzbh;
	}

	public void setZzbh(String zzbh) {
		this.zzbh = zzbh;
	}

	public JzzQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(JzzQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public List<JzzDayinBean> getJzzList() {
		return jzzList;
	}

	public void setJzzList(List<JzzDayinBean> jzzList) {
		this.jzzList = jzzList;
	}

	public String getRybhs() {
		return rybhs;
	}

	public void setRybhs(String rybhs) {
		this.rybhs = rybhs;
	}

	public JzzDayinBean getDyBean() {
		return dyBean;
	}

	public void setDyBean(JzzDayinBean dyBean) {
		this.dyBean = dyBean;
	}

	public String getSelectedrybhs() {
		return selectedrybhs;
	}

	public void setSelectedrybhs(String selectedrybhs) {
		this.selectedrybhs = selectedrybhs;
	}

	public List<RkxxBean> getRkBeans() {
		return rkBeans;
	}

	public void setRkBeans(List<RkxxBean> rkBeans) {
		this.rkBeans = rkBeans;
	}

	public String getDyzt() {
		return dyzt;
	}

	public void setDyzt(String dyzt) {
		this.dyzt = dyzt;
	}

	public String getNowDate() {
		return nowDate;
	}

	public void setNowDate(String nowDate) {
		this.nowDate = nowDate;
	}

	public List<LdrkTjBean> getLdrktjBeans() {
		return ldrktjBeans;
	}

	public void setLdrktjBeans(List<LdrkTjBean> ldrktjBeans) {
		this.ldrktjBeans = ldrktjBeans;
	}

	public List<LdrkxxBean> getLdrkBeans()
	{
		return ldrkBeans;
	}

	public void setLdrkBeans(List<LdrkxxBean> ldrkBeans)
	{
		this.ldrkBeans = ldrkBeans;
	}

	public TjQueryBean getTjqueryBean() {
		return tjqueryBean;
	}

	public void setTjqueryBean(TjQueryBean tjqueryBean) {
		this.tjqueryBean = tjqueryBean;
	}

	public List<FatjBean> getFaTjList() {
		return faTjList;
	}

	public void setFaTjList(List<FatjBean> faTjList) {
		this.faTjList = faTjList;
	}

	public List<RsdfxBean> getRsdfxList()
	{
		return rsdfxList;
	}

	public void setRsdfxList(List<RsdfxBean> rsdfxList)
	{
		this.rsdfxList = rsdfxList;
	}

	public List<JzzTjBean> getJzztjResult() {
		return jzztjResult;
	}

	public void setJzztjResult(List<JzzTjBean> jzztjResult) {
		this.jzztjResult = jzztjResult;
	}

	public RkJbxxBean getJbxxBean()
	{
		return jbxxBean;
	}

	public void setJbxxBean(RkJbxxBean jbxxBean)
	{
		this.jbxxBean = jbxxBean;
	}

	public String getJzzbhs()
	{
		return jzzbhs;
	}

	public void setJzzbhs(String jzzbhs)
	{
		this.jzzbhs = jzzbhs;
	}

	public List<LdrkJzzxxBean> getLdrkJjzList() {
		return ldrkJjzList;
	}

	public void setLdrkJjzList(List<LdrkJzzxxBean> ldrkJjzList) {
		this.ldrkJjzList = ldrkJjzList;
	}
	
}
